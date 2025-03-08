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

       @@white_tube_top = Shirt.new("White Tube-Top", 200, false, "none", "sexy", WHITE_TUBE_TOP_TEXTURE, "white")
       @@black_tube_top = Shirt.new("Black Tube-Top", 201, false, "none", "sexy", BLACK_TUBE_TOP_TEXTURE, "black")
       @@red_tube_top = Shirt.new("Red Tube-Top", 202, false, "none", "sexy", RED_TUBE_TOP_TEXTURE, "red")
       @@orange_tube_top = Shirt.new("Orange Tube-Top", 203, false, "none", "sexy", ORANGE_TUBE_TOP_TEXTURE, "orange")
       @@yellow_tube_top = Shirt.new("Yellow Tube-Top", 204, false, "none", "sexy", YELLOW_TUBE_TOP_TEXTURE, "yellow")
       @@green_tube_top = Shirt.new("Green Tube-Top", 205, false, "none", "sexy", GREEN_TUBE_TOP_TEXTURE, "green")
       @@blue_tube_top = Shirt.new("Blue Tube-Top", 206, false, "none", "sexy", BLUE_TUBE_TOP_TEXTURE, "blue")
       @@purple_tube_top = Shirt.new("Purple Tube-Top", 207, false, "none", "sexy", PURPLE_TUBE_TOP_TEXTURE, "purple")
       @@pink_tube_top = Shirt.new("Pink Tube-Top", 208, false, "none", "sexy", PINK_TUBE_TOP_TEXTURE, "pink")


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

        @@white_booty_shorts = Pants.new("White Booty Shorts", 100, false, "very_short", "sexy", BOOTY_SHORTS_WHITE_TEXTURE, "white", false)
        @@black_booty_shorts = Pants.new("Black Booty Shorts", 101, false, "very_short", "sexy", BOOTY_SHORTS_BLACK_TEXTURE, "black", false)
        @@red_booty_shorts = Pants.new("Red Booty Shorts", 102, false, "very_short", "sexy", BOOTY_SHORTS_RED_TEXTURE, "red", false)
        @@orange_booty_shorts = Pants.new("Orange Booty Shorts", 103, false, "very_short", "sexy", BOOTY_SHORTS_ORANGE_TEXTURE, "orange", false)
        @@yellow_booty_shorts = Pants.new("Yellow Booty Shorts", 104, false, "very_short", "sexy", BOOTY_SHORTS_YELLOW_TEXTURE, "yellow", false)
        @@green_booty_shorts = Pants.new("Green Booty Shorts", 105, false, "very_short", "sexy", BOOTY_SHORTS_GREEN_TEXTURE, "green", false)
        @@blue_booty_shorts = Pants.new("Blue Booty Shorts", 106, false, "very_short", "sexy", BOOTY_SHORTS_BLUE_TEXTURE, "blue", false)
        @@purple_booty_shorts = Pants.new("Purple Booty Shorts", 107, false, "very_short", "sexy", BOOTY_SHORTS_PURPLE_TEXTURE, "purple", false)
        @@pink_booty_shorts = Pants.new("Pink Booty Shorts", 108, false, "very_short", "sexy", BOOTY_SHORTS_PINK_TEXTURE, "pink", false)

        @@white_shorts = Pants.new("White Shorts", 200, false, "short", "plain", SHORTS_WHITE_TEXTURE, "white", false)
        @@black_shorts = Pants.new("Black Shorts", 201, false, "short", "plain", SHORTS_BLACK_TEXTURE, "black", false)
        @@red_shorts = Pants.new("Red Shorts", 202, false, "short", "plain", SHORTS_RED_TEXTURE, "red", false)
        @@orange_shorts = Pants.new("Orange Shorts", 203, false, "short", "plain", SHORTS_ORANGE_TEXTURE, "orange", false)
        @@yellow_shorts = Pants.new("Yellow Shorts", 204, false, "short", "plain", SHORTS_YELLOW_TEXTURE, "yellow", false)
        @@green_shorts = Pants.new("Green Shorts", 205, false, "short", "plain", SHORTS_GREEN_TEXTURE, "green", false)
        @@blue_shorts = Pants.new("Blue Shorts", 206, false, "short", "plain", SHORTS_BLUE_TEXTURE, "blue", false)
        @@purple_shorts = Pants.new("Purple Shorts", 207, false, "short", "plain", SHORTS_PURPLE_TEXTURE, "purple", false)
        @@pink_shorts = Pants.new("Pink Shorts", 208, false, "short", "plain", SHORTS_PINK_TEXTURE, "pink", false)

    end

    class Shoes
        SHOES_ARRAY = [] of Shoes
        def initialize(name : String, id : Int32, is_owned : Bool, length : String, style : String, texture : SF::Texture, color : String)
         @name = name
         @@name = name
         @id = id
         @is_owned = is_owned
         @length = length
         @style = style
         @texture = texture
         @color = color
         SHOES_ARRAY.push(self)
        end
 
        getter name : String
        getter id : Int32
        getter length : String
        getter style : String
        getter texture : SF::Texture
        getter color : String
        property is_owned : Bool
 
        def Shoes.name
         @@name
        end
 
        def Shoes.id
         @@id
        end
 
        def Shoes.is_owned
         @@is_owned
        end
 
        def Shoes.length
         @@length
        end
 
        def Shoes.style
         @@style
        end
 
        def Shoes.texture
         @@texture
        end
 
        def Shoes.color
         @@texture
        end
 
        def Shoes.is_owned=(this)
         @@is_owned = this
        end
 
        def Shoes.get_shoes(this)
         SHOES_ARRAY.each { |shoes| if shoes.name == this
         return shoes
         end }
        end
 
        def Shoes.get_shoes_texture(this)
         SHOES_ARRAY.each { |shoes| if shoes.name == this
         return shoes.texture
         end }
        end

        @@white_rain_boots = Shoes.new("White Rain Boots", 1, false, "long", "plain", RAIN_BOOTS_WHITE_TEXTURE, "white")
        @@black_rain_boots = Shoes.new("Black Rain Boots", 2, false, "long", "plain", RAIN_BOOTS_BLACK_TEXTURE, "black")
        @@red_rain_boots = Shoes.new("Red Rain Boots", 3, false, "long", "plain", RAIN_BOOTS_RED_TEXTURE, "red")
        @@orange_rain_boots = Shoes.new("Orange Rain Boots", 4, false, "long", "plain", RAIN_BOOTS_ORANGE_TEXTURE, "orange")
        @@yellow_rain_boots = Shoes.new("Yellow Rain Boots", 5, false, "long", "plain", RAIN_BOOTS_YELLOW_TEXTURE, "yellow")
        @@green_rain_boots = Shoes.new("Green Rain Boots", 6, false, "long", "plain", RAIN_BOOTS_GREEN_TEXTURE, "green")
        @@blue_rain_boots = Shoes.new("Blue Rain Boots", 7, false, "long", "plain", RAIN_BOOTS_BLUE_TEXTURE, "blue")
        @@purple_rain_boots = Shoes.new("Purple Rain Boots", 8, false, "long", "plain", RAIN_BOOTS_PURPLE_TEXTURE, "purple")
        @@pink_rain_boots = Shoes.new("Pink Rain Boots", 9, false, "long", "plain", RAIN_BOOTS_PINK_TEXTURE, "pink")

        @@white_sneakers = Shoes.new("White Sneakers", 100, false, "short", "plain", SNEAKERS_WHITE_TEXTURE, "white")
        @@black_sneakers = Shoes.new("Black Sneakers", 101, false, "short", "plain", SNEAKERS_BLACK_TEXTURE, "black")
        @@red_sneakers = Shoes.new("Red Sneakers", 102, false, "short", "plain", SNEAKERS_RED_TEXTURE, "red")
        @@orange_sneakers = Shoes.new("Orange Sneakers", 103, false, "short", "plain", SNEAKERS_ORANGE_TEXTURE, "orange")
        @@yellow_sneakers = Shoes.new("Yellow Sneakers", 104, false, "short", "plain", SNEAKERS_YELLOW_TEXTURE, "yellow")
        @@green_sneakers = Shoes.new("Green Sneakers", 105, false, "short", "plain", SNEAKERS_GREEN_TEXTURE, "green")
        @@blue_sneakers = Shoes.new("Blue Sneakers", 106, false, "short", "plain", SNEAKERS_BLUE_TEXTURE, "blue")
        @@purple_sneakers = Shoes.new("Purple Sneakers", 107, false, "short", "plain", SNEAKERS_PURPLE_TEXTURE, "purple")
        @@pink_sneakers = Shoes.new("Pink Sneakers", 108, false, "short", "plain", SNEAKERS_PINK_TEXTURE, "pink")
    end

    class Gloves
        GLOVES_ARRAY = [] of Gloves
        def initialize(name : String, id : Int32, is_owned : Bool, length : String, style : String, texture : SF::Texture, color : String)
         @name = name
         @@name = name
         @id = id
         @is_owned = is_owned
         @length = length
         @style = style
         @texture = texture
         @color = color
         GLOVES_ARRAY.push(self)
        end
 
        getter name : String
        getter id : Int32
        getter length : String
        getter style : String
        getter texture : SF::Texture
        getter color : String
        property is_owned : Bool
 
        def Gloves.name
         @@name
        end
 
        def Gloves.id
         @@id
        end
 
        def Gloves.is_owned
         @@is_owned
        end
 
        def Gloves.length
         @@length
        end
 
        def Gloves.style
         @@style
        end
 
        def Gloves.texture
         @@texture
        end
 
        def Gloves.color
         @@texture
        end
 
        def Gloves.is_owned=(this)
         @@is_owned = this
        end
 
        def Gloves.get_gloves(this)
         GLOVES_ARRAY.each { |gloves| if gloves.name == this
         return gloves
         end }
        end
 
        def Gloves.get_gloves_texture(this)
         GLOVES_ARRAY.each { |gloves| if gloves.name == this
         return gloves.texture
         end }
        end

        @@nil_gloves = Gloves.new("No Gloves", 0, false, "very_short", "plain", NIL_TEXTURE, "white")
        @@white_fingerless_gloves = Gloves.new("White Fingerless Gloves", 1, false, "very_short", "punk", FINGERLESS_GLOVES_WHITE_TEXTURE, "white")
    end
end