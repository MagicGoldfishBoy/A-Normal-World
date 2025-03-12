require "crsfml"
require "../src/textures.cr"
require "../src/player.cr"

module Combat
    class Player
        TARGET_ARRAY = [] of String #Placeholder, will later contain actual enemies and stuff
        def Player.normal_attack(window, player_strength)    
            attack_strength : Float64      
            attack_strength = (player_strength || 1.0) * 1.25
        end
    end
end