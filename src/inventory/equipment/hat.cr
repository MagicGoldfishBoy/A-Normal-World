require "crsfml"
require "crsfml/audio"
require "../../../src/textures.cr"
require "../../../src/utility.cr"
require "../../../src/inventory/equipment/clothing.cr"

module Hat
    class HatBase < Clothing::ClothingBase
        include JSON::Serializable

        HAT_ARRAY = [] of HatBase 
        OWNED_HAT_ARRAY = [] of HatBase | Clothing::ClothingBase
        HAT_SPRITE_HASH = Hash(String, SF::Sprite).new

        property name : String
        property id : String
        property is_owned : Bool
        property color : String       
        property covers_hair : Bool
        property sprite : SF::Sprite?

     def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, color : String, covers_hair : Bool)
        @name = name
        @id = id
        @is_owned = is_owned
        @sprite = sprite
        @color = color
        @covers_hair = covers_hair
        HAT_ARRAY << self
        if self.is_owned
         OWNED_HAT_ARRAY << self
        end
     end
     
    end
    class BaseballCap < HatBase
        @@white_baseball_cap = BaseballCap.new("White Baseball Cap", "W/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "white", true)
        HAT_SPRITE_HASH[@@white_baseball_cap.id] = @@white_baseball_cap.sprite.as(SF::Sprite)

        @@grey_baseball_cap = BaseballCap.new("Grey Baseball Cap", "Gy/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "grey", true)
        @@grey_baseball_cap.sprite.as(SF::Sprite).color = SF.color(100, 100, 100) 
        HAT_SPRITE_HASH[@@grey_baseball_cap.id] = @@grey_baseball_cap.sprite.as(SF::Sprite)

        @@black_baseball_cap = BaseballCap.new("Black Baseball Cap", "Bk/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "black", true)
        @@black_baseball_cap.sprite.as(SF::Sprite).color = SF.color(25, 25, 25) 
        HAT_SPRITE_HASH[@@black_baseball_cap.id] = @@black_baseball_cap.sprite.as(SF::Sprite)

        @@tan_baseball_cap = BaseballCap.new("Tan Baseball Cap", "T/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "tan", true)
        @@tan_baseball_cap.sprite.as(SF::Sprite).color = SF.color(210, 180, 140)
        HAT_SPRITE_HASH[@@tan_baseball_cap.id] = @@tan_baseball_cap.sprite.as(SF::Sprite)

        @@brown_baseball_cap = BaseballCap.new("Brown Baseball Cap", "Br/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "brown", true)
        @@brown_baseball_cap.sprite.as(SF::Sprite).color = SF.color(139, 69, 19)
        HAT_SPRITE_HASH[@@brown_baseball_cap.id] = @@brown_baseball_cap.sprite.as(SF::Sprite)

        @@red_baseball_cap = BaseballCap.new("Red Baseball Cap", "R/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "red", true)
        @@red_baseball_cap.sprite.as(SF::Sprite).color = SF.color(136, 8, 8)
        HAT_SPRITE_HASH[@@red_baseball_cap.id] = @@red_baseball_cap.sprite.as(SF::Sprite)

        @@orange_baseball_cap = BaseballCap.new("Orange Baseball Cap", "O/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "orange", true)
        @@orange_baseball_cap.sprite.as(SF::Sprite).color = SF.color(255, 117, 24)
        HAT_SPRITE_HASH[@@orange_baseball_cap.id] = @@orange_baseball_cap.sprite.as(SF::Sprite)

        @@yellow_baseball_cap = BaseballCap.new("Yellow Baseball Cap", "Y/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "yellow", true)
        @@yellow_baseball_cap.sprite.as(SF::Sprite).color = SF.color(228, 208, 10)
        HAT_SPRITE_HASH[@@yellow_baseball_cap.id] = @@yellow_baseball_cap.sprite.as(SF::Sprite)

        @@yellow_green_baseball_cap = BaseballCap.new("Yellow-Green Baseball Cap", "Y-Gn/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "yellow-green", true)
        @@yellow_green_baseball_cap.sprite.as(SF::Sprite).color = SF.color(170, 255, 0)
        HAT_SPRITE_HASH[@@yellow_green_baseball_cap.id] = @@yellow_green_baseball_cap.sprite.as(SF::Sprite)

        @@green_baseball_cap = BaseballCap.new("Green Baseball Cap", "Gn/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "green", true)
        @@green_baseball_cap.sprite.as(SF::Sprite).color = SF.color(34, 139, 34)
        HAT_SPRITE_HASH[@@green_baseball_cap.id] = @@green_baseball_cap.sprite.as(SF::Sprite)

        @@turquoise_baseball_cap = BaseballCap.new("Turquoise Baseball Cap", "Tq/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "turquoise", true)
        @@turquoise_baseball_cap.sprite.as(SF::Sprite).color = SF.color(64, 224, 208)
        HAT_SPRITE_HASH[@@turquoise_baseball_cap.id] = @@turquoise_baseball_cap.sprite.as(SF::Sprite)

        @@light_blue_baseball_cap = BaseballCap.new("Light Blue Baseball Cap", "L-Bl/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "light-blue", true)
        @@light_blue_baseball_cap.sprite.as(SF::Sprite).color = SF.color(137, 207, 240)
        HAT_SPRITE_HASH[@@light_blue_baseball_cap.id] = @@light_blue_baseball_cap.sprite.as(SF::Sprite)

        @@blue_baseball_cap = BaseballCap.new("Blue Baseball Cap", "Bl/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "blue", true)
        @@blue_baseball_cap.sprite.as(SF::Sprite).color = SF.color(20, 52, 164)
        HAT_SPRITE_HASH[@@blue_baseball_cap.id] = @@blue_baseball_cap.sprite.as(SF::Sprite)

        @@indigo_baseball_cap = BaseballCap.new("Indigo Baseball Cap", "In/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "indigo", true)
        @@indigo_baseball_cap.sprite.as(SF::Sprite).color = SF.color(63, 0, 255)
        HAT_SPRITE_HASH[@@indigo_baseball_cap.id] = @@indigo_baseball_cap.sprite.as(SF::Sprite)

        @@light_purple_baseball_cap = BaseballCap.new("Light Purple Baseball Cap", "L-Pr/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "light-purple", true)
        @@light_purple_baseball_cap.sprite.as(SF::Sprite).color = SF.color(191, 64, 191)
        HAT_SPRITE_HASH[@@light_purple_baseball_cap.id] = @@light_purple_baseball_cap.sprite.as(SF::Sprite)

        @@purple_baseball_cap = BaseballCap.new("Purple Baseball Cap", "Pr/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "purple", true)
        @@purple_baseball_cap.sprite.as(SF::Sprite).color = SF.color(112, 41, 99)
        HAT_SPRITE_HASH[@@purple_baseball_cap.id] = @@purple_baseball_cap.sprite.as(SF::Sprite)

        @@pink_baseball_cap = BaseballCap.new("Pink Baseball Cap", "Pk/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "pink", true)
        @@pink_baseball_cap.sprite.as(SF::Sprite).color = SF.color(255, 192, 203)
        HAT_SPRITE_HASH[@@pink_baseball_cap.id] = @@pink_baseball_cap.sprite.as(SF::Sprite)

        @@hot_pink_baseball_cap = BaseballCap.new("Hot-Pink Baseball Cap", "H-Pk/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "hot-pink", true)
        @@hot_pink_baseball_cap.sprite.as(SF::Sprite).color = SF.color(255, 105, 180)
        HAT_SPRITE_HASH[@@hot_pink_baseball_cap.id] = @@hot_pink_baseball_cap.sprite.as(SF::Sprite)
    end
end