require "crsfml"
require "../src/textures.cr"
require "../src/animations.cr"
require "../src/level_elements.cr"
require "../src/platforms.cr"
require "../src/decor.cr"
require "../src/level_editor/walls.cr"
require "../src/climbeable.cr"
require "../src/teleporters.cr"
require "../src/level_editor/parallax.cr"
require "../src/level_editor/whackeable_objects.cr"

module LevelEditor 
    class LevelEditorLogic
        class_property current_element_array : (Array(LevelElements::PlatformBase) | Array(LevelElements::DecorBase) | Array(Walls::WallBase) |
        Array(LevelElements::ClimbeableBase) | Array(LevelElements::TeleportBase) | Array(WhackeableObject::WhackeableObjectBase)) = [] of LevelElements::PlatformBase
        # class_property current_element_array : (Array(LevelElements::PlatformBase) | Array(LevelElements::DecorBase) | Array(Walls::WallBase) |
        # Array(LevelElements::ClimbeableBase) | Array(LevelElements::TeleportBase) | 
        # Array(WhackeableObject::WhackeableObjectBase).as_a(LevelElements::LevelElementBase)) = 
        # self.spawned_platform_array
        class_property current_index : Int32 = self.current_platform_index

        class_property current_element_index : Int32 = 0
        class_property current_element_type : String = "Platform"
        class_property element_array : Array(String) = ["Platform", "Decor", "Wall", "Climbeable", "Teleporter", "Whackeable"]
        class_property current_template : (LevelElements::LevelElementBase) = 
        Platforms::Natural_Platform.very_small_grassy_platform

        class_property current_platform_index : Int32 = 0
        class_property spawned_platform_index : Int32 = 0
        class_property spawned_platform_array : Array(LevelElements::PlatformBase) = [] of LevelElements::PlatformBase

        class_property current_decor_index : Int32 = 0
        class_property spawned_decor_index : Int32 = 0
        class_property spawned_decor_array : Array(LevelElements::DecorBase) = [] of LevelElements::DecorBase

        class_property current_wall_index : Int32 = 0
        class_property spawned_wall_index : Int32 = 0
        class_property spawned_wall_array : Array(Walls::WallBase) = [] of Walls::WallBase

        class_property current_climbeable_index : Int32 = 0
        class_property spawned_climbeable_index : Int32 = 0
        class_property spawned_climbeable_array : Array(LevelElements::ClimbeableBase) = [] of LevelElements::ClimbeableBase
        
        class_property current_teleport_index : Int32 = 0
        class_property spawned_teleport_index : Int32 = 0
        class_property spawned_teleport_array : Array(LevelElements::TeleportBase) = [] of LevelElements::TeleportBase

        class_property spawned_element_array : Array(LevelElements::LevelElementBase) = (spawned_platform_array + spawned_decor_array + spawned_wall_array + 
        spawned_climbeable_array + spawned_teleport_array)
        class_property spawned_element_index : Int32 = 0

        class_property current_parallax_index : Int32 = 0

        def self.update_spawned_element_array
            self.spawned_element_array.clear
            self.spawned_element_array = self.spawned_platform_array + self.spawned_decor_array + self.spawned_wall_array
            self.spawned_element_array += self.spawned_climbeable_array
            self.spawned_element_array += self.spawned_teleport_array
            self.spawned_element_array += WhackeableObject::WhackeableObjectsMethods.spawned_whackeable_object_array.map(&.as(LevelElements::LevelElementBase))
        end

        def LevelEditorLogic.set_current_array
            case current_element_type
            when "Platform"
                self.current_element_array = LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY
            when "Decor"
                self.current_element_array = LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY
            when "Wall"
                self.current_element_array = Walls::WallBase::WALL_TEMPLATE_ARRAY
            when "Climbeable"
                self.current_element_array = LevelElements::ClimbeableBase::CLIMBEABLE_TEMPLATE_ARRAY
            when "Teleporter"
                self.current_element_array = LevelElements::TeleportBase::TELEPORT_TEMPLATE_ARRAY
            when "Whackeable"
                self.current_element_array = WhackeableObject::WhackeableObjectBase::WHACKEABLE_TEMPLATE_ARRAY
            else
                puts "Error: Unknown element type '#{current_element_type}'"
            end
        end
        def LevelEditorLogic.set_current_index
            self.reset_indexes
            case current_element_type
            when "Platform"
                self.current_index = self.current_platform_index
            when "Decor"
                self.current_index = self.current_decor_index
            when "Wall"
                self.current_index = self.current_wall_index
            when "Climbeable"
                self.current_index = self.current_climbeable_index
            when "Teleporter"
                self.current_index = self.current_teleport_index
            when "Whackeable"
                self.current_index = WhackeableObject::WhackeableObjectsMethods.current_whackeable_object_index
            else
                puts "Error: Unknown element type '#{current_element_type}'"
            end
        end
        def LevelEditorLogic.reset_indexes
            self.current_platform_index = 0
            self.current_decor_index = 0
            self.spawned_platform_index = 0
            self.spawned_decor_index = 0
            self.current_wall_index = 0
            self.spawned_wall_index = 0
            self.current_climbeable_index = 0
            self.spawned_climbeable_index = 0
            self.current_teleport_index = 0
            self.spawned_teleport_index = 0
            self.spawned_element_index = 0
            WhackeableObject::WhackeableObjectsMethods.current_whackeable_object_index = 0
            WhackeableObject::WhackeableObjectsMethods.spawned_whackeable_object_index = 0
            #Do NOT put this line back
            #self.current_element_index = 0
        end

        def LevelEditorLogic.spawn_element(window)
            case self.current_element_type
            when "Platform"
                Platforms::PlatformMethods.spawn_platform(window)
            when "Decor"
                Decor::DecorMethods.spawn_decor(window)
            when "Wall"
                Walls::WallsMethods.spawn_wall(window)
            when "Climbeable"
                Climbeable::ClimbeableMethods.spawn_climbeable(window)
            when "Teleporter"
                Teleporters::TeleporterMethods.spawn_teleporter(window)
            when "Whackeable"
                WhackeableObject::WhackeableObjectsMethods.spawn_whackeable(window)
            else
                puts "Error: Unknown element type '#{current_element_type}'"
            end
        end
        def LevelEditorLogic.middle_mouse_button_handling(window)
            mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window), window.view)
            LevelEditorLogic.close_all_windows
            LevelDisplay.current_element.x = mouse_position.x
            LevelDisplay.current_element.y = mouse_position.y
            LevelDisplay.current_element.sprite.position = mouse_position
        end
        def LevelEditorLogic.right_mouse_button_handling(window)
            mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window), window.view)
            bounding_box_size = 50.0
            LevelEditorLogic.close_all_windows
            # LevelEditor::LevelEditorLogic.spawned_platform_array.each do |platform|
            #     if platform.sprite.global_bounds.contains?(mouse_position.x, mouse_position.y)
            #         LevelDisplay.current_element = platform
            #         platform.open_menu(window)
            #     end
            # end
            LevelEditor::LevelEditorLogic.spawned_decor_array.each do |decor|
                if decor.sprite.global_bounds.contains?(mouse_position.x, mouse_position.y)
                    LevelDisplay.current_element = decor
                    decor.open_menu(window)
                end
            end
            LevelEditor::LevelEditorLogic.spawned_wall_array.each do |wall|
                if wall.sprite.global_bounds.contains?(mouse_position.x, mouse_position.y)
                    LevelDisplay.current_element = wall
                    wall.open_menu(window)
                end
            end
            LevelEditor::LevelEditorLogic.spawned_climbeable_array.each do |climbeable|
                if climbeable.sprite.global_bounds.contains?(mouse_position.x, mouse_position.y)
                    LevelDisplay.current_element = climbeable
                    climbeable.open_menu(window)
                end
            end
            LevelEditor::LevelEditorLogic.spawned_teleport_array.each do |teleporter|
                if teleporter.sprite.global_bounds.contains?(mouse_position.x, mouse_position.y)
                    LevelDisplay.current_element = teleporter
                    teleporter.open_menu(window)
                end
            end
        end
        def LevelEditorLogic.left_mouse_button_handling(window)
            mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window), window.view)
            bounding_box_size = 50.0
            LevelEditor::LevelEditorLogic.spawned_platform_array.each do |platform|
                if platform.sprite.global_bounds.contains?(mouse_position.x, mouse_position.y)
                    LevelDisplay.current_element = platform
                    window.draw(platform.sprite)
                   # LevelEditorLogic.close_all_windows
                end
            end
            LevelEditor::LevelEditorLogic.spawned_decor_array.each do |decor|
                if decor.sprite.global_bounds.contains?(mouse_position.x, mouse_position.y)
                    LevelDisplay.current_element = decor
                    window.draw(decor.sprite)
                    LevelEditorLogic.close_all_windows
                end
            end
            LevelEditor::LevelEditorLogic.spawned_wall_array.each do |wall|
                if wall.sprite.global_bounds.contains?(mouse_position.x, mouse_position.y)
                    LevelDisplay.current_element = wall
                    window.draw(wall.sprite)
                    LevelEditorLogic.close_all_windows
                end
            end
            LevelEditor::LevelEditorLogic.spawned_climbeable_array.each do |climbeable|
                if climbeable.sprite.global_bounds.contains?(mouse_position.x, mouse_position.y)
                    LevelDisplay.current_element = climbeable
                    window.draw(climbeable.sprite)
                end
            end
            LevelEditor::LevelEditorLogic.spawned_teleport_array.each do |teleporter|
                if teleporter.sprite.global_bounds.contains?(mouse_position.x, mouse_position.y)
                    LevelDisplay.current_element = teleporter
                    window.draw(teleporter.sprite)
                    LevelEditorLogic.close_all_windows
                end
            end
            WhackeableObject::WhackeableObjectsMethods.spawned_whackeable_object_array.each do |whackeable|
                if whackeable.sprite.global_bounds.contains?(mouse_position.x, mouse_position.y)
                    LevelDisplay.current_element = whackeable
                    window.draw(whackeable.sprite)
                    LevelEditorLogic.close_all_windows
                end
            end
        end

        def self.close_all_windows
            MenuHandling::Window.is_decor_window_open = false
        end

        def LevelEditorLogic.move_current_element(window, x : Float32, y : Float32)
            current_element = LevelDisplay.current_element
            current_element.x += x
            current_element.y += y
            current_element.sprite.position = SF::Vector2f.new(current_element.x, current_element.y)
        end
        def LevelEditorLogic.delete_current_element
            self.spawned_element_array.delete(LevelDisplay.current_element)
            self.spawned_platform_array.delete(LevelDisplay.current_element)
            self.spawned_decor_array.delete(LevelDisplay.current_element)
            self.spawned_wall_array.delete(LevelDisplay.current_element)
            self.spawned_climbeable_array.delete(LevelDisplay.current_element)
            self.spawned_teleport_array.delete(LevelDisplay.current_element)
            WhackeableObject::WhackeableObjectsMethods.spawned_whackeable_object_array.delete(LevelDisplay.current_element)
        end
    end
    class LevelDisplay 
    class_property current_element : (LevelElements::LevelElementBase) = 
    Platforms::Natural_Platform.very_small_grassy_platform

    #this stupid little motherfucker couldn't find a class variable if its dumbass life depended on it, so the little bastard will just have to be nill for now 
    class_property current_parallax : LevelElements::ParallaxBase | Nil = nil #Parallax::ParallaxSky.sunset_01
    current_parallax = Parallax::ParallaxMethods.change_parallax(LevelEditor::LevelEditorLogic.current_parallax_index, "right")

     class_property view_center : SF::Vector2f = SF::Vector2f.new(350, 300)
     class_property move_speed : Float32 = 1.0
     class_property zoom_level : Float32 = 1.0
     class_property selector_rectangle : SF::RectangleShape = SF::RectangleShape.new(SF::Vector2f.new(50, 50))
     
     def LevelDisplay.move_view(window, x : Float32, y : Float32)
        view_center.x += x
        view_center.y += y
        self.view_center = SF::Vector2f.new(view_center.x + x, view_center.y + y)
        view = window.view
        view.center = view_center
        window.view = view
     end
     def LevelDisplay.zoom_view(window, zoom_factor : Float32)
        self.zoom_level += zoom_factor
        view = window.view
        self.zoom_level = zoom_level
        view.zoom(zoom_level)
        window.view = view
     end
     def LevelDisplay.draw_level(window)
        window.view = window.default_view
        window.view.center = view_center
        window.view.zoom(zoom_level)
            current_size = window.size
            original_width = 800 
            original_height = 600
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
    
            scale_ratio = [scale_x, scale_y].min

        self.current_element.sprite.position = SF::Vector2f.new(current_element.x, current_element.y)

        self.selector_rectangle.size = (SF::Vector2f.new(current_element.sprite.global_bounds.width * scale_ratio,
        current_element.sprite.global_bounds.height * scale_ratio))
        self.selector_rectangle.position = current_element.sprite.position
        self.selector_rectangle.fill_color = SF::Color.new(0, 0, 255, 80)

        if self.current_parallax == nil
            self.current_parallax = Parallax::ParallaxMethods.change_parallax(LevelEditor::LevelEditorLogic.current_parallax_index, "right")
        else
            parallax_sprite = self.current_parallax.as(LevelElements::ParallaxBase).sprite
            parallax = self.current_parallax.as(LevelElements::ParallaxBase)
            parallax_sprite.position = SF.vector2(parallax.x, parallax.y)
            window.draw(self.current_parallax.as(LevelElements::ParallaxBase).sprite)
        end

        LevelEditor::LevelEditorLogic.spawned_decor_array.each do |decor|
            if decor.layer == 0
            decor.sprite.position = SF::Vector2f.new(decor.x, decor.y)
            window.draw(decor.sprite)
            end
        end
        LevelEditor::LevelEditorLogic.spawned_platform_array.each do |platform|
            platform.sprite.position = SF::Vector2f.new(platform.x, platform.y)
            window.draw(platform.sprite)
        end
        LevelEditor::LevelEditorLogic.spawned_decor_array.each do |decor|
            if decor.layer == 1
            decor.sprite.position = SF::Vector2f.new(decor.x, decor.y)
            window.draw(decor.sprite)
            end
        end
        LevelEditor::LevelEditorLogic.spawned_wall_array.each do |wall|
            wall.sprite.position = SF::Vector2f.new(wall.x, wall.y)
            window.draw(wall.sprite)
        end
        WhackeableObject::WhackeableObjectsMethods.spawned_whackeable_object_array.each do |whackeable|
            whackeable.sprite.position = SF::Vector2f.new(whackeable.x, whackeable.y)
            window.draw(whackeable.sprite)
        end
        LevelEditor::LevelEditorLogic.spawned_climbeable_array.each do |climbeable|
            climbeable.sprite.position = SF::Vector2f.new(climbeable.x, climbeable.y)
            window.draw(climbeable.sprite)
        end
        LevelEditor::LevelEditorLogic.spawned_decor_array.each do |decor|
            if decor.layer == 2
            decor.sprite.position = SF::Vector2f.new(decor.x, decor.y)
            window.draw(decor.sprite)
            end
        end
        LevelEditor::LevelEditorLogic.spawned_teleport_array.each do |teleporter|
            teleporter.sprite.position = SF::Vector2f.new(teleporter.x, teleporter.y)
            teleporter.sprite.texture_rect = Animations::Portal.portal_animation
            window.draw(teleporter.sprite)
        end
        window.draw(selector_rectangle)
        current_element.sprite.position = SF::Vector2f.new(current_element.x, current_element.y)
        selector_rectangle = SF::RectangleShape.new(SF::Vector2f.new(current_element.sprite.global_bounds.width * scale_ratio,
        current_element.sprite.global_bounds.height * scale_ratio))
        selector_rectangle.position = current_element.sprite.position
        if SF::Mouse.button_pressed?(SF::Mouse::Left)
            LevelEditorLogic.left_mouse_button_handling(window)
        end
        if SF::Mouse.button_pressed?(SF::Mouse::Right)
            LevelEditorLogic.right_mouse_button_handling(window)
            sleep 0.15.seconds
        end
        if SF::Mouse.button_pressed?(SF::Mouse::Middle)
            LevelEditorLogic.middle_mouse_button_handling(window)
        end
     end
    end
end