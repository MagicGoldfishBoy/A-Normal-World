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

     def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, color : String)
        @name = name
        @id = id
        @is_owned = is_owned
        @sprite = sprite
        @color = color
        HAT_ARRAY << self
        if self.is_owned
         OWNED_HAT_ARRAY << self
        end
     end
    end
    class BaseballCap < HatBase
        @@white_baseball_cap = BaseballCap.new("White Baseball Cap", "W/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "white")

        @@grey_baseball_cap = BaseballCap.new("Grey Baseball Cap", "Gy/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "grey")
        @@grey_baseball_cap.sprite.color = SF.color(100, 100, 100) 

        @@black_baseball_cap = BaseballCap.new("Black Baseball Cap", "Bk/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "black")
        @@black_baseball_cap.sprite.color = SF.color(25, 25, 25) 

        @@tan_baseball_cap = BaseballCap.new("Tan Baseball Cap", "T/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "brown")
        @@tan_baseball_cap.sprite.color = SF.color(210, 180, 140)

        @@brown_baseball_cap = BaseballCap.new("Brown Baseball Cap", "T/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "brown")
        @@brown_baseball_cap.sprite.color = SF.color(139, 69, 19)

        @@red_baseball_cap = BaseballCap.new("Red Baseball Cap", "R/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "red")
        @@red_baseball_cap.sprite.color = SF.color(136, 8, 8)

        @@orange_baseball_cap = BaseballCap.new("Orange Baseball Cap", "O/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "orange")
        @@orange_baseball_cap.sprite.color = SF.color(255, 117, 24)

        @@yellow_baseball_cap = BaseballCap.new("Yellow Baseball Cap", "Y/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "yellow")
        @@yellow_baseball_cap.sprite.color = SF.color(228, 208, 10)

        @@yellow_green_baseball_cap = BaseballCap.new("Yellow-Green Baseball Cap", "Y-Gn/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "green")
        @@yellow_green_baseball_cap.sprite.color = SF.color(170, 255, 0)

        @@green_baseball_cap = BaseballCap.new("Green Baseball Cap", "Gn/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "green")
        @@green_baseball_cap.sprite.color = SF.color(34, 139, 34)

        @@turquoise_baseball_cap = BaseballCap.new("Turquoise Baseball Cap", "Tq/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "blue")
        @@turquoise_baseball_cap.sprite.color = SF.color(64, 224, 208)

        @@light_blue_baseball_cap = BaseballCap.new("Light Blue Baseball Cap", "L-Bl/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "blue")
        @@light_blue_baseball_cap.sprite.color = SF.color(137, 207, 240)

        @@blue_baseball_cap = BaseballCap.new("Blue Baseball Cap", "Bl/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "blue")
        @@blue_baseball_cap.sprite.color = SF.color(20, 52, 164)

        @@indigo_baseball_cap = BaseballCap.new("Indigo Baseball Cap", "In/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "purple")
        @@indigo_baseball_cap.sprite.color = SF.color(63, 0, 255)

        @@light_purple_baseball_cap = BaseballCap.new("Light Purple Baseball Cap", "L-Pr/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "purple")
        @@light_purple_baseball_cap.sprite.color = SF.color(191, 64, 191)

        @@purple_baseball_cap = BaseballCap.new("Purple Baseball Cap", "Pr/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "purple")
        @@purple_baseball_cap.sprite.color = SF.color(112, 41, 99)

        @@pink_baseball_cap = BaseballCap.new("Pink Baseball Cap", "Pk/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "pink")
        @@pink_baseball_cap.sprite.color = SF.color(255, 192, 203)

        @@hot_pink_baseball_cap = BaseballCap.new("Hot-Pink Baseball Cap", "H-Pk/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "pink")
        @@hot_pink_baseball_cap.sprite.color = SF.color(255, 105, 180)
    end
end