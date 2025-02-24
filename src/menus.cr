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
        current_size = window.size
        original_width = 800 
        original_height = 600
    
        scale_x = current_size.x.to_f / original_width
        scale_y = current_size.y.to_f / original_height

        MENU_BOX_01.position = SF.vector2(scale_x + 50, scale_y + 300)
        MENU_TEXT_01.position = MENU_BOX_01.position + SF.vector2(35, 15)
        MENU_BOX_02.position = MENU_BOX_01.position + SF.vector2(250, 0)
        MENU_BOX_03.position = MENU_BOX_02.position + SF.vector2(300, 0)
        window.draw(MENU_BOX_01)
        window.draw(MENU_BOX_02)
        window.draw(MENU_BOX_03)
        window.draw(MENU_TEXT_01)
        window.draw(MENU_TEXT_02)
        if SF::Mouse.button_pressed?(SF::Mouse::Left)
            SystemMenus.main_menu_mouse_handling(window)
        end
     end
     
     def SystemMenus.main_menu_mouse_handling(window)
        mouse_position = SF::Mouse.get_position(window)
        mouse_x = mouse_position.x
        mouse_y = mouse_position.y
        menu_box_1_x = MENU_BOX_01.position.x
        menu_box_1_y = MENU_BOX_01.position.y
        menu_box_2_x = MENU_BOX_02.position.x
        menu_box_2_y = MENU_BOX_02.position.y
        menu_box_3_x = MENU_BOX_03.position.x
        menu_box_3_y = MENU_BOX_03.position.y
        current_size = window.size
        original_width = 800
        original_height = 600
    
        scale_x = current_size.x.to_f / original_width
        scale_y = current_size.y.to_f / original_height
    
        scaled_mouse_x = mouse_x / scale_x
        scaled_mouse_y = mouse_y / scale_y
        
        if (scaled_mouse_x >= menu_box_1_x && scaled_mouse_x <= menu_box_1_x + MENU_BOX_01.size.x) && (scaled_mouse_y >= menu_box_1_y && scaled_mouse_y <= menu_box_1_y + MENU_BOX_01.size.y)
            MENU_BOX_01.outline_color = SF.color(97, 140, 165)
        elsif (scaled_mouse_x >= menu_box_2_x && scaled_mouse_x <= menu_box_2_x + 200) && (scaled_mouse_y >= menu_box_2_y && scaled_mouse_y <= menu_box_2_y + 80)
            MENU_BOX_02.outline_color = SF.color(97, 140, 165)
        elsif (scaled_mouse_x >= menu_box_3_x && scaled_mouse_x <= menu_box_3_x + 150) && (scaled_mouse_y >= menu_box_3_y && scaled_mouse_y <= menu_box_3_y + 80)
            MENU_BOX_03.outline_color = SF.color(97, 140, 165)
            window.close
        end
     end

    end
end