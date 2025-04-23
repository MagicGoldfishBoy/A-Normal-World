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
            @gravity = gravity
        end

        property name : String
        property id : String
        property level : String
        property region : String
        property recommended_lvl : Int32
        property filename : String

        class_property gravity : Float64 = 1

        class_property level_platform_array : Array(LevelElements::PlatformBase) = [] of LevelElements::PlatformBase

        class_property level_decor_array : Array(LevelElements::DecorBase) = [] of LevelElements::DecorBase

        class_property level_wall_array : Array(Walls::WallBase) = [] of Walls::WallBase

        class_property level_climbeable_array : Array(LevelElements::ClimbeableBase) = [] of LevelElements::ClimbeableBase

        class_property level_teleport_array : Array(LevelElements::TeleportBase) = [] of LevelElements::TeleportBase

        class_property level_whackeable_array : Array(WhackeableObject::WhackeableObjectBase) = [] of WhackeableObject::WhackeableObjectBase

        class_property level_element_array : Array(LevelElements::LevelElementBase) = (level_platform_array + level_decor_array + level_wall_array + 
        level_climbeable_array + level_teleport_array + level_whackeable_array)

        class_property current_parallax : LevelElements::ParallaxBase | Nil = nil

        class_property current_parallax_index : Int32 = 0
        #Parallax::ParallaxMethods.change_parallax("right")

        class_property gravity_clock : SF::Clock = SF::Clock.new

        def self.normal_gameplay_view(window)
            normal_gameplay_view = SF::View.new(SF.float_rect(300, 300, 400, 300))
            normal_gameplay_view.zoom(1.5)
            normal_gameplay_view.viewport = SF.float_rect(0, 0, 1, 0.95)
            normal_gameplay_view.center = Sprites::Player.retrieve_sprite.position + (SF.vector2(50, 50))
            window.view = normal_gameplay_view
        end


        def self.gravitational_pull(entity, gravity, window)
            if self.gravity_clock.elapsed_time > SF.seconds(1)
                if  !self.platform_collision(window)
                elsif SF::Keyboard.key_pressed?(SF::Keyboard::Up) && !self.climbeable_collision(window)
                    self.climb_climbeable(window)
                else
                    entity.move(SF.vector2(0, gravity))
                end
            end
        end

        def self.can_jump?(window)
         if self.level_platform_array.all? { |platform| Sprites::Player.check_feet_collision(window, platform.sprite) == false }
            return false
         else
            return true
         end
        end
        def self.platform_collision(window)
            if self.level_platform_array.all?{ |platform| Sprites::Player.check_feet_collision(window, platform.sprite) == false }
               return true
            else 
               return false
            end
        end
        def self.climbeable_collision(window)
            if self.level_climbeable_array.all?{ |climbeable| Sprites::Player.check_torso_collision(window, climbeable.sprite) == false}
            return true
        else
            return false
        end
        end

        def self.climb_climbeable(window)
            self.level_climbeable_array.each{ |climbeable| 
        if Sprites::Player.check_torso_collision(window, climbeable.sprite)
            Sprites::Player.move_player_sprite(window, 0, -1)
        end}
        end


        def self.wall_collision(window)
            self.level_wall_array.each{|wall|
            if Sprites::Player.check_sprite_collision(window, wall.sprite)
                self.check_wall_position_relative_to_player_position(window, wall)
            end}
        end
        def self.check_wall_position_relative_to_player_position(window, wall)
            player = Sprites::Player.retrieve_sprite
            player_bounds = Sprites::Player.get_adjusted_bounds(player)
            wall_bounds = wall.sprite.global_bounds
          
            dx_left = player_bounds.left + player_bounds.width - wall_bounds.left
            dx_right = wall_bounds.left + wall_bounds.width - player_bounds.left
          
            if dx_left > 0 && dx_left < dx_right
              Sprites::Player.move_player_sprite(window, -dx_left, 0)
            elsif dx_right > 0
              Sprites::Player.move_player_sprite(window, dx_right, 0)
            end
          end
          

        def self.draw_elements(window)
            self.normal_gameplay_view(window)

            if self.current_parallax == nil
                self.current_parallax = Parallax::ParallaxMethods.change_parallax(self.current_parallax_index, "right")
            else
                parallax_sprite = self.current_parallax.as(LevelElements::ParallaxBase).sprite
                parallax = self.current_parallax.as(LevelElements::ParallaxBase)
                parallax_sprite.position = SF.vector2(parallax.x, parallax.y)
                window.draw(parallax_sprite)
                if parallax_sprite.position.x <= Sprites::Player.retrieve_sprite.position.x + 500 && parallax_sprite.position.x >= Sprites::Player.retrieve_sprite.position.x - 250
                    parallax.x -= 5
                elsif parallax_sprite.position.x >= Sprites::Player.retrieve_sprite.position.x + 500 || parallax_sprite.position.x <= Sprites::Player.retrieve_sprite.position.x - 1500
                    parallax.x += 5
                end
                if parallax_sprite.position.y <= Sprites::Player.retrieve_sprite.position.y + 500 && parallax_sprite.position.y >= Sprites::Player.retrieve_sprite.position.y - 250
                    parallax.x -= 5
                elsif parallax_sprite.position.y >= Sprites::Player.retrieve_sprite.position.y + 500 || parallax_sprite.position.y <= Sprites::Player.retrieve_sprite.position.y - 1500
                    parallax.x += 5
                end
                #might be useful if I need a parallax to scroll constantly
                # if parallax_sprite.position.x <= Sprites::Player.retrieve_sprite.position.x - 50
                #     parallax.x -= 10
                #     if parallax_sprite.position.x + parallax_sprite.global_bounds.width < 500
                #         parallax.x = Sprites::Player.retrieve_sprite.position.x - 300
                #     end
                # end
            end


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

            WhackeableObject::WhackeableObjectsMethods.animate_whackeables(window)

            self.level_whackeable_array.each {|whackeable|
                window.draw(whackeable.sprite)}

            self.level_climbeable_array.each { |climbeable|
            window.draw(climbeable.sprite)}

            self.level_decor_array.each { |decor|
            if decor.layer == 2
             window.draw(decor.sprite)
            end}

            self.level_teleport_array.each { |teleport|
            teleport.sprite.texture_rect = Animations::Portal.portal_animation
            window.draw(teleport.sprite)}
            self.gravitational_pull(Sprites::Player.retrieve_sprite, gravity, window)
            self.wall_collision(window)
        end
     end
end