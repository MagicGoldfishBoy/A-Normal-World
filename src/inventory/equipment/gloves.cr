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
        end
    end
end