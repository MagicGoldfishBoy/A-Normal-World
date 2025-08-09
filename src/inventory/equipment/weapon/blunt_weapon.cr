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
        #include JSON::Serializable

        DEFAULT_BLUNT_WEAPON_SFX = SFX::CombatSFX::BLUNT_SWING_SFX_01

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
        property clock : SF::Clock?

        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, description : String, sfx : SF::Sound, tier : Int8, base_monetary_value : Int64, required_lvl : Int32, weapon_type : String, attack_type : String, attack_strength : Float64, range : Float64, clock : SF::Clock)
            super(name, id, is_owned, sprite, description, sfx, tier, base_monetary_value, required_lvl, weapon_type, attack_type, attack_strength, range, clock)
            @weapon_type = weapon_type
            @attack_type = attack_type
            @attack_strength = attack_strength
            @range = range
            @clock = clock

            Weapon::WeaponBase::WEAPON_SPRITE_HASH[id] = sprite
            Weapon::WeaponBase::WEAPON_SFX_HASH[id] = sfx

            if self.is_owned
                Weapon::WeaponBase::OWNED_WEAPON_ARRAY << self
            end
            #puts "added blunt weapon: #{self.name} with id: #{self.id} to the array."
        end

        @@stick = BluntWeaponBase.new("Stick", "stick", false, SF::Sprite.new(WOODEN_STICK_TEXTURE), "It's a stick.", DEFAULT_BLUNT_WEAPON_SFX, 1_i8, 10_i64, 1, "blunt", "swing", 5.0, 50.0, SF::Clock.new)

        @@wooden_baseball_bat = BluntWeaponBase.new("Wooden Baseball Bat", "wooden_baseball_bat", false, SF::Sprite.new(WOODEN_BASEBALL_BAT_TEXTURE), "Thwack!", SFX::CombatSFX::WOODEN_BASEBALL_BAT_SFX_01, 1_i8, 20_i64, 1, "blunt", "swing", 10.0, 60.0, SF::Clock.new)
    end
end