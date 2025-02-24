require "crsfml"
require "../src/textures.cr"
require "../src/fonts.cr"

module Menus

    class SystemMenus

        MENU_BOX_01 = SF::RectangleShape.new(SF.vector2(150, 80))
        MENU_BOX_01.fill_color = SF.color(200, 212, 219)
        MENU_BOX_01.position = SF.vector2(50, 400)
        MENU_BOX_01.outline_thickness = 10
        MENU_BOX_01.outline_color = SF.color(151, 179, 194)

        MENU_BOX_02 = SF::RectangleShape.new(SF.vector2(200, 80))
        MENU_BOX_02.fill_color = SF.color(200, 212, 219)
        MENU_BOX_02.position = MENU_BOX_01.position + SF.vector2(250, 0)
        MENU_BOX_02.outline_thickness = 10
        MENU_BOX_02.outline_color = SF.color(151, 179, 194)
        
        MENU_BOX_03 = SF::RectangleShape.new(SF.vector2(150, 80))
        MENU_BOX_03.fill_color = SF.color(200, 212, 219)
        MENU_BOX_03.position = MENU_BOX_02.position + SF.vector2(300, 0)
        MENU_BOX_03.outline_thickness = 10
        MENU_BOX_03.outline_color = SF.color(151, 179, 194)

        MENU_TEXT_01 = SF::Text.new
        MENU_TEXT_01.font = QUICKSAND
        MENU_TEXT_01.string = "Play                    Settings                    Quit"
        MENU_TEXT_01.character_size = 34
        MENU_TEXT_01.color = SF::Color::Black
        MENU_TEXT_01.position = MENU_BOX_01.position + SF.vector2(35, 15)

        MENU_TEXT_02 = SF::Text.new
        MENU_TEXT_02.font = QUICKSAND
        MENU_TEXT_02.string = "A Normal World"
        MENU_TEXT_02.character_size = 50
        MENU_TEXT_02.color = SF::Color::White
        MENU_TEXT_02.position = SF.vector2(200, 100)

     def initialize(system_menu : String)
        @system_menu = system_menu
        @@system_menu = system_menu
     end

     def system_menu 
        @system_menu
     end

     def SystemMenus.system_menu=(this)
       system_menu = this
       @@system_menu = this
     end

     def SystemMenus.draw_system_menu(window)
        case @@system_menu
        when "main_menu"
            SystemMenus.draw_main_menu(window)
        when "save_menu"
            puts "save menu"
        when "settings_menu"
            puts  "settings menu"
        when "hud"
            puts "hud"
        else
            puts @@system_menu
            window.close
        end
     end

     def SystemMenus.draw_main_menu(window)
        window.draw(MENU_BOX_01)
        window.draw(MENU_BOX_02)
        window.draw(MENU_BOX_03)
        window.draw(MENU_TEXT_01)
        window.draw(MENU_TEXT_02)
     end

    end
end