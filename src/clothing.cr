require "crsfml"
require "../src/textures.cr"

module Clothing
    class Shirt
        SHIRT_ARRAY = [] of Shirt
       def initialize(name : String, id : Int32, is_owned : Bool, sleeve_length : String, style : String, texture : SF::Texture)
        @@name = name
        @@id = id
        @@is_owned = is_owned
        @@sleeve_length = sleeve_length
        @@style = style
        @@texture = texture
       end

       def name
        @@name
       end

       def id
        @@id
       end

       def is_owned
        @@is_owned
       end

       def sleeve_length
        @@sleeve_length
       end

       def style
        @@style
       end

       def texture
        @@texture
       end

       def is_owned=(this)
        @@is_owned = this
       end

       @@white_tank_top = Shirt.new("white_tank_top", 1, false, "very_short", "plain", TANK_TOP_WHITE_TEXTURE)
    end
end