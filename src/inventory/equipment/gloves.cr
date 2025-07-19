require "crsfml"
require "crsfml/audio"
require "../../../src/textures.cr"
require "../../../src/utility.cr"
require "../../../src/inventory/equipment/clothing.cr"
require "../../../src/sound/sfx.cr"
require "../../../graphics/color.cr"

module Gloves
    class GlovesBase < Clothing::ClothingBase
        include JSON::Serializable

        GLOVES_ARRAY = [] of GlovesBase
        OWNED_GLOVES_ARRAY = [] of GlovesBase | Clothing::ClothingBase

        GLOVES_SPRITE_HASH = {} of String => SF::Sprite
        GLOVES_SFX_HASH = {} of String => SF::Sound

        DEFAULT_GLOVES_EQUIP_SFX = SFX::EquipSFX::FABRIC_EQUIP_02

        property name : String
        property id : String
        property is_owned : Bool
        property sprite : SF::Sprite?
        property color : String
        property sfx : SF::Sound?

        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, color : String, sfx : SF::Sound = DEFAULT_GLOVES_EQUIP_SFX)
            @name = name
            @id = id
            @is_owned = Settings::GameSettings.is_debug_mode ? true : is_owned
            @sprite = sprite
            @color = color
            @sfx = sfx

            GLOVES_ARRAY << self
            GLOVES_SPRITE_HASH[id] = sprite
            GLOVES_SFX_HASH[id] = sfx

            if self.is_owned && !OWNED_GLOVES_ARRAY.any? { |owned_gloves| owned_gloves.id == self.id }
                OWNED_GLOVES_ARRAY << self
                OWNED_GLOVES_ARRAY.uniq!
            end
        end

        def self.swap_gloves(item : GlovesBase)
            if item.as(Gloves::GlovesBase).sfx != nil
                item.as(Gloves::GlovesBase).sfx.not_nil!.play
            else
                DEFAULT_GLOVES_EQUIP_SFX.play
            end
            
            if Player::Appearance.gloves != nil
                if Gloves::GlovesBase::OWNED_GLOVES_ARRAY.none? { |owned_gloves| owned_gloves.id == Player::Appearance.gloves.as(Gloves::GlovesBase).id }
                    Gloves::GlovesBase::OWNED_GLOVES_ARRAY << Player::Appearance.gloves.as(Gloves::GlovesBase)
                end
            end
            
            Player::Appearance.gloves = item.as(Gloves::GlovesBase)
            Gloves::GlovesBase::OWNED_GLOVES_ARRAY.reject! { |owned_gloves| owned_gloves.id == item.as(Gloves::GlovesBase).id }
        end

        def self.remove_current_gloves_from_inventory
            if Player::Appearance.gloves && Player::Appearance.gloves.as(Gloves::GlovesBase).id
                current_gloves = Player::Appearance.gloves.as(Gloves::GlovesBase)
                gloves_id = Player::Appearance.gloves.as(Gloves::GlovesBase).id
                OWNED_GLOVES_ARRAY.reject! { |owned_gloves| owned_gloves.id == gloves_id }
            end
        end
        class ShortGloves < GlovesBase
            @@white_gloves = ShortGloves.new("White Gloves", "short_gloves_white", false, SF::Sprite.new(GLOVES_WHITE_TEXTURE), "white", DEFAULT_GLOVES_EQUIP_SFX)

            @@grey_gloves = ShortGloves.new("Gray Gloves", "short_gloves_gray", false, SF::Sprite.new(GLOVES_WHITE_TEXTURE), "gray", DEFAULT_GLOVES_EQUIP_SFX)
            @@grey_gloves.sprite.as(SF::Sprite).color = Color::ClothingColor::GREY

            @@black_gloves = ShortGloves.new("Black Gloves", "short_gloves_black", false, SF::Sprite.new(GLOVES_WHITE_TEXTURE), "black", DEFAULT_GLOVES_EQUIP_SFX)
            @@black_gloves.sprite.as(SF::Sprite).color = Color::ClothingColor::BLACK

            @@tan_gloves = ShortGloves.new("Tan Gloves", "short_gloves_tan", false, SF::Sprite.new(GLOVES_WHITE_TEXTURE), "tan", DEFAULT_GLOVES_EQUIP_SFX)
            @@tan_gloves.sprite.as(SF::Sprite).color = Color::ClothingColor::TAN

            @@brown_gloves = ShortGloves.new("Brown Gloves", "short_gloves_brown", false, SF::Sprite.new(GLOVES_WHITE_TEXTURE), "brown", DEFAULT_GLOVES_EQUIP_SFX)
            @@brown_gloves.sprite.as(SF::Sprite).color = Color::ClothingColor::BROWN

            @@red_gloves = ShortGloves.new("Red Gloves", "short_gloves_red", false, SF::Sprite.new(GLOVES_WHITE_TEXTURE), "red", DEFAULT_GLOVES_EQUIP_SFX)
            @@red_gloves.sprite.as(SF::Sprite).color = Color::ClothingColor::RED

            @@orange_gloves = ShortGloves.new("Orange Gloves", "short_gloves_orange", false, SF::Sprite.new(GLOVES_WHITE_TEXTURE), "orange", DEFAULT_GLOVES_EQUIP_SFX)
            @@orange_gloves.sprite.as(SF::Sprite).color = Color::ClothingColor::ORANGE

            @@yellow_gloves = ShortGloves.new("Yellow Gloves", "short_gloves_yellow", false, SF::Sprite.new(GLOVES_WHITE_TEXTURE), "yellow", DEFAULT_GLOVES_EQUIP_SFX)
            @@yellow_gloves.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW

            @@yellow_green_gloves = ShortGloves.new("Yellow Green Gloves", "short_gloves_yellow_green", false, SF::Sprite.new(GLOVES_WHITE_TEXTURE), "yellow-green", DEFAULT_GLOVES_EQUIP_SFX)
            @@yellow_green_gloves.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW_GREEN

            @@green_gloves = ShortGloves.new("Green Gloves", "short_gloves_green", false, SF::Sprite.new(GLOVES_WHITE_TEXTURE), "green", DEFAULT_GLOVES_EQUIP_SFX)
            @@green_gloves.sprite.as(SF::Sprite).color = Color::ClothingColor::GREEN

            @@turquoise_gloves = ShortGloves.new("Turquoise Gloves", "short_gloves_turquoise", false, SF::Sprite.new(GLOVES_WHITE_TEXTURE), "turquoise", DEFAULT_GLOVES_EQUIP_SFX)
            @@turquoise_gloves.sprite.as(SF::Sprite).color = Color::ClothingColor::TURQUOISE

            @@light_blue_gloves = ShortGloves.new("Light Blue Gloves", "short_gloves_light_blue", false, SF::Sprite.new(GLOVES_WHITE_TEXTURE), "light-blue", DEFAULT_GLOVES_EQUIP_SFX)
            @@light_blue_gloves.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_BLUE

            @@blue_gloves = ShortGloves.new("Blue Gloves", "short_gloves_blue", false, SF::Sprite.new(GLOVES_WHITE_TEXTURE), "blue", DEFAULT_GLOVES_EQUIP_SFX)
            @@blue_gloves.sprite.as(SF::Sprite).color = Color::ClothingColor::BLUE

            @@indigo_gloves = ShortGloves.new("Indigo Gloves", "short_gloves_indigo", false, SF::Sprite.new(GLOVES_WHITE_TEXTURE), "indigo", DEFAULT_GLOVES_EQUIP_SFX)
            @@indigo_gloves.sprite.as(SF::Sprite).color = Color::ClothingColor::INDIGO

            @@light_purple_gloves = ShortGloves.new("Light Purple Gloves", "short_gloves_light_purple", false, SF::Sprite.new(GLOVES_WHITE_TEXTURE), "light-purple", DEFAULT_GLOVES_EQUIP_SFX)
            @@light_purple_gloves.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_PURPLE

            @@purple_gloves = ShortGloves.new("Purple Gloves", "short_gloves_purple", false, SF::Sprite.new(GLOVES_WHITE_TEXTURE), "purple", DEFAULT_GLOVES_EQUIP_SFX)
            @@purple_gloves.sprite.as(SF::Sprite).color = Color::ClothingColor::PURPLE

            @@pink_gloves = ShortGloves.new("Pink Gloves", "short_gloves_pink", false, SF::Sprite.new(GLOVES_WHITE_TEXTURE), "pink", DEFAULT_GLOVES_EQUIP_SFX)
            @@pink_gloves.sprite.as(SF::Sprite).color = Color::ClothingColor::PINK

            @@hot_pink_gloves = ShortGloves.new("Hot Pink Gloves", "short_gloves_hot_pink", false, SF::Sprite.new(GLOVES_WHITE_TEXTURE), "hot-pink", DEFAULT_GLOVES_EQUIP_SFX)
            @@hot_pink_gloves.sprite.as(SF::Sprite).color = Color::ClothingColor::HOT_PINK
        end
    end
end