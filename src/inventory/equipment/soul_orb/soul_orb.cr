require "log"
require "json"
require "crsfml"
require "crsfml/audio"
require "../../../../src/game_settings.cr"
require "../../../../src/textures.cr"
require "../../../../src/utility.cr"
require "../../../../src/inventory/equipment/equipment.cr"
require "../../../../graphics/color.cr"

module SoulOrb
    class SoulOrbBase < Equipment::EquipmentBase
        include JSON::Serializable

        Log = ::Log.for("soul_orb")

        SOUL_ORB_ARRAY = [] of SoulOrbBase
        OWNED_SOUL_ORB_ARRAY = [] of SoulOrbBase | Equipment::EquipmentBase

        SOUL_ORB_SPRITE_HASH = {} of String => SF::Sprite
        SOUL_ORB_SFX_HASH = {} of String => SF::Sound

        DEFAULT_SOUL_ORB_EQUIP_SFX = SFX::EquipSFX::BACKPACK_EQUIP_01

        property name : String
        property id : String
        property is_owned : Bool
        property sprite : SF::Sprite?
        property description : String
        property sfx : SF::Sound?
        property tier : Int8
        property base_monetary_value : Int64
        property required_lvl : Int32

        property max_slots : Int8
        property slot_array : Array(SoulJewel::SoulJewelBase)

        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, description : String, sfx : SF::Sound, tier : Int8, base_monetary_value : Int64, required_lvl : Int32, max_slots : Int8, slot_array : Array(SoulJewel::SoulJewelBase))
            @name = name
            @id = id
            @is_owned = Settings::GameSettings.is_debug_mode ? true : is_owned
            @sprite = sprite
            @description = description
            @sfx = sfx
            @tier = tier
            @base_monetary_value = base_monetary_value
            @required_lvl = required_lvl
            @max_slots = max_slots
            @slot_array = slot_array

            if self.is_owned
                OWNED_SOUL_ORB_ARRAY << self
            end

            SOUL_ORB_SPRITE_HASH[id] = sprite
            SOUL_ORB_SFX_HASH[id] = sfx

            SOUL_ORB_ARRAY << self
            
            Log.info &.emit("Soul Orb Initialized", soul_orb_name: self.name, soul_orb_id: self.id, is_owned: self.is_owned)
        end
        def self.swap_soul_orb(item : SoulOrbBase)
            if item.as(SoulOrb::SoulOrbBase).sfx != nil
                item.as(SoulOrb::SoulOrbBase).sfx.not_nil!.play
            else
                DEFAULT_SOUL_ORB_EQUIP_SFX.play
                Log.warn &.emit("SFX not found!", soul_orb_id: item.as(SoulOrb::SoulOrbBase).id)
            end

            if Player::Appearance.soul_orb != nil
                if SoulOrb::SoulOrbBase::OWNED_SOUL_ORB_ARRAY.none? { |owned_orb| owned_orb.id == Player::Appearance.soul_orb.as(SoulOrb::SoulOrbBase).id }
                    SoulOrb::SoulOrbBase::OWNED_SOUL_ORB_ARRAY << Player::Appearance.soul_orb.as(SoulOrb::SoulOrbBase)
                end
            end

            Player::Appearance.soul_orb = item.as(SoulOrb::SoulOrbBase)
            #Log.info &.emit("Soul Orb Swapped", soul_orb_name: Player::Appearance.soul_orb.name, soul_orb_id: Player::Appearance.soul_orb.id, is_owned: Player::Appearance.soul_orb.is_owned)
        end

    end
    class BasicSoulOrb < SoulOrbBase

        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, description : String, sfx : SF::Sound, tier : Int8, base_monetary_value : Int64, required_lvl : Int32, max_slots : Int8, slot_array : Array(SoulJewel::SoulJewelBase))
            super(name, id, is_owned, sprite, description, sfx, tier, base_monetary_value, required_lvl, max_slots, slot_array)
        end

        @@faint_soul_orb = BasicSoulOrb.new("Faint Soul Orb", "soul_orb_01", false, SF::Sprite.new(SOUL_ORB_TEXTURE, SF::Rect.new(0, 0, 80, 80)), "A Soul Orb™ that will die soon", DEFAULT_SOUL_ORB_EQUIP_SFX, 0, 100, 1, 1, [] of SoulJewel::SoulJewelBase)

        @@fading_soul_orb = BasicSoulOrb.new("Fading Soul Orb", "soul_orb_02", false, SF::Sprite.new(SOUL_ORB_TEXTURE, SF::Rect.new(80, 0, 80, 80)), "A Soul Orb™ that is fading away", DEFAULT_SOUL_ORB_EQUIP_SFX, 1, 100, 1, 2, [] of SoulJewel::SoulJewelBase)

        @@used_soul_orb = BasicSoulOrb.new("Used Soul Orb", "soul_orb_03", false, SF::Sprite.new(SOUL_ORB_TEXTURE, SF::Rect.new(160, 0, 80, 80)), "A Soul Orb™ that has been used. Gross.", DEFAULT_SOUL_ORB_EQUIP_SFX, 2, 100, 1, 3, [] of SoulJewel::SoulJewelBase)

        @@wasted_soul_orb = BasicSoulOrb.new("Wasted Soul Orb", "soul_orb_04", false, SF::Sprite.new(SOUL_ORB_TEXTURE, SF::Rect.new(240, 0, 80, 80)), "A Soul Orb™ that had been wasted. It was still in the package.", DEFAULT_SOUL_ORB_EQUIP_SFX, 3, 100, 1, 4, [] of SoulJewel::SoulJewelBase)
    end
end