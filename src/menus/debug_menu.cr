require "crsfml"
require "../../src/textures.cr"
require "../../src/fonts.cr"
require "../../src/ui_elements.cr"
require "../../src/mouse.cr"
require "../../src/keyboard.cr"
require "../../src/sprites.cr"
require "../menus/save_menu.cr"
require "../menus/main_menu.cr"
require "../menus/settings_menu.cr"

module DebugMenu
    class DebugMenuElements
        BACK_BUTTON = Ui_Elements::MenuBoxes.new("Back Button", "Debug1", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(0, 100, 115, 40)), 115.0, 40.0, 1)
        BACK_BUTTON_TEXT = Ui_Elements::MenuText.new("Back Button Text", "Debug2", SF::Text.new("Back", QUICKSAND, 28))

        LEVEL_EDITOR_BUTTON = Ui_Elements::MenuBoxes.new("Level Editor Button", "Debug3", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(700, 0, 155, 50)), 155.0, 50.0, 1)
        LEVEL_EDITOR_BUTTON_TEXT = Ui_Elements::MenuText.new("Level Editor Button Text", "Debug4", SF::Text.new("Level Editor", QUICKSAND, 25))
    end
    class DebugMenuDisplay
        def self.initialize_debug_menu(window)
            current_size = window.size
            original_width = 800 
            original_height = 600
        
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
    
            DebugMenuElements::BACK_BUTTON.sprite.position = SF.vector2(scale_x + 20, scale_y + 540)
            DebugMenuElements::BACK_BUTTON_TEXT.text.position = DebugMenuElements::BACK_BUTTON.sprite.position + SF.vector2(28, 1)
    
            DebugMenuElements::LEVEL_EDITOR_BUTTON.sprite.position = SF.vector2(scale_x + 50, scale_y + 20)
            DebugMenuElements::LEVEL_EDITOR_BUTTON_TEXT.text.position = DebugMenuElements::LEVEL_EDITOR_BUTTON.sprite.position + SF.vector2(8, 8)
         end
         def self.draw_debug_menu(window)
            window.draw(DebugMenuElements::BACK_BUTTON.sprite)
            window.draw(DebugMenuElements::BACK_BUTTON_TEXT.text)
            window.draw(DebugMenuElements::LEVEL_EDITOR_BUTTON.sprite)
            window.draw(DebugMenuElements::LEVEL_EDITOR_BUTTON_TEXT.text)
            if SF::Mouse.button_pressed?(SF::Mouse::Left)
                DebugMenuMouseHandling.debug_menu_mouse_handling(window)
            end
         end
    end
    class DebugMenuMouseHandling
        def self.debug_menu_mouse_handling(window)
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

            if MouseHandling::ClickHandling.button_clicked?(DebugMenuElements::LEVEL_EDITOR_BUTTON.sprite, scaled_mouse_x, scaled_mouse_y)
                Keyboard::Gameplay.gameplay_mode=("level_editor")
                MenuHandling::Gui.current_gui = "level_editor_hud"
                MenuHandling::Menu.current_menu = "none"
                LevelEditor::LevelEditorLogic.set_current_index
                LevelEditor::LevelEditorLogic.set_current_array
                sleep 0.15.seconds
            elsif MouseHandling::ClickHandling.button_clicked?(DebugMenuElements::BACK_BUTTON.sprite, scaled_mouse_x, scaled_mouse_y)
                MenuHandling::Menu.current_menu = "settings_menu"
                sleep 0.15.seconds
            end
         end
    end
end