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
            weapon = Equipment::Weapon.get_weapon(Player::Appearance.get_clothing("weapon"))
            if weapon.nil?
                puts "No Weapon is Equipped!"
            else
                weapon.as(Equipment::Weapon).attack(window, attack_strength)
            end
        end
    end
end