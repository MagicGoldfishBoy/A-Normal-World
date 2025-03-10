require "crsfml"
require "../src/textures.cr"

module Body
    class Hair
        HAIR_ARRAY = [] of Hair
        def initialize(name : String, id : Int32, is_owned : Bool, length : String, style : String, texture : SF::Texture, color : String)
         @name = name
         @@name = name
         @id = id
         @is_owned = is_owned
         @length = length
         @style = style
         @texture = texture
         @color = color
         HAIR_ARRAY.push(self)
        end
 
        getter name : String
        getter id : Int32
        getter length : String
        getter style : String
        getter texture : SF::Texture
        getter color : String
        property is_owned : Bool
 
        def Hair.name
         @@name
        end
 
        def Hair.id
         @@id
        end
 
        def Hair.is_owned
         @@is_owned
        end
 
        def Hair.length
         @@length
        end
 
        def Hair.style
         @@style
        end
 
        def Hair.texture
         @@texture
        end
 
        def Hair.color
         @@texture
        end
 
        def Hair.is_owned=(this)
         @@is_owned = this
        end
 
        def Hair.get_hair(this)
         HAIR_ARRAY.each { |hair| if hair.name == this
         return hair
         end }
        end
 
        def Hair.get_hair_texture(this)
         HAIR_ARRAY.each { |hair| if hair.name == this
         return hair.texture
         end }
        end
 
        @@nil_hair = Hair.new("No Hair", 0, false, "very_short", "plain", NIL_TEXTURE, "white")

        @@white_shounen_hair = Hair.new("White Shounen Hair", 1, false, "short", "quirky", SHOUNEN_HAIR_WHITE_TEXTURE, "white")
        @@white_shounen_hair_hat = Hair.new("White Shounen Hair Hat", 2, false, "short", "quirky", SHOUNEN_HAIR_WHITE_HAT_TEXTURE, "white")

        @@black_shounen_hair = Hair.new("Black Shounen Hair", 3, false, "short", "quirky", SHOUNEN_HAIR_BLACK_TEXTURE, "black")
        @@black_shounen_hair_hat = Hair.new("Black Shounen Hair Hat", 4, false, "short", "quirky", SHOUNEN_HAIR_BLACK_HAT_TEXTURE, "black")

        @@red_shounen_hair = Hair.new("Red Shounen Hair", 5, false, "short", "quirky", SHOUNEN_HAIR_RED_TEXTURE, "red")
        @@red_shounen_hair_hat = Hair.new("Red Shounen Hair Hat", 6, false, "short", "quirky", SHOUNEN_HAIR_RED_HAT_TEXTURE, "red")

        @@orange_shounen_hair = Hair.new("Orange Shounen Hair", 7, false, "short", "quirky", SHOUNEN_HAIR_ORANGE_TEXTURE, "orange")
        @@orange_shounen_hair_hat = Hair.new("Orange Shounen Hair Hat", 8, false, "short", "quirky", SHOUNEN_HAIR_ORANGE_HAT_TEXTURE, "orange")

        @@blond_shounen_hair = Hair.new("Blond Shounen Hair", 9, false, "short", "quirky", SHOUNEN_HAIR_BLOND_TEXTURE, "blond")
        @@blond_shounen_hair_hat = Hair.new("Blond Shounen Hair Hat", 10, false, "short", "quirky", SHOUNEN_HAIR_BLOND_HAT_TEXTURE, "blond")

        @@light_blond_shounen_hair = Hair.new("Light Blond Shounen Hair", 11, false, "short", "quirky", SHOUNEN_HAIR_LIGHT_BLOND_TEXTURE, "light_blond")
        @@light_blond_shounen_hair_hat = Hair.new("Light Blond Shounen Hair Hat", 12, false, "short", "quirky", SHOUNEN_HAIR_LIGHT_BLOND_HAT_TEXTURE, "light_blond")

        @@green_shounen_hair = Hair.new("Green Shounen Hair", 13, false, "short", "quirky", SHOUNEN_HAIR_GREEN_TEXTURE, "green")
        @@green_shounen_hair_hat = Hair.new("Green Shounen Hair Hat", 14, false, "short", "quirky", SHOUNEN_HAIR_GREEN_HAT_TEXTURE, "green")

        @@blue_shounen_hair = Hair.new("Blue Shounen Hair", 15, false, "short", "quirky", SHOUNEN_HAIR_BLUE_TEXTURE, "blue")
        @@blue_shounen_hair_hat = Hair.new("Blue Shounen Hair Hat", 16, false, "short", "quirky", SHOUNEN_HAIR_BLUE_HAT_TEXTURE, "blue")

        @@purple_shounen_hair = Hair.new("Purple Shounen Hair", 17, false, "short", "quirky", SHOUNEN_HAIR_PURPLE_TEXTURE, "purple")
        @@purple_shounen_hair_hat = Hair.new("Purple Shounen Hair Hat", 18, false, "short", "quirky", SHOUNEN_HAIR_PURPLE_HAT_TEXTURE, "purple")

        @@pink_shounen_hair = Hair.new("Pink Shounen Hair", 19, false, "short", "quirky", SHOUNEN_HAIR_PINK_TEXTURE, "pink")
        @@pink_shounen_hair_hat = Hair.new("Pink Shounen Hair Hat", 20, false, "short", "quirky", SHOUNEN_HAIR_PINK_HAT_TEXTURE, "pink")

        @@brown_shounen_hair = Hair.new("Brown Shounen Hair", 20, false, "short", "quirky", SHOUNEN_HAIR_BROWN_TEXTURE, "brown")
        @@brown_shounen_hair_hat = Hair.new("Brown Shounen Hair Hat", 21, false, "short", "quirky", SHOUNEN_HAIR_BROWN_HAT_TEXTURE, "brown")


        @@white_ponytail_hair = Hair.new("White Ponytail Hair", 100, false, "long", "sporty", PONYTAIL_HAIR_WHITE_TEXTURE, "white")
        @@white_ponytail_hair_hat = Hair.new("White Ponytail Hair Hat", 101, false, "long", "sporty", PONYTAIL_HAIR_WHITE_HAT_TEXTURE, "white")

        @@black_ponytail_hair = Hair.new("Black Ponytail Hair", 102, false, "long", "sporty", PONYTAIL_HAIR_BLACK_TEXTURE, "black")
        @@black_ponytail_hair_hat = Hair.new("Black Ponytail Hair Hat", 103, false, "long", "sporty", PONYTAIL_HAIR_BLACK_TEXTURE, "black")

        @@red_ponytail_hair = Hair.new("Red Ponytail Hair", 104, false, "long", "sporty", PONYTAIL_HAIR_RED_TEXTURE, "red")
        @@red_ponytail_hair_hat = Hair.new("Red Ponytail Hair Hat", 105, false, "long", "sporty", PONYTAIL_HAIR_RED_HAT_TEXTURE, "red")

        @@orange_ponytail_hair = Hair.new("Orange Ponytail Hair", 106, false, "long", "sporty", PONYTAIL_HAIR_ORANGE_TEXTURE, "orange")
        @@orange_ponytail_hair_hat = Hair.new("Orange Ponytail Hair Hat", 107, false, "long", "sporty", PONYTAIL_HAIR_ORANGE_HAT_TEXTURE, "orange")

        @@blonde_ponytail_hair = Hair.new("Blonde Ponytail Hair", 108, false, "long", "sporty", PONYTAIL_HAIR_BLONDE_TEXTURE, "blond")
        @@blonde_ponytail_hair = Hair.new("Blonde Ponytail Hair", 109, false, "long", "sporty", PONYTAIL_HAIR_BLONDE_TEXTURE, "blond")

        @@light_blonde_ponytail_hair = Hair.new("Light Blonde Ponytail Hair", 110, false, "long", "sporty", PONYTAIL_HAIR_LIGHT_BLONDE_TEXTURE, "light_blond")
        @@light_blonde_ponytail_hair_Hat = Hair.new("Light Blonde Ponytail Hair Hat", 111, false, "long", "sporty", PONYTAIL_HAIR_LIGHT_BLONDE_HAT_TEXTURE, "light_blond")

        @@orange_ponytail_hair = Hair.new("Orange Ponytail Hair", 112, false, "long", "sporty", PONYTAIL_HAIR_ORANGE_TEXTURE, "orange")
        @@orange_ponytail_hair_hat = Hair.new("Orange Ponytail Hair Hat", 113, false, "long", "sporty", PONYTAIL_HAIR_ORANGE_HAT_TEXTURE, "orange")

        @@green_ponytail_hair = Hair.new("Green Ponytail Hair", 114, false, "long", "sporty", PONYTAIL_HAIR_GREEN_TEXTURE, "green")
        @@green_ponytail_hair_hat = Hair.new("Green Ponytail Hair Hat", 115, false, "long", "sporty", PONYTAIL_HAIR_GREEN_HAT_TEXTURE, "green")

        @@blue_ponytail_hair = Hair.new("Blue Ponytail Hair", 116, false, "long", "sporty", PONYTAIL_HAIR_BLUE_TEXTURE, "Blue")
        @@blue_ponytail_hair_hat = Hair.new("Blue Ponytail Hair Hat", 117, false, "long", "sporty", PONYTAIL_HAIR_BLUE_HAT_TEXTURE, "Blue")

        @@purple_ponytail_hair = Hair.new("Purple Ponytail Hair", 118, false, "long", "sporty", PONYTAIL_HAIR_PURPLE_TEXTURE, "purple")
        @@purple_ponytail_hair_hat = Hair.new("Purple Ponytail Hair Hat", 119, false, "long", "sporty", PONYTAIL_HAIR_PURPLE_HAT_TEXTURE, "purple")

        @@pink_ponytail_hair = Hair.new("Pink Ponytail Hair", 120, false, "long", "sporty", PONYTAIL_HAIR_PINK_TEXTURE, "pink")
        @@pink_ponytail_hair_hat = Hair.new("Pink Ponytail Hair Hat", 121, false, "long", "sporty", PONYTAIL_HAIR_PINK_HAT_TEXTURE, "pink")

        @@brown_ponytail_hair = Hair.new("Brown Ponytail Hair", 122, false, "long", "sporty", PONYTAIL_HAIR_BROWN_TEXTURE, "brown")
        @@brown_ponytail_hair_hat = Hair.new("Brown Ponytail Hair Hat", 123, false, "long", "sporty", PONYTAIL_HAIR_BROWN_HAT_TEXTURE, "brown")
    end
end