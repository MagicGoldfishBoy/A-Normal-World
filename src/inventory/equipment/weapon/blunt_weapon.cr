require "crsfml"
require "crsfml/audio"
require "../../../../src/game_settings.cr"
require "../../../../src/textures.cr"
require "../../../../src/utility.cr"
require "../../../../src/inventory/equipment/equipment.cr"
require "../../../../src/inventory/equipment/weapon/weapon.cr"
require "../../../../graphics/color.cr"

module BluntWeapon
    class BluntWeaponBase < Weapon::WeaponBase
        include JSON::Serializable

        BLUNT_WEAPON_ARRAY = [] of BluntWeaponBase
        OWNED_BLUNT_WEAPON_ARRAY = [] of BluntWeaponBase | Weapon::WeaponBase | Equipment::EquipmentBase

        BLUNT_WEAPON_SPRITE_HASH = {} of String => SF::Sprite
        BLUNT_WEAPON_SFX_HASH = {} of String => SF::Sound

        DEFAULT_BLUNT_WEAPON_EQUIP_SFX = SFX::EquipSFX::BACKPACK_EQUIP_01

        property name : String
        property id : String
        property is_owned : Bool
        property sprite : SF::Sprite?
        property description : String
        property sfx : SF::Sound?
        property tier : Int8
        property base_monetary_value : Int64
        property required_lvl : Int32

        property weapon_type : String
        property attack_type : String
        property attack_strength : Float64
        property range : Float64
        property clock : SF::Clock
        property attack_method : Proc((Float64 | Nil))

        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, description : String, sfx : SF::Sound, tier : Int8, base_monetary_value : Int64, required_lvl : Int32, weapon_type : String, attack_type : String, attack_strength : Float64, range : Float64, clock : SF::Clock, attack_method : Proc((Float64 | Nil)))
            super(name, id, is_owned, sprite, description, sfx, tier, base_monetary_value, required_lvl, weapon_type, attack_type, attack_strength, range, clock, attack_method)
            @weapon_type = weapon_type
            @attack_type = attack_type
            @attack_strength = attack_strength
            @range = range
            @clock = clock
            @attack_method = attack_method

            BLUNT_WEAPON_ARRAY << self
            BLUNT_WEAPON_SPRITE_HASH[id] = sprite
            BLUNT_WEAPON_SFX_HASH[id] = sfx

            if self.is_owned && !OWNED_BLUNT_WEAPON_ARRAY.any? { |owned_blunt_weapon| owned_blunt_weapon.id == self.id }
                OWNED_BLUNT_WEAPON_ARRAY << self
            end

            OWNED_BLUNT_WEAPON_ARRAY.uniq!
        end
    end
end