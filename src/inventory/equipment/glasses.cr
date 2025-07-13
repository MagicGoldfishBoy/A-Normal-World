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

    DEFAULT_GLASSES_EQUIP_SFX = SFX::EquipSFX::GLASSES_EQUIP_01
    EYEPATCH_GLASSES_EQUIP_SFX = SFX::EquipSFX::FABRIC_EQUIP_01

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

     def self.remove_current_glasses_from_inventory
        if Player::Appearance.glasses && Player::Appearance.glasses.as(Glasses::GlassesBase).id
            OWNED_GLASSES_ARRAY.reject! { |owned_glasses| owned_glasses.id == Player::Appearance.glasses.as(Glasses::GlassesBase).id }
        end
     end
    end

    class Sunglasses < GlassesBase
        @@sunglasses = Sunglasses.new("White Sunglasses", "sunglasses", true, SF::Sprite.new(SUNGLASSES_TEXTURE), "white", DEFAULT_GLASSES_EQUIP_SFX)

        @@grey_sunglasses = Sunglasses.new("Grey Sunglasses", "grey_sunglasses", true, SF::Sprite.new(SUNGLASSES_TEXTURE), "grey", DEFAULT_GLASSES_EQUIP_SFX)
        @@grey_sunglasses.sprite.as(SF::Sprite).color = Color::ClothingColor::GREY

        @@black_sunglasses = Sunglasses.new("Black Sunglasses", "black_sunglasses", true, SF::Sprite.new(SUNGLASSES_TEXTURE), "black", DEFAULT_GLASSES_EQUIP_SFX)
        @@black_sunglasses.sprite.as(SF::Sprite).color = Color::ClothingColor::BLACK

        @@red_sunglasses = Sunglasses.new("Red Sunglasses", "red_sunglasses", true, SF::Sprite.new(SUNGLASSES_TEXTURE), "red", DEFAULT_GLASSES_EQUIP_SFX)
        @@red_sunglasses.sprite.as(SF::Sprite).color = Color::ClothingColor::RED
    end
    class Eyeglasses < GlassesBase
        @@white_round_eyeglasses = Eyeglasses.new("White Round Glasses", "white_round_eyeglasses", true, SF::Sprite.new(WHITE_ROUND_GLASSES_TEXTURE), "white", DEFAULT_GLASSES_EQUIP_SFX)

        @@grey_round_eyeglasses = Eyeglasses.new("Grey Round Glasses", "round_eyeglasses", true, SF::Sprite.new(GREY_ROUND_GLASSES_TEXTURE), "grey_custom", DEFAULT_GLASSES_EQUIP_SFX)

        @@rainbow_round_eyeglasses = Eyeglasses.new("Rainbow Round Glasses", "rainbow_round_eyeglasses", true, SF::Sprite.new(RAINBOW_ROUND_GLASSES_TEXTURE), "rainbow", DEFAULT_GLASSES_EQUIP_SFX)

    end
    class Eyepatch < GlassesBase
        @@eye_bandage = Eyepatch.new("Eye Bandage", "eye_bandage", true, SF::Sprite.new(EYE_BANDAGE_TEXTURE), "white", EYEPATCH_GLASSES_EQUIP_SFX)
    end
end