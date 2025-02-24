require "crsfml"
require "../src/graphics.cr"

module Menus

    class SystemMenus
        MENU_BOX_01 = SF::RectangleShape.new(SF.vector2(120, 50))
        MENU_BOX_01.fill_color = SF.color(150, 50, 250)
        


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
        else
            puts "invalid menu"
        end
     end

     def SystemMenus.draw_main_menu(window)
        window.draw(MENU_BOX_01)
     end

    end
end