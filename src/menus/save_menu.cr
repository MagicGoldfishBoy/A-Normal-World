require "crsfml"
require "../../src/textures.cr"
require "../../src/fonts.cr"
require "../../src/ui_elements.cr"
require "../../src/mouse.cr"

module SaveMenu
    class SaveMenuElements
        SAVE_MENU_BACK_BUTTON = Ui_Elements::Ui_BoxBase.new("Save Menu Back Button", "Save 1", 
        SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 100, 115, 40)), 115.0, 40.0, 1)
        SAVE_MENU_BACK_BUTTON_TEXT = Ui_Elements::Ui_TextBase.new("Back Button Text", "Save 2", SF::Text.new("Back", 
        QUICKSAND, 28))

        SAVE_BOX_01 = Ui_Elements::Ui_BoxBase.new("Save Box 1", "Save 3", SF::Sprite.new(BLANK_TEXTURE, 
        SF::Rect.new(0, 800, 150, 250)), 150.0, 250.0, 2)
        SAVE_BOX_01_TEXT = Ui_Elements::Ui_TextBase.new("Save Box 1 Text", "Save 4", SF::Text.new("Save 1", 
        QUICKSAND, 25))

        SAVE_BOX_02 = Ui_Elements::Ui_BoxBase.new("Save Box 2", "Save 5", SF::Sprite.new(BLANK_TEXTURE,
        SF::Rect.new(0, 800, 150, 250)), 150.0, 250.0, 2)
        SAVE_BOX_02_TEXT = Ui_Elements::Ui_TextBase.new("Save Box 2 Text", "Save 6", SF::Text.new("Save 2", 
        QUICKSAND, 25))

        SAVE_BOX_03 = Ui_Elements::Ui_BoxBase.new("Save Box 3", "Save 7", SF::Sprite.new(BLANK_TEXTURE,
        SF::Rect.new(0, 800, 150, 250)), 150.0, 250.0, 2)
        SAVE_BOX_03_TEXT = Ui_Elements::Ui_TextBase.new("Save Box 3 Text", "Save 8", SF::Text.new("Save 3", 
        QUICKSAND, 25))

        SAVE_BOX_04 = Ui_Elements::Ui_BoxBase.new("Save Box 4", "Save 9", SF::Sprite.new(BLANK_TEXTURE,
        SF::Rect.new(0, 800, 150, 250)), 150.0, 250.0, 2)
        SAVE_BOX_04_TEXT = Ui_Elements::Ui_TextBase.new("Save Box 4 Text", "Save 10", SF::Text.new("Save 4", 
        QUICKSAND, 25))

        SAVE_BOX_05 = Ui_Elements::Ui_BoxBase.new("Save Box 5", "Save 11", SF::Sprite.new(BLANK_TEXTURE,
        SF::Rect.new(0, 800, 150, 250)), 150.0, 250.0, 2)
        SAVE_BOX_05_TEXT = Ui_Elements::Ui_TextBase.new("Save Box 5 Text", "Save 12", SF::Text.new("Save 5", 
        QUICKSAND, 25))

        SAVE_BOX_06 = Ui_Elements::Ui_BoxBase.new("Save Box 6", "Save 13", SF::Sprite.new(BLANK_TEXTURE,
        SF::Rect.new(0, 800, 150, 250)), 150.0, 250.0, 2)
        SAVE_BOX_06_TEXT = Ui_Elements::Ui_TextBase.new("Save Box 6 Text", "Save 14", SF::Text.new("Save 6", 
        QUICKSAND, 25))

        SAVE_BOX_07 = Ui_Elements::Ui_BoxBase.new("Save Box 7", "Save 15", SF::Sprite.new(BLANK_TEXTURE,
        SF::Rect.new(0, 800, 150, 250)), 150.0, 250.0, 2)
        SAVE_BOX_07_TEXT = Ui_Elements::Ui_TextBase.new("Save Box 7 Text", "Save 16", SF::Text.new("Save 7", 
        QUICKSAND, 25))
    end
    class SaveMenuDislay
        def self.initialize_save_menu(window)
            current_size = window.size
            original_width = 800 
            original_height = 600
        
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
    
            SaveMenuElements::SAVE_MENU_BACK_BUTTON.sprite.position = SF.vector2(scale_x + 20, scale_y + 540)
            SaveMenuElements::SAVE_MENU_BACK_BUTTON_TEXT.text.position = SaveMenuElements::SAVE_MENU_BACK_BUTTON.sprite.position + SF.vector2(28, 1)
    
            SaveMenuElements::SAVE_BOX_01.sprite.position = SF.vector2(scale_x + 50, scale_y + 20)
            SaveMenuElements::SAVE_BOX_01_TEXT.text.position = SaveMenuElements::SAVE_BOX_01.sprite.position + SF.vector2(35, 200)
    
            SaveMenuElements::SAVE_BOX_02.sprite.position = SaveMenuElements::SAVE_BOX_01.sprite.position + SF.vector2(scale_x + 180, scale_y + 0)
            SaveMenuElements::SAVE_BOX_02_TEXT.text.position = SaveMenuElements::SAVE_BOX_02.sprite.position + SF.vector2(35, 200)
    
            SaveMenuElements::SAVE_BOX_03.sprite.position = SaveMenuElements::SAVE_BOX_02.sprite.position + SF.vector2(scale_x + 180, scale_y + 0)
            SaveMenuElements::SAVE_BOX_03_TEXT.text.position = SaveMenuElements::SAVE_BOX_03.sprite.position + SF.vector2(35, 200)
    
            SaveMenuElements::SAVE_BOX_04.sprite.position = SaveMenuElements::SAVE_BOX_03.sprite.position + SF.vector2(scale_x + 180, scale_y + 0)
            SaveMenuElements::SAVE_BOX_04_TEXT.text.position = SaveMenuElements::SAVE_BOX_04.sprite.position + SF.vector2(35, 200)
    
            SaveMenuElements::SAVE_BOX_05.sprite.position = SaveMenuElements::SAVE_BOX_01.sprite.position + SF.vector2(scale_x + 180, scale_y + 300)
            SaveMenuElements::SAVE_BOX_05_TEXT.text.position = SaveMenuElements::SAVE_BOX_05.sprite.position + SF.vector2(35, 200)
    
            SaveMenuElements::SAVE_BOX_06.sprite.position = SaveMenuElements::SAVE_BOX_05.sprite.position + SF.vector2(scale_x + 180, scale_y + 0)
            SaveMenuElements::SAVE_BOX_06_TEXT.text.position = SaveMenuElements::SAVE_BOX_06.sprite.position + SF.vector2(35, 200)
    
            SaveMenuElements::SAVE_BOX_07.sprite.position = SaveMenuElements::SAVE_BOX_06.sprite.position + SF.vector2(scale_x + 180, scale_y + 0)
            SaveMenuElements::SAVE_BOX_07_TEXT.text.position = SaveMenuElements::SAVE_BOX_07.sprite.position + SF.vector2(35, 200)
    
            if !File.exists?("saves/save01")
                SaveMenuElements::SAVE_BOX_01_TEXT.text.string = "Empty"
            else
                SaveMenuElements::SAVE_BOX_01_TEXT.text.string = Serialization::SaveFile.retrieve_data("saves/save01", "name").to_s
                Utility::StringUtilities.center_text(SaveMenuElements::SAVE_BOX_01_TEXT.text)
            end
            if !File.exists?("saves/save02")
                SaveMenuElements::SAVE_BOX_02_TEXT.text.string = "Empty"
            else
                SaveMenuElements::SAVE_BOX_02_TEXT.text.string = Serialization::SaveFile.retrieve_data("saves/save02", "name").to_s
                Utility::StringUtilities.center_text(SaveMenuElements::SAVE_BOX_02_TEXT.text)
            end
            if !File.exists?("saves/save03")
                SaveMenuElements::SAVE_BOX_03_TEXT.text.string = "Empty"
            else
                SaveMenuElements::SAVE_BOX_03_TEXT.text.string = Serialization::SaveFile.retrieve_data("saves/save03", "name").to_s
                Utility::StringUtilities.center_text(SaveMenuElements::SAVE_BOX_03_TEXT.text)
            end
            if !File.exists?("saves/save04")
                SaveMenuElements::SAVE_BOX_04_TEXT.text.string = "Empty"
            else
                SaveMenuElements::SAVE_BOX_04_TEXT.text.string = Serialization::SaveFile.retrieve_data("saves/save04", "name").to_s
                Utility::StringUtilities.center_text(SaveMenuElements::SAVE_BOX_04_TEXT.text)
            end
            if !File.exists?("saves/save05")
                SaveMenuElements::SAVE_BOX_05_TEXT.text.string = "Empty"
            else
                SaveMenuElements::SAVE_BOX_05_TEXT.text.string = Serialization::SaveFile.retrieve_data("saves/save05", "name").to_s
                Utility::StringUtilities.center_text(SaveMenuElements::SAVE_BOX_05_TEXT.text)
            end
            if !File.exists?("saves/save06")
                SaveMenuElements::SAVE_BOX_06_TEXT.text.string = "Empty"
            else
                SaveMenuElements::SAVE_BOX_06_TEXT.text.string = Serialization::SaveFile.retrieve_data("saves/save06", "name").to_s
                Utility::StringUtilities.center_text(SaveMenuElements::SAVE_BOX_06_TEXT.text)
            end
            if !File.exists?("saves/save07")
                SaveMenuElements::SAVE_BOX_07_TEXT.text.string = "Empty"
            else
                SaveMenuElements::SAVE_BOX_07_TEXT.text.string = Serialization::SaveFile.retrieve_data("saves/save07", "name").to_s
                Utility::StringUtilities.center_text(SaveMenuElements::SAVE_BOX_07_TEXT.text)
            end
         end
         def self.draw_save_menu(window)

            window.draw(SaveMenuElements::SAVE_MENU_BACK_BUTTON.sprite)
            window.draw(SaveMenuElements::SAVE_BOX_01.sprite)
            window.draw(SaveMenuElements::SAVE_BOX_02.sprite)
            window.draw(SaveMenuElements::SAVE_BOX_03.sprite)
            window.draw(SaveMenuElements::SAVE_BOX_04.sprite)
            window.draw(SaveMenuElements::SAVE_BOX_05.sprite)
            window.draw(SaveMenuElements::SAVE_BOX_06.sprite)
            window.draw(SaveMenuElements::SAVE_BOX_07.sprite)
    
            window.draw(SaveMenuElements::SAVE_MENU_BACK_BUTTON_TEXT.text)
            window.draw(SaveMenuElements::SAVE_BOX_01_TEXT.text)
            window.draw(SaveMenuElements::SAVE_BOX_02_TEXT.text)
            window.draw(SaveMenuElements::SAVE_BOX_03_TEXT.text)
            window.draw(SaveMenuElements::SAVE_BOX_04_TEXT.text)
            window.draw(SaveMenuElements::SAVE_BOX_05_TEXT.text)
            window.draw(SaveMenuElements::SAVE_BOX_06_TEXT.text)
            window.draw(SaveMenuElements::SAVE_BOX_07_TEXT.text)
            if SF::Mouse.button_pressed?(SF::Mouse::Left)
                #Menus::Menus::SystemMenus.save_menu_mouse_handling(window)
                SaveMenuMouseHandling.save_menu_mouse_handling(window)
            end
         end
    end
    class SaveMenuMouseHandling
        def self.save_menu_mouse_handling(window)
            mouse_position = SF::Mouse.get_position(window)
            mouse_x = mouse_position.x
            mouse_y = mouse_position.y
            menu_box_1_x = SaveMenuElements::SAVE_MENU_BACK_BUTTON.sprite.position.x
            menu_box_1_y = SaveMenuElements::SAVE_MENU_BACK_BUTTON.sprite.position.y
            menu_box_2_x = SaveMenuElements::SAVE_BOX_01.sprite.position.x
            menu_box_2_y = SaveMenuElements::SAVE_BOX_01.sprite.position.y
            menu_box_3_x = SaveMenuElements::SAVE_BOX_02.sprite.position.x
            menu_box_3_y = SaveMenuElements::SAVE_BOX_02.sprite.position.y
            menu_box_4_x = SaveMenuElements::SAVE_BOX_03.sprite.position.x
            menu_box_4_y = SaveMenuElements::SAVE_BOX_03.sprite.position.y
            menu_box_5_x = SaveMenuElements::SAVE_BOX_04.sprite.position.x
            menu_box_5_y = SaveMenuElements::SAVE_BOX_04.sprite.position.y
            menu_box_6_x = SaveMenuElements::SAVE_BOX_05.sprite.position.x
            menu_box_6_y = SaveMenuElements::SAVE_BOX_05.sprite.position.y
            menu_box_7_x = SaveMenuElements::SAVE_BOX_06.sprite.position.x
            menu_box_7_y = SaveMenuElements::SAVE_BOX_06.sprite.position.y
            menu_box_8_x = SaveMenuElements::SAVE_BOX_07.sprite.position.x
            menu_box_8_y = SaveMenuElements::SAVE_BOX_07.sprite.position.y
            current_size = window.size
            original_width = 800
            original_height = 600
        
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
        
            scaled_mouse_x = mouse_x / scale_x
            scaled_mouse_y = mouse_y / scale_y
            if (scaled_mouse_x >= menu_box_1_x && scaled_mouse_x <= menu_box_1_x + SaveMenuElements::SAVE_MENU_BACK_BUTTON.width) && 
               (scaled_mouse_y >= menu_box_1_y && scaled_mouse_y <= menu_box_1_y + SaveMenuElements::SAVE_MENU_BACK_BUTTON.height)
                #Menus::SystemMenus.system_menu=("main_menu")
                MenuHandling::Menu.current_menu = "main_menu"
            end
            if (scaled_mouse_x >= menu_box_2_x && scaled_mouse_x <= menu_box_2_x + SaveMenuElements::SAVE_BOX_01.width) && 
               (scaled_mouse_y >= menu_box_2_y && scaled_mouse_y <= menu_box_2_y + SaveMenuElements::SAVE_BOX_01.height)
                if !File.exists?("src/saves/save01")
                #Player::Stats.initialize_player_stats
                Serialization::SaveFile.save_file=("save01")
                Serialization::SaveFile.initial_save("save01")
                Menus::SystemMenus.initialize_character_creation_menu(window)
                else
                 Serialization::SaveFile.save_file=("save01")
                 Serialization::SaveFile.load_game("src/saves/save01")
                 Sprites::Player.is_drawn=(true)
                 Menus::SystemMenus.system_menu=("hud")
                 MenuHandling::Menu.current_menu = "hud"
                 Menus::SystemMenus.initialize_hud(window)
                 Keyboard::Gameplay.gameplay_mode=("normal")
                 Levels::PhysicsTest.initialize_platform_test(window)
                 Levels::LevelSelectionLogic.level=("physics_test")
                 Menus::SystemMenus.initialize_hud(window)
                end
            end
            if (scaled_mouse_x >= menu_box_3_x && scaled_mouse_x <= menu_box_3_x + SaveMenuElements::SAVE_BOX_02.width) && 
               (scaled_mouse_y >= menu_box_3_y && scaled_mouse_y <= menu_box_3_y + SaveMenuElements::SAVE_BOX_02.height)
                Serialization::SaveFile.save_file=("save02")
                Serialization::SaveFile.initial_save("save02")
                Menus::SystemMenus.initialize_character_creation_menu(window)
            end
            if (scaled_mouse_x >= menu_box_4_x && scaled_mouse_x <= menu_box_4_x + SaveMenuElements::SAVE_BOX_03.width) && 
               (scaled_mouse_y >= menu_box_4_y && scaled_mouse_y <= menu_box_4_y + SaveMenuElements::SAVE_BOX_03.height)
                Serialization::SaveFile.save_file=("save03")
                Serialization::SaveFile.initial_save("save03")
                Menus::SystemMenus.initialize_character_creation_menu(window)
            end
            if (scaled_mouse_x >= menu_box_5_x && scaled_mouse_x <= menu_box_5_x + SaveMenuElements::SAVE_BOX_04.width) && 
               (scaled_mouse_y >= menu_box_5_y && scaled_mouse_y <= menu_box_5_y + SaveMenuElements::SAVE_BOX_04.height)
                Serialization::SaveFile.save_file=("save04")
                Serialization::SaveFile.initial_save("save04")
                Menus::SystemMenus.initialize_character_creation_menu(window)
            end
            if (scaled_mouse_x >= menu_box_6_x && scaled_mouse_x <= menu_box_6_x + SaveMenuElements::SAVE_BOX_05.width) && 
               (scaled_mouse_y >= menu_box_6_y && scaled_mouse_y <= menu_box_6_y + SaveMenuElements::SAVE_BOX_05.height)
                Serialization::SaveFile.save_file=("save05")
                Serialization::SaveFile.initial_save("save05")
                Menus::SystemMenus.initialize_character_creation_menu(window)
            end
            if (scaled_mouse_x >= menu_box_7_x && scaled_mouse_x <= menu_box_7_x + SaveMenuElements::SAVE_BOX_06.width) && 
               (scaled_mouse_y >= menu_box_7_y && scaled_mouse_y <= menu_box_7_y + SaveMenuElements::SAVE_BOX_06.height)
                Serialization::SaveFile.save_file=("save06")
                Serialization::SaveFile.initial_save("save06")
                Menus::SystemMenus.initialize_character_creation_menu(window)
            end
            if (scaled_mouse_x >= menu_box_8_x && scaled_mouse_x <= menu_box_8_x + SaveMenuElements::SAVE_BOX_07.width) && 
               (scaled_mouse_y >= menu_box_8_y && scaled_mouse_y <= menu_box_8_y + SaveMenuElements::SAVE_BOX_07.height)
                Serialization::SaveFile.save_file=("save07")
                Serialization::SaveFile.initial_save("save07")
                Menus::SystemMenus.initialize_character_creation_menu(window)
            end
         end
    end
end