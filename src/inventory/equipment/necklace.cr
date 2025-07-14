require "crsfml"
require "crsfml/audio"
require "../../../src/textures.cr"
require "../../../src/utility.cr"
require "../../../src/inventory/equipment/clothing.cr"
require "../../../graphics/color.cr"

module Necklace
    class NecklaceBase < Clothing::ClothingBase
        include JSON::Serializable

        NECKLACE_ARRAY = [] of NecklaceBase
        OWNED_NECKLACES_ARRAY = [] of NecklaceBase | Clothing::ClothingBase

        NECKLACE_SPRITE_HASH = {} of String => SF::Sprite
        NECKLACE_SFX_HASH = {} of String => SF::Sound

        DEFAULT_NECKLACE_EQUIP_SFX = SFX::EquipSFX::GLASSES_EQUIP_01

        property name : String
        property id : String
        property is_owned : Bool
        property sprite : SF::Sprite?
        property color : String
        property sfx : SF::Sound?

        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, color : String, sfx : SF::Sound)
            @name = name
            @id = id
            @is_owned = is_owned
            @sprite = sprite
            @color = color
            @sfx = sfx

            NECKLACE_ARRAY << self
            NECKLACE_SPRITE_HASH[id] = sprite
            NECKLACE_SFX_HASH[id] = sfx

            if self.is_owned && !OWNED_NECKLACES_ARRAY.any? { |owned_necklace| owned_necklace.id == self.id }
                OWNED_NECKLACES_ARRAY << self
                OWNED_NECKLACES_ARRAY.uniq!
            end
        end

        def self.swap_necklace(item : NecklaceBase)
            if item.as(Necklace::NecklaceBase).sfx != nil
                item.as(Necklace::NecklaceBase).sfx.not_nil!.play
            else
                DEFAULT_NECKLACE_EQUIP_SFX.play
            end
            
            if Player::Appearance.necklace != nil
                if Necklace::NecklaceBase::OWNED_NECKLACES_ARRAY.none? { |owned_necklace| owned_necklace.id == Player::Appearance.necklace.as(Necklace::NecklaceBase).id }
                    Necklace::NecklaceBase::OWNED_NECKLACES_ARRAY << Player::Appearance.necklace.as(Necklace::NecklaceBase)
                end
            end
            
            Player::Appearance.necklace = item.as(Necklace::NecklaceBase)
            Necklace::NecklaceBase::OWNED_NECKLACES_ARRAY.reject! { |owned_necklace| owned_necklace.id == item.as(Necklace::NecklaceBase).id }
        end

        def self.remove_current_necklace_from_inventory
            if Player::Appearance.necklace && Player::Appearance.necklace.as(Necklace::NecklaceBase).id
                OWNED_NECKLACES_ARRAY.reject! { |owned_necklace| owned_necklace.id == Player::Appearance.necklace.as(Necklace::NecklaceBase).id }
            end
        end
    end
    class JeweledNecklace < NecklaceBase
        @@ruby_necklace = NecklaceBase.new("Ruby Necklace", "ruby_necklace", true, SF::Sprite.new(RUBY_NECKLACE_TEXTURE), "red_custom", DEFAULT_NECKLACE_EQUIP_SFX)

        @@topaz_necklace = NecklaceBase.new("Topaz Necklace", "topaz_necklace", true, SF::Sprite.new(TOPAZ_NECKLACE_TEXTURE), "yellow_custom", DEFAULT_NECKLACE_EQUIP_SFX)

        @@amber_necklace = NecklaceBase.new("Amber Necklace", "amber_necklace", true, SF::Sprite.new(AMBER_NECKLACE_TEXTURE), "orange_custom", DEFAULT_NECKLACE_EQUIP_SFX)
    end
    class Choker < NecklaceBase
        @@chain = NecklaceBase.new("Chain", "chain", true, SF::Sprite.new(WEARABLE_CHAIN_TEXTURE), "grey_custom", DEFAULT_NECKLACE_EQUIP_SFX)
    end
end