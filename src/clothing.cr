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

       @@nil_shirt = Shirt.new("No Shirt", 0, false, "very_short", "plain", NIL_TEXTURE, "white")

       @@white_tank_top = Shirt.new("White Tank Top", 1, false, "very_short", "plain", TANK_TOP_WHITE_TEXTURE, "white")
       @@black_tank_top = Shirt.new("Black Tank Top", 2, false, "very_short", "plain", TANK_TOP_BLACK_TEXTURE, "black")
       @@red_tank_top = Shirt.new("Red Tank Top", 3, false, "very_short", "plain", TANK_TOP_RED_TEXTURE, "red")
       @@orange_tank_top = Shirt.new("Orange Tank Top", 4, false, "very_short", "plain", TANK_TOP_ORANGE_TEXTURE, "orange")
       @@yellow_tank_top = Shirt.new("Yellow Tank Top", 5, false, "very_short", "plain", TANK_TOP_YELLOW_TEXTURE, "yellow")
       @@green_tank_top = Shirt.new("Green Tank Top", 6, false, "very_short", "plain", TANK_TOP_GREEN_TEXTURE, "green")
       @@blue_tank_top = Shirt.new("Blue Tank Top", 7, false, "very_short", "plain", TANK_TOP_BLUE_TEXTURE, "blue")
       @@purple_tank_top = Shirt.new("Purple Tank Top", 8, false, "very_short", "plain", TANK_TOP_PURPLE_TEXTURE, "purple")
       @@pink_tank_top = Shirt.new("Pink Tank Top", 9, false, "very_short", "plain", TANK_TOP_PINK_TEXTURE, "pink")

       @@white_t_shirt = Shirt.new("White T-Shirt", 100, false, "short", "plain", T_SHIRT_WHITE_TEXTURE, "white")
       @@black_t_shirt = Shirt.new("Black T-Shirt", 101, false, "short", "plain", T_SHIRT_BLACK_TEXTURE, "black")
       @@red_t_shirt = Shirt.new("Red T-Shirt", 102, false, "short", "plain", T_SHIRT_RED_TEXTURE, "red")
       @@orange_t_shirt = Shirt.new("Orange T-Shirt", 103, false, "short", "plain", T_SHIRT_ORANGE_TEXTURE, "orange")
       @@yellow_t_shirt = Shirt.new("Yellow T-Shirt", 104, false, "short", "plain", T_SHIRT_YELLOW_TEXTURE, "yellow")
       @@green_t_shirt = Shirt.new("Green T-Shirt", 105, false, "short", "plain", T_SHIRT_GREEN_TEXTURE, "green")
       @@blue_t_shirt = Shirt.new("Blue T-Shirt", 106, false, "short", "plain", T_SHIRT_BLUE_TEXTURE, "blue")
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

        @@nil_pants = Pants.new("No Pants", 0, false, "long", "plain", NIL_TEXTURE, "white", false)

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

        @@nil_shoes = Shoes.new("No Shoes", 0, false, "very_short", "plain", NIL_TEXTURE, "white")

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
        @@white_fingerless_gloves = Gloves.new("White Fingerless\n          Gloves", 1, false, "very_short", "punk", FINGERLESS_GLOVES_WHITE_TEXTURE, "white")
        @@black_fingerless_gloves = Gloves.new("Black Fingerless\n          Gloves", 2, false, "very_short", "punk", FINGERLESS_GLOVES_BLACK_TEXTURE, "black")
        @@red_fingerless_gloves = Gloves.new("Red Fingerless\n          Gloves", 3, false, "very_short", "punk", FINGERLESS_GLOVES_RED_TEXTURE, "red")
        @@orange_fingerless_gloves = Gloves.new("Orange Fingerless\n          Gloves", 4, false, "very_short", "punk", FINGERLESS_GLOVES_ORANGE_TEXTURE, "orange")
        @@yellow_fingerless_gloves = Gloves.new("Yellow Fingerless\n          Gloves", 5, false, "very_short", "punk", FINGERLESS_GLOVES_YELLOW_TEXTURE, "yellow")
        @@green_fingerless_gloves = Gloves.new("Green Fingerless\n          Gloves", 6, false, "very_short", "punk", FINGERLESS_GLOVES_GREEN_TEXTURE, "green")
        @@blue_fingerless_gloves = Gloves.new("Blue Fingerless\n          Gloves", 7, false, "very_short", "punk", FINGERLESS_GLOVES_BLUE_TEXTURE, "blue")
        @@purple_fingerless_gloves = Gloves.new("Purple Fingerless\n          Gloves", 8, false, "very_short", "punk", FINGERLESS_GLOVES_PURPLE_TEXTURE, "purple")
        @@pink_fingerless_gloves = Gloves.new("Pink Fingerless\n          Gloves", 9, false, "very_short", "punk", FINGERLESS_GLOVES_PINK_TEXTURE, "pink")

        @@white_gloves = Gloves.new("White Gloves", 100, false, "short", "plain", GLOVES_WHITE_TEXTURE, "white")
        @@black_gloves = Gloves.new("Black Gloves", 101, false, "short", "plain", GLOVES_BLACK_TEXTURE, "black")
        @@red_gloves = Gloves.new("Red Gloves", 102, false, "short", "plain", GLOVES_RED_TEXTURE, "red")
        @@orange_gloves = Gloves.new("Orange Gloves", 103, false, "short", "plain", GLOVES_ORANGE_TEXTURE, "orange")
        @@yellow_gloves = Gloves.new("Yellow Gloves", 104, false, "short", "plain", GLOVES_YELLOW_TEXTURE, "yellow")
        @@green_gloves = Gloves.new("Green Gloves", 105, false, "short", "plain", GLOVES_GREEN_TEXTURE, "green")
        @@blue_gloves = Gloves.new("Blue Gloves", 106, false, "short", "plain", GLOVES_BLUE_TEXTURE, "blue")
        @@purple_gloves = Gloves.new("Purple Gloves", 107, false, "short", "plain", GLOVES_PURPLE_TEXTURE, "purple")
        @@pink_gloves = Gloves.new("Pink Gloves", 108, false, "short", "plain", GLOVES_PINK_TEXTURE, "pink")

        @@white_opera_gloves = Gloves.new("White Opera Gloves", 200, false, "long", "plain", OPERA_GLOVES_WHITE_TEXTURE, "white")
        @@black_opera_gloves = Gloves.new("Black Opera Gloves", 201, false, "long", "plain", OPERA_GLOVES_BLACK_TEXTURE, "black")
        @@red_opera_gloves = Gloves.new("Red Opera Gloves", 202, false, "long", "plain", OPERA_GLOVES_RED_TEXTURE, "red")
        @@orange_opera_gloves = Gloves.new("Orange Opera Gloves", 203, false, "long", "plain", OPERA_GLOVES_ORANGE_TEXTURE, "orange")
        @@yellow_opera_gloves = Gloves.new("Yellow Opera Gloves", 204, false, "long", "plain", OPERA_GLOVES_YELLOW_TEXTURE, "yellow")
        @@green_opera_gloves = Gloves.new("Green Opera Gloves", 205, false, "long", "plain", OPERA_GLOVES_GREEN_TEXTURE, "green")
        @@blue_opera_gloves = Gloves.new("Blue Opera Gloves", 206, false, "long", "plain", OPERA_GLOVES_BLUE_TEXTURE, "blue")
        @@purple_opera_gloves = Gloves.new("Purple Opera Gloves", 207, false, "long", "plain", OPERA_GLOVES_PURPLE_TEXTURE, "purple")
        @@pink_opera_gloves = Gloves.new("Pink Opera Gloves", 208, false, "long", "plain", OPERA_GLOVES_PINK_TEXTURE, "pink")
    end

    class Earrings
        EARRINGS_ARRAY = [] of Earrings
        def initialize(name : String, id : Int32, is_owned : Bool, length : String, style : String, texture : SF::Texture, color : String)
         @name = name
         @@name = name
         @id = id
         @is_owned = is_owned
         @length = length
         @style = style
         @texture = texture
         @color = color
         EARRINGS_ARRAY.push(self)
        end
 
        getter name : String
        getter id : Int32
        getter length : String
        getter style : String
        getter texture : SF::Texture
        getter color : String
        property is_owned : Bool
 
        def Earrings.name
         @@name
        end
 
        def Earrings.id
         @@id
        end
 
        def Earrings.is_owned
         @@is_owned
        end
 
        def Earrings.length
         @@length
        end
 
        def Earrings.style
         @@style
        end
 
        def Earrings.texture
         @@texture
        end
 
        def Earrings.color
         @@texture
        end
 
        def Earrings.is_owned=(this)
         @@is_owned = this
        end
 
        def Earrings.get_earrings(this)
         EARRINGS_ARRAY.each { |earrings| if earrings.name == this
         return earrings
         end }
        end
 
        def Earrings.get_earrings_texture(this)
         EARRINGS_ARRAY.each { |earrings| if earrings.name == this
         return earrings.texture
         end }
        end

        @@nil_earrings = Earrings.new("No Earrings", 0, false, "very_short", "plain", NIL_TEXTURE, "white")
        @@ruby_earrings = Earrings.new("Ruby Earrings", 1, false, "long", "fancy", RUBY_EARRINGS_TEXTURE, "red")
        @@amber_earrings = Earrings.new("Amber Earrings", 2, false, "long", "quirky", AMBER_EARRINGS_TEXTURE, "orange")
        @@topaz_earrings = Earrings.new("Topaz Earrings", 3, false, "long", "fancy", TOPAZ_EARRINGS_TEXTURE, "yellow")
    end

    class Hat
        HAT_ARRAY = [] of Hat
        def initialize(name : String, id : Int32, is_owned : Bool, length : String, style : String, texture : SF::Texture, color : String)
         @name = name
         @@name = name
         @id = id
         @is_owned = is_owned
         @length = length
         @style = style
         @texture = texture
         @color = color
         HAT_ARRAY.push(self)
        end
 
        getter name : String
        getter id : Int32
        getter length : String
        getter style : String
        getter texture : SF::Texture
        getter color : String
        property is_owned : Bool
 
        def Hat.name
         @@name
        end
 
        def Hat.id
         @@id
        end
 
        def Hat.is_owned
         @@is_owned
        end
 
        def Hat.length
         @@length
        end
 
        def Hat.style
         @@style
        end
 
        def Hat.texture
         @@texture
        end
 
        def Hat.color
         @@texture
        end
 
        def Hat.is_owned=(this)
         @@is_owned = this
        end
 
        def Hat.get_hat(this)
         HAT_ARRAY.each { |hat| if hat.name == this
         return hat
         end }
        end
 
        def Hat.get_hat_texture(this)
         HAT_ARRAY.each { |hat| if hat.name == this
         return hat.texture
         end }
        end

        @@nil_hat = Hat.new("No Hat", 0, false, "floating", "plain", NIL_TEXTURE, "white")
        
        @@white_baseball_cap = Hat.new("White Baseball Cap", 1, false, "full", "sporty", WHITE_BASEBALL_CAP_TEXTURE, "white")
        @@black_baseball_cap = Hat.new("Black Baseball Cap", 2, false, "full", "sporty", BLACK_BASEBALL_CAP_TEXTURE, "black")
        @@brown_baseball_cap = Hat.new("Brown Baseball Cap", 3, false, "full", "sporty", BROWN_BASEBALL_CAP_TEXTURE, "brown")
        @@red_baseball_cap = Hat.new("Red Baseball Cap", 4, false, "full", "sporty", RED_BASEBALL_CAP_TEXTURE, "red")
        @@orange_baseball_cap = Hat.new("Orange Baseball Cap", 5, false, "full", "sporty", ORANGE_BASEBALL_CAP_TEXTURE, "orange")
        @@yellow_baseball_cap = Hat.new("Yellow Baseball Cap", 6, false, "full", "sporty", YELLOW_BASEBALL_CAP_TEXTURE, "yellow")
        @@green_baseball_cap = Hat.new("Green Baseball Cap", 7, false, "full", "sporty", GREEN_BASEBALL_CAP_TEXTURE, "green")
        @@blue_baseball_cap = Hat.new("Blue Baseball Cap", 8, false, "full", "sporty", BLUE_BASEBALL_CAP_TEXTURE, "blue")
        @@purple_baseball_cap = Hat.new("Purple Baseball Cap", 9, false, "full", "sporty", PURPLE_BASEBALL_CAP_TEXTURE, "purple")
        @@pink_baseball_cap = Hat.new("Pink Baseball Cap", 10, false, "full", "sporty", PINK_BASEBALL_CAP_TEXTURE, "pink")

        @@white_sweatband = Hat.new("White Sweatband", 100, false, "ring", "sporty", WHITE_SWEATBAND_TEXTURE, "white")
        @@black_sweatband = Hat.new("Black Sweatband", 101, false, "ring", "sporty", BLACK_SWEATBAND_TEXTURE, "black")
        @@brown_sweatband = Hat.new("Brown Sweatband", 102, false, "ring", "sporty", BROWN_SWEATBAND_TEXTURE, "brown")
        @@red_sweatband = Hat.new("Red Sweatband", 103, false, "ring", "sporty", RED_SWEATBAND_TEXTURE, "red")
        @@orange_sweatband = Hat.new("Orange Sweatband", 104, false, "ring", "sporty", ORANGE_SWEATBAND_TEXTURE, "orange")
        @@yellow_sweatband = Hat.new("Yellow Sweatband", 105, false, "ring", "sporty", YELLOW_SWEATBAND_TEXTURE, "yellow")
        @@green_sweatband = Hat.new("Green Sweatband", 106, false, "ring", "sporty", GREEN_SWEATBAND_TEXTURE, "green")
        @@blue_sweatband = Hat.new("Blue Sweatband", 107, false, "ring", "sporty", BLUE_SWEATBAND_TEXTURE, "blue")
        @@purple_sweatband = Hat.new("Purple Sweatband", 108, false, "ring", "sporty", PURPLE_SWEATBAND_TEXTURE, "purple")
        @@pink_sweatband = Hat.new("Pink Sweatband", 109, false, "ring", "sporty", PINK_SWEATBAND_TEXTURE, "pink")
    end

    class Glasses
        GLASSES_ARRAY = [] of Glasses
        def initialize(name : String, id : Int32, is_owned : Bool, glasses_type : String, style : String, texture : SF::Texture, color : String)
         @name = name
         @@name = name
         @id = id
         @is_owned = is_owned
         @glasses_type = glasses_type
         @style = style
         @texture = texture
         @color = color
         GLASSES_ARRAY.push(self)
        end
 
        getter name : String
        getter id : Int32
        getter glasses_type : String
        getter style : String
        getter texture : SF::Texture
        getter color : String
        property is_owned : Bool
 
        def Glasses.name
         @@name
        end
 
        def Glasses.id
         @@id
        end
 
        def Glasses.is_owned
         @@is_owned
        end
 
        def Glasses.glasses_type
         @@glasses_type
        end
 
        def Glasses.style
         @@style
        end
 
        def Glasses.texture
         @@texture
        end
 
        def Glasses.color
         @@texture
        end
 
        def Glasses.is_owned=(this)
         @@is_owned = this
        end
 
        def Glasses.get_glasses(this)
         GLASSES_ARRAY.each { |glasses| if glasses.name == this
         return glasses
         end }
        end
 
        def Glasses.get_glasses_texture(this)
         GLASSES_ARRAY.each { |glasses| if glasses.name == this
         return glasses.texture
         end }
        end

        @@nil_glasses = Glasses.new("No Glasses", 0, false, "nil", "plain", NIL_TEXTURE, "white")

        @@sunglasses = Glasses.new("Sunglasses", 1, false, "translucent", "cool", SUNGLASSES_TEXTURE, "black")

        @@round_glasses = Glasses.new("Round Glasses", 2, false, "transparent", "nerdy", ROUND_GLASSES_TEXTURE, "white")

        @@eye_bandage = Glasses.new("Eye Bandage", 3, false, "opaque", "cool", EYE_BANDAGE_TEXTURE, "white")
    end

    class Makeup
        MAKEUP_ARRAY = [] of Makeup
        def initialize(name : String, id : Int32, is_owned : Bool, makeup_type : String, style : String, texture : SF::Texture, color : String)
         @name = name
         @@name = name
         @id = id
         @is_owned = is_owned
         @makeup_type = makeup_type
         @style = style
         @texture = texture
         @color = color
         MAKEUP_ARRAY.push(self)
        end
 
        getter name : String
        getter id : Int32
        getter makeup_type : String
        getter style : String
        getter texture : SF::Texture
        getter color : String
        property is_owned : Bool
 
        def Makeup.name
         @@name
        end
 
        def Makeup.id
         @@id
        end
 
        def Makeup.is_owned
         @@is_owned
        end
 
        def Makeup.makeup_type
         @@makeup_type
        end
 
        def Makeup.style
         @@style
        end
 
        def Makeup.texture
         @@texture
        end
 
        def Makeup.color
         @@texture
        end
 
        def Makeup.is_owned=(this)
         @@is_owned = this
        end
 
        def Makeup.get_makeup(this)
         MAKEUP_ARRAY.each { |makeup| if makeup.name == this
         return makeup
         end }
        end
 
        def Makeup.get_makeup_texture(this)
         MAKEUP_ARRAY.each { |makeup| if makeup.name == this
         return makeup.texture
         end }
        end

        @@nil_makeup = Makeup.new("No Makeup", 0, false, "nil", "plain", NIL_TEXTURE, "white")

        @@eye_scar = Makeup.new("Eye Scar", 1, false, "eye", "cool", EYE_SCAR_BUTTON_TEXTURE, "pink")
        @@eye_scar_shounen = Makeup.new("Eye Scar Shounen", 1, false, "eye", "cool", EYE_SCAR_SHOUNEN_TEXTURE, "pink")
        @@eye_scar_button = Makeup.new("Eye Scar Button", 1, false, "eye", "cool", EYE_SCAR_BUTTON_TEXTURE, "pink")

        @@pink_makeup = Makeup.new("Pink Makeup", 1, false, "eye", "cool", PINK_MAKEUP_BUTTON_TEXTURE, "pink")
        @@pink_makeup_shounen = Makeup.new("Pink Makeup Shounen", 1, false, "eye", "cool", PINK_MAKEUP_SHOUNEN_TEXTURE, "pink")
        @@pink_makeup_button = Makeup.new("Pink Makeup Button", 1, false, "eye", "cool", PINK_MAKEUP_BUTTON_TEXTURE, "pink")
    end
end