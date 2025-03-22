require "crsfml"
require "../src/textures.cr"
require "../src/effects.cr"

module Consumables
    class Consumables_base
        CONSUMABLE_ARRAY = [] of Consumables_base
        def initialize(name : String, id : Int32, stack_limit : Int32, amount_owned : Int32, texture : SF::Texture, texture_rectangle : SF::IntRect, effect : Effects::Effects_Base)
            @name = name
            @id = id
            @stack_limit = stack_limit
            @amount_owned = amount_owned
            @texture = texture
            @texture_rectangle = texture_rectangle
            @effect = effect
            CONSUMABLE_ARRAY.push(self)
        end

        property name : String

        property id : Int32

        property stack_limit : Int32

        property amount_owned : Int32

        property texture : SF::Texture

        property texture_rectangle : SF::IntRect

        property effect : Effects::Effects_Base

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
        @@weak_healing_potion = Potions.new("Weak HP Potion", 1, 99, 0, CONSUMABLES_TEXTURE_01, SF::Rect.new(0, 0, 100, 100), Effects::HealingEffects::HEALING_EFFECTS_HASH["heal_instant_10hp"])
        @@weak_mp_restore_potion = Potions.new("Weak MP Potion", 2, 99, 0, CONSUMABLES_TEXTURE_01, SF::Rect.new(0, 100, 100, 100), Effects::HealingEffects::HEALING_EFFECTS_HASH["heal_instant_10mp"])

        @@healing_potion = Potions.new("HP Potion", 3, 99, 0, CONSUMABLES_TEXTURE_01, SF::Rect.new(100, 0, 100, 100), Effects::HealingEffects::HEALING_EFFECTS_HASH["heal_instant_25hp"])
        @@mp_restore_potion = Potions.new("MP Potion", 4, 99, 0, CONSUMABLES_TEXTURE_01, SF::Rect.new(100, 100, 100, 100), Effects::HealingEffects::HEALING_EFFECTS_HASH["heal_instant_25mp"])
    end
end