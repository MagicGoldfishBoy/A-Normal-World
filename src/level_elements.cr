require "crsfml"
require "../src/textures.cr"
require "../src/sprites.cr"
require "crsfml/audio"

module LevelElements
    class LevelElementBase
        def initialize(name : String, id : String, x : Float32, y : Float32, sprite : SF::Sprite)
            @name = name
            @id = id
            @x = x
            @y = y
            @sprite = sprite
        end
        property name : String
        property id : String
        property x : Float32
        property y : Float32
        property sprite : SF::Sprite
    end

    class PlatformBase < LevelElementBase
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

        def open_menu(window)
            puts "⛔ Platforms don't have a menu"
        end

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
        # def to_json(io : IO)
        #     io << "{\"name\": \"#{@name}\", \"id\": \"#{@id}\", \"x\": #{@x}, \"y\": #{@y}, \"can_jump_down\": #{@can_jump_down}}"
        # end
        def to_json(io : IO)
            JSON.build(io) do |json|
                json.object do
                    json.field("name", @name)
                    json.field("id", @id)
                    json.field("x", @x)
                    json.field("y", @y)
                    json.field("can_jump_down", @can_jump_down)
                end
            end
        end
    end
    class ClimbeableBase < LevelElementBase
        CLIMBEABLE_TEMPLATE_ARRAY = [] of ClimbeableBase
        CLIMBEABLE_SPRITE_HASH = Hash(String, SF::Sprite).new
        def initialize(name : String, id : String, x : Float32, y : Float32, sprite : SF::Sprite)
            @name = name
            @id = id
            @x = x
            @y = y
            @sprite = sprite
        end

        property name : String
        property id : String
        property x : Float32
        property y : Float32
        property sprite : SF::Sprite

        def to_json(io : IO)
            JSON.build(io) do |json|
                json.object do
                    json.field("name", @name)
                    json.field("id", @id)
                    json.field("x", @x)
                    json.field("y", @y)
                end
            end
        end

        def open_menu(window)
            puts "🛠 Climbeable menu not yet implemented"
        end

        def self.climbeable_collision(window)
            if CLIMBEABLE_TEMPLATE_ARRAY.all? { |climbeable| Sprites::Player.check_sprite_collision(window, climbeable) == false }
                return true
            else
                return false
            end
        end
    end
    class TeleportBase < LevelElementBase
        TELEPORT_TEMPLATE_ARRAY = [] of TeleportBase
        TELEPORT_SPRITE_HASH = Hash(String, SF::Sprite).new
        def initialize(name : String, id : String, x : Float32, y : Float32, sprite : SF::Sprite,
            destination : String, requirement : String, sound : String)
            @name = name
            @id = id
            @x = x
            @y = y
            @sprite = sprite
            @destination = destination
            @requirement = requirement
            @sound = sound
        end

        property name : String
        property id : String
        property x : Float32
        property y : Float32
        property sprite : SF::Sprite
        property destination : String
        property requirement : String
        property sound : String

        def open_menu(window)
            puts "🛠 Teleport menu not yet implemented"
        end
    end

    class DecorBase < LevelElementBase
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

        def open_menu(window)
            if self.is_a?(DecorBase)
                DecorWindow::DecorWindowElements::DECOR_WINDOW_BOX.sprite.position = window.map_pixel_to_coords(
                SF::Mouse.get_position(window), window.view)
                DecorWindow::DecorWindowElements::CURRENT_DECOR_TEXT.text.string = LevelEditor::LevelDisplay.current_element.name
                DecorWindow::DecorWindowElements::CURRENT_LAYER_TEXT.text.string = "Layer: #{self.layer.to_s}"
                MenuHandling::Window.is_decor_window_open = !MenuHandling::Window.is_decor_window_open
            else
                puts "⛔ This element is not a decor element"
            end
        end

        def shift_layer_higher
            if self.is_a?(DecorBase)
                if self.layer < 2
                    self.layer += 1
                else
                    self.layer = 0
                end
            else
                puts "⛔ This element is not a decor element"
            end
        end

        def shift_layer_lower
            if self.is_a?(DecorBase)
                if self.layer > 0
                    self.layer -= 1
                else
                    self.layer = 2
                end
            else
                puts "⛔ This element is not a decor element"
            end
        end
    end
    class ParallaxBase < LevelElementBase
        PARALLAX_ARRAY = [] of ParallaxBase
        PARALLAX_SPRITE_HASH = Hash(String, SF::Sprite).new
        def initialize(name : String, id : String, x : Float32, y : Float32, sprite : SF::Sprite)
            @name = name
            @id = id
            @x = x
            @y = y
            @sprite = sprite
            PARALLAX_ARRAY << self
        end

        property name : String
        property id : String
        property x : Float32
        property y : Float32
        property sprite : SF::Sprite

        def to_json(io : IO)
         JSON.build(io) do |json|
          json.object do
            json.field("name", @name)
            json.field("id", @id)
            json.field("x", @x)
            json.field("y", @y)
          end
         end
        end

        def open_menu(window)
            puts "⛔ Parallaxes don't have a menu"
        end
    end
    class SpikeBase
    end    
    class EnemyBase
    end

end
