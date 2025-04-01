require "crsfml"
require "../src/textures.cr"
require "../src/sprites.cr"

module LevelElements
    class PlatformBase
        PLATFORM_ARRAY = [] of PlatformBase
        def initialize(name : String, x : Float64, y : Float64, sprite : SF::Sprite, can_jump_down : Bool)
            @name = name
            @x = x
            @y = y
            @sprite = sprite
            @can_jump_down = can_jump_down
            PLATFORM_ARRAY << self
        end

        property name : String
        property x : Float64
        property y : Float64
        property sprite : SF::Sprite
        property can_jump_down : Bool
        class_property current_platform_array : Array(PlatformBase) = [] of PlatformBase
        
        def self.add_platform(platform : PlatformBase)
            PLATFORM_ARRAY << platform
        end

        def self.remove_platform(platform : PlatformBase)
            PLATFORM_ARRAY.delete(platform)
        end

        def self.get_platforms
            PLATFORM_ARRAY
        end

        def self.get_platform(name : String)
            PLATFORM_ARRAY.find { |platform| platform.name == name }
        end

        def self.draw_platforms(window)
            PLATFORM_ARRAY.each do |platform|
                window.draw(platform.sprite)
            end
        end

        def self.platform_collision(window)
         if PLATFORM_ARRAY.all? { |platform| Sprites::Player.check_feet_collision(window, platform) == false }
            return true
         else
            return false
         end
        end
    end
    class WallBase
    end
    class ClimbeableBase
    end
    class TeleportBase
    end
    class FluidBase
    end
    class DecorBase
    end
    class EnemyBase
    end
    class SpikeBase
    end
end