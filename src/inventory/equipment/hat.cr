require "crsfml"
require "crsfml/audio"
require "../../../src/textures.cr"
require "../../../src/utility.cr"
require "../../../src/inventory/equipment/clothing.cr"

module Hat
    class HatBase < Clothing::ClothingBase

        HAT_ARRAY = [] of HatBase 
        OWNED_HAT_ARRAY = [] of HatBase | Clothing::ClothingBase

     def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, color : String)
        super
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

        @@tan_baseball_cap = BaseballCap.new("Tan Baseball Cap", "T/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "tan")
        @@tan_baseball_cap.sprite.color = SF.color(210, 180, 140)

        @@brown_baseball_cap = BaseballCap.new("Brown Baseball Cap", "T/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "tan")
        @@brown_baseball_cap.sprite.color = SF.color(139, 69, 19)

        @@red_baseball_cap = BaseballCap.new("Red Baseball Cap", "R/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "red")
        @@red_baseball_cap.sprite.color = SF.color(136, 8, 8)

        @@orange_baseball_cap = BaseballCap.new("Orange Baseball Cap", "O/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "orange")
        @@orange_baseball_cap.sprite.color = SF.color(255, 117, 24)

        @@yellow_baseball_cap = BaseballCap.new("Yellow Baseball Cap", "Y/Baseball Cap", true, SF::Sprite.new(WHITE_BASEBALL_CAP_TEXTURE), "yellow")
        @@yellow_baseball_cap.sprite.color = SF.color(228, 208, 10)
    end
end