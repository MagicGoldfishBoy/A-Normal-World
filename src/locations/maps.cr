require "crsfml"
require "../../src/level_elements.cr"
module Maps
    class MapBase
        def initialize(name : String, id : String, level : String, region : String, recommended_lvl : Int32,
            filename : String, gravity : Float64)
            @name = name
            @id = id
            @level = level
            @region = region
            @recommended_lvl = recommended_lvl
            @filename = filename
        end

        property name : String
        property id : String
        property level : String
        property region : String
        property recommended_lvl : Int32
        property filename : String

        class_property level_platform_array : Array(LevelElements::PlatformBase) = [] of LevelElements::PlatformBase

        class_property level_decor_array : Array(LevelElements::DecorBase) = [] of LevelElements::DecorBase

        class_property level_wall_array : Array(LevelElements::WallBase) = [] of LevelElements::WallBase

        class_property level_climbeable_array : Array(LevelElements::ClimbeableBase) = [] of LevelElements::ClimbeableBase

        class_property level_teleport_array : Array(LevelElements::TeleportBase) = [] of LevelElements::TeleportBase

        class_property level_element_array : Array(LevelElements::LevelElementBase) = (level_platform_array + level_decor_array + level_wall_array + 
        level_climbeable_array + level_teleport_array)

        class_property gravity_clock : SF::Clock = SF::Clock.new

        def self.normal_gameplay_view(window)
            normal_gameplay_view = SF::View.new(SF.float_rect(300, 300, 400, 300))
            normal_gameplay_view.zoom(1.5)
            normal_gameplay_view.viewport = SF.float_rect(0, 0, 1, 0.95)
            normal_gameplay_view.center = Sprites::Player.retrieve_sprite.position + (SF.vector2(50, 50))
            window.view = normal_gameplay_view
        end


        def self.gravitational_pull(entity, gravity)
            if self.gravity_clock.elapsed_time > SF.seconds(1) 
            entity.move(SF.vector2(0, gravity))
            end
        end

        def self.can_jump?(window)
         if self.level_platform_array.all? { |platform| Sprites::Player.check_feet_collision(window, platform.sprite) == false }
            self.gravitational_pull(Sprites::Player.retrieve_sprite, 1)
            return false
         else
            return true
         end
        end

        def self.platform_collision(window)
            if self.level_platform_array.all?{ |platform| Sprites::Player.check_feet_collision(window, platform.sprite) == false }
               self.gravitational_pull(Sprites::Player.retrieve_sprite, 1)
            end
        end
        def self.draw_elements(window)
            self.normal_gameplay_view(window)

            self.level_decor_array.each { |decor|
            if decor.layer == 0
             window.draw(decor.sprite)
            end}

            self.level_platform_array.each { |platform|
            window.draw(platform.sprite)}

            self.level_decor_array.each { |decor|
            if decor.layer == 1
             window.draw(decor.sprite)
            end}

            self.level_wall_array.each { |wall|
            window.draw(wall.sprite)}

            self.level_climbeable_array.each { |climbeable|
            window.draw(climbeable.sprite)}

            self.level_decor_array.each { |decor|
            if decor.layer == 2
             window.draw(decor.sprite)
            end}

            self.level_teleport_array.each { |teleport|
            teleport.sprite.texture_rect = Animations::Portal.portal_animation
            window.draw(teleport.sprite)}
            
            self.platform_collision(window)
        end
     end
end