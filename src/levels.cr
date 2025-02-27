require "crsfml"
require "json"

module Levels
    class LevelSelectionLogic
        def initialize(level : String)
        @@level = level
        end

        def LevelSelectionLogic.level
            @@level = level
        end

        def LevelSelectionLogic.level=(this)
            @@level = this
        end

        def LevelSelectionLogic.current_area(window)
            case @@level
            when "none"
            when "physics_test"
                PhysicsTest.draw_platform_test(window)
            end
        end
    end
    class Level_Physics
        def initialize(can_float : Bool, gravity : Float64)
            @@can_float = can_float
            @@gravity = gravity
        end

        def can_float
            @@can_float
        end

        def can_float=(this)
            @@can_float = this
        end

        def Level_Physics.gravity
            @@gravity
        end

        def Level_Physics.gravity=(this)
            @@gravity = this
        end

        @@gravity_clock = SF::Clock.new

        def Level_Physics.gravitational_pull(entity)
            if @@gravity_clock.elapsed_time > SF.seconds(1) 
            entity.move(SF.vector2(0, @@gravity.not_nil!))
            end
        end
    end
    class PhysicsTest
        TEST_PLATFORM_01 = SF::RectangleShape.new(SF.vector2(500, 80))
        TEST_PLATFORM_01.fill_color = SF.color( 96, 166, 84 )
        def PhysicsTest.initialize_platform_test(window)
            current_size = window.size
            original_width = 800 
            original_height = 600
        
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
            TEST_PLATFORM_01.position = SF.vector2(scale_x + 200, scale_y + 340)
        end

        def PhysicsTest.draw_platform_test(window)
            Level_Physics.gravity=(1)
            
            if Sprites::Player.check_feet_collision(window, TEST_PLATFORM_01) == false
                Level_Physics.gravitational_pull(Sprites::Player.retrieve_sprite)
            end
            window.draw(TEST_PLATFORM_01)
        end
    end
end