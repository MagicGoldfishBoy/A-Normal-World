require "crsfml"
require "crsfml/audio"
require "../../../src/textures.cr"
require "../../../src/utility.cr"
require "../../../src/inventory/equipment/clothing.cr"
require "../../../graphics/color.cr"

module Shirt
    class ShirtBase < Clothing::ClothingBase
        include JSON::Serializable

        SHIRT_ARRAY = [] of ShirtBase
        OWNED_SHIRTS_ARRAY = [] of ShirtBase | Clothing::ClothingBase

        SHIRT_SPRITE_HASH = {} of String => SF::Sprite
        SHIRT_SFX_HASH = {} of String => SF::Sound

        DEFAULT_SHIRT_EQUIP_SFX = SFX::EquipSFX::FABRIC_EQUIP_01

        property name : String
        property id : String
        property is_owned : Bool
        property sprite : SF::Sprite?
        property color : String
        property sfx : SF::Sound?
        property sleeve_length : String

        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, color : String, sfx : SF::Sound, sleeve_length : String)
            @name = name
            @id = id
            @is_owned = is_owned
            @sprite = sprite
            @color = color
            @sfx = sfx
            @sleeve_length = sleeve_length

            SHIRT_ARRAY << self
            SHIRT_SPRITE_HASH[id] = sprite
            SHIRT_SFX_HASH[id] = sfx

            if self.is_owned && !OWNED_SHIRTS_ARRAY.any? { |owned_shirt| owned_shirt.id == self.id }
                OWNED_SHIRTS_ARRAY << self
                OWNED_SHIRTS_ARRAY.uniq!
            end
        end

        def self.swap_shirt(item : ShirtBase)
            if item.as(Shirt::ShirtBase).sfx != nil
                item.as(Shirt::ShirtBase).sfx.not_nil!.play
            else
                DEFAULT_SHIRT_EQUIP_SFX.play
            end
            
            if Player::Appearance.shirt != nil
                if Shirt::ShirtBase::OWNED_SHIRTS_ARRAY.none? { |owned_shirt| owned_shirt.id == Player::Appearance.shirt.as(Shirt::ShirtBase).id }
                    Shirt::ShirtBase::OWNED_SHIRTS_ARRAY << Player::Appearance.shirt.as(Shirt::ShirtBase)
                end
            end
            
            Player::Appearance.shirt = item.as(Shirt::ShirtBase)
            Shirt::ShirtBase::OWNED_SHIRTS_ARRAY.reject! { |owned_shirt| owned_shirt.id == item.as(Shirt::ShirtBase).id }
        end

        def self.swap_shirt_character_creation(direction : String, iterator : Int32)
            if ShirtBase::OWNED_SHIRTS_ARRAY.empty?
                return 0
            end
            if direction == "next"
                iterator += 1
            elsif direction == "previous"
                iterator -= 1
            end

            if iterator >= ShirtBase::OWNED_SHIRTS_ARRAY.size - 1
                iterator = 0
            elsif iterator < 0
                iterator = ShirtBase::OWNED_SHIRTS_ARRAY.size - 1
            end

            Player::Appearance.shirt = ShirtBase::OWNED_SHIRTS_ARRAY[iterator].as(ShirtBase)
            return iterator
        end
    end
    class TankTop < ShirtBase
        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, color : String, sfx : SF::Sound)
            super(name, id, is_owned, sprite, color, sfx, "very_short")
        end

        @@white_tank_top = TankTop.new("White Tank Top", "white_tank_top", true, SF::Sprite.new(TANK_TOP_WHITE_TEXTURE), "white", SFX::EquipSFX::FABRIC_EQUIP_01)

        @@black_tank_top = TankTop.new("Black Tank Top", "black_tank_top", true, SF::Sprite.new(TANK_TOP_WHITE_TEXTURE), "black", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@black_tank_top.sprite.as(SF::Sprite).color = Color::ClothingColor::BLACK
    end
end