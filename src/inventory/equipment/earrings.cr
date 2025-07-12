require "crsfml"
require "crsfml/audio"
require "../../../src/textures.cr"
require "../../../src/utility.cr"
require "../../../src/inventory/equipment/clothing.cr"
require "../../../graphics/color.cr"

module Earrings
    class EarringsBase < Clothing::ClothingBase
        include JSON::Serializable

        EARRINGS_ARRAY = [] of EarringsBase
        OWNED_EARRINGS_ARRAY = [] of EarringsBase | Clothing::ClothingBase

        EARRINGS_SPRITE_HASH = {} of String => SF::Sprite
        EARRINGS_SFX_HASH = {} of String => SF::Sound

        DEFAULT_EARRINGS_EQUIP_SFX = SFX::EquipSFX::GLASSES_EQUIP_01

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

            EARRINGS_ARRAY << self
            EARRINGS_SPRITE_HASH[id] = sprite
            EARRINGS_SFX_HASH[id] = sfx

            if self.is_owned && !OWNED_EARRINGS_ARRAY.any? { |owned_earrings| owned_earrings.id == self.id }
                OWNED_EARRINGS_ARRAY << self
                OWNED_EARRINGS_ARRAY.uniq!
            end
        end

        def self.swap_earrings(item : EarringsBase)
            if item.as(Earrings::EarringsBase).sfx != nil
                item.as(Earrings::EarringsBase).sfx.not_nil!.play
            else
                DEFAULT_EARRINGS_EQUIP_SFX.play
            end
            
            if Player::Appearance.earrings != nil
                if Earrings::EarringsBase::OWNED_EARRINGS_ARRAY.none? { |owned_earrings| owned_earrings.id == Player::Appearance.earrings.as(Earrings::EarringsBase).id }
                    Earrings::EarringsBase::OWNED_EARRINGS_ARRAY << Player::Appearance.earrings.as(Earrings::EarringsBase)
                end
            end
            
            Player::Appearance.earrings = item.as(Earrings::EarringsBase)
            Earrings::EarringsBase::OWNED_EARRINGS_ARRAY.reject! { |owned_earrings| owned_earrings.id == item.as(Earrings::EarringsBase).id }
        end
    end
    class JeweledEarrings < EarringsBase
        @@ruby_earrings = JeweledEarrings.new("Ruby Earrings", "ruby_earrings", true, SF::Sprite.new(RUBY_EARRINGS_TEXTURE), "red", DEFAULT_EARRINGS_EQUIP_SFX)
    end
end