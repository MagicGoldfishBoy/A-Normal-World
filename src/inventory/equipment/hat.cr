require "crsfml"
require "crsfml/audio"
require "../../../src/textures.cr"
require "../../../src/utility.cr"
require "../../../src/inventory/equipment/clothing.cr"
require "../../../src/sound/sfx.cr"
require "../../../graphics/color.cr"

module Hat
    class HatBase < Clothing::ClothingBase
        include JSON::Serializable

        HAT_ARRAY = [] of HatBase 
        OWNED_HAT_ARRAY = [] of HatBase | Clothing::ClothingBase

        HAT_SPRITE_HASH = Hash(String, SF::Sprite).new
        HAT_SFX_HASH = Hash(String, SF::Sound).new

        DEFAULT_HAT_EQUIP_SFX = SFX::EquipSFX::FABRIC_EQUIP_01

        property name : String
        property id : String
        property is_owned : Bool
        property color : String       
        property covers_hair : Bool
        property sprite : SF::Sprite?
        property sfx : SF::Sound?

     def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, color : String, covers_hair : Bool, sfx : SF::Sound)
        @name = name
        @id = id
        @is_owned = is_owned
        @sprite = sprite
        @color = color
        @covers_hair = covers_hair
        @sfx = sfx
        HAT_ARRAY << self
        if self.is_owned && !OWNED_HAT_ARRAY.any? { |owned_hat| owned_hat.id == self.id }
            OWNED_HAT_ARRAY << self
            OWNED_HAT_ARRAY.uniq!
        end
     end

     def self.swap_hat(item)
      if item.as(Hat::HatBase).sfx
            item.as(Hat::HatBase).sfx.not_nil!.play
      else
            DEFAULT_HAT_EQUIP_SFX.play
      end
      if Player::Appearance.hat != nil
        if Hat::HatBase::OWNED_HAT_ARRAY.none? { |owned_hat| owned_hat.id == Player::Appearance.hat.as(Hat::HatBase).id }
         Hat::HatBase::OWNED_HAT_ARRAY << Player::Appearance.hat.as(Hat::HatBase)
        end
      end

      Player::Appearance.hat = item.as(Hat::HatBase)
      Hat::HatBase::OWNED_HAT_ARRAY.reject! { |owned_hat| owned_hat.id == Player::Appearance.hat.as(Hat::HatBase).id }
     end
     
    end
    class BaseballCap < HatBase
        @@white_baseball_cap = BaseballCap.new("White Baseball Cap", "W/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), 
        "white", true, DEFAULT_HAT_EQUIP_SFX)
        HAT_SPRITE_HASH[@@white_baseball_cap.id] = @@white_baseball_cap.sprite.as(SF::Sprite)
        HAT_SFX_HASH[@@white_baseball_cap.id] = @@white_baseball_cap.sfx.as(SF::Sound)

        @@grey_baseball_cap = BaseballCap.new("Grey Baseball Cap", "Gy/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "grey", 
        true, DEFAULT_HAT_EQUIP_SFX)
        @@grey_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::GREY
        HAT_SPRITE_HASH[@@grey_baseball_cap.id] = @@grey_baseball_cap.sprite.as(SF::Sprite)
        HAT_SFX_HASH[@@grey_baseball_cap.id] = @@grey_baseball_cap.sfx.as(SF::Sound)

        @@black_baseball_cap = BaseballCap.new("Black Baseball Cap", "Bk/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "black", 
        true, DEFAULT_HAT_EQUIP_SFX)
        @@black_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::BLACK 
        HAT_SPRITE_HASH[@@black_baseball_cap.id] = @@black_baseball_cap.sprite.as(SF::Sprite)
        HAT_SFX_HASH[@@black_baseball_cap.id] = @@black_baseball_cap.sfx.as(SF::Sound)

        @@tan_baseball_cap = BaseballCap.new("Tan Baseball Cap", "T/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "tan", true, DEFAULT_HAT_EQUIP_SFX)
        @@tan_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::TAN
        HAT_SPRITE_HASH[@@tan_baseball_cap.id] = @@tan_baseball_cap.sprite.as(SF::Sprite)
        HAT_SFX_HASH[@@tan_baseball_cap.id] = @@tan_baseball_cap.sfx.as(SF::Sound)

        @@brown_baseball_cap = BaseballCap.new("Brown Baseball Cap", "Br/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "brown", true, DEFAULT_HAT_EQUIP_SFX)
        @@brown_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::BROWN
        HAT_SPRITE_HASH[@@brown_baseball_cap.id] = @@brown_baseball_cap.sprite.as(SF::Sprite)
        HAT_SFX_HASH[@@brown_baseball_cap.id] = @@brown_baseball_cap.sfx.as(SF::Sound)

        @@red_baseball_cap = BaseballCap.new("Red Baseball Cap", "R/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "red", true, DEFAULT_HAT_EQUIP_SFX)
        @@red_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::RED
        HAT_SPRITE_HASH[@@red_baseball_cap.id] = @@red_baseball_cap.sprite.as(SF::Sprite)
        HAT_SFX_HASH[@@red_baseball_cap.id] = @@red_baseball_cap.sfx.as(SF::Sound)

        @@orange_baseball_cap = BaseballCap.new("Orange Baseball Cap", "O/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "orange", true, DEFAULT_HAT_EQUIP_SFX)
        @@orange_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::ORANGE
        HAT_SPRITE_HASH[@@orange_baseball_cap.id] = @@orange_baseball_cap.sprite.as(SF::Sprite)
        HAT_SFX_HASH[@@orange_baseball_cap.id] = @@orange_baseball_cap.sfx.as(SF::Sound)

        @@yellow_baseball_cap = BaseballCap.new("Yellow Baseball Cap", "Y/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "yellow", true, DEFAULT_HAT_EQUIP_SFX)
        @@yellow_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW
        HAT_SPRITE_HASH[@@yellow_baseball_cap.id] = @@yellow_baseball_cap.sprite.as(SF::Sprite)
        HAT_SFX_HASH[@@yellow_baseball_cap.id] = @@yellow_baseball_cap.sfx.as(SF::Sound)

        @@yellow_green_baseball_cap = BaseballCap.new("Yellow-Green Baseball Cap", "Y-Gn/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "yellow-green", true, DEFAULT_HAT_EQUIP_SFX)
        @@yellow_green_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW_GREEN
        HAT_SPRITE_HASH[@@yellow_green_baseball_cap.id] = @@yellow_green_baseball_cap.sprite.as(SF::Sprite)
        HAT_SFX_HASH[@@yellow_green_baseball_cap.id] = @@yellow_green_baseball_cap.sfx.as(SF::Sound)

        @@green_baseball_cap = BaseballCap.new("Green Baseball Cap", "Gn/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "green", true, DEFAULT_HAT_EQUIP_SFX)
        @@green_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::GREEN
        HAT_SPRITE_HASH[@@green_baseball_cap.id] = @@green_baseball_cap.sprite.as(SF::Sprite)
        HAT_SFX_HASH[@@green_baseball_cap.id] = @@green_baseball_cap.sfx.as(SF::Sound)

        @@turquoise_baseball_cap = BaseballCap.new("Turquoise Baseball Cap", "Tq/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "turquoise", true, DEFAULT_HAT_EQUIP_SFX)
        @@turquoise_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::TURQUOISE
        HAT_SPRITE_HASH[@@turquoise_baseball_cap.id] = @@turquoise_baseball_cap.sprite.as(SF::Sprite)
        HAT_SFX_HASH[@@turquoise_baseball_cap.id] = @@turquoise_baseball_cap.sfx.as(SF::Sound)

        @@light_blue_baseball_cap = BaseballCap.new("Light Blue Baseball Cap", "L-Bl/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "light-blue", true, DEFAULT_HAT_EQUIP_SFX)
        @@light_blue_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_BLUE
        HAT_SPRITE_HASH[@@light_blue_baseball_cap.id] = @@light_blue_baseball_cap.sprite.as(SF::Sprite)
        HAT_SFX_HASH[@@light_blue_baseball_cap.id] = @@light_blue_baseball_cap.sfx.as(SF::Sound)

        @@blue_baseball_cap = BaseballCap.new("Blue Baseball Cap", "Bl/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "blue", true, DEFAULT_HAT_EQUIP_SFX)
        @@blue_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::BLUE
        HAT_SPRITE_HASH[@@blue_baseball_cap.id] = @@blue_baseball_cap.sprite.as(SF::Sprite)
        HAT_SFX_HASH[@@blue_baseball_cap.id] = @@blue_baseball_cap.sfx.as(SF::Sound)

        @@indigo_baseball_cap = BaseballCap.new("Indigo Baseball Cap", "In/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "indigo", true, DEFAULT_HAT_EQUIP_SFX)
        @@indigo_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::INDIGO
        HAT_SPRITE_HASH[@@indigo_baseball_cap.id] = @@indigo_baseball_cap.sprite.as(SF::Sprite)
        HAT_SFX_HASH[@@indigo_baseball_cap.id] = @@indigo_baseball_cap.sfx.as(SF::Sound)

        @@light_purple_baseball_cap = BaseballCap.new("Light Purple Baseball Cap", "L-Pr/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "light-purple", true, DEFAULT_HAT_EQUIP_SFX)
        @@light_purple_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_PURPLE
        HAT_SPRITE_HASH[@@light_purple_baseball_cap.id] = @@light_purple_baseball_cap.sprite.as(SF::Sprite)
        HAT_SFX_HASH[@@light_purple_baseball_cap.id] = @@light_purple_baseball_cap.sfx.as(SF::Sound)

        @@purple_baseball_cap = BaseballCap.new("Purple Baseball Cap", "Pr/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "purple", true, DEFAULT_HAT_EQUIP_SFX)
        @@purple_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::PURPLE
        HAT_SPRITE_HASH[@@purple_baseball_cap.id] = @@purple_baseball_cap.sprite.as(SF::Sprite)
        HAT_SFX_HASH[@@purple_baseball_cap.id] = @@purple_baseball_cap.sfx.as(SF::Sound)

        @@pink_baseball_cap = BaseballCap.new("Pink Baseball Cap", "Pk/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "pink", true, DEFAULT_HAT_EQUIP_SFX)
        @@pink_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::PINK
        HAT_SPRITE_HASH[@@pink_baseball_cap.id] = @@pink_baseball_cap.sprite.as(SF::Sprite)
        HAT_SFX_HASH[@@pink_baseball_cap.id] = @@pink_baseball_cap.sfx.as(SF::Sound)

        @@hot_pink_baseball_cap = BaseballCap.new("Hot-Pink Baseball Cap", "H-Pk/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "hot-pink", true, DEFAULT_HAT_EQUIP_SFX)
        @@hot_pink_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::HOT_PINK
        HAT_SPRITE_HASH[@@hot_pink_baseball_cap.id] = @@hot_pink_baseball_cap.sprite.as(SF::Sprite)
        HAT_SFX_HASH[@@hot_pink_baseball_cap.id] = @@hot_pink_baseball_cap.sfx.as(SF::Sound)
    end
    class Beanie < HatBase
        @@white_beanie = Beanie.new("White Beanie", "W/Beanie", true, SF::Sprite.new(BEANIE_TEXTURE), "white", true, DEFAULT_HAT_EQUIP_SFX)
        HAT_SPRITE_HASH[@@white_beanie.id] = @@white_beanie.sprite.as(SF::Sprite)
        HAT_SFX_HASH[@@white_beanie.id] = @@white_beanie.sfx.as(SF::Sound)

        @@grey_beanie = Beanie.new("Grey Beanie", "Gy/Beanie", true, SF::Sprite.new(BEANIE_TEXTURE), "grey", true, DEFAULT_HAT_EQUIP_SFX)
        @@grey_beanie.sprite.as(SF::Sprite).color = Color::ClothingColor::GREY
        HAT_SPRITE_HASH[@@grey_beanie.id] = @@grey_beanie.sprite.as(SF::Sprite)
        HAT_SFX_HASH[@@grey_beanie.id] = @@grey_beanie.sfx.as(SF::Sound)

        @@black_beanie = Beanie.new("Black Beanie", "Bk/Beanie", true, SF::Sprite.new(BEANIE_TEXTURE), "black", true, DEFAULT_HAT_EQUIP_SFX)
        @@black_beanie.sprite.as(SF::Sprite).color = Color::ClothingColor::BLACK
        HAT_SPRITE_HASH[@@black_beanie.id] = @@black_beanie.sprite.as(SF::Sprite)
        HAT_SFX_HASH[@@black_beanie.id] = @@black_beanie.sfx.as(SF::Sound)

        @@tan_beanie = Beanie.new("Tan Beanie", "T/Beanie", true, SF::Sprite.new(BEANIE_TEXTURE), "tan", true, DEFAULT_HAT_EQUIP_SFX)
        @@tan_beanie.sprite.as(SF::Sprite).color = Color::ClothingColor::TAN
        HAT_SPRITE_HASH[@@tan_beanie.id] = @@tan_beanie.sprite.as(SF::Sprite)
        HAT_SFX_HASH[@@tan_beanie.id] = @@tan_beanie.sfx.as(SF::Sound)

        @@brown_beanie = Beanie.new("Brown Beanie", "Br/Beanie", true, SF::Sprite.new(BEANIE_TEXTURE), "brown", true, DEFAULT_HAT_EQUIP_SFX)
        @@brown_beanie.sprite.as(SF::Sprite).color = Color::ClothingColor::BROWN
        HAT_SPRITE_HASH[@@brown_beanie.id] = @@brown_beanie.sprite.as(SF::Sprite)
        HAT_SFX_HASH[@@brown_beanie.id] = @@brown_beanie.sfx.as(SF::Sound)

        @@red_beanie = Beanie.new("Red Beanie", "R/Beanie", true, SF::Sprite.new(BEANIE_TEXTURE), "red", true, DEFAULT_HAT_EQUIP_SFX)
        @@red_beanie.sprite.as(SF::Sprite).color = Color::ClothingColor::RED
        HAT_SPRITE_HASH[@@red_beanie.id] = @@red_beanie.sprite.as(SF::Sprite)
        HAT_SFX_HASH[@@red_beanie.id] = @@red_beanie.sfx.as(SF::Sound)

        @@orange_beanie = Beanie.new("Orange Beanie", "O/Beanie", true, SF::Sprite.new(BEANIE_TEXTURE), "orange", true, DEFAULT_HAT_EQUIP_SFX)
        @@orange_beanie.sprite.as(SF::Sprite).color = Color::ClothingColor::ORANGE
        HAT_SPRITE_HASH[@@orange_beanie.id] = @@orange_beanie.sprite.as(SF::Sprite)
        HAT_SFX_HASH[@@orange_beanie.id] = @@orange_beanie.sfx.as(SF::Sound)
    end
end