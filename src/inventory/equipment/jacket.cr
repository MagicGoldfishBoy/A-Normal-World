require "crsfml"
require "crsfml/audio"
require "../../../src/textures.cr"
require "../../../src/utility.cr"
require "../../../src/inventory/equipment/clothing.cr"
require "../../../src/sound/sfx.cr"
require "../../../graphics/color.cr"

module Jacket
    class JacketBase < Clothing::ClothingBase
        include JSON::Serializable

        JACKET_ARRAY = [] of JacketBase
        OWNED_JACKETS_ARRAY = [] of JacketBase | Clothing::ClothingBase

        JACKET_SPRITE_HASH = {} of String => Array(SF::Sprite)
        JACKET_SFX_HASH = {} of String => SF::Sound

        DEFAULT_JACKET_EQUIP_SFX = SFX::EquipSFX::FABRIC_EQUIP_01

        property name : String
        property id : String
        property is_owned : Bool
        property sprite : SF::Sprite?
        property color : String
        property sfx : SF::Sound?
        @[JSON::Field(ignore: true)]
        property back_sprite : SF::Sprite? #< the amount of issues adding a second sprite caused was insane, but it works now :P

        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, back_sprite : SF::Sprite, color : String, sfx : SF::Sound)
            @name = name
            @id = id
            @is_owned = is_owned
            @sprite = sprite
            @back_sprite = back_sprite
            @color = color
            @sfx = sfx

            JACKET_ARRAY << self
            JACKET_SPRITE_HASH[id] = [sprite, back_sprite]
            JACKET_SFX_HASH[id] = sfx

            if self.is_owned && !OWNED_JACKETS_ARRAY.any? { |owned_jacket| owned_jacket.id == self.id }
                OWNED_JACKETS_ARRAY << self
                OWNED_JACKETS_ARRAY.uniq!
            end
        end

        def self.swap_jacket(item : JacketBase)
            if item.as(Jacket::JacketBase).sfx != nil
                item.as(Jacket::JacketBase).sfx.not_nil!.play
            else
                DEFAULT_JACKET_EQUIP_SFX.play
            end
            
            if Player::Appearance.jacket != nil
                if Jacket::JacketBase::OWNED_JACKETS_ARRAY.none? { |owned_jacket| owned_jacket.id == Player::Appearance.jacket.as(Jacket::JacketBase).id }
                    Jacket::JacketBase::OWNED_JACKETS_ARRAY << Player::Appearance.jacket.as(Jacket::JacketBase)
                end
            end
            
            Player::Appearance.jacket = item.as(Jacket::JacketBase)
            Jacket::JacketBase::OWNED_JACKETS_ARRAY.reject! { |owned_jacket| owned_jacket.id == item.as(Jacket::JacketBase).id }
        end

        def self.remove_current_jacket_from_inventory
            if Player::Appearance.jacket && Player::Appearance.jacket.as(Jacket::JacketBase).id
                jacket_id = Player::Appearance.jacket.as(Jacket::JacketBase).id
                Jacket::JacketBase::OWNED_JACKETS_ARRAY.reject! { |owned_jacket| owned_jacket.id == jacket_id }
            end
        end
    end
    class LightJacket < JacketBase

        @@white_light_jacket = LightJacket.new("White Light Jacket", "white_light_jacket", true, SF::Sprite.new(WHITE_LIGHT_JACKET_FRONT_TEXTURE), SF::Sprite.new(WHITE_LIGHT_JACKET_BACK_TEXTURE), "white", DEFAULT_JACKET_EQUIP_SFX)

        @@grey_light_jacket = LightJacket.new("Grey Light Jacket", "grey_light_jacket", true, SF::Sprite.new(WHITE_LIGHT_JACKET_FRONT_TEXTURE), SF::Sprite.new(WHITE_LIGHT_JACKET_BACK_TEXTURE), "grey", DEFAULT_JACKET_EQUIP_SFX)
        @@grey_light_jacket.sprite.as(SF::Sprite).color = Color::ClothingColor::GREY
        @@grey_light_jacket.back_sprite.as(SF::Sprite).color = Color::ClothingColor::GREY

        @@black_light_jacket = LightJacket.new("Black Light Jacket", "black_light_jacket", true, SF::Sprite.new(WHITE_LIGHT_JACKET_FRONT_TEXTURE), SF::Sprite.new(WHITE_LIGHT_JACKET_BACK_TEXTURE), "black", DEFAULT_JACKET_EQUIP_SFX)
        @@black_light_jacket.sprite.as(SF::Sprite).color = Color::ClothingColor::BLACK
        @@black_light_jacket.back_sprite.as(SF::Sprite).color = Color::ClothingColor::BLACK

        @@tan_light_jacket = LightJacket.new("Tan Light Jacket", "tan_light_jacket", true, SF::Sprite.new(WHITE_LIGHT_JACKET_FRONT_TEXTURE), SF::Sprite.new(WHITE_LIGHT_JACKET_BACK_TEXTURE), "tan", DEFAULT_JACKET_EQUIP_SFX)
        @@tan_light_jacket.sprite.as(SF::Sprite).color = Color::ClothingColor::TAN
        @@tan_light_jacket.back_sprite.as(SF::Sprite).color = Color::ClothingColor::TAN

        @@brown_light_jacket = LightJacket.new("Brown Light Jacket", "brown_light_jacket", true, SF::Sprite.new(WHITE_LIGHT_JACKET_FRONT_TEXTURE), SF::Sprite.new(WHITE_LIGHT_JACKET_BACK_TEXTURE), "brown", DEFAULT_JACKET_EQUIP_SFX)
        @@brown_light_jacket.sprite.as(SF::Sprite).color = Color::ClothingColor::BROWN
        @@brown_light_jacket.back_sprite.as(SF::Sprite).color = Color::ClothingColor::BROWN

        @@red_light_jacket = LightJacket.new("Red Light Jacket", "red_light_jacket", true, SF::Sprite.new(WHITE_LIGHT_JACKET_FRONT_TEXTURE), SF::Sprite.new(WHITE_LIGHT_JACKET_BACK_TEXTURE), "red", DEFAULT_JACKET_EQUIP_SFX)
        @@red_light_jacket.sprite.as(SF::Sprite).color = Color::ClothingColor::RED
        @@red_light_jacket.back_sprite.as(SF::Sprite).color = Color::ClothingColor::RED

        @@orange_light_jacket = LightJacket.new("Orange Light Jacket", "orange_light_jacket", true, SF::Sprite.new(WHITE_LIGHT_JACKET_FRONT_TEXTURE), SF::Sprite.new(WHITE_LIGHT_JACKET_BACK_TEXTURE), "orange", DEFAULT_JACKET_EQUIP_SFX)
        @@orange_light_jacket.sprite.as(SF::Sprite).color = Color::ClothingColor::ORANGE
        @@orange_light_jacket.back_sprite.as(SF::Sprite).color = Color::ClothingColor::ORANGE

        @@yellow_light_jacket = LightJacket.new("Yellow Light Jacket", "yellow_light_jacket", true, SF::Sprite.new(WHITE_LIGHT_JACKET_FRONT_TEXTURE), SF::Sprite.new(WHITE_LIGHT_JACKET_BACK_TEXTURE), "yellow", DEFAULT_JACKET_EQUIP_SFX)
        @@yellow_light_jacket.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW
        @@yellow_light_jacket.back_sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW

        @@yellow_green_light_jacket = LightJacket.new("Yellow Green Light Jacket", "yellow_green_light_jacket", true, SF::Sprite.new(WHITE_LIGHT_JACKET_FRONT_TEXTURE), SF::Sprite.new(WHITE_LIGHT_JACKET_BACK_TEXTURE), "yellow-green", DEFAULT_JACKET_EQUIP_SFX)
        @@yellow_green_light_jacket.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW_GREEN
        @@yellow_green_light_jacket.back_sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW_GREEN

        @@green_light_jacket = LightJacket.new("Green Light Jacket", "green_light_jacket", true, SF::Sprite.new(WHITE_LIGHT_JACKET_FRONT_TEXTURE), SF::Sprite.new(WHITE_LIGHT_JACKET_BACK_TEXTURE), "green", DEFAULT_JACKET_EQUIP_SFX)
        @@green_light_jacket.sprite.as(SF::Sprite).color = Color::ClothingColor::GREEN
        @@green_light_jacket.back_sprite.as(SF::Sprite).color = Color::ClothingColor::GREEN

        @@turquoise_light_jacket = LightJacket.new("Turquoise Light Jacket", "turquoise_light_jacket", true, SF::Sprite.new(WHITE_LIGHT_JACKET_FRONT_TEXTURE), SF::Sprite.new(WHITE_LIGHT_JACKET_BACK_TEXTURE), "turquoise", DEFAULT_JACKET_EQUIP_SFX)
        @@turquoise_light_jacket.sprite.as(SF::Sprite).color = Color::ClothingColor::TURQUOISE
        @@turquoise_light_jacket.back_sprite.as(SF::Sprite).color = Color::ClothingColor::TURQUOISE

        @@light_blue_light_jacket = LightJacket.new("Light Blue Light Jacket", "light_blue_light_jacket", true, SF::Sprite.new(WHITE_LIGHT_JACKET_FRONT_TEXTURE), SF::Sprite.new(WHITE_LIGHT_JACKET_BACK_TEXTURE), "light-blue", DEFAULT_JACKET_EQUIP_SFX)
        @@light_blue_light_jacket.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_BLUE
        @@light_blue_light_jacket.back_sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_BLUE

        @@blue_light_jacket = LightJacket.new("Blue Light Jacket", "blue_light_jacket", true, SF::Sprite.new(WHITE_LIGHT_JACKET_FRONT_TEXTURE), SF::Sprite.new(WHITE_LIGHT_JACKET_BACK_TEXTURE), "blue", DEFAULT_JACKET_EQUIP_SFX)
        @@blue_light_jacket.sprite.as(SF::Sprite).color = Color::ClothingColor::BLUE
        @@blue_light_jacket.back_sprite.as(SF::Sprite).color = Color::ClothingColor::BLUE

        @@indigo_light_jacket = LightJacket.new("Indigo Light Jacket", "indigo_light_jacket", true, SF::Sprite.new(WHITE_LIGHT_JACKET_FRONT_TEXTURE), SF::Sprite.new(WHITE_LIGHT_JACKET_BACK_TEXTURE), "indigo", DEFAULT_JACKET_EQUIP_SFX)
        @@indigo_light_jacket.sprite.as(SF::Sprite).color = Color::ClothingColor::INDIGO
        @@indigo_light_jacket.back_sprite.as(SF::Sprite).color = Color::ClothingColor::INDIGO

        @@light_purple_light_jacket = LightJacket.new("Light Purple Light Jacket", "light_purple_light_jacket", true, SF::Sprite.new(WHITE_LIGHT_JACKET_FRONT_TEXTURE), SF::Sprite.new(WHITE_LIGHT_JACKET_BACK_TEXTURE), "light-purple", DEFAULT_JACKET_EQUIP_SFX)
        @@light_purple_light_jacket.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_PURPLE
        @@light_purple_light_jacket.back_sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_PURPLE

        @@purple_light_jacket = LightJacket.new("Purple Light Jacket", "purple_light_jacket", true, SF::Sprite.new(WHITE_LIGHT_JACKET_FRONT_TEXTURE), SF::Sprite.new(WHITE_LIGHT_JACKET_BACK_TEXTURE), "purple", DEFAULT_JACKET_EQUIP_SFX)
        @@purple_light_jacket.sprite.as(SF::Sprite).color = Color::ClothingColor::PURPLE
        @@purple_light_jacket.back_sprite.as(SF::Sprite).color = Color::ClothingColor::PURPLE

        @@pink_light_jacket = LightJacket.new("Pink Light Jacket", "pink_light_jacket", true, SF::Sprite.new(WHITE_LIGHT_JACKET_FRONT_TEXTURE), SF::Sprite.new(WHITE_LIGHT_JACKET_BACK_TEXTURE), "pink", DEFAULT_JACKET_EQUIP_SFX)
        @@pink_light_jacket.sprite.as(SF::Sprite).color = Color::ClothingColor::PINK
        @@pink_light_jacket.back_sprite.as(SF::Sprite).color = Color::ClothingColor::PINK

        @@hot_pink_light_jacket = LightJacket.new("Hot Pink Light Jacket", "hot_pink_light_jacket", true, SF::Sprite.new(WHITE_LIGHT_JACKET_FRONT_TEXTURE), SF::Sprite.new(WHITE_LIGHT_JACKET_BACK_TEXTURE), "hot-pink", DEFAULT_JACKET_EQUIP_SFX)
        @@hot_pink_light_jacket.sprite.as(SF::Sprite).color = Color::ClothingColor::HOT_PINK
        @@hot_pink_light_jacket.back_sprite.as(SF::Sprite).color = Color::ClothingColor::HOT_PINK
    end
    class Backpack < JacketBase
        #TODO: figure out why backsprite on the white backpack is invisible
        @@white_backpack = Backpack.new("White Backpack", "white_backpack", true, SF::Sprite.new(WHITE_BACKPACK_FRONT_TEXTURE), SF::Sprite.new(WHITE_BACKPACK_BACK_TEXTURE), "white", DEFAULT_JACKET_EQUIP_SFX) #whyyyyyyy?!?

        @@grey_backpack = Backpack.new("Grey Backpack", "grey_backpack", true, SF::Sprite.new(WHITE_BACKPACK_FRONT_TEXTURE), SF::Sprite.new(WHITE_BACKPACK_BACK_TEXTURE), "grey", DEFAULT_JACKET_EQUIP_SFX)
        @@grey_backpack.sprite.as(SF::Sprite).color = Color::ClothingColor::GREY
        @@grey_backpack.back_sprite.as(SF::Sprite).color = Color::ClothingColor::GREY

        @@black_backpack = Backpack.new("Black Backpack", "black_backpack", true, SF::Sprite.new(WHITE_BACKPACK_FRONT_TEXTURE), SF::Sprite.new(WHITE_BACKPACK_BACK_TEXTURE), "black", DEFAULT_JACKET_EQUIP_SFX)
        @@black_backpack.sprite.as(SF::Sprite).color = Color::ClothingColor::BLACK
        @@black_backpack.back_sprite.as(SF::Sprite).color = Color::ClothingColor::BLACK

        @@tan_backpack = Backpack.new("Tan Backpack", "tan_backpack", true, SF::Sprite.new(WHITE_BACKPACK_FRONT_TEXTURE), SF::Sprite.new(WHITE_BACKPACK_BACK_TEXTURE), "tan", DEFAULT_JACKET_EQUIP_SFX)
        @@tan_backpack.sprite.as(SF::Sprite).color = Color::ClothingColor::TAN
        @@tan_backpack.back_sprite.as(SF::Sprite).color = Color::ClothingColor::TAN

        @@brown_backpack = Backpack.new("Brown Backpack", "brown_backpack", true, SF::Sprite.new(WHITE_BACKPACK_FRONT_TEXTURE), SF::Sprite.new(WHITE_BACKPACK_BACK_TEXTURE), "brown", DEFAULT_JACKET_EQUIP_SFX)
        @@brown_backpack.sprite.as(SF::Sprite).color = Color::ClothingColor::BROWN
        @@brown_backpack.back_sprite.as(SF::Sprite).color = Color::ClothingColor::BROWN

        @@red_backpack = Backpack.new("Red Backpack", "red_backpack", true, SF::Sprite.new(WHITE_BACKPACK_FRONT_TEXTURE), SF::Sprite.new(WHITE_BACKPACK_BACK_TEXTURE), "red", DEFAULT_JACKET_EQUIP_SFX)
        @@red_backpack.sprite.as(SF::Sprite).color = Color::ClothingColor::RED
        @@red_backpack.back_sprite.as(SF::Sprite).color = Color::ClothingColor::RED

        @@orange_backpack = Backpack.new("Orange Backpack", "orange_backpack", true, SF::Sprite.new(WHITE_BACKPACK_FRONT_TEXTURE), SF::Sprite.new(WHITE_BACKPACK_BACK_TEXTURE), "orange", DEFAULT_JACKET_EQUIP_SFX)
        @@orange_backpack.sprite.as(SF::Sprite).color = Color::ClothingColor::ORANGE
        @@orange_backpack.back_sprite.as(SF::Sprite).color = Color::ClothingColor::ORANGE

        @@yellow_backpack = Backpack.new("Yellow Backpack", "yellow_backpack", true, SF::Sprite.new(WHITE_BACKPACK_FRONT_TEXTURE), SF::Sprite.new(WHITE_BACKPACK_BACK_TEXTURE), "yellow", DEFAULT_JACKET_EQUIP_SFX)
        @@yellow_backpack.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW
        @@yellow_backpack.back_sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW

        @@yellow_green_backpack = Backpack.new("Yellow Green Backpack", "yellow_green_backpack", true, SF::Sprite.new(WHITE_BACKPACK_FRONT_TEXTURE), SF::Sprite.new(WHITE_BACKPACK_BACK_TEXTURE), "yellow-green", DEFAULT_JACKET_EQUIP_SFX)
        @@yellow_green_backpack.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW_GREEN
        @@yellow_green_backpack.back_sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW_GREEN

        @@green_backpack = Backpack.new("Green Backpack", "green_backpack", true, SF::Sprite.new(WHITE_BACKPACK_FRONT_TEXTURE), SF::Sprite.new(WHITE_BACKPACK_BACK_TEXTURE), "green", DEFAULT_JACKET_EQUIP_SFX)
        @@green_backpack.sprite.as(SF::Sprite).color = Color::ClothingColor::GREEN
        @@green_backpack.back_sprite.as(SF::Sprite).color = Color::ClothingColor::GREEN

        @@turquoise_backpack = Backpack.new("Turquoise Backpack", "turquoise_backpack", true, SF::Sprite.new(WHITE_BACKPACK_FRONT_TEXTURE), SF::Sprite.new(WHITE_BACKPACK_BACK_TEXTURE), "turquoise", DEFAULT_JACKET_EQUIP_SFX)
        @@turquoise_backpack.sprite.as(SF::Sprite).color = Color::ClothingColor::TURQUOISE
        @@turquoise_backpack.back_sprite.as(SF::Sprite).color = Color::ClothingColor::TURQUOISE

        @@light_blue_backpack = Backpack.new("Light Blue Backpack", "light_blue_backpack", true, SF::Sprite.new(WHITE_BACKPACK_FRONT_TEXTURE), SF::Sprite.new(WHITE_BACKPACK_BACK_TEXTURE), "light-blue", DEFAULT_JACKET_EQUIP_SFX)
        @@light_blue_backpack.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_BLUE
        @@light_blue_backpack.back_sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_BLUE

        @@blue_backpack = Backpack.new("Blue Backpack", "blue_backpack", true, SF::Sprite.new(WHITE_BACKPACK_FRONT_TEXTURE), SF::Sprite.new(WHITE_BACKPACK_BACK_TEXTURE), "blue", DEFAULT_JACKET_EQUIP_SFX)
        @@blue_backpack.sprite.as(SF::Sprite).color = Color::ClothingColor::BLUE
        @@blue_backpack.back_sprite.as(SF::Sprite).color = Color::ClothingColor::BLUE

        @@indigo_backpack = Backpack.new("Indigo Backpack", "indigo_backpack", true, SF::Sprite.new(WHITE_BACKPACK_FRONT_TEXTURE), SF::Sprite.new(WHITE_BACKPACK_BACK_TEXTURE), "indigo", DEFAULT_JACKET_EQUIP_SFX)
        @@indigo_backpack.sprite.as(SF::Sprite).color = Color::ClothingColor::INDIGO
        @@indigo_backpack.back_sprite.as(SF::Sprite).color = Color::ClothingColor::INDIGO

        @@light_purple_backpack = Backpack.new("Light Purple Backpack", "light_purple_backpack", true, SF::Sprite.new(WHITE_BACKPACK_FRONT_TEXTURE), SF::Sprite.new(WHITE_BACKPACK_BACK_TEXTURE), "light-purple", DEFAULT_JACKET_EQUIP_SFX)
        @@light_purple_backpack.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_PURPLE
        @@light_purple_backpack.back_sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_PURPLE

        @@purple_backpack = Backpack.new("Purple Backpack", "purple_backpack", true, SF::Sprite.new(WHITE_BACKPACK_FRONT_TEXTURE), SF::Sprite.new(WHITE_BACKPACK_BACK_TEXTURE), "purple", DEFAULT_JACKET_EQUIP_SFX)
        @@purple_backpack.sprite.as(SF::Sprite).color = Color::ClothingColor::PURPLE
        @@purple_backpack.back_sprite.as(SF::Sprite).color = Color::ClothingColor::PURPLE

        @@pink_backpack = Backpack.new("Pink Backpack", "pink_backpack", true, SF::Sprite.new(WHITE_BACKPACK_FRONT_TEXTURE), SF::Sprite.new(WHITE_BACKPACK_BACK_TEXTURE), "pink", DEFAULT_JACKET_EQUIP_SFX)
        @@pink_backpack.sprite.as(SF::Sprite).color = Color::ClothingColor::PINK
        @@pink_backpack.back_sprite.as(SF::Sprite).color = Color::ClothingColor::PINK

        @@hot_pink_backpack = Backpack.new("Hot Pink Backpack", "hot_pink_backpack", true, SF::Sprite.new(WHITE_BACKPACK_FRONT_TEXTURE), SF::Sprite.new(WHITE_BACKPACK_BACK_TEXTURE), "hot-pink", DEFAULT_JACKET_EQUIP_SFX)
        @@hot_pink_backpack.sprite.as(SF::Sprite).color = Color::ClothingColor::HOT_PINK
        @@hot_pink_backpack.back_sprite.as(SF::Sprite).color = Color::ClothingColor::HOT_PINK
    end
end