require "crsfml"
require "crsfml/audio"
require "../../../src/textures.cr"
require "../../../src/utility.cr"
require "../../../src/inventory/clothing/clothing.cr"
require "../../../src/sound/sfx.cr"
require "../../../graphics/color.cr"
require "../../../src/game_settings.cr"

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
        @is_owned = Settings::GameSettings.is_debug_mode ? true : is_owned
        @sprite = sprite
        @color = color
        @covers_hair = covers_hair
        @sfx = sfx
        HAT_ARRAY << self
        if self.is_owned && !OWNED_HAT_ARRAY.any? { |owned_hat| owned_hat.id == self.id }
            OWNED_HAT_ARRAY << self
            OWNED_HAT_ARRAY.uniq!
            HAT_SPRITE_HASH[id] = sprite
            HAT_SFX_HASH[id] = sfx
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
     
     def self.remove_current_hat_from_inventory
        if Player::Appearance.hat && Player::Appearance.hat.as(Hat::HatBase).id
            OWNED_HAT_ARRAY.reject! { |owned_hat| owned_hat.id == Player::Appearance.hat.as(Hat::HatBase).id }
        end
     end
     
    end
    class BaseballCap < HatBase
        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, color : String, covers_hair : Bool, sfx : SF::Sound)
            super(name, id, is_owned, sprite, color, covers_hair = true, sfx)
        end

        @@white_baseball_cap = BaseballCap.new("White Baseball Cap", "W/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "white", true, DEFAULT_HAT_EQUIP_SFX)

        @@grey_baseball_cap = BaseballCap.new("Grey Baseball Cap", "Gy/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "grey", true, DEFAULT_HAT_EQUIP_SFX)
        @@grey_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::GREY

        @@black_baseball_cap = BaseballCap.new("Black Baseball Cap", "Bk/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "black", true, DEFAULT_HAT_EQUIP_SFX)
        @@black_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::BLACK

        @@tan_baseball_cap = BaseballCap.new("Tan Baseball Cap", "T/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "tan", true, DEFAULT_HAT_EQUIP_SFX)
        @@tan_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::TAN

        @@brown_baseball_cap = BaseballCap.new("Brown Baseball Cap", "Br/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "brown", true, DEFAULT_HAT_EQUIP_SFX)
        @@brown_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::BROWN

        @@red_baseball_cap = BaseballCap.new("Red Baseball Cap", "R/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "red", true, DEFAULT_HAT_EQUIP_SFX)
        @@red_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::RED

        @@orange_baseball_cap = BaseballCap.new("Orange Baseball Cap", "O/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "orange", true, DEFAULT_HAT_EQUIP_SFX)
        @@orange_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::ORANGE

        @@yellow_baseball_cap = BaseballCap.new("Yellow Baseball Cap", "Y/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "yellow", true, DEFAULT_HAT_EQUIP_SFX)
        @@yellow_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW

        @@yellow_green_baseball_cap = BaseballCap.new("Yellow-Green Baseball Cap", "Y-Gn/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "yellow-green", true, DEFAULT_HAT_EQUIP_SFX)
        @@yellow_green_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW_GREEN

        @@green_baseball_cap = BaseballCap.new("Green Baseball Cap", "Gn/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "green", true, DEFAULT_HAT_EQUIP_SFX)
        @@green_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::GREEN

        @@turquoise_baseball_cap = BaseballCap.new("Turquoise Baseball Cap", "Tq/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "turquoise", true, DEFAULT_HAT_EQUIP_SFX)
        @@turquoise_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::TURQUOISE

        @@light_blue_baseball_cap = BaseballCap.new("Light Blue Baseball Cap", "L-Bl/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "light-blue", true, DEFAULT_HAT_EQUIP_SFX)
        @@light_blue_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_BLUE

        @@blue_baseball_cap = BaseballCap.new("Blue Baseball Cap", "Bl/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "blue", true, DEFAULT_HAT_EQUIP_SFX)
        @@blue_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::BLUE

        @@indigo_baseball_cap = BaseballCap.new("Indigo Baseball Cap", "In/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "indigo", true, DEFAULT_HAT_EQUIP_SFX)
        @@indigo_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::INDIGO

        @@light_purple_baseball_cap = BaseballCap.new("Light Purple Baseball Cap", "L-Pr/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "light-purple", true, DEFAULT_HAT_EQUIP_SFX)
        @@light_purple_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_PURPLE

        @@purple_baseball_cap = BaseballCap.new("Purple Baseball Cap", "Pr/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "purple", true, DEFAULT_HAT_EQUIP_SFX)
        @@purple_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::PURPLE

        @@pink_baseball_cap = BaseballCap.new("Pink Baseball Cap", "Pk/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "pink", true, DEFAULT_HAT_EQUIP_SFX)
        @@pink_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::PINK

        @@hot_pink_baseball_cap = BaseballCap.new("Hot-Pink Baseball Cap", "H-Pk/Baseball Cap", true, SF::Sprite.new(BASEBALL_CAP_TEXTURE), "hot-pink", true, DEFAULT_HAT_EQUIP_SFX)
        @@hot_pink_baseball_cap.sprite.as(SF::Sprite).color = Color::ClothingColor::HOT_PINK
    end
    class Beanie < HatBase
        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, color : String, covers_hair : Bool, sfx : SF::Sound)
            super(name, id, is_owned, sprite, color, covers_hair = true, sfx)
        end
        @@white_beanie = Beanie.new("White Beanie", "W/Beanie", true, SF::Sprite.new(BEANIE_TEXTURE), "white", true, DEFAULT_HAT_EQUIP_SFX)

        @@grey_beanie = Beanie.new("Grey Beanie", "Gy/Beanie", true, SF::Sprite.new(BEANIE_TEXTURE), "grey", true, DEFAULT_HAT_EQUIP_SFX)
        @@grey_beanie.sprite.as(SF::Sprite).color = Color::ClothingColor::GREY

        @@black_beanie = Beanie.new("Black Beanie", "Bk/Beanie", true, SF::Sprite.new(BEANIE_TEXTURE), "black", true, DEFAULT_HAT_EQUIP_SFX)
        @@black_beanie.sprite.as(SF::Sprite).color = Color::ClothingColor::BLACK

        @@tan_beanie = Beanie.new("Tan Beanie", "T/Beanie", true, SF::Sprite.new(BEANIE_TEXTURE), "tan", true, DEFAULT_HAT_EQUIP_SFX)
        @@tan_beanie.sprite.as(SF::Sprite).color = Color::ClothingColor::TAN

        @@brown_beanie = Beanie.new("Brown Beanie", "Br/Beanie", true, SF::Sprite.new(BEANIE_TEXTURE), "brown", true, DEFAULT_HAT_EQUIP_SFX)
        @@brown_beanie.sprite.as(SF::Sprite).color = Color::ClothingColor::BROWN

        @@red_beanie = Beanie.new("Red Beanie", "R/Beanie", true, SF::Sprite.new(BEANIE_TEXTURE), "red", true, DEFAULT_HAT_EQUIP_SFX)
        @@red_beanie.sprite.as(SF::Sprite).color = Color::ClothingColor::RED

        @@orange_beanie = Beanie.new("Orange Beanie", "O/Beanie", true, SF::Sprite.new(BEANIE_TEXTURE), "orange", true, DEFAULT_HAT_EQUIP_SFX)
        @@orange_beanie.sprite.as(SF::Sprite).color = Color::ClothingColor::ORANGE

        @@yellow_beanie = Beanie.new("Yellow Beanie", "Y/Beanie", false, SF::Sprite.new(BEANIE_TEXTURE), "yellow", true, DEFAULT_HAT_EQUIP_SFX)
        @@yellow_beanie.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW

        @@yellow_green_beanie = Beanie.new("Yellow-Green Beanie", "Y-Gn/Beanie", false, SF::Sprite.new(BEANIE_TEXTURE), "yellow-green", true, DEFAULT_HAT_EQUIP_SFX)
        @@yellow_green_beanie.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW_GREEN

        @@green_beanie = Beanie.new("Green Beanie", "Gn/Beanie", false, SF::Sprite.new(BEANIE_TEXTURE), "green", true, DEFAULT_HAT_EQUIP_SFX)
        @@green_beanie.sprite.as(SF::Sprite).color = Color::ClothingColor::GREEN

        @@turquoise_beanie = Beanie.new("Turquoise Beanie", "Tq/Beanie", false, SF::Sprite.new(BEANIE_TEXTURE), "turquoise", true, DEFAULT_HAT_EQUIP_SFX)
        @@turquoise_beanie.sprite.as(SF::Sprite).color = Color::ClothingColor::TURQUOISE

        @@light_blue_beanie = Beanie.new("Light Blue Beanie", "L-Bl/Beanie", false, SF::Sprite.new(BEANIE_TEXTURE), "light-blue", true, DEFAULT_HAT_EQUIP_SFX)
        @@light_blue_beanie.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_BLUE

        @@blue_beanie = Beanie.new("Blue Beanie", "Bl/Beanie", false, SF::Sprite.new(BEANIE_TEXTURE), "blue", true, DEFAULT_HAT_EQUIP_SFX)
        @@blue_beanie.sprite.as(SF::Sprite).color = Color::ClothingColor::BLUE

        @@indigo_beanie = Beanie.new("Indigo Beanie", "In/Beanie", false, SF::Sprite.new(BEANIE_TEXTURE), "indigo", true, DEFAULT_HAT_EQUIP_SFX)
        @@indigo_beanie.sprite.as(SF::Sprite).color = Color::ClothingColor::INDIGO

        @@light_purple_beanie = Beanie.new("Light Purple Beanie", "L-Pr/Beanie", false, SF::Sprite.new(BEANIE_TEXTURE), "light-purple", true, DEFAULT_HAT_EQUIP_SFX)
        @@light_purple_beanie.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_PURPLE

        @@purple_beanie = Beanie.new("Purple Beanie", "Pr/Beanie", false, SF::Sprite.new(BEANIE_TEXTURE), "purple", true, DEFAULT_HAT_EQUIP_SFX)
        @@purple_beanie.sprite.as(SF::Sprite).color = Color::ClothingColor::PURPLE

        @@pink_beanie = Beanie.new("Pink Beanie", "Pk/Beanie", false, SF::Sprite.new(BEANIE_TEXTURE), "pink", true, DEFAULT_HAT_EQUIP_SFX)
        @@pink_beanie.sprite.as(SF::Sprite).color = Color::ClothingColor::PINK

        @@hot_pink_beanie = Beanie.new("Hot-Pink Beanie", "H-Pk/Beanie", false, SF::Sprite.new(BEANIE_TEXTURE), "hot-pink", true, DEFAULT_HAT_EQUIP_SFX)
        @@hot_pink_beanie.sprite.as(SF::Sprite).color = Color::ClothingColor::HOT_PINK
    end
    class SweatBand < HatBase
        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, color : String, covers_hair : Bool, sfx : SF::Sound)
            super(name, id, is_owned, sprite, color, covers_hair = false, sfx)
        end
        @@white_sweatband = SweatBand.new("White Sweatband", "W/Sweatband", false, SF::Sprite.new(WHITE_SWEATBAND_TEXTURE), "white", false, DEFAULT_HAT_EQUIP_SFX)

        @@grey_sweatband = SweatBand.new("Grey Sweatband", "Gy/Sweatband", false, SF::Sprite.new(WHITE_SWEATBAND_TEXTURE), "grey", true, DEFAULT_HAT_EQUIP_SFX)
        @@grey_sweatband.sprite.as(SF::Sprite).color = Color::ClothingColor::GREY

        @@black_sweatband = SweatBand.new("Black Sweatband", "Bk/Sweatband", false, SF::Sprite.new(WHITE_SWEATBAND_TEXTURE), "black", true, DEFAULT_HAT_EQUIP_SFX)
        @@black_sweatband.sprite.as(SF::Sprite).color = Color::ClothingColor::BLACK

        @@tan_sweatband = SweatBand.new("Tan Sweatband", "T/Sweatband", false, SF::Sprite.new(WHITE_SWEATBAND_TEXTURE), "tan", true, DEFAULT_HAT_EQUIP_SFX)
        @@tan_sweatband.sprite.as(SF::Sprite).color = Color::ClothingColor::TAN

        @@brown_sweatband = SweatBand.new("Brown Sweatband", "Br/Sweatband", false, SF::Sprite.new(WHITE_SWEATBAND_TEXTURE), "brown", true, DEFAULT_HAT_EQUIP_SFX)
        @@brown_sweatband.sprite.as(SF::Sprite).color = Color::ClothingColor::BROWN

        @@red_sweatband = SweatBand.new("Red Sweatband", "R/Sweatband", false, SF::Sprite.new(WHITE_SWEATBAND_TEXTURE), "red", true, DEFAULT_HAT_EQUIP_SFX)
        @@red_sweatband.sprite.as(SF::Sprite).color = Color::ClothingColor::RED

        @@orange_sweatband = SweatBand.new("Orange Sweatband", "O/Sweatband", false, SF::Sprite.new(WHITE_SWEATBAND_TEXTURE), "orange", true, DEFAULT_HAT_EQUIP_SFX)
        @@orange_sweatband.sprite.as(SF::Sprite).color = Color::ClothingColor::ORANGE

        @@yellow_sweatband = SweatBand.new("Yellow Sweatband", "Y/Sweatband", false, SF::Sprite.new(WHITE_SWEATBAND_TEXTURE), "yellow", true, DEFAULT_HAT_EQUIP_SFX)
        @@yellow_sweatband.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW

        @@yellow_green_sweatband = SweatBand.new("Yellow-Green Sweatband", "Y-Gn/Sweatband", false, SF::Sprite.new(WHITE_SWEATBAND_TEXTURE), "yellow-green", true, DEFAULT_HAT_EQUIP_SFX)
        @@yellow_green_sweatband.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW_GREEN

        @@green_sweatband = SweatBand.new("Green Sweatband", "Gn/Sweatband", false, SF::Sprite.new(WHITE_SWEATBAND_TEXTURE), "green", true, DEFAULT_HAT_EQUIP_SFX)
        @@green_sweatband.sprite.as(SF::Sprite).color = Color::ClothingColor::GREEN

        @@turquoise_sweatband = SweatBand.new("Turquoise Sweatband", "Tq/Sweatband", false, SF::Sprite.new(WHITE_SWEATBAND_TEXTURE), "turquoise", true, DEFAULT_HAT_EQUIP_SFX)
        @@turquoise_sweatband.sprite.as(SF::Sprite).color = Color::ClothingColor::TURQUOISE

        @@light_blue_sweatband = SweatBand.new("Light Blue Sweatband", "L-Bl/Sweatband", false, SF::Sprite.new(WHITE_SWEATBAND_TEXTURE), "light-blue", true, DEFAULT_HAT_EQUIP_SFX)
        @@light_blue_sweatband.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_BLUE

        @@blue_sweatband = SweatBand.new("Blue Sweatband", "Bl/Sweatband", false, SF::Sprite.new(WHITE_SWEATBAND_TEXTURE), "blue", true, DEFAULT_HAT_EQUIP_SFX)
        @@blue_sweatband.sprite.as(SF::Sprite).color = Color::ClothingColor::BLUE

        @@indigo_sweatband = SweatBand.new("Indigo Sweatband", "In/Sweatband", false, SF::Sprite.new(WHITE_SWEATBAND_TEXTURE), "indigo", true, DEFAULT_HAT_EQUIP_SFX)
        @@indigo_sweatband.sprite.as(SF::Sprite).color = Color::ClothingColor::INDIGO

        @@light_purple_sweatband = SweatBand.new("Light Purple Sweatband", "L-Pr/Sweatband", false, SF::Sprite.new(WHITE_SWEATBAND_TEXTURE), "light-purple", true, DEFAULT_HAT_EQUIP_SFX)
        @@light_purple_sweatband.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_PURPLE

        @@purple_sweatband = SweatBand.new("Purple Sweatband", "Pr/Sweatband", false, SF::Sprite.new(WHITE_SWEATBAND_TEXTURE), "purple", true, DEFAULT_HAT_EQUIP_SFX)
        @@purple_sweatband.sprite.as(SF::Sprite).color = Color::ClothingColor::PURPLE

        @@pink_sweatband = SweatBand.new("Pink Sweatband", "Pk/Sweatband", false, SF::Sprite.new(WHITE_SWEATBAND_TEXTURE), "pink", true, DEFAULT_HAT_EQUIP_SFX)
        @@pink_sweatband.sprite.as(SF::Sprite).color = Color::ClothingColor::PINK

        @@hot_pink_sweatband = SweatBand.new("Hot-Pink Sweatband", "H-Pk/Sweatband", false, SF::Sprite.new(WHITE_SWEATBAND_TEXTURE), "hot-pink", true, DEFAULT_HAT_EQUIP_SFX)
        @@hot_pink_sweatband.sprite.as(SF::Sprite).color = Color::ClothingColor::HOT_PINK
    end
end