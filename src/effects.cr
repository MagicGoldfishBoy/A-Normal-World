require "crsfml"
require "../src/textures.cr"
require "../src/player.cr"

module Effects
    class Effects_Base
        EFFECTS_ARRAY = [] of Effects_Base
        def initialize(name : String, id : Int32, duration : Float64, strength : Float64, is_harmful : Bool, texture : SF::Texture, action : Proc((Float64 | Nil)))
            @name = name
            @id = id
            @duration = duration
            @strength = strength
            @is_harmful = is_harmful
            @texture = texture
            @action = action
            EFFECTS_ARRAY.push(self)
        end

        property action : Proc((Float64 | Nil))

        property name : String
        
        property id : Int32

        property duration : Float64

        property strength : Float64

        property is_harmful : Bool

        property texture : SF::Texture

        def apply
            @action.call
          end

    end
    
    class HealingEffects < Effects_Base

     HEALING_EFFECTS_HASH = Hash(String, HealingEffects).new
     
     @@heal_instant_10hp : HealingEffects

     @@heal_instant_10mp : HealingEffects

     def self.heal_instant_hp(this)
        -> {
          puts "Healing the player!"
          Player::Stats.current_hp = Player::Stats.current_hp.not_nil! + this
          if Player::Stats.current_hp.not_nil! > Player::Stats.max_hp.not_nil!
            Player::Stats.current_hp = Player::Stats.max_hp.not_nil!
          end
        }
     end
     def self.heal_instant_mp(this)
        -> {
          puts "Healing the player!"
          Player::Stats.current_mp = Player::Stats.current_mp.not_nil! + this
          if Player::Stats.current_mp.not_nil! > Player::Stats.max_mp.not_nil!
            Player::Stats.current_mp = Player::Stats.max_mp.not_nil!
          end
        }
     end
      
     HEALING_EFFECTS_HASH["heal_instant_10hp"] = @@heal_instant_10hp
     HEALING_EFFECTS_HASH["heal_instant_10mp"] = @@heal_instant_10mp
      
     HEALING_EFFECTS_HASH["heal_instant_25hp"] = @@heal_instant_25hp
     HEALING_EFFECTS_HASH["heal_instant_25mp"] = @@heal_instant_25mp

     HEALING_EFFECTS_HASH["heal_instant_50hp"] = @@heal_instant_50hp
     HEALING_EFFECTS_HASH["heal_instant_50mp"] = @@heal_instant_50mp

        @@heal_instant_10hp = HealingEffects.new("Heal 10", 1, 0.0, 10.0, false, NIL_TEXTURE, heal_instant_hp(10.0))
        @@heal_instant_10mp = HealingEffects.new("Restore MP 10", 2, 0.0, 10.0, false, NIL_TEXTURE, heal_instant_mp(10.0))

        @@heal_instant_25hp = HealingEffects.new("Heal 25", 3, 0.0, 25.0, false, NIL_TEXTURE, heal_instant_hp(25.0))
        @@heal_instant_25mp = HealingEffects.new("Restore MP 25", 4, 0.0, 25.0, false, NIL_TEXTURE, heal_instant_mp(25.0))

        @@heal_instant_50hp = HealingEffects.new("Heal 50", 5, 0.0, 50.0, false, NIL_TEXTURE, heal_instant_hp(50.0))
        @@heal_instant_50mp = HealingEffects.new("Restore MP 50", 5, 0.0, 50.0, false, NIL_TEXTURE, heal_instant_mp(50.0))
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