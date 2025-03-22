require "crsfml"
require "../src/textures.cr"
require "../src/effects.cr"

module Consumables
    class Consumables_base
        CONSUMABLE_ARRAY = [] of Consumables_base
        def initialize(name : String, id : Int32, stack_limit : Int32, amount_owned : Int32, texture : SF::Texture, effect : Effects::Effects_Base)
            @name = name
            @id = id
            @stack_limit = stack_limit
            @amount_owned = amount_owned
            @texture = texture
            @effect = effect
            CONSUMABLE_ARRAY.push(self)
        end

        property name : String

        property id : Int32

        property stack_limit : Int32

        property amount_owned : Int32

        property texture : SF::Texture

        def Consumables_base.get_consumable(this)
            CONSUMABLE_ARRAY.each { |consumable| if consumable.name == this
            return consumable
            end }
        end

    end

    class Potions < Consumables_base
        @@weak_healing_potion = Potions.new("Weak HP Potion", 1, 99, 0, NIL_TEXTURE, Effects::HealingEffects::HEALING_EFFECTS_HASH["heal_instant_10hp"])
    end
end