require "crsfml"
require "../src/textures.cr"
require "../src/level_elements.cr"
require "../src/platforms.cr"

module LevelEditor
    class LevelEditorLogic
        class_property current_platform_index : Int32 = 0
        def LevelEditorLogic.spawn_platform(window)
            current_platform = LevelElements::PlatformBase.get_platforms[current_platform_index]
            current_platform.sprite.position = SF::Vector2f.new(100, 100)
            LevelElements::PlatformBase.current_platform_array << current_platform
        end
        def LevelEditorLogic.mouse_handling(window)
        LevelElements::PlatformBase.current_platform_array.each do |platform|
            if SF::Mouse.button_pressed?(SF::Mouse::Left)
                mouse_position = SF::Mouse.get_position(window)
                if platform.sprite.global_bounds.contains?(mouse_position.x, mouse_position.y)
                    platform.x = mouse_position.x.to_f32 - 10
                    platform.y = mouse_position.y.to_f32 - 10
                    platform.sprite.position = SF::Vector2f.new(platform.x, platform.y)
                    window.draw(platform.sprite)
                end
            end
        end
    end
   end
    class LevelDisplay

     class_property current_element : LevelElements::PlatformBase = Platforms::Natural_Platform.very_small_grassy_platform
     def LevelDisplay.draw_level(window)
        scale_ratio = 1.0
        if SF::Event::Resized
            current_size = window.size
            original_width = 800 
            original_height = 600
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
    
            scale_ratio = [scale_x, scale_y].min
        end
        window.view = window.default_view
        current_element.sprite.position = SF::Vector2f.new(100, 100)
        #window.draw(current_element.sprite)
        LevelElements::PlatformBase.current_platform_array.each do |platform|
            platform.sprite.scale(scale_ratio, scale_ratio)
            platform.sprite.position = SF::Vector2f.new(platform.x, platform.y)
            window.draw(platform.sprite)
        end
        if SF::Mouse.button_pressed?(SF::Mouse::Left)
            LevelEditorLogic.mouse_handling(window)
        end
     end
    end
end