require "crsfml"
require "../src/textures.cr"
require "../src/player.cr"
#tfw my motherboard breaks on my main pc so I have to dig up my old college laptop and work on this with that
module Effects
    class Effects_Base
        EFFECTS_ARRAY = [] of Effects_Base
        def initialize(name : String, id : Int32, duration : Float64, strength : Float64, is_harmful : Bool, texture : SF::Texture, 
          action : Proc((Float64 | Nil)), is_active : Bool)
            @name = name
            @id = id
            @duration = duration
            @strength = strength
            @is_harmful = is_harmful
            @texture = texture
            @action = action
            @is_active = is_active
            EFFECTS_ARRAY.push(self)
        end

        property action : Proc((Float64 | Nil))

        property name : String
        
        property id : Int32

        property duration : Float64

        property strength : Float64

        property is_harmful : Bool

        property texture : SF::Texture

        property is_active : Bool

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
      
     def self.heal_instant_both(this)
        -> {
          Player::Stats.current_mp = Player::Stats.current_mp.not_nil! + this
          Player::Stats.current_hp = Player::Stats.current_hp.not_nil! + this
          if Player::Stats.current_mp.not_nil! > Player::Stats.max_mp.not_nil!
            Player::Stats.current_mp = Player::Stats.max_mp.not_nil!
          end
          if Player::Stats.current_hp.not_nil! > Player::Stats.max_hp.not_nil!
            Player::Stats.current_hp = Player::Stats.max_hp.not_nil!
          end
        }
     end
      
     HEALING_EFFECTS_HASH["heal_instant_10hp"] = @@heal_instant_10hp
     HEALING_EFFECTS_HASH["heal_instant_10mp"] = @@heal_instant_10mp
      
     HEALING_EFFECTS_HASH["heal_instant_25hp"] = @@heal_instant_25hp
     HEALING_EFFECTS_HASH["heal_instant_25mp"] = @@heal_instant_25mp

     HEALING_EFFECTS_HASH["heal_instant_50hp"] = @@heal_instant_50hp
     HEALING_EFFECTS_HASH["heal_instant_50mp"] = @@heal_instant_50mp

     HEALING_EFFECTS_HASH["heal_instant_100hp"] = @@heal_instant_100hp
     HEALING_EFFECTS_HASH["heal_instant_100mp"] = @@heal_instant_100mp

     HEALING_EFFECTS_HASH["heal_instant_200hp"] = @@heal_instant_200hp
     HEALING_EFFECTS_HASH["heal_instant_200mp"] = @@heal_instant_200mp

     HEALING_EFFECTS_HASH["heal_instant_500hp"] = @@heal_instant_500hp
     HEALING_EFFECTS_HASH["heal_instant_500mp"] = @@heal_instant_500mp

     HEALING_EFFECTS_HASH["heal_instant_500hp"] = @@heal_instant_500hp
     HEALING_EFFECTS_HASH["heal_instant_500mp"] = @@heal_instant_500mp

     HEALING_EFFECTS_HASH["heal_instant_1000hp"] = @@heal_instant_1000hp
     HEALING_EFFECTS_HASH["heal_instant_1000mp"] = @@heal_instant_1000mp

     HEALING_EFFECTS_HASH["heal_instant_2500hp"] = @@heal_instant_2500hp
     HEALING_EFFECTS_HASH["heal_instant_2500mp"] = @@heal_instant_2500mp

     HEALING_EFFECTS_HASH["heal_instant_10both"] = @@heal_instant_10both

     HEALING_EFFECTS_HASH["heal_instant_25both"] = @@heal_instant_25both

     HEALING_EFFECTS_HASH["heal_instant_50both"] = @@heal_instant_50both

     HEALING_EFFECTS_HASH["heal_instant_100both"] = @@heal_instant_100both

     HEALING_EFFECTS_HASH["heal_instant_200both"] = @@heal_instant_200both

     HEALING_EFFECTS_HASH["heal_instant_500both"] = @@heal_instant_500both

     HEALING_EFFECTS_HASH["heal_instant_1000both"] = @@heal_instant_1000both

     HEALING_EFFECTS_HASH["heal_instant_2500both"] = @@heal_instant_2500both


      @@heal_instant_10hp = HealingEffects.new("Heal 10", 1, 0.0, 10.0, false, NIL_TEXTURE, heal_instant_hp(10.0), false)
      @@heal_instant_10mp = HealingEffects.new("Restore MP 10", 2, 0.0, 10.0, false, NIL_TEXTURE, heal_instant_mp(10.0), false)

      @@heal_instant_25hp = HealingEffects.new("Heal 25", 3, 0.0, 25.0, false, NIL_TEXTURE, heal_instant_hp(25.0), false)
      @@heal_instant_25mp = HealingEffects.new("Restore MP 25", 4, 0.0, 25.0, false, NIL_TEXTURE, heal_instant_mp(25.0), false)

      @@heal_instant_50hp = HealingEffects.new("Heal 50", 5, 0.0, 50.0, false, NIL_TEXTURE, heal_instant_hp(50.0), false)
      @@heal_instant_50mp = HealingEffects.new("Restore MP 50", 6, 0.0, 50.0, false, NIL_TEXTURE, heal_instant_mp(50.0), false)

      @@heal_instant_100hp = HealingEffects.new("Heal 100", 7, 0.0, 100.0, false, NIL_TEXTURE, heal_instant_hp(100.0), false)
      @@heal_instant_100mp = HealingEffects.new("Restore MP 100", 8, 0.0, 100.0, false, NIL_TEXTURE, heal_instant_mp(100.0), false)

      @@heal_instant_200hp = HealingEffects.new("Heal 200", 9, 0.0, 200.0, false, NIL_TEXTURE, heal_instant_hp(200.0), false)
      @@heal_instant_200mp = HealingEffects.new("Restore MP 200", 10, 0.0, 200.0, false, NIL_TEXTURE, heal_instant_mp(200.0), false)

      @@heal_instant_500hp = HealingEffects.new("Heal 500", 11, 0.0, 500.0, false, NIL_TEXTURE, heal_instant_hp(500.0), false)
      @@heal_instant_500mp = HealingEffects.new("Restore MP 500", 12, 0.0, 500.0, false, NIL_TEXTURE, heal_instant_mp(500.0), false)

      @@heal_instant_1000hp = HealingEffects.new("Heal 1000", 13, 0.0, 1000.0, false, NIL_TEXTURE, heal_instant_hp(1000.0), false)
      @@heal_instant_1000mp = HealingEffects.new("Restore MP 1000", 14, 0.0, 1000.0, false, NIL_TEXTURE, heal_instant_mp(1000.0), false)

      @@heal_instant_2500hp = HealingEffects.new("Heal 2500", 15, 0.0, 2500.0, false, NIL_TEXTURE, heal_instant_hp(2500.0), false)
      @@heal_instant_2500mp = HealingEffects.new("Restore MP 2500", 16, 0.0, 2500.0, false, NIL_TEXTURE, heal_instant_mp(2500.0), false)

      @@heal_instant_10both = HealingEffects.new("Heal Both 10", 17, 0.0, 10.0, false, NIL_TEXTURE, heal_instant_both(10.0), false)

      @@heal_instant_25both = HealingEffects.new("Heal Both 25", 18, 0.0, 25.0, false, NIL_TEXTURE, heal_instant_both(25.0), false)

      @@heal_instant_50both = HealingEffects.new("Heal Both 50", 19, 0.0, 50.0, false, NIL_TEXTURE, heal_instant_both(50.0), false)

      @@heal_instant_100both = HealingEffects.new("Heal Both 100", 20, 0.0, 100.0, false, NIL_TEXTURE, heal_instant_both(100.0), false)

      @@heal_instant_200both = HealingEffects.new("Heal Both 200", 21, 0.0, 200.0, false, NIL_TEXTURE, heal_instant_both(200.0), false)

      @@heal_instant_500both = HealingEffects.new("Heal Both 500", 22, 0.0, 500.0, false, NIL_TEXTURE, heal_instant_both(500.0), false)

      @@heal_instant_1000both = HealingEffects.new("Heal Both 1000", 23, 0.0, 1000.0, false, NIL_TEXTURE, heal_instant_both(1000.0), false)

      @@heal_instant_2500both = HealingEffects.new("Heal Both 2500", 24, 0.0, 2500.0, false, NIL_TEXTURE, heal_instant_both(2500.0), false)
    end

    class HarmfulEffects < Effects_Base
      POISON_CLOCK = SF::Clock.new

      POISON_TICK = SF::Clock.new

      def restart_poison_clock
        POISON_CLOCK.restart
      end

      def self.restart_poison_tick
        POISON_TICK.restart
      end

      def self.poison(time, potency)
        -> {
          if POISON_CLOCK.elapsed_time  < SF.seconds(time)
            if POISON_TICK.elapsed_time < SF.seconds(25.0)
             Player::Stats.current_hp = Player::Stats.current_hp.not_nil! - potency
             restart_poison_tick
             return Player::Stats.current_hp.not_nil!
            else
             return Player::Stats.current_hp = Player::Stats.current_hp.not_nil!
            end
          end
        }
     end

    #TODO: Add effect checking to game loop

    #  def self.poison(time : Float64, potency : Float64) : Proc(Float64 | Nil)
    #   -> : Float64 | Nil {
    #     start_time = POISON_CLOCK.elapsed_time # Capture start time
    #     -> : Float64 | Nil {
    #       if POISON_CLOCK.elapsed_time - start_time < SF.seconds(time)
    #         if POISON_TICK.elapsed_time > SF.seconds(5.0)
    #           Player::Stats.current_hp = Player::Stats.current_hp.not_nil! - potency
    #           restart_poison_tick
    #         end
    #         return Player::Stats.current_hp.not_nil!
    #       end
    #       return nil # Poison expires
    #     }
    #   }
    # end

    #active_effects << poison(25.0, 1.0)
    #active_effects.reject! { |effect| effect.call.nil? }


    

     @@weak_poison = HarmfulEffects.new("Weak Poison", 1, 25.0, 1.0, true, NIL_TEXTURE, poison(25.0, 1.0), false)
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