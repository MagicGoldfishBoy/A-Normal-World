require "crsfml"
require "../../src/textures.cr"
require "../../src/fonts.cr"
require "../../src/ui_elements.cr"
require "../menus/menu_handling.cr"

module DecorWindow
    class DecorWindowElements

        DECOR_WINDOW_BOX = Ui_Elements::WindowBoxes.new("Decor Window Box", "DecElement1", SF::Sprite.new(BLANK_TEXTURE,
        SF::Rect.new(1100, 0, 100, 200)), 0.0, 0.0, 3)

        DECOR_EXIT_BUTTON = Ui_Elements::WindowBoxes.new("Decor Exit Button", "DecElement2", SF::Sprite.new(BLANK_TEXTURE,
        SF::Rect.new(1200, 0, 9, 9)), 0.0, 0.0, 4)

    end
    class DecorWindowDisplay
        def self.draw_decor_window(window)
            if SF::Event::Resized
                current_size = window.size
                original_width = 800 
                original_height = 600
                scale_x = current_size.x.to_f / original_width
                scale_y = current_size.y.to_f / original_height
                max_scale = 5
                scale_ratio = [scale_x, scale_y].min
                clamped_scale = [scale_ratio, max_scale].min

                DecorWindowElements::DECOR_WINDOW_BOX.sprite.scale = SF.vector2(clamped_scale, clamped_scale)

                new_position_x = (current_size.x - (DecorWindowElements::DECOR_WINDOW_BOX.width * clamped_scale)) / 2
                new_position_y = (current_size.y - (DecorWindowElements::DECOR_WINDOW_BOX.height * clamped_scale)) / 2
                DecorWindowElements::DECOR_WINDOW_BOX.sprite.position = SF.vector2(new_position_x, new_position_y)

                DecorWindowElements::DECOR_EXIT_BUTTON.sprite.scale = DecorWindowElements::DECOR_WINDOW_BOX.sprite.scale

                DecorWindowElements::DECOR_EXIT_BUTTON.sprite.position = DecorWindowElements::DECOR_WINDOW_BOX.sprite.position + SF.vector2(
                DecorWindowElements::DECOR_WINDOW_BOX.sprite.global_bounds.width - 12 * clamped_scale, 2 * clamped_scale)
            end

            window.draw(DecorWindowElements::DECOR_WINDOW_BOX.sprite)
            window.draw(DecorWindowElements::DECOR_EXIT_BUTTON.sprite)

            if SF::Mouse.button_pressed?(SF::Mouse::Left)
                DecorWindowMouseHandling.decor_window_mouse_handling(window)
            end
        end
    end
    class DecorWindowMouseHandling
        def self.decor_window_mouse_handling(window)

            window_size = window.size
            hud_view = SF::View.new(SF::FloatRect.new(0_f32, window_size.y.to_f32 / 2_f32, window_size.x.to_f32, window_size.y.to_f32 / 2_f32))
            hud_view.viewport = SF::FloatRect.new(0_f32, 0.5_f32, 1_f32, 0.5_f32)
            window.view = hud_view
            mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window), window.view)

            mouse_x = mouse_position.x
            mouse_y = mouse_position.y

            current_size = window.size
            original_width = 800
            original_height = 600
        
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
        
            scaled_mouse_x = mouse_x / scale_x
            scaled_mouse_y = mouse_y / scale_y
        
        if MouseHandling::ClickHandling.button_clicked?(DecorWindowElements::DECOR_EXIT_BUTTON.sprite, mouse_x, mouse_y)
            MenuHandling::Window.is_decor_window_open = false
           sleep 0.15.seconds
        end
    end
    end
end