require "crsfml"
require "../../src/textures.cr"
require "../../src/fonts.cr"
require "../../src/ui_elements.cr"
require "../../src/mouse.cr"
require "../../src/sprites.cr"
require "../menus/save_menu.cr"
require "../menus/main_menu.cr"
require "../menus/debug_menu.cr"

module SettingsMenu
    class SettingsMenuElements
        BACK_BUTTON = Ui_Elements::MenuBoxes.new("Back Button", "Settings1", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(0, 100, 115, 40)), 115.0, 40.0, 1)
        BACK_BUTTON_TEXT = Ui_Elements::MenuText.new("Back Button Text", "Settings2", SF::Text.new("Back", QUICKSAND, 28))

        DEBUG_BUTTON = Ui_Elements::MenuBoxes.new("Debug Button", "Settings3", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(600, 0, 100, 50)), 100.0, 50.0, 1)
        DEBUG_BUTTON_TEXT = Ui_Elements::MenuText.new("Debug Button Text", "Settings4", SF::Text.new("Debug", QUICKSAND, 25))

        THEMES_BUTTON = Ui_Elements::MenuBoxes.new("Themes Button", "Settings5", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(600, 0, 100, 50)), 100.0, 50.0, 1)
        THEMES_BUTTON_TEXT = Ui_Elements::MenuText.new("Themes Button Text", "Settings6", SF::Text.new("Themes", QUICKSAND, 25))
    end
    class SettingsMenuDisplay
        def self.initialize_settings_menu(window)
            current_size = window.size
            original_width = 800 
            original_height = 600
        
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
    
            SettingsMenuElements::BACK_BUTTON.sprite.position = SF.vector2(scale_x + 20, scale_y + 540)
            SettingsMenuElements::BACK_BUTTON_TEXT.text.position = SettingsMenuElements::BACK_BUTTON.sprite.position + SF.vector2(28, 1)
    
            SettingsMenuElements::DEBUG_BUTTON.sprite.position = SF.vector2(scale_x + 50, scale_y + 20)
            SettingsMenuElements::DEBUG_BUTTON_TEXT.text.position = SettingsMenuElements::DEBUG_BUTTON.sprite.position + SF.vector2(8, 8)

            SettingsMenuElements::THEMES_BUTTON.sprite.position = SF.vector2(scale_x + 175, scale_y + 20)
            SettingsMenuElements::THEMES_BUTTON_TEXT.text.position = SettingsMenuElements::THEMES_BUTTON.sprite.position + SF.vector2(4, 8)
         end
         def self.draw_settings_menu(window)
            window.draw(SettingsMenuElements::BACK_BUTTON.sprite)
            window.draw(SettingsMenuElements::BACK_BUTTON_TEXT.text)
            window.draw(SettingsMenuElements::DEBUG_BUTTON.sprite)
            window.draw(SettingsMenuElements::DEBUG_BUTTON_TEXT.text)
            window.draw(SettingsMenuElements::THEMES_BUTTON.sprite)
            window.draw(SettingsMenuElements::THEMES_BUTTON_TEXT.text)
            if SF::Mouse.button_pressed?(SF::Mouse::Left)
                SettingsMenuMouseHandling.settings_menu_mouse_handling(window)
            end
         end
    end
    class SettingsMenuMouseHandling
        def self.settings_menu_mouse_handling(window)
            mouse_position = SF::Mouse.get_position(window)
            mouse_x = mouse_position.x
            mouse_y = mouse_position.y
    
            current_size = window.size
            original_width = 800
            original_height = 600
        
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
        
            scaled_mouse_x = mouse_x / scale_x
            scaled_mouse_y = mouse_y / scale_y

            if MouseHandling::ClickHandling.button_clicked?(SettingsMenuElements::BACK_BUTTON.sprite, scaled_mouse_x, scaled_mouse_y)
                MenuHandling::Menu.current_menu = "main_menu"
                sleep 0.15.seconds
            elsif MouseHandling::ClickHandling.button_clicked?(SettingsMenuElements::DEBUG_BUTTON.sprite, scaled_mouse_x, scaled_mouse_y)
                DebugMenu::DebugMenuDisplay.initialize_debug_menu(window)
                MenuHandling::Menu.current_menu = "debug"
                sleep 0.15.seconds
            elsif MouseHandling::ClickHandling.button_clicked?(SettingsMenuElements::THEMES_BUTTON.sprite, scaled_mouse_x, scaled_mouse_y)
                puts "themes"
                sleep 0.15.seconds
            end
         end
    end
end