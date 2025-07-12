require "crsfml"
require "crsfml/audio"
require "../../../src/textures.cr"
require "../../../src/utility.cr"
require "../../../src/inventory/equipment/clothing.cr"
require "../../../src/sound/sfx.cr"
require "../../../graphics/color.cr"

module Makeup
    class MakeupBase < Clothing::ClothingBase
        include JSON::Serializable

        MAKEUP_ARRAY = [] of MakeupBase
        OWNED_MAKEUP_ARRAY = [] of MakeupBase | Clothing::ClothingBase

        MAKEUP_SPRITE_HASH = {} of String => SF::Sprite
        MAKEUP_SFX_HASH = {} of String => SF::Sound

        DEFAULT_MAKEUP_EQUIP_SFX = SFX::EquipSFX::FABRIC_EQUIP_01

        property name : String
        property id : String
        property is_owned : Bool
        property sprite : SF::Sprite?
        property color : String
        property sfx : SF::Sound?

        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, color : String, sfx : SF::Sound = DEFAULT_MAKEUP_EQUIP_SFX)
            @name = name
            @id = id
            @is_owned = is_owned
            @sprite = sprite
            @color = color
            @sfx = sfx

            MAKEUP_ARRAY << self
            MAKEUP_SPRITE_HASH[id] = sprite
            MAKEUP_SFX_HASH[id] = sfx

            if self.is_owned && !OWNED_MAKEUP_ARRAY.any? { |owned_makeup| owned_makeup.id == self.id }
                OWNED_MAKEUP_ARRAY << self
                OWNED_MAKEUP_ARRAY.uniq!
            end
        end

        def self.swap_makeup(item : MakeupBase)
            if item.as(Makeup::MakeupBase).sfx != nil
                item.as(Makeup::MakeupBase).sfx.not_nil!.play
            else
                DEFAULT_MAKEUP_EQUIP_SFX.play
            end
            
            if Player::Appearance.makeup != nil
                if Makeup::MakeupBase::OWNED_MAKEUP_ARRAY.none? { |owned_makeup| owned_makeup.id == Player::Appearance.makeup.as(Makeup::MakeupBase).id }
                    Makeup::MakeupBase::OWNED_MAKEUP_ARRAY << Player::Appearance.makeup.as(Makeup::MakeupBase)
                end
            end
            
            Player::Appearance.makeup = item.as(Makeup::MakeupBase)
            Makeup::MakeupBase::OWNED_MAKEUP_ARRAY.reject! { |owned_makeup| owned_makeup.id == item.as(Makeup::MakeupBase).id }
        end
    end
    class MakeupTexture
        MAKEUP_TEXTURE_ARRAY = [] of MakeupTexture

        def initialize(id : String, texture : SF::Texture)
            @id = id
            @texture = texture
            MAKEUP_TEXTURE_ARRAY << self
        end

        property id : String
        property texture : SF::Texture

        def self.get_texture(id : String)
            mt = MAKEUP_TEXTURE_ARRAY.find { |mt| mt.id == id }
            mt ? mt.texture : SF::Texture.new
            if mt.nil?
                puts "Makeup texture not found for id: #{id}"
                return nil
            else
                return mt.texture.as(SF::Texture)
            end
        end

        @@red_makeup_texture_shounen = MakeupTexture.new("red_makeup_shounen", RED_MAKEUP_SHOUNEN_TEXTURE)
        @@red_makeup_texture_button = MakeupTexture.new("red_makeup_button", RED_MAKEUP_BUTTON_TEXTURE)

    end
    class FullMakeup < MakeupBase
        @@red_makeup = MakeupBase.new("Red Makeup", "red_makeup", true, SF::Sprite.new(RED_MAKEUP_SHOUNEN_TEXTURE), "red_custom", DEFAULT_MAKEUP_EQUIP_SFX)
    end
end