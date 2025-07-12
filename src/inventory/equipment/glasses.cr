require "crsfml"
require "crsfml/audio"
require "../../../src/textures.cr"
require "../../../src/utility.cr"
require "../../../src/inventory/equipment/clothing.cr"

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

        if self.is_owned
            OWNED_GLASSES_ARRAY << self
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
        @@sunglasses = Sunglasses.new("Sunglasses", "sunglasses", true, SF::Sprite.new(SUNGLASSES_TEXTURE), "white", DEFAULT_GLASSES_EQUIP_SFX)
        GLASSES_SPRITE_HASH[@@sunglasses.id] = @@sunglasses.sprite.as(SF::Sprite)
        GLASSES_SFX_HASH[@@sunglasses.id] = @@sunglasses.sfx.as(SF::Sound)
    end
end