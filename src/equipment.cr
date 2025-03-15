require "crsfml"
require "../src/textures.cr"

module Equipment
    class Weapon
        WEAPON_ARRAY = [] of Weapon

        def initialize(name : String, id : Int32, weapon_type : String, attack_type : String, attack_strength : Float64, range : Float64, minimum_strength : Float64, minimum_dexterity : Float64, 
            minimum_intelligence : Float64, minimum_luck : Float64, status_effects : Array(String), amount_owned : Int32, texture : SF::Texture)
            @name = name
            @id = id
            @weapon_type = weapon_type
            @attack_type = attack_type
            @range = range
            @attack_strength = attack_strength
            @minimum_strength = minimum_strength
            @minimum_dexterity = minimum_dexterity
            @minimum_intelligence = minimum_intelligence
            @minimum_luck = minimum_luck
            @status_effects = status_effects
            @amount_owned = amount_owned
            @texture = texture
            WEAPON_ARRAY.push(self)
        end

        def name
            @name
        end
        def name=(this)
            @name = this
        end

        def id
            @id
        end
        def id=(this)
            @id = this
        end

        def weapon_type
            @weapon_type
        end
        def weapon_type=(this)
            @weapon_type = this
        end

        def attack_type
            @attack_type
        end
        def attack_type=(this)
            @attack_type = this
        end

        def attack_strength
            @attack_strength
        end
        def attack_strength=(this)
            @attack_strength = this
        end

        def range
            @range
        end
        def range=(this)
            @range = this
        end

        def minimum_strength
            @minimum_strength
        end
        def minimum_strength=(this)
            @minimum_strength = this
        end

        def minimum_dexterity
            @minimum_dexterity
        end
        def minimum_dexterity=(this)
            @minimum_dexterity = this
        end

        def minimum_intelligence
            @minimum_intelligence
        end
        def minimum_intelligence=(this)
            @minimum_intelligence = this
        end

        def minimum_luck
            @minimum_luck
        end
        def minimum_luck=(this)
            @minimum_luck = this
        end

        def status_effects
            @status_effects
        end
        def status_effects=(this)
            @status_effects = this
        end

        def amount_owned
            @amount_owned
        end
        def amount_owned=(this)
            @amount_owned = this
        end

        def texture
            @texture
        end
        def texture=(this)
            @texture = this
        end

        def self.get_weapon(this)
            WEAPON_ARRAY.each do |weapon|
                return weapon if weapon.name == this
            end
            nil
        end

        @@nil_weapon = Weapon.new("No Weapon", 0, "fist", "punch", 1.0, 1.0, 0.0, 0.0, 0.0, 0.0, [] of String, 1, NIL_TEXTURE)

        @@stick = Weapon.new("Stick", 1, "blunt", "swing", 2.0, 2.0, 0.0, 0.0, 0.0, 0.0, [] of String, 1, WOODEN_STICK_TEXTURE)
        @@wooden_training_sword = Weapon.new("Wooden Training Sword", 2, "sword", "swing", 3.5, 2.5, 0.0, 0.0, 0.0, 0.0, [] of String, 1, WOODEN_TRAINING_SWORD_TEXTURE)

        @@kitchen_knife = Weapon.new("Kitchen Knife", 100, "knife", "stab", 3.0, 1.5, 0.0, 0.0, 0.0, 0.0, [] of String, 1, KITCHEN_KNIFE_TEXTURE)
        @@broken_bottle = Weapon.new("Broken Bottle", 101, "knife", "stab", 2.5, 1.5, 0.0, 0.0, 0.0, 0.0, [] of String, 1, BROKEN_BOTTLE_TEXTURE)

        @@bb_gun = Weapon.new("BB Gun", 200, "gun", "shoot", 3.0, 15.0, 0.0, 0.0, 0.0, 0.0, [] of String, 1, BB_GUN_TEXTURE)
    end
end
