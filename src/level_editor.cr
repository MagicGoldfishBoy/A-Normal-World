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
            platform = LevelElements::PlatformBase.new(current_platform.name, current_platform.x, 
            current_platform.y, current_platform.sprite.dup, current_platform.can_jump_down)
            LevelElements::PlatformBase.current_platform_array << platform
        end
        def LevelEditorLogic.mouse_handling(window)
        LevelElements::PlatformBase.current_platform_array.each do |platform|
                mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window), window.view)
                if platform.sprite.global_bounds.contains?(mouse_position.x, mouse_position.y)
                    platform.x = mouse_position.x.to_f32 - 10
                    platform.y = mouse_position.y.to_f32 - 10
                    platform.sprite.position = SF::Vector2f.new(platform.x, platform.y)
                    window.draw(platform.sprite)
                end
        end
    end
   end
    class LevelDisplay

     class_property current_element : LevelElements::PlatformBase = Platforms::Natural_Platform.very_small_grassy_platform
     def LevelDisplay.draw_level(window)
        window.view = window.default_view
            current_size = window.size
            original_width = 800 
            original_height = 600
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
    
            scale_ratio = [scale_x, scale_y].min
        
        current_element.sprite.position = SF::Vector2f.new(100, 100)
        #window.draw(current_element.sprite)
        LevelElements::PlatformBase.current_platform_array.each do |platform|
            #platform.sprite.scale(scale_ratio, scale_ratio)
            platform.sprite.position = SF::Vector2f.new(platform.x, platform.y)
            window.draw(platform.sprite)
        end
        if SF::Mouse.button_pressed?(SF::Mouse::Left)
            LevelEditorLogic.mouse_handling(window)
        end
     end
    end
end