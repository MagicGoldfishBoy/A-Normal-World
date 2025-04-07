require "crsfml"
require "../../src/textures.cr"
require "../../src/fonts.cr"
require "../../src/ui_elements.cr"
require "../../src/mouse.cr"

module MainMenu
    class MainMenuElements
        PLAY_BUTTON = Ui_Elements::MenuBoxes.new("Play Button", "Main1", SF::Sprite.new(BLANK_TEXTURE, 
        SF::Rect.new(0, 0, 150, 80)), 150.0, 80.0, 1)

        PLAY_BUTTON_TEXT = Ui_Elements::MenuText.new("Play Button Text", "Main1", 
        SF::Text.new("Play                    Settings                    Quit", QUICKSAND, 34))

        BACK_BUTTON = Ui_Elements::MenuBoxes.new("Back Button", "Main2", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 100, 115, 40)), 115.0, 40.0, 1)
        SETTINGS_BUTTON = Ui_Elements::MenuBoxes.new("Settings Button", "Main3", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(200, 0, 200, 80)), 200.0, 80.0, 1)
        QUIT_BUTTON = Ui_Elements::MenuBoxes.new("Quit Button", "Main4", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 0, 150, 80)), 150.0, 80.0, 1)
        NEXT_BUTTON = Ui_Elements::MenuBoxes.new("Next Button", "Main5", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 140, 115, 40)), 115.0, 40.0, 1)
    end
    class MainMenuDisplay
        def self.draw_main_menu(window)
            current_size = window.size
            original_width = 800 
            original_height = 600
        
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
    
            MainMenuElements::PLAY_BUTTON.sprite.position = SF.vector2(scale_x + 50, scale_y + 300)
            MainMenuElements::PLAY_BUTTON_TEXT.text.position = MainMenuElements::PLAY_BUTTON.sprite.position + SF.vector2(35, 15)
    
            Ui_Elements::MenuBoxes::SETTINGS_BUTTON.sprite.position = MainMenuElements::PLAY_BUTTON.sprite.position + SF.vector2(250, 0)
            Ui_Elements::MenuText::TITLE_TEXT.text.position = SF.vector2(200, 100)
    
            Ui_Elements::MenuBoxes::QUIT_BUTTON.sprite.position = Ui_Elements::MenuBoxes::SETTINGS_BUTTON.sprite.position + SF.vector2(300, 0)
    
            window.draw(MainMenuElements::PLAY_BUTTON.sprite)
            window.draw(Ui_Elements::MenuBoxes::SETTINGS_BUTTON.sprite)
            window.draw(Ui_Elements::MenuBoxes::QUIT_BUTTON.sprite)
            window.draw(MainMenuElements::PLAY_BUTTON_TEXT.text)
            window.draw(Ui_Elements::MenuText::TITLE_TEXT.text)
            if SF::Mouse.button_pressed?(SF::Mouse::Left)
                MainMenuMouseHandling.main_menu_mouse_handling(window)
            end
         end
    end
    class MainMenuMouseHandling
        def self.main_menu_mouse_handling(window)
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

            if MouseHandling::ClickHandling.button_clicked?(MainMenuElements::PLAY_BUTTON.sprite, scaled_mouse_x, scaled_mouse_y)
                Menus::SystemMenus.initialize_save_menu(window)
                MenuHandling::Menu.current_menu = "save_menu"
            elsif MouseHandling::ClickHandling.button_clicked?(Ui_Elements::MenuBoxes::SETTINGS_BUTTON.sprite, scaled_mouse_x, scaled_mouse_y)
                Menus::SystemMenus.initialize_settings_menu(window)
                MenuHandling::Menu.current_menu = "settings_menu"
            elsif MouseHandling::ClickHandling.button_clicked?(Ui_Elements::MenuBoxes::QUIT_BUTTON.sprite, scaled_mouse_x, scaled_mouse_y)
                window.close
            end
         end
    end
end