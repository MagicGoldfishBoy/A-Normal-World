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
            @is_owned = is_owned
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

            iterator = 0 if iterator < 0
            iterator = Pants::PantsBase::PANTS_ARRAY.size - 1 if iterator >= Pants::PantsBase::PANTS_ARRAY.size

            Player::Appearance.pants = Pants::PantsBase::PANTS_ARRAY[iterator]
            return iterator
        end

        def self.remove_current_shoes_from_inventory
            if Player::Appearance.shoes && Player::Appearance.shoes.as(Shoes::ShoesBase).id
                current_shoes_id = Player::Appearance.shoes.as(Shoes::ShoesBase).id
                shoes_id = Player::Appearance.shoes.as(Shoes::ShoesBase).id
                OWNED_SHOES_ARRAY.reject! { |owned_shoes| owned_shoes.id == current_shoes_id }
            end
        end
    end
end