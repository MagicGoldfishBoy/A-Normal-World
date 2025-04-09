require "crsfml"
require "../../src/textures.cr"
require "../../src/fonts.cr"
require "../../src/ui_elements.cr"
require "../menus/menu_handling.cr"
require "../gui/gameplay_gui.cr"

module HudWindow
 class HudWindowElements

    HUD_WINDOW_BOX = Ui_Elements::WindowBoxes.new("Hud Window Box", "HudMen1", SF::Sprite.new(BLANK_TEXTURE, 
    SF::Rect.new(200, 800, 120, 176)), 120.0, 176.0, 3)

    HUD_WINDOW_SAVE_BOX = Ui_Elements::WindowBoxes.new("Hud Window Save Box", "HudMen2", SF::Sprite.new(BLANK_TEXTURE, 
    SF::Rect.new(200, 100, 116, 40)), 116.0, 40.0, 1)

    HUD_WINDOW_QUIT_BOX = Ui_Elements::WindowBoxes.new("Hud Window Quit Box", "HudMen3", SF::Sprite.new(BLANK_TEXTURE, 
    SF::Rect.new(200, 100, 116, 40)), 116.0, 40.0, 1)

    HUD_WINDOW_STATS_BOX = Ui_Elements::WindowBoxes.new("Hud Window Stats Box", "HudMen4", SF::Sprite.new(BLANK_TEXTURE, 
    SF::Rect.new(200, 100, 116, 40)), 116.0, 40.0, 1)

    HUD_WINDOW_SETTINGS_BOX = Ui_Elements::WindowBoxes.new("Hud Window Settings Box", "HudMen5", SF::Sprite.new(
    BLANK_TEXTURE, SF::Rect.new(200, 100, 116, 40)), 116.0, 40.0, 1)

    HUD_WINDOW_SAVE_TEXT = Ui_Elements::WindowText.new("Hud Window Save Text", "HudMen1", SF::Text.new("Save", QUICKSAND, 24))
    HUD_WINDOW_QUIT_TEXT = Ui_Elements::WindowText.new("Hud Window Quit Text", "HudMen2", SF::Text.new("Save & Quit", QUICKSAND, 20))
    HUD_WINDOW_STATS_TEXT = Ui_Elements::WindowText.new("Hud Window Stats Text", "HudMen3", SF::Text.new("Stats", QUICKSAND, 24))
    HUD_WINDOW_SETTINGS_TEXT = Ui_Elements::WindowText.new("Hud Window Settings Text", "HudMen4", SF::Text.new("Settings", QUICKSAND, 24))

    def self.position_hud_window_elements(window)
        current_size = window.size
        original_width = 800 
        original_height = 600
        scale_x = current_size.x.to_f / original_width
        scale_y = current_size.y.to_f / original_height
        window_width = current_size.x.to_f
        window_height = current_size.y.to_f
        scale_ratio = [scale_x, scale_y].min

        max_scale = 1.5
        clamped_scale = [scale_ratio, max_scale].min
        window_size = window.size
        hud_view = SF::View.new(SF::FloatRect.new(0_f32, window_size.y.to_f32 / 2_f32, window_size.x.to_f32, window_size.y.to_f32 / 2_f32))
        hud_view.viewport = SF::FloatRect.new(0_f32, 0.5_f32, 1_f32, 0.5_f32)
        window.view = hud_view

          HudWindowElements::HUD_WINDOW_BOX.sprite.position = GameplayGui::GameplayGuiElements::MENU_BOX.sprite.position + SF.vector2(-2.75 * clamped_scale, -GameplayGui::GameplayGuiElements::MENU_BOX.height * clamped_scale * 4.25)
          HudWindowElements::HUD_WINDOW_BOX.sprite.scale = SF.vector2(scale_x - clamped_scale * 0.005, scale_ratio)
              
          HudWindowElements::HUD_WINDOW_SAVE_BOX.sprite.position = HudWindowElements::HUD_WINDOW_BOX.sprite.position + SF.vector2(2 * clamped_scale, 2 * clamped_scale)
          HudWindowElements::HUD_WINDOW_SAVE_BOX.sprite.scale = SF.vector2(scale_x, clamped_scale)

          HudWindowElements::HUD_WINDOW_SAVE_TEXT.text.position = HudWindowElements::HUD_WINDOW_SAVE_BOX.sprite.position + SF.vector2((40 * (scale_x - 0.25)), 2 * clamped_scale)
          HudWindowElements::HUD_WINDOW_SAVE_TEXT.text.scale = SF.vector2(clamped_scale, clamped_scale)
              

          HudWindowElements::HUD_WINDOW_QUIT_BOX.sprite.position = HudWindowElements::HUD_WINDOW_SAVE_BOX.sprite.position + SF.vector2(0, 44 * clamped_scale)
          HudWindowElements::HUD_WINDOW_QUIT_BOX.sprite.scale = SF.vector2(scale_x, clamped_scale)

          HudWindowElements::HUD_WINDOW_QUIT_TEXT.text.position = HudWindowElements::HUD_WINDOW_QUIT_BOX.sprite.position + SF.vector2(18 * (scale_x * scale_ratio), 6 * clamped_scale)
          HudWindowElements::HUD_WINDOW_QUIT_TEXT.text.scale = SF.vector2(clamped_scale - 0.25, clamped_scale)
              

          HudWindowElements::HUD_WINDOW_STATS_BOX.sprite.position = HudWindowElements::HUD_WINDOW_QUIT_BOX.sprite.position + SF.vector2(0, 44 * clamped_scale)
          HudWindowElements::HUD_WINDOW_STATS_BOX.sprite.scale = SF.vector2(scale_x, clamped_scale)

          HudWindowElements::HUD_WINDOW_STATS_TEXT.text.position = HudWindowElements::HUD_WINDOW_STATS_BOX.sprite.position + SF.vector2((40 * (scale_x - 0.25)), 2 * clamped_scale)
          HudWindowElements::HUD_WINDOW_STATS_TEXT.text.scale = SF.vector2(clamped_scale, clamped_scale)


          HudWindowElements::HUD_WINDOW_SETTINGS_BOX.sprite.position = HudWindowElements::HUD_WINDOW_STATS_BOX.sprite.position + SF.vector2(0, 44 * clamped_scale)
          HudWindowElements::HUD_WINDOW_SETTINGS_BOX.sprite.scale = SF.vector2(scale_x, clamped_scale)

          HudWindowElements::HUD_WINDOW_SETTINGS_TEXT.text.position = HudWindowElements::HUD_WINDOW_SETTINGS_BOX.sprite.position + SF.vector2((15 * (scale_x * clamped_scale * scale_ratio)), 2 * clamped_scale)
          HudWindowElements::HUD_WINDOW_SETTINGS_TEXT.text.scale = SF.vector2(clamped_scale, clamped_scale)

    end


 end
 class HudWindowDisplay

    def self.draw_hud_window(window)
        if SF::Event::Resized
            current_size = window.size
            original_width = 800 
            original_height = 600
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
    
            scale_ratio = [scale_x, scale_y].min
            HudWindowElements.position_hud_window_elements(window)
        end
        window.draw(HudWindowElements::HUD_WINDOW_BOX.sprite)

        window.draw(HudWindowElements::HUD_WINDOW_SAVE_BOX.sprite)
        window.draw(HudWindowElements::HUD_WINDOW_SAVE_TEXT.text)

        window.draw(HudWindowElements::HUD_WINDOW_QUIT_BOX.sprite)
        window.draw(HudWindowElements::HUD_WINDOW_QUIT_TEXT.text)

        window.draw(HudWindowElements::HUD_WINDOW_STATS_BOX.sprite)
        window.draw(HudWindowElements::HUD_WINDOW_STATS_TEXT.text)

        window.draw(HudWindowElements::HUD_WINDOW_SETTINGS_BOX.sprite)
        window.draw(HudWindowElements::HUD_WINDOW_SETTINGS_TEXT.text)
        if SF::Mouse.button_pressed?(SF::Mouse::Left)
            HudWindowMouseHandling.hud_window_mouse_handling(window)
        end
    end
 end
 class HudWindowMouseHandling
    def self.hud_window_mouse_handling(window)
            window_size = window.size
            hud_view = SF::View.new(SF::FloatRect.new(0_f32, window_size.y.to_f32 / 2_f32, window_size.x.to_f32, window_size.y.to_f32 / 2_f32))
            hud_view.viewport = SF::FloatRect.new(0_f32, 0.5_f32, 1_f32, 0.5_f32)
            window.view = hud_view
            mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window), window.view)
            mouse_x = mouse_position.x
            mouse_y = mouse_position.y
        
            original_width = 800
            original_height = 600
        
            scale_x = window.view.size.x / original_width
            scale_y = window.view.size.y / original_height
        
            scaled_mouse_x = (mouse_x + window_size.x * window.view.viewport.left) * scale_x
            scaled_mouse_y = (mouse_y + window_size.y * window.view.viewport.top) * scale_y
        
        if MouseHandling::ClickHandling.button_clicked?(HudWindowElements::HUD_WINDOW_SAVE_BOX.sprite, scaled_mouse_x, scaled_mouse_y)
           Serialization::SaveFile.normal_save
           puts "save"
           sleep 0.15.seconds
        end
        #     elsif (scaled_mouse_x >= menu_box_3_x && scaled_mouse_x <= menu_box_3_x + menu_box_3_width) &&
        #           (scaled_mouse_y >= menu_box_3_y && scaled_mouse_y <= menu_box_3_y + menu_box_3_height)
        #         Serialization::SaveFile.normal_save
        #         sleep 0.15.seconds 
        #         window.close
        
        #     elsif (scaled_mouse_x >= menu_box_4_x && scaled_mouse_x <= menu_box_4_x + menu_box_4_width) &&
        #           (scaled_mouse_y >= menu_box_4_y && scaled_mouse_y <= menu_box_4_y + menu_box_4_height)
        #         Windows.is_stats_menu_open = !Windows.is_stats_menu_open
        #         sleep 0.15.seconds

        #     elsif (scaled_mouse_x >= menu_box_5_x && scaled_mouse_x <= menu_box_5_x + menu_box_5_width) &&
        #           (scaled_mouse_y >= menu_box_5_y && scaled_mouse_y <= menu_box_5_y + menu_box_5_height)
        #           puts "settings"
        #         #Settings::SettingsMenu.is_settings_menu_open = !Settings::SettingsMenu.is_settings_menu_open
        #         sleep 0.15.seconds
        
         end
    end
end