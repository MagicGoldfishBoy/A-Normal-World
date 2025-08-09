require "log"
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
        property slot_array : Array(SoulJewel::SoulJewelBase)?

        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, description : String, sfx : SF::Sound, tier : Int8, base_monetary_value : Int64, required_lvl : Int32)
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
            
            Log.info &.emit("Soul Orb Initialized", soul_orb_name: self.name, soul_orb_id: self.id, is_owned: self.is_owned)
        end
    end
end