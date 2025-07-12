require "crsfml"
require "crsfml/audio"
require "../../../src/textures.cr"
require "../../../src/utility.cr"
require "../../../src/inventory/equipment/clothing.cr"
require "../../../graphics/color.cr"

module Glasses 

    class GlassesBase < Clothing::ClothingBase
    include JSON::Serializable

    GLASSES_ARRAY = [] of GlassesBase
    OWNED_GLASSES_ARRAY = [] of GlassesBase | Clothing::ClothingBase

    GLASSES_SPRITE_HASH = {} of String => SF::Sprite
    GLASSES_SFX_HASH = {} of String => SF::Sound

    DEFAULT_GLASSES_EQUIP_SFX = SFX::EquipSFX::TEST_EQUIP_SFX

    property name : String
    property id : String
    property is_owned : Bool
    property sprite : SF::Sprite?
    property color : String
    property sfx : SF::Sound?

    def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, color : String, sfx : SF::Sound = DEFAULT_GLASSES_EQUIP_SFX)
        @name = name
        @id = id
        @is_owned = is_owned
        @sprite = sprite
        @color = color
        @sfx = sfx

        GLASSES_ARRAY << self
        GLASSES_SPRITE_HASH[id] = sprite
        GLASSES_SFX_HASH[id] = sfx

        if self.is_owned && !OWNED_GLASSES_ARRAY.any? { |owned_glasses| owned_glasses.id == self.id }
            OWNED_GLASSES_ARRAY << self
            OWNED_GLASSES_ARRAY.uniq!
        end
    end

    def self.swap_glasses(item : GlassesBase)
        
     if item.as(Glasses::GlassesBase).sfx != nil
            item.as(Glasses::GlassesBase).sfx.not_nil!.play
     else
            DEFAULT_GLASSES_EQUIP_SFX.play
     end
     if Player::Appearance.glasses != nil
        if Glasses::GlassesBase::OWNED_GLASSES_ARRAY.none? { |owned_glasses| owned_glasses.id == Player::Appearance.glasses.as(Glasses::GlassesBase).id }
            Glasses::GlassesBase::OWNED_GLASSES_ARRAY << Player::Appearance.glasses.as(Glasses::GlassesBase)
        end
     end
        Player::Appearance.glasses = item.as(Glasses::GlassesBase)
        Glasses::GlassesBase::OWNED_GLASSES_ARRAY.reject! { |owned_glasses| owned_glasses.id == item.as(Glasses::GlassesBase).id }
     end
    end

    class Sunglasses < GlassesBase
        @@sunglasses = Sunglasses.new("White Sunglasses", "sunglasses", true, SF::Sprite.new(SUNGLASSES_TEXTURE), "white", DEFAULT_GLASSES_EQUIP_SFX)
        GLASSES_SPRITE_HASH[@@sunglasses.id] = @@sunglasses.sprite.as(SF::Sprite)
        GLASSES_SFX_HASH[@@sunglasses.id] = @@sunglasses.sfx.as(SF::Sound)

        @@grey_sunglasses = Sunglasses.new("Grey Sunglasses", "grey_sunglasses", true, SF::Sprite.new(SUNGLASSES_TEXTURE), "grey", DEFAULT_GLASSES_EQUIP_SFX)
        @@grey_sunglasses.sprite.as(SF::Sprite).color = Color::ClothingColor::GREY
        GLASSES_SPRITE_HASH[@@grey_sunglasses.id] = @@grey_sunglasses.sprite.as(SF::Sprite)
        GLASSES_SFX_HASH[@@grey_sunglasses.id] = @@grey_sunglasses.sfx.as(SF::Sound)

        @@black_sunglasses = Sunglasses.new("Black Sunglasses", "black_sunglasses", true, SF::Sprite.new(SUNGLASSES_TEXTURE), "black", DEFAULT_GLASSES_EQUIP_SFX)
        @@black_sunglasses.sprite.as(SF::Sprite).color = Color::ClothingColor::BLACK
        GLASSES_SPRITE_HASH[@@black_sunglasses.id] = @@black_sunglasses.sprite.as(SF::Sprite)
        GLASSES_SFX_HASH[@@black_sunglasses.id] = @@black_sunglasses.sfx.as(SF::Sound)

        @@red_sunglasses = Sunglasses.new("Red Sunglasses", "red_sunglasses", true, SF::Sprite.new(SUNGLASSES_TEXTURE), "red", DEFAULT_GLASSES_EQUIP_SFX)
        @@red_sunglasses.sprite.as(SF::Sprite).color = Color::ClothingColor::RED
        GLASSES_SPRITE_HASH[@@red_sunglasses.id] = @@red_sunglasses.sprite.as(SF::Sprite)
        GLASSES_SFX_HASH[@@red_sunglasses.id] = @@red_sunglasses.sfx.as(SF::Sound)
    end
    class Eyeglasses < GlassesBase
        @@round_eyeglasses = Eyeglasses.new("Round Glasses", "round_eyeglasses", true, SF::Sprite.new(ROUND_GLASSES_TEXTURE), "white", DEFAULT_GLASSES_EQUIP_SFX)
        GLASSES_SPRITE_HASH[@@round_eyeglasses.id] = @@round_eyeglasses.sprite.as(SF::Sprite)
        GLASSES_SFX_HASH[@@round_eyeglasses.id] = @@round_eyeglasses.sfx.as(SF::Sound)
    end
end