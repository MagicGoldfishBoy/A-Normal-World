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
        property back_sprite : SF::Sprite? 

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
        @@white_light_jacket = JacketBase.new("White Light Jacket", "white_light_jacket", true, SF::Sprite.new(WHITE_LIGHT_JACKET_FRONT_TEXTURE), SF::Sprite.new(WHITE_LIGHT_JACKET_BACK_TEXTURE), "white", DEFAULT_JACKET_EQUIP_SFX)
    end
end