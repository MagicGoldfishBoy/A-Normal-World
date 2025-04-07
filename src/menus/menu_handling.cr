require "crsfml"
require "../../src/textures.cr"
require "../../src/fonts.cr"
require "../../src/ui_elements.cr"
require "../../src/menus.cr"

module MenuHandling
    class Menu
        def initialize(current_menu : String)
            @current_menu = current_menu
        end

        class_property current_menu : String = "main_menu"

        def self.draw_menu(window)
            case self.current_menu
            when "main_menu"
                Menus::SystemMenus.draw_main_menu(window)
            when "save_menu"
                Menus::SystemMenus.draw_save_menu(window)
            when "character_creation_menu"
                Menus::SystemMenus.draw_charater_creation_menu(window)
            when "settings_menu"
                Menus::SystemMenus.draw_settings_menu(window)
                when "hud"
                    Menus::SystemMenus.draw_hud(window)
            when "debug"
                Menus::SystemMenus.draw_debug_menu(window)
                when "level_editor"
                    Menus::SystemMenus.draw_level_editor_ui(window)
            else
                puts self.current_menu
                window.close
            end
         end
    end
    class Gui
    end
    class Window
    end
end