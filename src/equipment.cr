require "crsfml"
require "../src/textures.cr"

module Equipment
    class Weapon
        WEAPON_ARRAY = [] of Weapon
        initialize(name : String, id : Int32, attack_type : String, attack_strength : Float64, minimum_strength : Float64, status_effects : Array of String, amount_owned : Int32, texture : SF::Texture)
        @name = name
        @id = id
        @attack_type = attack_type
        @attack_strength = attack_strength
        @minimum_strength = minimum_strength
        @status_effects = status_effects
        @amount_owned = amount_owned
        @texture = texture
        WEAPON_ARRAY.push(self)
        end

        def Weapon.name
            @name
        end
        def Weapon.name=(this)
            @name = this
        end

        def Weapon.id
            @id
        end
        def Weapon.id=(this)
            @id = this
        end

        def Weapon.attack_type
            @attack_type
        end
        def Weapon.attack_type=(this)
            @attack_type = this
        end

        def Weapon.attack_strength
            @attack_strength
        end
        def Weapon.attack_strength=(this)
            @attack_strength = this
        end

        def Weapon.minimum_strength
            @minimum_strength
        end
        def Weapon.minimum_strength=(this)
            @minimum_strength = this
        end

        def Weapon.status_effects
            @status_effects
        end
        def Weapon.status_effects=(this)
            @status_effects = this
        end

        def Weapon.amount_owned
            @is_owned
        end
        def Weapon.amount_owned=(this)
            @is_owned = this
        end

        def Weapon.texture
            @texture
        end
        def Weapon.texture=(this)
            @texture = this
        end

        def Weapon.get_weapon(this)
            WEAPON_ARRAY.each { |weapon| if weapon.name == this
            return weapon
            end }
        end

        @@nil_weapon = Weapon.new("No Weapon", 0, "punch", 1.0, 0, [], 1, NIL_TEXTURE)

        @@stick = Weapon.new("Stick", 1, "swing", 2.0, 0, [], 1, WOODEN_STICK_TEXTURE)
    end
end