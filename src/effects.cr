require "crsfml"
require "../src/textures.cr"
require "../src/player.cr"
#tfw my motherboard breaks on my main pc so I have to dig up my old college laptop and work on this with that
module Effects
    class Effects_Base
        EFFECTS_ARRAY = [] of Effects_Base
        def initialize(name : String, id : Int32, duration : Float64, strength : Float64, is_harmful : Bool, sprite : SF::Sprite, 
          action : Proc((Float64 | Nil)), is_active : Bool)
            @name = name
            @id = id
            @duration = duration
            @strength = strength
            @is_harmful = is_harmful
            @sprite = sprite
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

        property sprite : SF::Sprite

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


      @@heal_instant_10hp = HealingEffects.new("Heal 10", 1, 0.0, 10.0, false, SF::Sprite.new, 
      heal_instant_hp(10.0), false)
      @@heal_instant_10mp = HealingEffects.new("Restore MP 10", 2, 0.0, 10.0, false, SF::Sprite.new, 
      heal_instant_mp(10.0), false)

      @@heal_instant_25hp = HealingEffects.new("Heal 25", 3, 0.0, 25.0, false, SF::Sprite.new,
      heal_instant_hp(25.0), false)
      @@heal_instant_25mp = HealingEffects.new("Restore MP 25", 4, 0.0, 25.0, false, SF::Sprite.new,
      heal_instant_mp(25.0), false)

      @@heal_instant_50hp = HealingEffects.new("Heal 50", 5, 0.0, 50.0, false, SF::Sprite.new,
      heal_instant_hp(50.0), false)
      @@heal_instant_50mp = HealingEffects.new("Restore MP 50", 6, 0.0, 50.0, false, SF::Sprite.new,
      heal_instant_mp(50.0), false)

      @@heal_instant_100hp = HealingEffects.new("Heal 100", 7, 0.0, 100.0, false, SF::Sprite.new,
      heal_instant_hp(100.0), false)
      @@heal_instant_100mp = HealingEffects.new("Restore MP 100", 8, 0.0, 100.0, false, SF::Sprite.new,
      heal_instant_mp(100.0), false)

      @@heal_instant_200hp = HealingEffects.new("Heal 200", 9, 0.0, 200.0, false, SF::Sprite.new,
      heal_instant_hp(200.0), false)
      @@heal_instant_200mp = HealingEffects.new("Restore MP 200", 10, 0.0, 200.0, false, SF::Sprite.new,
      heal_instant_mp(200.0), false)

      @@heal_instant_500hp = HealingEffects.new("Heal 500", 11, 0.0, 500.0, false, SF::Sprite.new,
      heal_instant_hp(500.0), false)
      @@heal_instant_500mp = HealingEffects.new("Restore MP 500", 12, 0.0, 500.0, false, SF::Sprite.new,
      heal_instant_mp(500.0), false)

      @@heal_instant_1000hp = HealingEffects.new("Heal 1000", 13, 0.0, 1000.0, false, SF::Sprite.new,
      heal_instant_hp(1000.0), false)
      @@heal_instant_1000mp = HealingEffects.new("Restore MP 1000", 14, 0.0, 1000.0, false, SF::Sprite.new,
      heal_instant_mp(1000.0), false)

      @@heal_instant_2500hp = HealingEffects.new("Heal 2500", 15, 0.0, 2500.0, false, SF::Sprite.new,
      heal_instant_hp(2500.0), false)
      @@heal_instant_2500mp = HealingEffects.new("Restore MP 2500", 16, 0.0, 2500.0, false, SF::Sprite.new,
      heal_instant_mp(2500.0), false)

      @@heal_instant_10both = HealingEffects.new("Heal Both 10", 17, 0.0, 10.0, false, SF::Sprite.new, 
      heal_instant_both(10.0), false)

      @@heal_instant_25both = HealingEffects.new("Heal Both 25", 18, 0.0, 25.0, false, SF::Sprite.new,
      heal_instant_both(25.0), false)

      @@heal_instant_50both = HealingEffects.new("Heal Both 50", 19, 0.0, 50.0, false, SF::Sprite.new,
      heal_instant_both(50.0), false)

      @@heal_instant_100both = HealingEffects.new("Heal Both 100", 20, 0.0, 100.0, false, SF::Sprite.new,
      heal_instant_both(100.0), false)

      @@heal_instant_200both = HealingEffects.new("Heal Both 200", 21, 0.0, 200.0, false, SF::Sprite.new,
      heal_instant_both(200.0), false)

      @@heal_instant_500both = HealingEffects.new("Heal Both 500", 22, 0.0, 500.0, false, SF::Sprite.new,
      heal_instant_both(500.0), false)

      @@heal_instant_1000both = HealingEffects.new("Heal Both 1000", 23, 0.0, 1000.0, false, SF::Sprite.new,
      heal_instant_both(1000.0), false)

      @@heal_instant_2500both = HealingEffects.new("Heal Both 2500", 24, 0.0, 2500.0, false, SF::Sprite.new,
      heal_instant_both(2500.0), false)
    end

    class HarmfulEffects < Effects_Base

      HARMFUL_EFFECTS_HASH = Hash(String, HarmfulEffects).new

      POISON_CLOCK = SF::Clock.new
      POISON_TICK = SF::Clock.new
      POISON_ARRAY = [] of Effects_Base
      @@has_poison_clock_been_restarted = false

      def self.restart_poison_clock
        POISON_CLOCK.restart
      end

      def self.restart_poison_tick
        POISON_TICK.restart
      end

      DEMENTIA_CLOCK = SF::Clock.new
      DEMENTIA_TICK = SF::Clock.new
      DEMENTIA_ARRAY = [] of Effects_Base
      @@has_dementia_clock_been_restarted = false

      def self.restart_dementia_clock
        DEMENTIA_CLOCK.restart
      end

      def self.restart_dementia_tick
        DEMENTIA_TICK.restart
      end

      def self.poison(time, potency, type)
        -> {
          if @@has_dementia_clock_been_restarted == false
            restart_dementia_clock
            @@has_dementia_clock_been_restarted = true
          end
          if DEMENTIA_CLOCK.elapsed_time < SF.seconds(time)
            HARMFUL_EFFECTS_HASH[type].is_active = true
            if DEMENTIA_TICK.elapsed_time > SF.seconds(5.0)
             Player::Stats.current_hp = Player::Stats.current_hp.not_nil! - potency
             restart_dementia_tick
             return Player::Stats.current_hp.not_nil!
            end
          else
            HARMFUL_EFFECTS_HASH[type].is_active = false
            restart_dementia_clock
            @@has_poison_clock_been_restarted = false
            return Player::Stats.current_hp = Player::Stats.current_hp.not_nil!
          end
        }
      end

      def self.dementia(time, potency, type)
        -> {
          if @@has_poison_clock_been_restarted == false
            restart_poison_clock
            @@has_poison_clock_been_restarted = true
          end
          if POISON_CLOCK.elapsed_time < SF.seconds(time)
            HARMFUL_EFFECTS_HASH[type].is_active = true
            if POISON_TICK.elapsed_time > SF.seconds(5.0)
             Player::Stats.current_mp = Player::Stats.current_mp.not_nil! - potency
             restart_poison_tick
             return Player::Stats.current_hp.not_nil!
            end
          else
            HARMFUL_EFFECTS_HASH[type].is_active = false
            restart_poison_clock
            @@has_poison_clock_been_restarted = false
            return Player::Stats.current_mp = Player::Stats.current_mp.not_nil!
          end
        }
      end


    HARMFUL_EFFECTS_HASH["weak_poison"] = @@weak_poison
    HARMFUL_EFFECTS_HASH["poison"] = @@poison
    HARMFUL_EFFECTS_HASH["strong_poison"] = @@strong_poison
    HARMFUL_EFFECTS_HASH["very_strong_poison"] = @@very_strong_poison

     @@weak_poison = HarmfulEffects.new("Weak Poison", 1, 30.0, 1.0, true, SF::Sprite.new(EFFECT_TEXTURE_01, SF::Rect.new(0, 0, 50, 50)), 
     poison(30.0, 1.0, "weak_poison"), false)
     POISON_ARRAY.push(@@weak_poison)

     @@poison = HarmfulEffects.new("Poison", 2, 60.0, 2.0, true, SF::Sprite.new(EFFECT_TEXTURE_01, SF::Rect.new(0, 0, 50, 50)),
     poison(60.0, 2.0, "poison"), false)
     POISON_ARRAY.push(@@poison)

     @@strong_poison = HarmfulEffects.new("Strong Poison", 3, 60.0, 5.0, true, SF::Sprite.new(EFFECT_TEXTURE_01, SF::Rect.new(0, 0, 50, 50)),
     poison(60.0, 5.0, "strong_poison"), false)
     POISON_ARRAY.push(@@strong_poison)

     @@very_strong_poison = HarmfulEffects.new("Very Strong Poison", 4, 60.0, 10.0, true, SF::Sprite.new(EFFECT_TEXTURE_01, SF::Rect.new(0, 0, 50, 50)),
     poison(60.0, 10.0, "very_strong_poison"), false)
     POISON_ARRAY.push(@@very_strong_poison)
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