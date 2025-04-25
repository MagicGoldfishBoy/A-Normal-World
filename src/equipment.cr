require "crsfml"
require "crsfml/audio"
require "../src/textures.cr"
require "../src/sound/sfx.cr"

module Equipment
    class Weapon
        WEAPON_ARRAY = [] of Weapon

        def initialize(name : String, id : Int32, weapon_type : String, attack_type : String, attack_strength : Float64, range : Float64, minimum_strength : Float64, minimum_dexterity : Float64, 
            minimum_intelligence : Float64, minimum_luck : Float64, status_effects : Array(String), texture : SF::Texture, clock : SF::Clock, sfx : SF::Sound)
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
            @texture = texture
            @clock = clock
            @sfx = sfx
            WEAPON_ARRAY.push(self)
        end

        property name : String
        property id : Int32
        property weapon_type : String
        property attack_type : String
        property attack_strength : Float64
        property range : Float64
        property minimum_strength : Float64
        property minimum_dexterity : Float64
        property minimum_intelligence : Float64
        property minimum_luck : Float64
        property status_effects : Array(String)
        property texture : SF::Texture
        property clock : SF::Clock
        property sfx : SF::Sound

        def self.get_weapon(this)
            WEAPON_ARRAY.each do |weapon|
                return weapon if weapon.name == this
            end
            nil
        end

        def attack(window, attack_strength)
            attack_rect = SF::RectangleShape.new
            attack_rect.size = SF.vector2f(self.range, 10)
            direction = Player::Movement.movement_direction
            if self.clock.elapsed_time > SF.seconds(0.30) 
            if direction == "left"
            attack_rect.position = SF.vector2(Sprites::Player.retrieve_sprite.position.x, Sprites::Player.retrieve_sprite.position.y + 55)
            elsif direction == "right"
                attack_rect.position = SF.vector2(Sprites::Player.retrieve_sprite.position.x + 55, Sprites::Player.retrieve_sprite.position.y + 55)
            end
            #window.draw(attack_rect)
            self.sfx.play
            Combat::PlayerMethods::TARGET_ARRAY.each { |whackeable|
            if attack_rect.global_bounds.intersects? whackeable.sprite.global_bounds
                whackeable.react_to_impact(window, attack_strength)
            end}
            self.clock.restart
        end
        end

        @@nil_weapon = Weapon.new("No Weapon", 0, "fist", "punch", 1.0, 1.0, 0.0, 0.0, 0.0, 0.0, Array(String).new, NIL_TEXTURE, SF::Clock.new, SFX::CombatSFX::KNIFE_STAB_SFX_01)
    end
    class Sword < Weapon
        def initialize(name : String, id : Int32, weapon_type : String, attack_type : String, attack_strength : Float64, range : Float64, minimum_strength : Float64, minimum_dexterity : Float64, 
            minimum_intelligence : Float64, minimum_luck : Float64, status_effects : Array(String), texture : SF::Texture, clock : SF::Clock, sfx : SF::Sound)
            super
        end

        @@wooden_training_sword = Sword.new("Wood Sword", 1, "sword", "swing", 3.5, 40.5, 0.0, 0.0, 0.0, 0.0, Array(String).new, WOODEN_TRAINING_SWORD_TEXTURE, SF::Clock.new, SFX::CombatSFX::SWORD_SWING_SFX_01)
    end
"TODO: add rusty knife and make it super effective against unvaccinated children lol"
    class Knife < Weapon
        def initialize(name : String, id : Int32, weapon_type : String, attack_type : String, attack_strength : Float64, range : Float64, minimum_strength : Float64, minimum_dexterity : Float64, 
            minimum_intelligence : Float64, minimum_luck : Float64, status_effects : Array(String), texture : SF::Texture, clock : SF::Clock, sfx : SF::Sound)
            super
        end

        @@kitchen_knife = Knife.new("Kitchen Knife", 1, "knife", "stab", 3.0, 32.5, 0.0, 0.0, 0.0, 0.0, Array(String).new, KITCHEN_KNIFE_TEXTURE, SF::Clock.new, SFX::CombatSFX::KNIFE_STAB_SFX_01)
        @@broken_bottle = Knife.new("Broken Bottle", 2, "knife", "stab", 2.5, 30.5, 0.0, 0.0, 0.0, 0.0, Array(String).new, BROKEN_BOTTLE_TEXTURE, SF::Clock.new, SFX::CombatSFX::KNIFE_STAB_SFX_01)
    end

    class Blunt < Weapon
        def initialize(name : String, id : Int32, weapon_type : String, attack_type : String, attack_strength : Float64, range : Float64, minimum_strength : Float64, minimum_dexterity : Float64, 
            minimum_intelligence : Float64, minimum_luck : Float64, status_effects : Array(String), texture : SF::Texture, clock : SF::Clock, sfx : SF::Sound)
            super
        end

        @@stick = Blunt.new("Stick", 1, "blunt", "swing", 2.0, 35.0, 0.0, 0.0, 0.0, 0.0, Array(String).new, WOODEN_STICK_TEXTURE, SF::Clock.new, SFX::CombatSFX::BLUNT_SWING_SFX_01)
    end

    class Rifle < Weapon
        def initialize(name : String, id : Int32, weapon_type : String, attack_type : String, attack_strength : Float64, range : Float64, minimum_strength : Float64, minimum_dexterity : Float64, 
            minimum_intelligence : Float64, minimum_luck : Float64, status_effects : Array(String), texture : SF::Texture, clock : SF::Clock, sfx : SF::Sound)
            super
        end

        @@bb_gun = Weapon.new("BB Gun", 1, "gun", "shoot", 3.0, 60.0, 0.0, 0.0, 0.0, 0.0, Array(String).new, BB_GUN_TEXTURE, SF::Clock.new, SFX::CombatSFX::BB_GUN_SFX_01)
    end
end
