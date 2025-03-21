require "crsfml"
require "../src/textures.cr"
require "../src/player.cr"

module Effects
    class Effects_Base
        EFFECTS_ARRAY = [] of Effects_Base
        def initialize(name : String, id : Int32, duration : Float64, strength : Float64, is_harmful : Bool, texture : SF::Texture, action : Proc(Player::Stats, (Float64 | Nil)))
            @name = name
            @id = id
            @duration = duration
            @strength = strength
            @is_harmful = is_harmful
            @texture = texture
            @action = action
            EFFECTS_ARRAY.push(self)
        end

        property action : Proc(Player::Stats, (Float64 | Nil))

        property name : String
        
        property id : Int32

        property duration : Float64

        property strength : Float64

        property is_harmful : Bool

        property texture : SF::Texture

    end
    
    class HealingEffects < Effects_Base

     HEALING_EFFECTS_HASH = Hash(String, HealingEffects).new
     HEALING_EFFECTS_HASH["heal_instant_10hp"] = @@heal_instant_10hp

     def self.heal_instant_10hp
        heal_instant_10hp = -> (stats : Player::Stats) { stats.current_hp += 10.0 
      if stats.current_hp > stats.max_hp  
        stats.current_hp = stats.max_hp
      end}
        #{ puts "Healing the player!" }
     end

        @@heal_instant_10hp = HealingEffects.new("Heal", 1, 0.0, 10.0, false, NIL_TEXTURE, heal_instant_10hp)
    end
end

# heal = -> { puts "Healing the player!" }
# damage = -> { puts "Inflicting damage!" }

# # Attach behaviors to Effect objects
# heal_effect = Effect.new(heal)
# damage_effect = Effect.new(damage)

# # Apply effects
# heal_effect.apply   # Outputs: Healing the player!
# damage_effect.apply # Outputs: Inflicting damage!