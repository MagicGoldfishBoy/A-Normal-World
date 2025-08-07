require "crsfml"
require "crsfml/audio"
require "../../../src/textures.cr"
require "../../../src/utility.cr"
require "../../../src/sound/sfx.cr"

module Equipment
    abstract class EquipmentBase
        EQUIPMENT_ARRAY = [] of EquipmentBase
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
            EQUIPMENT_ARRAY << self
        end

        property name : String
        property id : String
        property is_owned : Bool
        @[JSON::Field(ignore: true)]
        property sprite : SF::Sprite?
        @[JSON::Field(ignore: true)]
        property sfx : SF::Sound?
        property description : String
        property tier : Int8
        property base_monetary_value : Int64
        property required_lvl : Int32
    end
end