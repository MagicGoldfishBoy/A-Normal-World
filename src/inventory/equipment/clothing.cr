require "crsfml"
require "crsfml/audio"
require "../../../src/textures.cr"
require "../../../src/utility.cr"
require "../../../src/sound/sfx.cr"

module Clothing
    class ClothingBase
        CLOTHING_ARRAY = [] of ClothingBase
        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, color : String, sfx : SF::Sound)
            @name = name
            @id = id
            @is_owned = Settings::GameSettings.is_debug ? true : is_owned
            @sprite = sprite
            @color = color
            @sfx = sfx
            CLOTHING_ARRAY << self
        end

        property name : String
        property id : String
        property is_owned : Bool
        @[JSON::Field(ignore: true)]
        property sprite : SF::Sprite?
        @[JSON::Field(ignore: true)]
        property sfx : SF::Sound?
        property color : String
    end
end