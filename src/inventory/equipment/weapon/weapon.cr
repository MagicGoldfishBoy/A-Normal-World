require "crsfml"
require "crsfml/audio"
require "../../../../src/game_settings.cr"
require "../../../../src/textures.cr"
require "../../../../src/utility.cr"
require "../../../../src/inventory/equipment/equipment.cr"
require "../../../../graphics/color.cr"

module Weapon
    class WeaponBase < Equipment::EquipmentBase
        #include JSON::Serializable

        WEAPON_ARRAY = [] of WeaponBase
        OWNED_WEAPON_ARRAY = [] of WeaponBase | Equipment::EquipmentBase

        WEAPON_SPRITE_HASH = {} of String => SF::Sprite
        WEAPON_SFX_HASH = {} of String => SF::Sound

        DEFAULT_WEAPON_EQUIP_SFX = SFX::EquipSFX::BACKPACK_EQUIP_01

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

        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, description : String, sfx : SF::Sound, tier : Int8, base_monetary_value : Int64, required_lvl : Int32, weapon_type : String, attack_type : String, attack_strength : Float64, range : Float64, clock : SF::Clock)
            super(name, id, is_owned, sprite, description, sfx, tier, base_monetary_value, required_lvl)
            @weapon_type = weapon_type
            @attack_type = attack_type
            @attack_strength = attack_strength
            @range = range
            @clock = clock
        end

        def self.swap_weapon(item : WeaponBase)
            if item.as(Weapon::WeaponBase).sfx != nil
                item.as(Weapon::WeaponBase).sfx.not_nil!.play
            else
                DEFAULT_WEAPON_EQUIP_SFX.play
            end
            
            if Player::Equipment.weapon != nil
                if Weapon::WeaponBase::OWNED_WEAPON_ARRAY.none? { |owned_weapon| owned_weapon.id == Player::Equipment.weapon.as(Weapon::WeaponBase).id }
                    Weapon::WeaponBase::OWNED_WEAPON_ARRAY << Player::Equipment.weapon.as(Weapon::WeaponBase)
                end
            end
            
            Player::Equipment.weapon = item.as(Weapon::WeaponBase)
        end

        def self.remove_current_weapon_from_inventory
            if Player::Equipment.weapon && Player::Equipment.weapon.as(Weapon::WeaponBase).id
                OWNED_WEAPON_ARRAY.reject! { |owned_weapon| owned_weapon.id == Player::Equipment.weapon.as(Weapon::WeaponBase).id }
            end
        end

        def attack(window, attack_strength)
            attack_rect = SF::RectangleShape.new
            attack_rect.size = SF.vector2f(self.range, 10)
            direction = Player::Movement.movement_direction

            if self.clock.elapsed_time > SF.seconds(0.30) 
                if direction == "left"
                attack_rect.position = SF.vector2(Sprites::Player.retrieve_sprite.position.x, Sprites::Player.retrieve_sprite.position.y + 55)
                elsif direction == "right"
                    attack_rect.position = SF.vector2(Sprites::Player.retrieve_sprite.position.x + 55, Sprites::Player.retrieve_sprite.position.y + 55)
                end
                #window.draw(attack_rect)
                self.sfx.play
                Combat::PlayerMethods::TARGET_ARRAY.each { |whackeable|
                if attack_rect.global_bounds.intersects? whackeable.sprite.global_bounds
                    whackeable.react_to_impact(window, attack_strength)
                end}
                self.clock.restart
            end
        end

    end
end