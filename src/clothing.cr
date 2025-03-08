require "crsfml"
require "../src/textures.cr"

module Clothing
    class Shirt
        SHIRT_ARRAY = [] of Shirt
       def initialize(name : String, id : Int32, is_owned : Bool, sleeve_length : String, style : String, texture : SF::Texture, color : String)
        @name = name
        @@name = name
        @id = id
        @is_owned = is_owned
        @sleeve_length = sleeve_length
        @style = style
        @texture = texture
        @color = color
        SHIRT_ARRAY.push(self)
       end

       getter name : String
       getter id : Int32
       getter sleeve_length : String
       getter style : String
       getter texture : SF::Texture
       getter color : String
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

       def Shirt.color
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

       @@white_tank_top = Shirt.new("White Tank Top", 1, false, "very_short", "plain", TANK_TOP_WHITE_TEXTURE, "white")
       @@black_tank_top = Shirt.new("Black Tank Top", 2, false, "very_short", "plain", TANK_TOP_BLACK_TEXTURE, "black")
       @@red_tank_top = Shirt.new("Red Tank Top", 3, false, "very_short", "plain", TANK_TOP_RED_TEXTURE, "red")
       @@orange_tank_top = Shirt.new("Orange Tank Top", 4, false, "very_short", "plain", TANK_TOP_ORANGE_TEXTURE, "orange")
       @@yellow_tank_top = Shirt.new("Yellow Tank Top", 5, false, "very_short", "plain", TANK_TOP_YELLOW_TEXTURE, "yellow")
       @@green_tank_top = Shirt.new("Green Tank Top", 6, false, "very_short", "plain", TANK_TOP_GREEN_TEXTURE, "green")
       @@blue_tank_top = Shirt.new("Blue Tank Top", 7, false, "very_short", "plain", TANK_TOP_BLUE_TEXTURE, "blue")
       @@purple_tank_top = Shirt.new("Purple Tank Top", 8, false, "very_short", "plain", TANK_TOP_PURPLE_TEXTURE, "purple")
       @@pink_tank_top = Shirt.new("Pink Tank Top", 9, false, "very_short", "plain", TANK_TOP_PINK_TEXTURE, "pink")

       @@white_t_shirt = Shirt.new("White_T-Shirt", 100, false, "short", "plain", T_SHIRT_WHITE_TEXTURE, "white")
       @@black_t_shirt = Shirt.new("Black_T-Shirt", 101, false, "short", "plain", T_SHIRT_BLACK_TEXTURE, "black")
       @@red_t_shirt = Shirt.new("Red_T-Shirt", 102, false, "short", "plain", T_SHIRT_RED_TEXTURE, "red")
       @@orange_t_shirt = Shirt.new("Orange_T-Shirt", 103, false, "short", "plain", T_SHIRT_ORANGE_TEXTURE, "orange")
       @@yellow_t_shirt = Shirt.new("Yellow_T-Shirt", 104, false, "short", "plain", T_SHIRT_YELLOW_TEXTURE, "yellow")
       @@green_t_shirt = Shirt.new("Green_T-Shirt", 105, false, "short", "plain", T_SHIRT_GREEN_TEXTURE, "green")
       @@blue_t_shirt = Shirt.new("Blue_T-Shirt", 106, false, "short", "plain", T_SHIRT_BLUE_TEXTURE, "blue")
       @@purple_t_shirt = Shirt.new("Purple T-Shirt", 107, false, "short", "plain", T_SHIRT_PURPLE_TEXTURE, "purple")
       @@pink_t_shirt = Shirt.new("Pink T-Shirt", 108, false, "short", "plain", T_SHIRT_PINK_TEXTURE, "pink")

       @@white_tube_top = Shirt.new("White Tube-Top", 200, false, "none", "plain", WHITE_TUBE_TOP_TEXTURE, "white")
       @@black_tube_top = Shirt.new("Black Tube-Top", 201, false, "none", "plain", BLACK_TUBE_TOP_TEXTURE, "black")
       @@red_tube_top = Shirt.new("Red Tube-Top", 202, false, "none", "plain", RED_TUBE_TOP_TEXTURE, "red")
       @@orange_tube_top = Shirt.new("Orange Tube-Top", 203, false, "none", "plain", ORANGE_TUBE_TOP_TEXTURE, "orange")
       @@yellow_tube_top = Shirt.new("Yellow Tube-Top", 204, false, "none", "plain", YELLOW_TUBE_TOP_TEXTURE, "yellow")
       @@green_tube_top = Shirt.new("Green Tube-Top", 205, false, "none", "plain", GREEN_TUBE_TOP_TEXTURE, "green")
       @@blue_tube_top = Shirt.new("Blue Tube-Top", 206, false, "none", "plain", BLUE_TUBE_TOP_TEXTURE, "blue")
       @@purple_tube_top = Shirt.new("Purple Tube-Top", 207, false, "none", "plain", PURPLE_TUBE_TOP_TEXTURE, "purple")
       @@pink_tube_top = Shirt.new("Pink Tube-Top", 208, false, "none", "plain", PINK_TUBE_TOP_TEXTURE, "pink")


       @@white_layered_shirt = Shirt.new("White Layered Shirt", 300, false, "long", "plain", WHITE_LAYERED_SHIRT_TEXTURE, "white")
       @@black_layered_shirt = Shirt.new("Black Layered Shirt", 301, false, "long", "plain", BLACK_LAYERED_SHIRT_TEXTURE, "black")
       @@red_layered_shirt = Shirt.new("Red Layered Shirt", 302, false, "long", "plain", RED_LAYERED_SHIRT_TEXTURE, "red")
       @@orange_layered_shirt = Shirt.new("Orange Layered Shirt", 303, false, "long", "plain", ORANGE_LAYERED_SHIRT_TEXTURE, "orange")
       @@yellow_layered_shirt = Shirt.new("Yellow Layered Shirt", 304, false, "long", "plain", YELLOW_LAYERED_SHIRT_TEXTURE, "yellow")
       @@green_layered_shirt = Shirt.new("Green Layered Shirt", 305, false, "long", "plain", GREEN_LAYERED_SHIRT_TEXTURE, "green")
       @@blue_layered_shirt = Shirt.new("Blue Layered Shirt", 306, false, "long", "plain", BLUE_LAYERED_SHIRT_TEXTURE, "blue")
       @@purple_layered_shirt = Shirt.new("Purple Layered Shirt", 307, false, "long", "plain", PURPLE_LAYERED_SHIRT_TEXTURE, "purple")
       @@pink_layered_shirt = Shirt.new("Pink Layered Shirt", 308, false, "long", "plain", PINK_LAYERED_SHIRT_TEXTURE, "pink")
    end

    class Pants
        PANTS_ARRAY = [] of Pants
        def initialize(name : String, id : Int32, is_owned : Bool, length : String, style : String, texture : SF::Texture, color : String, is_skirt : Bool)
         @name = name
         @@name = name
         @id = id
         @is_owned = is_owned
         @length = length
         @style = style
         @texture = texture
         @color = color
         @is_skirt = is_skirt
         PANTS_ARRAY.push(self)
        end
 
        getter name : String
        getter id : Int32
        getter length : String
        getter style : String
        getter texture : SF::Texture
        getter color : String
        getter is_skirt : Bool
        property is_owned : Bool
 
        def Pants.name
         @@name
        end
 
        def Pants.id
         @@id
        end
 
        def Pants.is_owned
         @@is_owned
        end
 
        def Pants.length
         @@length
        end
 
        def Pants.style
         @@style
        end
 
        def Pants.texture
         @@texture
        end
 
        def Pants.color
         @@texture
        end
 
        def Pants.is_owned=(this)
         @@is_owned = this
        end
 
        def Pants.get_pants(this)
         PANTS_ARRAY.each { |pants| if pants.name == this
         return pants
         end }
        end
 
        def Pants.get_pants_texture(this)
         PANTS_ARRAY.each { |pants| if pants.name == this
         return pants.texture
         end }
        end

        @@white_jeans = Pants.new("White Jeans", 1, false, "long", "plain", JEANS_WHITE_TEXTURE, "white", false)
        @@black_jeans = Pants.new("Black Jeans", 2, false, "long", "plain", JEANS_BLACK_TEXTURE, "black", false)
        @@red_jeans = Pants.new("Red Jeans", 3, false, "long", "plain", JEANS_RED_TEXTURE, "red", false)
        @@orange_jeans = Pants.new("Orange Jeans", 4, false, "long", "plain", JEANS_ORANGE_TEXTURE, "orange", false)
        @@yellow_jeans = Pants.new("Yellow Jeans", 5, false, "long", "plain", JEANS_YELLOW_TEXTURE, "yellow", false)
        @@green_jeans = Pants.new("Green Jeans", 6, false, "long", "plain", JEANS_GREEN_TEXTURE, "green", false)
        @@blue_jeans = Pants.new("Blue Jeans", 7, false, "long", "plain", JEANS_BLUE_TEXTURE, "blue", false)
        @@purple_jeans = Pants.new("Purple Jeans", 8, false, "long", "plain", JEANS_PURPLE_TEXTURE, "purple", false)
        @@pink_jeans = Pants.new("Pink Jeans", 9, false, "long", "plain", JEANS_PINK_TEXTURE, "pink", false)

    end
end