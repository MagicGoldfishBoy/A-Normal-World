require "crsfml"
require "../../src/textures.cr"
require "../../src/fonts.cr"
require "../../src/ui_elements.cr"
require "../../src/menus.cr"
require "../menus/main_menu.cr"

#menus take up the whole screen, guis overlay gameplay, windows are smoll

module MenuHandling
    class Menu
        def initialize(current_menu : String)
            @current_menu = current_menu
        end

        class_property current_menu : String = "main_menu"

        def self.draw_menu(window)
            case self.current_menu
            when "main_menu"
                MainMenu::MainMenuDisplay.draw_main_menu(window)
            when "save_menu"
                SaveMenu::SaveMenuDislay.draw_save_menu(window)
            when "character_creation_menu"
                CharacterCreationMenu::CharacterCreationMenuDisplay.draw_charater_creation_menu(window)
            when "settings_menu"
                SettingsMenu::SettingsMenuDisplay.draw_settings_menu(window)
                when "hud"
                    Menus::SystemMenus.draw_hud(window)
            when "debug"
                DebugMenu::DebugMenuDisplay.draw_debug_menu(window)
                when "level_editor"
                    Menus::SystemMenus.draw_level_editor_ui(window)
            else
                puts self.current_menu
                window.close
            end
         end
    end
    class Gui
        def initialize(current_gui : String)
            @current_gui = current_gui
        end

        class_property current_gui : String = "none"

        def self.draw_gui(window)
         case self.current_gui
            when "gameplay_hud"
             Menus::SystemMenus.draw_hud(window)
            when "level_editor_hud"
             Menus::SystemMenus.draw_level_editor_ui(window)
         else
            puts self.current_gui
            window.close
         end
        end
    end
    class Window
    end
end