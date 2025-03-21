require "crsfml"
require "../src/textures.cr"

module Consumables
    class Consumables_base
        CONSUMABLE_ARRAY = [] of Consumables_base
        def initialize(name : String, id : Int32, stack_limit : Int32, amount_owned : Int32, texture : SF::Texture)
            @name = name
            @id = id
            @stack_limit = stack_limit
            @amount_owned = amount_owned
            @texture = texture
        end

        getter name : String
        setter name : String

        getter id : Int32
        setter id : Int32

        getter stack_limit : Int32
        setter stack_limit : Int32

        getter amount_owned : Int32
        setter amount_owned : Int32

        getter texture : SF::Texture
        setter texture : SF::Texture

    end
end