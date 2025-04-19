require "crsfml"
require "../../src/textures.cr"
require "../../src/fonts.cr"
require "../../src/ui_elements.cr"
require "../menus/menu_handling.cr"

module DecorWindow
    class DecorWindowElements

        DECOR_WINDOW_BOX = Ui_Elements::WindowBoxes.new("Decor Window Box", "DecElement1", SF::Sprite.new(BLANK_TEXTURE,
        SF::Rect.new(1100, 0, 100, 200)), 0.0, 0.0, 3)

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
            end

            window.draw(DecorWindowElements::DECOR_WINDOW_BOX.sprite)

            if SF::Mouse.button_pressed?(SF::Mouse::Left)
               # HudWindowMouseHandling.hud_window_mouse_handling(window)
            end
        end
    end
    class DecorWindowMouseHandling
    end
end