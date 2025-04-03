require "crsfml"
require "../src/textures.cr"
require "../src/level_elements.cr"
require "../src/platforms.cr"

module LevelEditor 
    class LevelEditorLogic
        class_property current_element_index : Int32 = 0
        class_property current_element_type : String = "Platform"
        class_property element_array : Array(String) = ["Platform", "Decor"]

        class_property current_platform_index : Int32 = 0
        class_property spawned_platform_index : Int32 = 0
        class_property spawned_platform_array : Array(LevelElements::PlatformBase) = [] of LevelElements::PlatformBase
        class_property platform_number : Int32 = 1
        class_property current_template : (LevelElements::PlatformBase | LevelElements::DecorBase) = Platforms::Natural_Platform.very_small_grassy_platform


        def LevelEditorLogic.spawn_element(window)
            if current_platform_index < 0 || current_platform_index >= LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY.size
                puts "Error: current_platform_index #{current_platform_index} is out of bounds."
                return
            end
            
            current_platform = LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY[LevelEditor::LevelEditorLogic.current_platform_index]
            name = "Platform_#{platform_number}"
            platform = LevelElements::PlatformBase.new(
                name,
                current_platform.id,
                current_platform.x,
                current_platform.y,
                LevelElements::PlatformBase::PLATFORM_SPRITE_HASH[current_platform.id].dup,
                current_platform.can_jump_down
            )
            platform.sprite.position = SF::Vector2f.new(platform.x, platform.y)
            LevelElements::PlatformBase.current_platform_array << platform
            spawned_platform_array << platform
            LevelDisplay.current_element = platform
            self.platform_number += 1
        end
        def LevelEditorLogic.set_current_element(platform)
            LevelDisplay.current_element = platform
        end
        def LevelEditorLogic.mouse_handling(window)
            mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window), window.view)
            bounding_box_size = 50.0
            LevelEditor::LevelEditorLogic.spawned_platform_array.select do |platform|
                (platform.x - mouse_position.x).abs <= bounding_box_size &&
                (platform.y - mouse_position.y).abs <= bounding_box_size
            end.each do |platform|
                if platform.sprite.global_bounds.contains?(mouse_position.x, mouse_position.y)
                    platform.x = mouse_position.x.to_f32 - platform.sprite.global_bounds.width / 2
                    platform.y = mouse_position.y.to_f32 - platform.sprite.global_bounds.height / 2
                    platform.sprite.position = SF::Vector2f.new(platform.x, platform.y)
                    LevelDisplay.current_element = platform
                    window.draw(platform.sprite)
                end
            end
        end

        def LevelEditorLogic.move_current_element(window, x : Float32, y : Float32)
            current_element = LevelDisplay.current_element
            current_element.x += x
            current_element.y += y
            current_element.sprite.position = SF::Vector2f.new(current_element.x, current_element.y)
        end
    end
    class LevelDisplay 
     class_property current_element : (LevelElements::PlatformBase | LevelElements::DecorBase) = 
     Platforms::Natural_Platform.very_small_grassy_platform
     class_property view_center : SF::Vector2f = SF::Vector2f.new(350, 300)
     class_property move_speed : Float32 = 5.0
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
        self.selector_rectangle.fill_color = SF::Color.new(0, 0, 255, 100)
        LevelEditor::LevelEditorLogic.spawned_platform_array.each do |platform|
            platform.sprite.position = SF::Vector2f.new(platform.x, platform.y)
            window.draw(selector_rectangle)
            window.draw(platform.sprite)
        end
        current_element.sprite.position = SF::Vector2f.new(current_element.x, current_element.y)
        selector_rectangle = SF::RectangleShape.new(SF::Vector2f.new(current_element.sprite.global_bounds.width * scale_ratio,
        current_element.sprite.global_bounds.height * scale_ratio))
        selector_rectangle.position = current_element.sprite.position
        if SF::Mouse.button_pressed?(SF::Mouse::Left)
            LevelEditorLogic.mouse_handling(window)
        end
     end
    end
end