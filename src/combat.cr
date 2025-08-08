require "crsfml"
require "../src/textures.cr"
require "../src/player.cr"
require "../src/level_editor/whackeable_objects.cr"

module Combat
    class PlayerMethods
        TARGET_ARRAY = [] of (WhackeableObject::WhackeableObjectBase)
        def PlayerMethods.normal_attack(window)    
            attack_strength : Float64      
            attack_strength = (Player::Stats.str || 1.0) * 1.25
            weapon = Player::Appearance.weapon
            if weapon.nil?
                puts "No Weapon is Equipped!"
            else
                weapon.as(Weapon::WeaponBase).attack(window, attack_strength)
            end
        end
    end
end