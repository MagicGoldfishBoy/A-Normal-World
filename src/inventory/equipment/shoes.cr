require "crsfml"
require "crsfml/audio"
require "../../../src/textures.cr"
require "../../../src/utility.cr"
require "../../../src/inventory/equipment/clothing.cr"
require "../../../src/sound/sfx.cr"
require "../../../graphics/color.cr"

module Shoes
    class ShoesBase < Clothing::ClothingBase
        include JSON::Serializable

        SHOES_ARRAY = [] of ShoesBase
        OWNED_SHOES_ARRAY = [] of ShoesBase | Clothing::ClothingBase

        SHOES_SPRITE_HASH = {} of String => SF::Sprite
        SHOES_SFX_HASH = {} of String => SF::Sound

        DEFAULT_SHOES_EQUIP_SFX = SFX::EquipSFX::BACKPACK_EQUIP_01

        property name : String
        property id : String
        property is_owned : Bool
        property sprite : SF::Sprite?
        property color : String
        property sfx : SF::Sound?

        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, color : String, sfx : SF::Sound)
            @name = name
            @id = id
            @is_owned = Settings::GameSettings.is_debug_mode ? true : is_owned
            @sprite = sprite
            @color = color
            @sfx = sfx

            SHOES_ARRAY << self
            SHOES_SPRITE_HASH[id] = sprite
            SHOES_SFX_HASH[id] = sfx

            if self.is_owned && !OWNED_SHOES_ARRAY.any? { |owned_shoes| owned_shoes.id == self.id }
                OWNED_SHOES_ARRAY << self
                OWNED_SHOES_ARRAY.uniq!
            end
        end

        def self.swap_shoes(item : ShoesBase)
            if item.as(Shoes::ShoesBase).sfx != nil
                item.as(Shoes::ShoesBase).sfx.not_nil!.play
            else
                DEFAULT_SHOES_EQUIP_SFX.play
            end
            
            if Player::Appearance.shoes != nil
                if Shoes::ShoesBase::OWNED_SHOES_ARRAY.none? { |owned_shoes| owned_shoes.id == Player::Appearance.shoes.as(Shoes::ShoesBase).id }
                    Shoes::ShoesBase::OWNED_SHOES_ARRAY << Player::Appearance.shoes.as(Shoes::ShoesBase)
                end
            end
            
            Player::Appearance.shoes = item.as(Shoes::ShoesBase)
            Shoes::ShoesBase::OWNED_SHOES_ARRAY.reject! { |owned_shoes| owned_shoes.id == item.as(Shoes::ShoesBase).id }
        end

        def self.swap_shoes_character_creation(direction : String, iterator : Int32)
            if OWNED_SHOES_ARRAY.empty?
                return 0
            end

            if direction == "next"
                iterator += 1
            elsif direction == "previous"
                iterator -= 1
            end

            if iterator >= Shoes::ShoesBase::SHOES_ARRAY.size - 1
                iterator = 0
            elsif iterator < 0
                iterator = Shoes::ShoesBase::SHOES_ARRAY.size - 1
            end

            Player::Appearance.pants = Pants::PantsBase::PANTS_ARRAY[iterator]
            return iterator
        end

        def self.remove_current_shoes_from_inventory
            if Player::Appearance.shoes != nil
                Shoes::ShoesBase::OWNED_SHOES_ARRAY.reject! { |owned_shoes| owned_shoes.id == Player::Appearance.shoes.as(Shoes::ShoesBase).id }
            end
        end
    end

    class RainBoots < ShoesBase
        @@white_rain_boots = RainBoots.new("White Rain Boots", "white_rainboots", false, SF::Sprite.new(RAIN_BOOTS_WHITE_TEXTURE), "white", DEFAULT_SHOES_EQUIP_SFX)

        @@grey_rain_boots = RainBoots.new("Grey Rain Boots", "grey_rainboots", false, SF::Sprite.new(RAIN_BOOTS_WHITE_TEXTURE), "grey", DEFAULT_SHOES_EQUIP_SFX)
        @@grey_rain_boots.sprite.as(SF::Sprite).color = Color::ClothingColor::GREY

        @@black_rain_boots = RainBoots.new("Black Rain Boots", "black_rainboots", false, SF::Sprite.new(RAIN_BOOTS_WHITE_TEXTURE), "black", DEFAULT_SHOES_EQUIP_SFX)
        @@black_rain_boots.sprite.as(SF::Sprite).color = Color::ClothingColor::BLACK

        @@tan_rain_boots = RainBoots.new("Tan Rain Boots", "tan_rainboots", false, SF::Sprite.new(RAIN_BOOTS_WHITE_TEXTURE), "tan", DEFAULT_SHOES_EQUIP_SFX)
        @@tan_rain_boots.sprite.as(SF::Sprite).color = Color::ClothingColor::TAN

        @@brown_rain_boots = RainBoots.new("Brown Rain Boots", "brown_rainboots", false, SF::Sprite.new(RAIN_BOOTS_WHITE_TEXTURE), "brown", DEFAULT_SHOES_EQUIP_SFX)
        @@brown_rain_boots.sprite.as(SF::Sprite).color = Color::ClothingColor::BROWN

        @@red_rain_boots = RainBoots.new("Red Rain Boots", "red_rainboots", false, SF::Sprite.new(RAIN_BOOTS_WHITE_TEXTURE), "red", DEFAULT_SHOES_EQUIP_SFX)
        @@red_rain_boots.sprite.as(SF::Sprite).color = Color::ClothingColor::RED

        @@orange_rain_boots = RainBoots.new("Orange Rain Boots", "orange_rainboots", false, SF::Sprite.new(RAIN_BOOTS_WHITE_TEXTURE), "orange", DEFAULT_SHOES_EQUIP_SFX)
        @@orange_rain_boots.sprite.as(SF::Sprite).color = Color::ClothingColor::ORANGE

        @@yellow_rain_boots = RainBoots.new("Yellow Rain Boots", "yellow_rainboots", false, SF::Sprite.new(RAIN_BOOTS_WHITE_TEXTURE), "yellow", DEFAULT_SHOES_EQUIP_SFX)
        @@yellow_rain_boots.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW

        @@yellow_green_rain_boots = RainBoots.new("Yellow-Green Rain Boots", "yellow-green_rain_boots", false, SF::Sprite.new(RAIN_BOOTS_WHITE_TEXTURE), "yellow-green", DEFAULT_SHOES_EQUIP_SFX)
        @@yellow_green_rain_boots.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW_GREEN

        @@green_rain_boots = RainBoots.new("Green Rain Boots", "green_rain_boots", false, SF::Sprite.new(RAIN_BOOTS_WHITE_TEXTURE), "green", DEFAULT_SHOES_EQUIP_SFX)
        @@green_rain_boots.sprite.as(SF::Sprite).color = Color::ClothingColor::GREEN

        @@turquoise_rain_boots = RainBoots.new("Turquoise Rain Boots", "turquoise_rain_boots", false, SF::Sprite.new(RAIN_BOOTS_WHITE_TEXTURE), "turquoise", DEFAULT_SHOES_EQUIP_SFX)
        @@turquoise_rain_boots.sprite.as(SF::Sprite).color = Color::ClothingColor::TURQUOISE

        @@light_blue_rain_boots = RainBoots.new("Light-Blue Rain Boots", "light-blue_rain_boots", false, SF::Sprite.new(RAIN_BOOTS_WHITE_TEXTURE), "light-blue", DEFAULT_SHOES_EQUIP_SFX)
        @@light_blue_rain_boots.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_BLUE

        @@blue_rain_boots = RainBoots.new("Blue Rain Boots", "blue_rain_boots", false, SF::Sprite.new(RAIN_BOOTS_WHITE_TEXTURE), "blue", DEFAULT_SHOES_EQUIP_SFX)
        @@blue_rain_boots.sprite.as(SF::Sprite).color = Color::ClothingColor::BLUE

        @@indigo_rain_boots = RainBoots.new("Indigo Rain Boots", "indigo_rain_boots", false, SF::Sprite.new(RAIN_BOOTS_WHITE_TEXTURE), "indigo", DEFAULT_SHOES_EQUIP_SFX)
        @@indigo_rain_boots.sprite.as(SF::Sprite).color = Color::ClothingColor::INDIGO

        @@light_purple_rain_boots = RainBoots.new("Light-Purple Rain Boots", "light-purple_rain_boots", false, SF::Sprite.new(RAIN_BOOTS_WHITE_TEXTURE), "light-purple", DEFAULT_SHOES_EQUIP_SFX)
        @@light_purple_rain_boots.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_PURPLE

        @@purple_rain_boots = RainBoots.new("Purple Rain Boots", "purple_rain_boots", false, SF::Sprite.new(RAIN_BOOTS_WHITE_TEXTURE), "purple", DEFAULT_SHOES_EQUIP_SFX)
        @@purple_rain_boots.sprite.as(SF::Sprite).color = Color::ClothingColor::PURPLE

        @@pink_rain_boots = RainBoots.new("Pink Rain Boots", "pink_rain_boots", false, SF::Sprite.new(RAIN_BOOTS_WHITE_TEXTURE), "pink", DEFAULT_SHOES_EQUIP_SFX)
        @@pink_rain_boots.sprite.as(SF::Sprite).color = Color::ClothingColor::PINK

        @@hot_pink_rain_boots = RainBoots.new("Hot-Pink Rain Boots", "hot-pink_rain_boots", false, SF::Sprite.new(RAIN_BOOTS_WHITE_TEXTURE), "hot-pink", DEFAULT_SHOES_EQUIP_SFX)
        @@hot_pink_rain_boots.sprite.as(SF::Sprite).color = Color::ClothingColor::HOT_PINK
    end
end
