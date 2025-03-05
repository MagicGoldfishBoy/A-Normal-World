require "crsfml"
require "../src/textures.cr"

module Clothing
    class Shirt
        SHIRT_ARRAY = [] of Shirt
       def initialize(name : String, id : Int32, is_owned : Bool, sleeve_length : String, style : String, texture : SF::Texture)
        @name = name
        @@name = name
        @id = id
        @is_owned = is_owned
        @sleeve_length = sleeve_length
        @style = style
        @texture = texture
        SHIRT_ARRAY.push(self)
       end

       getter name : String
       getter id : Int32
       getter sleeve_length : String
       getter style : String
       getter texture : SF::Texture
       property is_owned : Bool

       def Shirt.name
        @@name
       end

       def Shirt.id
        @@id
       end

       def Shirt.is_owned
        @@is_owned
       end

       def Shirt.sleeve_length
        @@sleeve_length
       end

       def Shirt.style
        @@style
       end

       def Shirt.texture
        @@texture
       end

       def Shirt.is_owned=(this)
        @@is_owned = this
       end

       def Shirt.get_shirt(this)
        SHIRT_ARRAY.each { |shirt| if shirt.name == this
        return shirt
        end }
       end

       def Shirt.get_shirt_texture(this)
        SHIRT_ARRAY.each { |shirt| if shirt.name == this
        return shirt.texture
        end }
       end

       @@white_tank_top = Shirt.new("White_tank_top", 1, false, "very_short", "plain", TANK_TOP_WHITE_TEXTURE)
       @@black_tank_top = Shirt.new("Black_tank_top", 2, false, "very_short", "plain", TANK_TOP_BLACK_TEXTURE)
       @@orange_tank_top = Shirt.new("Orange_tank_top", 3, false, "very_short", "plain", TANK_TOP_ORANGE_TEXTURE)
    end
end