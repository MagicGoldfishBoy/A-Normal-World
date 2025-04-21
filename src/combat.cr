require "crsfml"
require "../src/textures.cr"
require "../src/player.cr"

module Combat
    class PlayerMethods
        TARGET_ARRAY = [] of String #Placeholder, will later contain actual enemies and stuff
        def PlayerMethods.normal_attack(window)    
            attack_strength : Float64      
            attack_strength = (Player::Stats.str || 1.0) * 1.25
            weapon = Equipment::Weapon.get_weapon(Player::Appearance.get_clothing("weapon"))
            if weapon.nil?
                puts "No Weapon is Equipped!"
            else
                weapon.as(Equipment::Weapon).attack(window)
            end
        end
    end
end