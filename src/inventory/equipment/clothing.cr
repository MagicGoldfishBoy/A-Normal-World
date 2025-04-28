require "crsfml"
require "crsfml/audio"
require "../../../src/textures.cr"
require "../../../src/utility.cr"

module Clothing
    class ClothingBase
        CLOTHING_ARRAY = [] of ClothingBase
        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, color : String)
            @name = name
            @id = id
            @is_owned = is_owned
            @sprite = sprite
            @color = color
            CLOTHING_ARRAY << self
        end

        property name : String
        property id : String
        property is_owned : Bool
        @[JSON::Field(ignore: true)]
        property sprite : SF::Sprite?
        property color : String
    end
end