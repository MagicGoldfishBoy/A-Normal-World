require "crsfml"
require "../../src/textures.cr"
require "../../src/fonts.cr"
require "../../src/ui_elements.cr"
require "../menus/main_menu.cr"
require "../gui/gameplay_gui.cr"
require "../gui/level_editor_gui.cr"
require "../window/hud_window.cr"
require "../window/stats_window.cr"
require "../window/decor_window.cr"

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
            when "debug"
                DebugMenu::DebugMenuDisplay.draw_debug_menu(window)
            when "none"
            else
                puts self.current_menu
                window.close
            end
         end
         def self.load_main_menu(window)
            Sprites::Player.is_drawn=(false)
            MenuHandling::Gui.current_gui = "none"
            MenuHandling::Window.is_hud_window_open = false
            window.view = window.default_view
            #Levels::LevelSelectionLogic.level = "none"
            Window.is_hud_window_open = false
            Window.is_stats_window_open = false
            MenuHandling::Menu.current_menu = "main_menu"
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
                GameplayGui::GameplayGuiDisplay.draw_hud(window)
            when "level_editor_hud"
                LevelEditorGui::LevelEditorGuiDisplay.draw_level_editor_ui(window)
            when "none"
         else
            puts self.current_gui
            window.close
         end
        end
    end
    class Window
        def initialize(is_hud_window_open : Bool, is_stats_window_open : Bool, is_decor_window_open : Bool)
            @is_hud_window_open = is_hud_window_open
            @is_stats_window_open = is_stats_window_open
            @is_decor_window_open = is_decor_window_open
        end

        class_property is_hud_window_open : Bool = false
        class_property is_stats_window_open : Bool = false
        class_property is_decor_window_open : Bool = false

        def self.draw_window(window)
            if self.is_hud_window_open == true
                HudWindow::HudWindowDisplay.draw_hud_window(window)
            end
            if self.is_stats_window_open == true
                StatsWindow::StatsWindowDisplay.display_stats_window(window)
            end
            if self.is_decor_window_open == true
                DecorWindow::DecorWindowDisplay.draw_decor_window(window)
            end
        end
    end
end