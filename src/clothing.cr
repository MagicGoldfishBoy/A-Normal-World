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

       @@white_tank_top = Shirt.new("White Tank Top", 1, false, "very_short", "plain", TANK_TOP_WHITE_TEXTURE)
       @@black_tank_top = Shirt.new("Black Tank Top", 2, false, "very_short", "plain", TANK_TOP_BLACK_TEXTURE)
       @@red_tank_top = Shirt.new("Red Tank Top", 3, false, "very_short", "plain", TANK_TOP_RED_TEXTURE)
       @@orange_tank_top = Shirt.new("Orange Tank Top", 4, false, "very_short", "plain", TANK_TOP_ORANGE_TEXTURE)
       @@yellow_tank_top = Shirt.new("Yellow Tank Top", 5, false, "very_short", "plain", TANK_TOP_YELLOW_TEXTURE)
       @@green_tank_top = Shirt.new("Green Tank Top", 6, false, "very_short", "plain", TANK_TOP_GREEN_TEXTURE)
       @@blue_tank_top = Shirt.new("Blue Tank Top", 7, false, "very_short", "plain", TANK_TOP_BLUE_TEXTURE)
       @@purple_tank_top = Shirt.new("Purple_tank_top", 8, false, "very_short", "plain", TANK_TOP_PURPLE_TEXTURE)
       @@pink_tank_top = Shirt.new("Pink_tank_top", 9, false, "very_short", "plain", TANK_TOP_PINK_TEXTURE)

       @@white_t_shirt = Shirt.new("White_T-Shirt", 100, false, "short", "plain", T_SHIRT_WHITE_TEXTURE)
       @@black_t_shirt = Shirt.new("Black_T-Shirt", 101, false, "short", "plain", T_SHIRT_BLACK_TEXTURE)
       @@red_t_shirt = Shirt.new("Red_T-Shirt", 102, false, "short", "plain", T_SHIRT_RED_TEXTURE)
       @@orange_t_shirt = Shirt.new("Orange_T-Shirt", 103, false, "short", "plain", T_SHIRT_ORANGE_TEXTURE)
       @@yellow_t_shirt = Shirt.new("Yellow_T-Shirt", 104, false, "short", "plain", T_SHIRT_YELLOW_TEXTURE)
       @@green_t_shirt = Shirt.new("Green_T-Shirt", 105, false, "short", "plain", T_SHIRT_GREEN_TEXTURE)
       @@blue_t_shirt = Shirt.new("Blue_T-Shirt", 106, false, "short", "plain", T_SHIRT_BLUE_TEXTURE)
    end
end