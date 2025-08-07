require "crsfml"
require "crsfml/audio"
require "../../../src/textures.cr"
require "../../../src/utility.cr"
require "../../../src/inventory/clothing/clothing.cr"
require "../../../graphics/color.cr"

module Pants
    class PantsBase < Clothing::ClothingBase
        include JSON::Serializable

        PANTS_ARRAY = [] of PantsBase
        OWNED_PANTS_ARRAY = [] of PantsBase | Clothing::ClothingBase

        PANTS_SPRITE_HASH = {} of String => SF::Sprite
        PANTS_SFX_HASH = {} of String => SF::Sound

        DEFAULT_PANTS_EQUIP_SFX = SFX::EquipSFX::FABRIC_EQUIP_01

        property name : String
        property id : String
        property is_owned : Bool
        property sprite : SF::Sprite?
        property color : String
        property sfx : SF::Sound?
        property length : String

        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, color : String, sfx : SF::Sound, length : String)
            @name = name
            @id = id
            @is_owned = Settings::GameSettings.is_debug_mode ? true : is_owned
            @sprite = sprite
            @color = color
            @sfx = sfx
            @length = length

            PANTS_ARRAY << self
            PANTS_SPRITE_HASH[id] = sprite
            PANTS_SFX_HASH[id] = sfx

            if self.is_owned && !OWNED_PANTS_ARRAY.any? { |owned_pants| owned_pants.id == self.id }
                OWNED_PANTS_ARRAY << self
            end

            OWNED_PANTS_ARRAY.uniq!
        end

        def self.swap_pants(item : PantsBase)
            if item.as(Pants::PantsBase).sfx != nil
                item.as(Pants::PantsBase).sfx.not_nil!.play
            else
                DEFAULT_PANTS_EQUIP_SFX.play
            end
            
            if Player::Appearance.pants != nil
                if Pants::PantsBase::OWNED_PANTS_ARRAY.none? { |owned_pants| owned_pants.id == Player::Appearance.pants.as(Pants::PantsBase).id }
                    Pants::PantsBase::OWNED_PANTS_ARRAY << Player::Appearance.pants.as(Pants::PantsBase)
                end
            end
            
            Player::Appearance.pants = item.as(Pants::PantsBase)
            Pants::PantsBase::OWNED_PANTS_ARRAY.reject! { |owned_pants| owned_pants.id == item.as(Pants::PantsBase).id }
        end

        def self.swap_pants_character_creation(direction : String, iterator : Int32)
            if OWNED_PANTS_ARRAY.empty?
                return 0
            end
            if direction == "next"
                iterator += 1
            elsif direction == "previous"
                iterator -= 1
            end

            if iterator >= PantsBase::OWNED_PANTS_ARRAY.size - 1
                iterator = 0
            elsif iterator < 0
                iterator = PantsBase::OWNED_PANTS_ARRAY.size - 1
            end

            Player::Appearance.pants = PantsBase::OWNED_PANTS_ARRAY[iterator].as(PantsBase)
            return iterator
        end

        def self.remove_current_pants_from_inventory
            if Player::Appearance.pants != nil
                Pants::PantsBase::OWNED_PANTS_ARRAY.reject! { |owned_pants| owned_pants.id == Player::Appearance.pants.as(Pants::PantsBase).id }
            end
        end
    end
    class Jeans < PantsBase
        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, color : String, sfx : SF::Sound)
            super(name, id, is_owned, sprite, color, sfx, "long")
        end

        @@white_jeans = Jeans.new("White Jeans", "white_jeans", false, SF::Sprite.new(JEANS_WHITE_TEXTURE), "white", DEFAULT_PANTS_EQUIP_SFX)

        @@grey_jeans = Jeans.new("Grey Jeans", "grey_jeans", false, SF::Sprite.new(JEANS_WHITE_TEXTURE), "grey", DEFAULT_PANTS_EQUIP_SFX)
        @@grey_jeans.sprite.as(SF::Sprite).color = Color::ClothingColor::GREY

        @@black_jeans = Jeans.new("Black Jeans", "black_jeans", false, SF::Sprite.new(JEANS_WHITE_TEXTURE), "black", DEFAULT_PANTS_EQUIP_SFX)
        @@black_jeans.sprite.as(SF::Sprite).color = Color::ClothingColor::BLACK

        @@tan_jeans = Jeans.new("Tan Jeans", "tan_jeans", false, SF::Sprite.new(JEANS_WHITE_TEXTURE), "tan", DEFAULT_PANTS_EQUIP_SFX)
        @@tan_jeans.sprite.as(SF::Sprite).color = Color::ClothingColor::TAN

        @@brown_jeans = Jeans.new("Brown Jeans", "brown_jeans", false, SF::Sprite.new(JEANS_WHITE_TEXTURE), "brown", DEFAULT_PANTS_EQUIP_SFX)
        @@brown_jeans.sprite.as(SF::Sprite).color = Color::ClothingColor::BROWN

        @@red_jeans = Jeans.new("Red Jeans", "red_jeans", false, SF::Sprite.new(JEANS_WHITE_TEXTURE), "red", DEFAULT_PANTS_EQUIP_SFX)
        @@red_jeans.sprite.as(SF::Sprite).color = Color::ClothingColor::RED

        @@orange_jeans = Jeans.new("Orange Jeans", "orange_jeans", false, SF::Sprite.new(JEANS_WHITE_TEXTURE), "orange", DEFAULT_PANTS_EQUIP_SFX)
        @@orange_jeans.sprite.as(SF::Sprite).color = Color::ClothingColor::ORANGE

        @@yellow_jeans = Jeans.new("Yellow Jeans", "yellow_jeans", false, SF::Sprite.new(JEANS_WHITE_TEXTURE), "yellow", DEFAULT_PANTS_EQUIP_SFX)
        @@yellow_jeans.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW

        @@yellow_green_jeans = Jeans.new("Yellow Green Jeans", "yellow_green_jeans", false, SF::Sprite.new(JEANS_WHITE_TEXTURE), "yellow-green", DEFAULT_PANTS_EQUIP_SFX)
        @@yellow_green_jeans.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW_GREEN

        @@green_jeans = Jeans.new("Green Jeans", "green_jeans", false, SF::Sprite.new(JEANS_WHITE_TEXTURE), "green", DEFAULT_PANTS_EQUIP_SFX)
        @@green_jeans.sprite.as(SF::Sprite).color = Color::ClothingColor::GREEN

        @@turquoise_jeans = Jeans.new("Turquoise Jeans", "turquoise_jeans", false, SF::Sprite.new(JEANS_WHITE_TEXTURE), "turquoise", DEFAULT_PANTS_EQUIP_SFX)
        @@turquoise_jeans.sprite.as(SF::Sprite).color = Color::ClothingColor::TURQUOISE

        @@light_blue_jeans = Jeans.new("Light Blue Jeans", "light_blue_jeans", false, SF::Sprite.new(JEANS_WHITE_TEXTURE), "light-blue", DEFAULT_PANTS_EQUIP_SFX)
        @@light_blue_jeans.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_BLUE

        @@blue_jeans = Jeans.new("Blue Jeans", "blue_jeans", false, SF::Sprite.new(JEANS_WHITE_TEXTURE), "blue", DEFAULT_PANTS_EQUIP_SFX)
        @@blue_jeans.sprite.as(SF::Sprite).color = Color::ClothingColor::BLUE

        @@indigo_jeans = Jeans.new("Indigo Jeans", "indigo_jeans", false, SF::Sprite.new(JEANS_WHITE_TEXTURE), "indigo", DEFAULT_PANTS_EQUIP_SFX)
        @@indigo_jeans.sprite.as(SF::Sprite).color = Color::ClothingColor::INDIGO

        @@light_purple_jeans = Jeans.new("Light Purple Jeans", "light_purple_jeans", false, SF::Sprite.new(JEANS_WHITE_TEXTURE), "light-purple", DEFAULT_PANTS_EQUIP_SFX)
        @@light_purple_jeans.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_PURPLE

        @@purple_jeans = Jeans.new("Purple Jeans", "purple_jeans", false, SF::Sprite.new(JEANS_WHITE_TEXTURE), "purple", DEFAULT_PANTS_EQUIP_SFX)
        @@purple_jeans.sprite.as(SF::Sprite).color = Color::ClothingColor::PURPLE

        @@pink_jeans = Jeans.new("Pink Jeans", "pink_jeans", false, SF::Sprite.new(JEANS_WHITE_TEXTURE), "pink", DEFAULT_PANTS_EQUIP_SFX)
        @@pink_jeans.sprite.as(SF::Sprite).color = Color::ClothingColor::PINK

        @@hot_pink_jeans = Jeans.new("Hot Pink Jeans", "hot_pink_jeans", false, SF::Sprite.new(JEANS_WHITE_TEXTURE), "hot-pink", DEFAULT_PANTS_EQUIP_SFX)
        @@hot_pink_jeans.sprite.as(SF::Sprite).color = Color::ClothingColor::HOT_PINK
    end
    class Shorts < PantsBase
        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, color : String, sfx : SF::Sound)
            super(name, id, is_owned, sprite, color, sfx, "short")
        end

        @@white_booty_shorts = Shorts.new("White Booty Shorts", "white_booty_shorts", false, SF::Sprite.new(BOOTY_SHORTS_WHITE_TEXTURE), "white", DEFAULT_PANTS_EQUIP_SFX)

        @@grey_booty_shorts = Shorts.new("Grey Booty Shorts", "grey_booty_shorts", false, SF::Sprite.new(BOOTY_SHORTS_WHITE_TEXTURE), "grey", DEFAULT_PANTS_EQUIP_SFX)
        @@grey_booty_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::GREY

        @@black_booty_shorts = Shorts.new("Black Booty Shorts", "black_booty_shorts", false, SF::Sprite.new(BOOTY_SHORTS_WHITE_TEXTURE), "black", DEFAULT_PANTS_EQUIP_SFX)
        @@black_booty_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::BLACK

        @@tan_booty_shorts = Shorts.new("Tan Booty Shorts", "tan_booty_shorts", false, SF::Sprite.new(BOOTY_SHORTS_WHITE_TEXTURE), "tan", DEFAULT_PANTS_EQUIP_SFX)
        @@tan_booty_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::TAN

        @@brown_booty_shorts = Shorts.new("Brown Booty Shorts", "brown_booty_shorts", false, SF::Sprite.new(BOOTY_SHORTS_WHITE_TEXTURE), "brown", DEFAULT_PANTS_EQUIP_SFX)
        @@brown_booty_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::BROWN

        @@red_booty_shorts = Shorts.new("Red Booty Shorts", "red_booty_shorts", false, SF::Sprite.new(BOOTY_SHORTS_WHITE_TEXTURE), "red", DEFAULT_PANTS_EQUIP_SFX)
        @@red_booty_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::RED

        @@orange_booty_shorts = Shorts.new("Orange Booty Shorts", "orange_booty_shorts", false, SF::Sprite.new(BOOTY_SHORTS_WHITE_TEXTURE), "orange", DEFAULT_PANTS_EQUIP_SFX)
        @@orange_booty_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::ORANGE

        @@yellow_booty_shorts = Shorts.new("Yellow Booty Shorts", "yellow_booty_shorts", false, SF::Sprite.new(BOOTY_SHORTS_WHITE_TEXTURE), "yellow", DEFAULT_PANTS_EQUIP_SFX)
        @@yellow_booty_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW

        @@yellow_green_booty_shorts = Shorts.new("Yellow Green Booty Shorts", "yellow_green_booty_shorts", false, SF::Sprite.new(BOOTY_SHORTS_WHITE_TEXTURE), "yellow-green", DEFAULT_PANTS_EQUIP_SFX)
        @@yellow_green_booty_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW_GREEN

        @@green_booty_shorts = Shorts.new("Green Booty Shorts", "green_booty_shorts", false, SF::Sprite.new(BOOTY_SHORTS_WHITE_TEXTURE), "green", DEFAULT_PANTS_EQUIP_SFX)
        @@green_booty_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::GREEN

        @@turquoise_booty_shorts = Shorts.new("Turquoise Booty Shorts", "turquoise_booty_shorts", false, SF::Sprite.new(BOOTY_SHORTS_WHITE_TEXTURE), "turquoise", DEFAULT_PANTS_EQUIP_SFX)
        @@turquoise_booty_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::TURQUOISE

        @@light_blue_booty_shorts = Shorts.new("Light Blue Booty Shorts", "light_blue_booty_shorts", false, SF::Sprite.new(BOOTY_SHORTS_WHITE_TEXTURE), "light-blue", DEFAULT_PANTS_EQUIP_SFX)
        @@light_blue_booty_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_BLUE

        @@blue_booty_shorts = Shorts.new("Blue Booty Shorts", "blue_booty_shorts", false, SF::Sprite.new(BOOTY_SHORTS_WHITE_TEXTURE), "blue", DEFAULT_PANTS_EQUIP_SFX)
        @@blue_booty_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::BLUE

        @@indigo_booty_shorts = Shorts.new("Indigo Booty Shorts", "indigo_booty_shorts", false, SF::Sprite.new(BOOTY_SHORTS_WHITE_TEXTURE), "indigo", DEFAULT_PANTS_EQUIP_SFX)
        @@indigo_booty_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::INDIGO

        @@light_purple_booty_shorts = Shorts.new("Light Purple Booty Shorts", "light_purple_booty_shorts", false, SF::Sprite.new(BOOTY_SHORTS_WHITE_TEXTURE), "light-purple", DEFAULT_PANTS_EQUIP_SFX)
        @@light_purple_booty_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_PURPLE

        @@purple_booty_shorts = Shorts.new("Purple Booty Shorts", "purple_booty_shorts", false, SF::Sprite.new(BOOTY_SHORTS_WHITE_TEXTURE), "purple", DEFAULT_PANTS_EQUIP_SFX)
        @@purple_booty_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::PURPLE

        @@pink_booty_shorts = Shorts.new("Pink Booty Shorts", "pink_booty_shorts", false, SF::Sprite.new(BOOTY_SHORTS_WHITE_TEXTURE), "pink", DEFAULT_PANTS_EQUIP_SFX)
        @@pink_booty_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::PINK

        @@hot_pink_booty_shorts = Shorts.new("Hot Pink Booty Shorts", "hot_pink_booty_shorts", false, SF::Sprite.new(BOOTY_SHORTS_WHITE_TEXTURE), "hot-pink", DEFAULT_PANTS_EQUIP_SFX)
        @@hot_pink_booty_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::HOT_PINK


        @@white_shorts = Shorts.new("White Shorts", "white_shorts", false, SF::Sprite.new(SHORTS_WHITE_TEXTURE), "white", DEFAULT_PANTS_EQUIP_SFX)

        @@grey_shorts = Shorts.new("Grey Shorts", "grey_shorts", false, SF::Sprite.new(SHORTS_WHITE_TEXTURE), "grey", DEFAULT_PANTS_EQUIP_SFX)
        @@grey_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::GREY

        @@black_shorts = Shorts.new("Black Shorts", "black_shorts", false, SF::Sprite.new(SHORTS_WHITE_TEXTURE), "black", DEFAULT_PANTS_EQUIP_SFX)
        @@black_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::BLACK

        @@tan_shorts = Shorts.new("Tan Shorts", "tan_shorts", false, SF::Sprite.new(SHORTS_WHITE_TEXTURE), "tan", DEFAULT_PANTS_EQUIP_SFX)
        @@tan_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::TAN

        @@brown_shorts = Shorts.new("Brown Shorts", "brown_shorts", false, SF::Sprite.new(SHORTS_WHITE_TEXTURE), "brown", DEFAULT_PANTS_EQUIP_SFX)
        @@brown_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::BROWN

        @@red_shorts = Shorts.new("Red Shorts", "red_shorts", false, SF::Sprite.new(SHORTS_WHITE_TEXTURE), "red", DEFAULT_PANTS_EQUIP_SFX)
        @@red_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::RED

        @@orange_shorts = Shorts.new("Orange Shorts", "orange_shorts", false, SF::Sprite.new(SHORTS_WHITE_TEXTURE), "orange", DEFAULT_PANTS_EQUIP_SFX)
        @@orange_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::ORANGE

        @@yellow_shorts = Shorts.new("Yellow Shorts", "yellow_shorts", false, SF::Sprite.new(SHORTS_WHITE_TEXTURE), "yellow", DEFAULT_PANTS_EQUIP_SFX)
        @@yellow_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW

        @@yellow_green_shorts = Shorts.new("Yellow Green Shorts", "yellow_green_shorts", false, SF::Sprite.new(SHORTS_WHITE_TEXTURE), "yellow-green", DEFAULT_PANTS_EQUIP_SFX)
        @@yellow_green_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW_GREEN

        @@green_shorts = Shorts.new("Green Shorts", "green_shorts", false, SF::Sprite.new(SHORTS_WHITE_TEXTURE), "green", DEFAULT_PANTS_EQUIP_SFX)
        @@green_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::GREEN

        @@turquoise_shorts = Shorts.new("Turquoise Shorts", "turquoise_shorts", false, SF::Sprite.new(SHORTS_WHITE_TEXTURE), "turquoise", DEFAULT_PANTS_EQUIP_SFX)
        @@turquoise_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::TURQUOISE

        @@light_blue_shorts = Shorts.new("Light Blue Shorts", "light_blue_shorts", false, SF::Sprite.new(SHORTS_WHITE_TEXTURE), "light-blue", DEFAULT_PANTS_EQUIP_SFX)
        @@light_blue_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_BLUE

        @@blue_shorts = Shorts.new("Blue Shorts", "blue_shorts", false, SF::Sprite.new(SHORTS_WHITE_TEXTURE), "blue", DEFAULT_PANTS_EQUIP_SFX)
        @@blue_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::BLUE

        @@indigo_shorts = Shorts.new("Indigo Shorts", "indigo_shorts", false, SF::Sprite.new(SHORTS_WHITE_TEXTURE), "indigo", DEFAULT_PANTS_EQUIP_SFX)
        @@indigo_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::INDIGO

        @@light_purple_shorts = Shorts.new("Light Purple Shorts", "light_purple_shorts", false, SF::Sprite.new(SHORTS_WHITE_TEXTURE), "light-purple", DEFAULT_PANTS_EQUIP_SFX)
        @@light_purple_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_PURPLE

        @@purple_shorts = Shorts.new("Purple Shorts", "purple_shorts", false, SF::Sprite.new(SHORTS_WHITE_TEXTURE), "purple", DEFAULT_PANTS_EQUIP_SFX)
        @@purple_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::PURPLE

        @@pink_shorts = Shorts.new("Pink Shorts", "pink_shorts", false, SF::Sprite.new(SHORTS_WHITE_TEXTURE), "pink", DEFAULT_PANTS_EQUIP_SFX)
        @@pink_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::PINK

        @@hot_pink_shorts = Shorts.new("Hot Pink Shorts", "hot_pink_shorts", false, SF::Sprite.new(SHORTS_WHITE_TEXTURE), "hot-pink", DEFAULT_PANTS_EQUIP_SFX)
        @@hot_pink_shorts.sprite.as(SF::Sprite).color = Color::ClothingColor::HOT_PINK
    end
end