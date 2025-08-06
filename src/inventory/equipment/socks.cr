require "crsfml"
require "crsfml/audio"
require "../../../src/textures.cr"
require "../../../src/utility.cr"
require "../../../src/inventory/equipment/clothing.cr"
require "../../../src/sound/sfx.cr"
require "../../../graphics/color.cr"

module Socks
    class SocksBase < Clothing::ClothingBase
        include JSON::Serializable

        SOCKS_ARRAY = [] of SocksBase
        OWNED_SOCKS_ARRAY = [] of SocksBase | Clothing::ClothingBase

        SOCKS_SPRITE_HASH = {} of String => SF::Sprite
        SOCKS_SFX_HASH = {} of String => SF::Sound

        DEFAULT_SOCKS_EQUIP_SFX = SFX::EquipSFX::FABRIC_EQUIP_01

        property name : String
        property id : String
        property is_owned : Bool
        property sprite : SF::Sprite?
        property color : String
        property sfx : SF::Sound?

        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, color : String, sfx : SF::Sound)
            @name = name
            @id = id
            @is_owned = Settings::GameSettings.is_debug_mode ? true : is_owned
            @sprite = sprite
            @color = color
            @sfx = sfx

            SOCKS_ARRAY << self
            SOCKS_SPRITE_HASH[id] = sprite
            SOCKS_SFX_HASH[id] = sfx

            if self.is_owned && !OWNED_SOCKS_ARRAY.any? { |owned_socks| owned_socks.id == self.id }
                OWNED_SOCKS_ARRAY << self
                OWNED_SOCKS_ARRAY.uniq!
            end
        end

        def self.swap_socks(item : SocksBase)
            if item.as(Socks::SocksBase).sfx != nil
                item.as(Socks::SocksBase).sfx.not_nil!.play
            else
                DEFAULT_SOCKS_EQUIP_SFX.play
            end
            
            if Player::Appearance.socks != nil
                if Socks::SocksBase::OWNED_SOCKS_ARRAY.none? { |owned_socks| owned_socks.id == Player::Appearance.socks.as(Socks::SocksBase).id }
                    Socks::SocksBase::OWNED_SOCKS_ARRAY << Player::Appearance.socks.as(Socks::SocksBase)
                end
            end
            
            Player::Appearance.socks = item.as(Socks::SocksBase)
            Socks::SocksBase::OWNED_SOCKS_ARRAY.reject! { |owned_socks| owned_socks.id == item.as(Socks::SocksBase).id }
        end

        def self.remove_current_socks_from_inventory
            if Player::Appearance.socks && Player::Appearance.socks.as(Socks::SocksBase).id
                Socks::SocksBase::OWNED_SOCKS_ARRAY.reject! { |owned_socks| owned_socks.id == Player::Appearance.socks.as(Socks::SocksBase).id }
            end
        end
    end
    class CrewSocks < SocksBase
        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, color : String, sfx : SF::Sound = DEFAULT_SOCKS_EQUIP_SFX)
            super(name, id, is_owned, sprite, color, sfx)
        end

        @@white_crew_socks = SocksBase.new("White Crew Socks", "white_crew_socks", false, SF::Sprite.new(WHITE_SOCKS_TEXTURE), "white", DEFAULT_SOCKS_EQUIP_SFX)

        @@black_crew_socks = SocksBase.new("Black Crew Socks", "black_crew_socks", false, SF::Sprite.new(WHITE_SOCKS_TEXTURE), "black", DEFAULT_SOCKS_EQUIP_SFX)
        @@black_crew_socks.sprite.as(SF::Sprite).color = Color::ClothingColor::BLACK
    end
end