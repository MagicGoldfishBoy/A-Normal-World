require "crsfml"
require "../src/textures.cr"
require "../src/effects.cr"

module Consumables
    class Consumables_base
        CONSUMABLE_ARRAY = [] of Consumables_base
        def initialize(name : String, short_name : String, stack_limit : Int32, amount_owned : Int32, texture : SF::Texture, texture_rectangle : SF::IntRect, effect : Effects::Effects_Base, base_value : Int32)
            @name = name
            @short_name = short_name
            @stack_limit = stack_limit
            @amount_owned = amount_owned
            @texture = texture
            @texture_rectangle = texture_rectangle
            @effect = effect
            @base_value = base_value
            CONSUMABLE_ARRAY.push(self)
        end

        property name : String

        property short_name : String

        property stack_limit : Int32

        property amount_owned : Int32

        property texture : SF::Texture

        property texture_rectangle : SF::IntRect

        property effect : Effects::Effects_Base

        property base_value  : Int32

        def Consumables_base.get_consumable(this)
            CONSUMABLE_ARRAY.each { |consumable| if consumable.name == this
            return consumable
            end }
        end

        def self.clone
            self.class.new(
                name: @name,
                id: @id,
                stack_limit: @stack_limit,
                amount_owned: @amount_owned,
                texture: @texture,
                texture_rectangle: @texture_rectangle,
                effect: @effect
            )
        end

    end

    class Potions < Consumables_base
        @@small_healing_potion = Potions.new("Small HP Potion", "Sm/HP Pot", 99, 0, CONSUMABLES_TEXTURE_01, SF::Rect.new(0, 0, 100, 100), Effects::HealingEffects::HEALING_EFFECTS_HASH["heal_instant_10hp"], 50)
        @@small_mp_restore_potion = Potions.new("Small MP Potion", "Sm/HP Pot", 99, 0, CONSUMABLES_TEXTURE_01, SF::Rect.new(0, 100, 100, 100), Effects::HealingEffects::HEALING_EFFECTS_HASH["heal_instant_10mp"], 50)

        @@healing_potion = Potions.new("HP Potion", "HP Pot", 99, 0, CONSUMABLES_TEXTURE_01, SF::Rect.new(100, 0, 100, 100), Effects::HealingEffects::HEALING_EFFECTS_HASH["heal_instant_25hp"], 200)
        @@mp_restore_potion = Potions.new("MP Potion", "HP Pot", 99, 0, CONSUMABLES_TEXTURE_01, SF::Rect.new(100, 100, 100, 100), Effects::HealingEffects::HEALING_EFFECTS_HASH["heal_instant_25mp"], 200)

        @@large_healing_potion = Potions.new("Large HP Potion", "L/HP Pot", 99, 0, CONSUMABLES_TEXTURE_01, SF::Rect.new(200, 0, 100, 100), Effects::HealingEffects::HEALING_EFFECTS_HASH["heal_instant_50hp"], 500)
        @@large_mp_restore_potion = Potions.new("Large MP Potion", "L/MP Pot", 99, 0, CONSUMABLES_TEXTURE_01, SF::Rect.new(200, 100, 100, 100), Effects::HealingEffects::HEALING_EFFECTS_HASH["heal_instant_50mp"], 500)

        @@x_large_healing_potion = Potions.new("Extra Large HP Potion", "XL/HP Pot", 99, 0, CONSUMABLES_TEXTURE_01, SF::Rect.new(300, 0, 100, 100), 
        Effects::HealingEffects::HEALING_EFFECTS_HASH["heal_instant_100hp"], 1000)
        @@x_large_mp_restore_potion = Potions.new("Extra Large MP Potion", "XL/HP Pot", 99, 0, CONSUMABLES_TEXTURE_01, SF::Rect.new(300, 100, 100, 100), 
        Effects::HealingEffects::HEALING_EFFECTS_HASH["heal_instant_100mp"], 1000)

        @@small_advanced_healing_potion = Potions.new("Small Advanced HP Potion", "Sm/Adv/HP Pot", 99, 0, CONSUMABLES_TEXTURE_01, SF::Rect.new(400, 0, 100, 100), 
        Effects::HealingEffects::HEALING_EFFECTS_HASH["heal_instant_200hp"], 2000)
        @@small_advanced_mp_restore_potion = Potions.new("Small Advanced MP Potion", "Sm/Adv/MP Pot", 99, 0, CONSUMABLES_TEXTURE_01, SF::Rect.new(400, 100, 100, 100), 
        Effects::HealingEffects::HEALING_EFFECTS_HASH["heal_instant_200mp"], 2000)

        @@advanced_healing_potion = Potions.new("Advanced HP Potion", "Adv/HP Pot", 99, 0, CONSUMABLES_TEXTURE_01, SF::Rect.new(500, 0, 100, 100), 
        Effects::HealingEffects::HEALING_EFFECTS_HASH["heal_instant_500hp"], 5000)
        @@advanced_mp_restore_potion = Potions.new("Advanced MP Potion", "Adv/MP Pot", 99, 0, CONSUMABLES_TEXTURE_01, SF::Rect.new(500, 100, 100, 100), 
        Effects::HealingEffects::HEALING_EFFECTS_HASH["heal_instant_500mp"], 5000)

        @@large_advanced_healing_potion = Potions.new("Large Advanced HP Potion", "L/Adv/HP Pot", 99, 0, CONSUMABLES_TEXTURE_01, SF::Rect.new(600, 0, 100, 100),
        Effects::HealingEffects::HEALING_EFFECTS_HASH["heal_instant_1000hp"], 10000)
        @@large_advanced_mp_restore_potion = Potions.new("Large Advanced MP Potion", "L/Adv/MP Pot", 99, 0, CONSUMABLES_TEXTURE_01, SF::Rect.new(600, 100, 100, 100),
        Effects::HealingEffects::HEALING_EFFECTS_HASH["heal_instant_1000mp"], 10000)

        @@x_large_advanced_healing_potion = Potions.new("Extra Large Advanced HP Potion", "XL/Adv/HP Pot", 99, 0, CONSUMABLES_TEXTURE_01, SF::Rect.new(700, 0, 100, 100),
        Effects::HealingEffects::HEALING_EFFECTS_HASH["heal_instant_2500hp"], 50000)
        @@x_large_advanced_mp_restore_potion = Potions.new("Extra Large Advanced MP Potion", "XL/Adv/MP Pot", 99, 0, CONSUMABLES_TEXTURE_01, SF::Rect.new(700, 100, 100, 100),
        Effects::HealingEffects::HEALING_EFFECTS_HASH["heal_instant_2500mp"], 50000)

        @@small_elixir = Potions.new("Small Elixir", "Sm/Elixir", 99, 0, CONSUMABLES_TEXTURE_01, SF::Rect.new(0, 200, 100, 100), 
        Effects::HealingEffects::HEALING_EFFECTS_HASH["heal_instant_10both"], 500)
    end
end