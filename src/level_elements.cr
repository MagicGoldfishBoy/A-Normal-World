require "crsfml"
require "../src/textures.cr"
require "../src/sprites.cr"

module LevelElements
    class PlatformBase
        PLATFORM_ARRAY = [] of PlatformBase
        PLATFORM_TEMPLATE_ARRAY = [] of PlatformBase
        PLATFORM_SPRITE_HASH = Hash(String, SF::Sprite).new
        PLATFORM_SPRITE_HASH["test"] = SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(950, 50, 50, 40))

        def initialize(name : String, id : String, x : Float32, y : Float32, 
            sprite : SF::Sprite, can_jump_down : Bool)
            @name = name
            @id = id
            @x = x
            @y = y
            @sprite = sprite
            @can_jump_down = can_jump_down
            PLATFORM_ARRAY << self
        end

        property name : String
        property id : String
        property x : Float32
        property y : Float32
        property sprite : SF::Sprite
        property can_jump_down : Bool
        class_property current_platform_array : Array(PlatformBase) = Array(PlatformBase).new

        @@test_platform = PlatformBase.new("test", "test", 0.0, 0.0, 
        SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(950, 50, 50, 40)), true)
        PLATFORM_TEMPLATE_ARRAY << @@test_platform

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

        def to_json(io : IO)
            io << "{\"name\": \"#{@name}\", \"id\": \"#{@id}\", \"x\": #{@x}, \"y\": #{@y}, \"can_jump_down\": #{@can_jump_down}}"
        end
    end 
    # class WallBase
    # end
    # class ClimbeableBase
    # end
    # class TeleportBase
    # end
    # class FluidBase
    class DecorBase
        DECOR_TEMPLATE_ARRAY = [] of DecorBase
        DECOR_SPRITE_HASH = Hash(String, SF::Sprite).new

        def initialize(name : String, id : String, x : Float32, y : Float32, sprite : SF::Sprite, layer : Int32)
            @name = name
            @id = id
            @x = x
            @y = y
            @sprite = sprite
            @layer = layer
        end

        property name : String
        property id : String
        property x : Float32
        property y : Float32
        property sprite : SF::Sprite
        property layer : Int32

        def to_json(io : IO)
            JSON.build(io) do |json|
                json.object do
                    json.field("name", @name)
                    json.field("id", @id)
                    json.field("x", @x)
                    json.field("y", @y)
                    json.field("layer", @layer)
                end
            end
        end
    end
    class EnemyBase
    end
    class SpikeBase
    end
    class WhackeableObjects
    end
end
