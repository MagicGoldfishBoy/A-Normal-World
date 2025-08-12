require "log"
require "crsfml"
require "crsfml/audio"
require "../../../../src/game_settings.cr"
require "../../../../src/textures.cr"
require "../../../../src/utility.cr"
require "../../../../src/inventory/equipment/equipment.cr"
require "../../../../src/player.cr"
require "../../../../graphics/color.cr"

module SoulJewel
    class SoulJewelBase < Equipment::EquipmentBase
        include JSON::Serializable

        Log = ::Log.for("soul_jewel")

        SOUL_JEWEL_ARRAY = [] of SoulJewelBase
        OWNED_SOUL_JEWEL_ARRAY = [] of SoulJewelBase | Equipment::EquipmentBase

        SOUL_JEWEL_SPRITE_HASH = {} of String => SF::Sprite
        SOUL_JEWEL_SFX_HASH = {} of String => SF::Sound

        DEFAULT_SOUL_JEWEL_EQUIP_SFX = SFX::EquipSFX::SOUL_JEWEL_EQUIP_01

        property name : String
        property id : String
        property is_owned : Bool
        property sprite : SF::Sprite?
        property sfx : SF::Sound?
        property description : String
        property tier : Int8
        property base_monetary_value : Int64
        property required_lvl : Int32

        property jewel_type : String

        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, description : String, sfx : SF::Sound, tier : Int8, base_monetary_value : Int64, required_lvl : Int32, jewel_type : String)
            @name = name
            @id = id
            @is_owned = Settings::GameSettings.is_debug_mode ? true : is_owned
            @sprite = sprite
            @sfx = sfx
            @description = description
            @tier = tier
            @base_monetary_value = base_monetary_value
            @required_lvl = required_lvl
            @jewel_type = jewel_type

            if self.is_owned
                OWNED_SOUL_JEWEL_ARRAY << self
            end

            SOUL_JEWEL_SPRITE_HASH[id] = sprite
            SOUL_JEWEL_SFX_HASH[id] = sfx

            Log.info &.emit("Soul Jewel Initialized", jewel_name: self.name, jewel_id: self.id, is_owned: self.is_owned)
        end
    end

    class StatBuffingSoulJewel < SoulJewelBase
        property buff_type : Float64
        property buff_value : Float64

        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, description : String, sfx : SF::Sound, tier : Int8, base_monetary_value : Int64, required_lvl : Int32, jewel_type : String, buff_type : Float64, buff_value : Float64)
            super(name, id, is_owned, sprite, description, sfx, tier, base_monetary_value, required_lvl, jewel_type)
            @buff_type = buff_type
            @buff_value = buff_value
        end

        @@dull_topaz = StatBuffingSoulJewel.new("Dull Topaz", "dull_topaz", false, SF::Sprite.new(SOUL_JEWEL_TEXTURE, SF::Rect.new(0, 0, 40, 40)), "A dull topaz jewel with little time left.", SoulJewelBase::DEFAULT_SOUL_JEWEL_EQUIP_SFX, 1_i8, 100_i64, 1, "soul_jewel", Player::Stats.buff_int, 5.0)
    end
end