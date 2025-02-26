require "crsfml"
require "json"
require "../src/textures.cr"
require "../src/fonts.cr"
require "../src/sprites.cr"
require "../src/serialization.cr"

module Menus

    class SystemMenus

        MENU_BOX_01 = SF::RectangleShape.new(SF.vector2(150, 80))
        MENU_BOX_01.fill_color = SF.color(200, 212, 219)
        MENU_BOX_01.outline_thickness = 10
        MENU_BOX_01.outline_color = SF.color(151, 179, 194)

        MENU_BOX_02 = SF::RectangleShape.new(SF.vector2(200, 80))
        MENU_BOX_02.fill_color = SF.color(200, 212, 219)
        MENU_BOX_02.outline_thickness = 10
        MENU_BOX_02.outline_color = SF.color(151, 179, 194)
        
        MENU_BOX_03 = SF::RectangleShape.new(SF.vector2(150, 80))
        MENU_BOX_03.fill_color = SF.color(200, 212, 219)
        MENU_BOX_03.outline_thickness = 10
        MENU_BOX_03.outline_color = SF.color(151, 179, 194)

        MENU_BOX_04 = SF::RectangleShape.new(SF.vector2(150, 80))
        MENU_BOX_04.fill_color = SF.color(200, 212, 219)
        MENU_BOX_04.outline_thickness = 10
        MENU_BOX_04.outline_color = SF.color(151, 179, 194)

        MENU_BOX_05 = SF::RectangleShape.new(SF.vector2(150, 80))
        MENU_BOX_05.fill_color = SF.color(200, 212, 219)
        MENU_BOX_05.outline_thickness = 10
        MENU_BOX_05.outline_color = SF.color(151, 179, 194)

        MENU_BOX_06 = SF::RectangleShape.new(SF.vector2(150, 80))
        MENU_BOX_06.fill_color = SF.color(200, 212, 219)
        MENU_BOX_06.outline_thickness = 10
        MENU_BOX_06.outline_color = SF.color(151, 179, 194)

        MENU_BOX_07 = SF::RectangleShape.new(SF.vector2(150, 80))
        MENU_BOX_07.fill_color = SF.color(200, 212, 219)
        MENU_BOX_07.outline_thickness = 10
        MENU_BOX_07.outline_color = SF.color(151, 179, 194)

        MENU_BOX_08 = SF::RectangleShape.new(SF.vector2(150, 80))
        MENU_BOX_08.fill_color = SF.color(200, 212, 219)
        MENU_BOX_08.outline_thickness = 10
        MENU_BOX_08.outline_color = SF.color(151, 179, 194)

        MENU_BOX_09 = SF::RectangleShape.new(SF.vector2(150, 80))
        MENU_BOX_09.fill_color = SF.color(200, 212, 219)
        MENU_BOX_09.outline_thickness = 10
        MENU_BOX_09.outline_color = SF.color(151, 179, 194)

        MENU_BOX_10 = SF::RectangleShape.new(SF.vector2(150, 80))
        MENU_BOX_10.fill_color = SF.color(200, 212, 219)
        MENU_BOX_10.outline_thickness = 10
        MENU_BOX_10.outline_color = SF.color(151, 179, 194)

        MENU_BOX_11 = SF::RectangleShape.new(SF.vector2(150, 80))
        MENU_BOX_11.fill_color = SF.color(200, 212, 219)
        MENU_BOX_11.outline_thickness = 10
        MENU_BOX_11.outline_color = SF.color(151, 179, 194)

        MENU_BOX_12 = SF::RectangleShape.new(SF.vector2(150, 80))
        MENU_BOX_12.fill_color = SF.color(200, 212, 219)
        MENU_BOX_12.outline_thickness = 10
        MENU_BOX_12.outline_color = SF.color(151, 179, 194)

        MENU_BOX_13 = SF::RectangleShape.new(SF.vector2(150, 80))
        MENU_BOX_13.fill_color = SF.color(200, 212, 219)
        MENU_BOX_13.outline_thickness = 10
        MENU_BOX_13.outline_color = SF.color(151, 179, 194)

        MENU_BOX_14 = SF::RectangleShape.new(SF.vector2(150, 80))
        MENU_BOX_14.fill_color = SF.color(200, 212, 219)
        MENU_BOX_14.outline_thickness = 10
        MENU_BOX_14.outline_color = SF.color(151, 179, 194)

        MENU_TEXT_01 = SF::Text.new
        MENU_TEXT_01.font = QUICKSAND

        MENU_TEXT_02 = SF::Text.new
        MENU_TEXT_02.font = QUICKSAND

        MENU_TEXT_03 = SF::Text.new
        MENU_TEXT_03.font = QUICKSAND

        MENU_TEXT_04 = SF::Text.new
        MENU_TEXT_04.font = QUICKSAND

        MENU_TEXT_05 = SF::Text.new
        MENU_TEXT_05.font = QUICKSAND

        MENU_TEXT_06 = SF::Text.new
        MENU_TEXT_06.font = QUICKSAND

        MENU_TEXT_07 = SF::Text.new
        MENU_TEXT_07.font = QUICKSAND

        MENU_TEXT_08 = SF::Text.new
        MENU_TEXT_08.font = QUICKSAND

        MENU_TEXT_09 = SF::Text.new
        MENU_TEXT_09.font = QUICKSAND

        MENU_TEXT_10 = SF::Text.new
        MENU_TEXT_10.font = QUICKSAND

        MENU_TEXT_11 = SF::Text.new
        MENU_TEXT_11.font = QUICKSAND

        MENU_TEXT_12 = SF::Text.new
        MENU_TEXT_12.font = QUICKSAND

        MENU_TEXT_13 = SF::Text.new
        MENU_TEXT_13.font = QUICKSAND

        MENU_TEXT_14 = SF::Text.new
        MENU_TEXT_14.font = QUICKSAND

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
            SystemMenus.draw_save_menu(window)
        when "character_creation_menu"
            SystemMenus.draw_charater_creation_menu(window)
        when "settings_menu"
            puts  "settings menu"
        when "hud"
            SystemMenus.draw_hud(window)
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
        MENU_BOX_01.size = SF.vector2(150, 80)
        MENU_TEXT_01.character_size = 34
        MENU_TEXT_01.position = MENU_BOX_01.position + SF.vector2(35, 15)
        MENU_TEXT_01.string = "Play                    Settings                    Quit"
        MENU_TEXT_01.color = SF::Color::Black

        MENU_BOX_02.position = MENU_BOX_01.position + SF.vector2(250, 0)
        MENU_BOX_02.size = SF.vector2(200, 80)
        MENU_TEXT_02.color = SF::Color::White
        MENU_TEXT_02.string = "A Normal World"
        MENU_TEXT_02.character_size = 50
        MENU_TEXT_02.position = SF.vector2(200, 100)

        MENU_BOX_03.position = MENU_BOX_02.position + SF.vector2(300, 0)
        MENU_BOX_03.size = SF.vector2(150, 80)

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
            this = "save_menu"
            SystemMenus.system_menu=(this)
        elsif (scaled_mouse_x >= menu_box_2_x && scaled_mouse_x <= menu_box_2_x + 200) && (scaled_mouse_y >= menu_box_2_y && scaled_mouse_y <= menu_box_2_y + 80)
            MENU_BOX_02.outline_color = SF.color(97, 140, 165)
        elsif (scaled_mouse_x >= menu_box_3_x && scaled_mouse_x <= menu_box_3_x + 150) && (scaled_mouse_y >= menu_box_3_y && scaled_mouse_y <= menu_box_3_y + 80)
            MENU_BOX_03.outline_color = SF.color(97, 140, 165)
            window.close
        end
     end

     def SystemMenus.draw_save_menu(window)
        current_size = window.size
        original_width = 800 
        original_height = 600
    
        scale_x = current_size.x.to_f / original_width
        scale_y = current_size.y.to_f / original_height

        MENU_BOX_01.position = SF.vector2(scale_x + 20, scale_y + 540)
        MENU_TEXT_01.position = MENU_BOX_01.position + SF.vector2(15, 1)
        MENU_BOX_01.size = SF.vector2(115, 40)
        MENU_TEXT_01.string = "Back"

        MENU_BOX_02.size = SF.vector2(150, 250)
        MENU_BOX_02.position = SF.vector2(scale_x + 50, scale_y + 20)
        MENU_TEXT_02.color = SF::Color::Blue
        MENU_TEXT_02.character_size = 25
        MENU_TEXT_02.position = MENU_BOX_02.position + SF.vector2(35, 200)

        MENU_BOX_03.size = MENU_BOX_02.size
        MENU_BOX_03.position = MENU_BOX_02.position + SF.vector2(scale_x + 180, scale_y + 0)
        MENU_TEXT_03.color = MENU_TEXT_02.color
        MENU_TEXT_03.character_size = MENU_TEXT_02.character_size
        MENU_TEXT_03.position = MENU_BOX_03.position + SF.vector2(35, 200)

        MENU_BOX_04.size = MENU_BOX_03.size
        MENU_BOX_04.position = MENU_BOX_03.position + SF.vector2(scale_x + 180, scale_y + 0)
        MENU_TEXT_04.color = MENU_TEXT_03.color
        MENU_TEXT_04.character_size = MENU_TEXT_03.character_size
        MENU_TEXT_04.position = MENU_BOX_04.position + SF.vector2(35, 200)

        MENU_BOX_05.size = MENU_BOX_04.size
        MENU_BOX_05.position = MENU_BOX_04.position + SF.vector2(scale_x + 180, scale_y + 0)
        MENU_TEXT_05.color = MENU_TEXT_04.color
        MENU_TEXT_05.character_size = MENU_TEXT_04.character_size
        MENU_TEXT_05.position = MENU_BOX_05.position + SF.vector2(35, 200)

        MENU_BOX_06.size = MENU_BOX_02.size
        MENU_BOX_06.position = MENU_BOX_02.position + SF.vector2(scale_x + 180, scale_y + 300)
        MENU_TEXT_06.color = MENU_TEXT_02.color
        MENU_TEXT_06.character_size = MENU_TEXT_02.character_size
        MENU_TEXT_06.position = MENU_BOX_06.position + SF.vector2(35, 200)

        MENU_BOX_07.size = MENU_BOX_02.size
        MENU_BOX_07.position = MENU_BOX_06.position + SF.vector2(scale_x + 180, scale_y + 0)
        MENU_TEXT_07.color = MENU_TEXT_06.color
        MENU_TEXT_07.character_size = MENU_TEXT_06.character_size
        MENU_TEXT_07.position = MENU_BOX_07.position + SF.vector2(35, 200)

        MENU_BOX_08.size = MENU_BOX_02.size
        MENU_BOX_08.position = MENU_BOX_07.position + SF.vector2(scale_x + 180, scale_y + 0)
        MENU_TEXT_08.color = MENU_TEXT_07.color
        MENU_TEXT_08.character_size = MENU_TEXT_07.character_size
        MENU_TEXT_08.position = MENU_BOX_08.position + SF.vector2(35, 200)

        if !File.exists?("save01")
            MENU_TEXT_02.string = "Empty"
        end
        if !File.exists?("save02")
            MENU_TEXT_03.string = "Empty"
        end
        if !File.exists?("save03")
            MENU_TEXT_04.string = "Empty"
        end
        if !File.exists?("save04")
            MENU_TEXT_05.string = "Empty"
        end
        if !File.exists?("save05")
            MENU_TEXT_06.string = "Empty"
        end
        if !File.exists?("save06")
            MENU_TEXT_07.string = "Empty"
        end
        if !File.exists?("save07")
            MENU_TEXT_08.string = "Empty"
        end
        window.draw(MENU_BOX_01)
        window.draw(MENU_BOX_02)
        window.draw(MENU_BOX_03)
        window.draw(MENU_BOX_04)
        window.draw(MENU_BOX_05)
        window.draw(MENU_BOX_06)
        window.draw(MENU_BOX_07)
        window.draw(MENU_BOX_08)

        window.draw(MENU_TEXT_01)
        window.draw(MENU_TEXT_02)
        window.draw(MENU_TEXT_03)
        window.draw(MENU_TEXT_04)
        window.draw(MENU_TEXT_05)
        window.draw(MENU_TEXT_06)
        window.draw(MENU_TEXT_07)
        window.draw(MENU_TEXT_08)
        if SF::Mouse.button_pressed?(SF::Mouse::Left)
            SystemMenus.save_menu_mouse_handling(window)
        end
     end

     def SystemMenus.save_menu_mouse_handling(window)
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
            this = "main_menu"
            SystemMenus.system_menu=(this)
        end
        if (scaled_mouse_x >= menu_box_2_x && scaled_mouse_x <= menu_box_2_x + MENU_BOX_02.size.x) && (scaled_mouse_y >= menu_box_2_y && scaled_mouse_y <= menu_box_2_y + MENU_BOX_02.size.y)
            Serialization::SaveFile.save_file=("save01")
            Serialization::SaveFile.initial_save("save01")
            SystemMenus.initialize_character_creation_menu(window)
        end
     end

     def SystemMenus.initialize_character_creation_menu(window)
        Player::Appearance.initialize_player_model
        Sprites::Player.refresh_player_sprite(window)
        Sprites::Player.resize_player_sprite(window, 3, 3)
        Sprites::Player.position_player_sprite(window, 250, 50)

        current_size = window.size
        original_width = 800 
        original_height = 600
    
        scale_x = current_size.x.to_f / original_width
        scale_y = current_size.y.to_f / original_height


        MENU_BOX_01.position = SF.vector2(scale_x + 20, scale_y + 540)
        MENU_TEXT_01.position = MENU_BOX_01.position + SF.vector2(15, 1)
        MENU_BOX_01.size = SF.vector2(115, 40)
        MENU_TEXT_01.string = "Back"

        MENU_BOX_02.position = SF.vector2(scale_x + 80, scale_y + 60)
        MENU_BOX_02.size = SF.vector2(115, 40)
        MENU_TEXT_02.position = MENU_BOX_02.position + SF.vector2(30, 1)
        MENU_TEXT_02.string = "Skin"
        MENU_TEXT_02.color = SF::Color::Black

        MENU_BOX_03.position = SF.vector2(scale_x + 560, scale_y + 60)
        MENU_BOX_03.size = SF.vector2(115, 40)
        MENU_TEXT_03.position = MENU_BOX_03.position + SF.vector2(30, 1)
        MENU_TEXT_03.string = "Skin"
        MENU_TEXT_03.color = SF::Color::Black

        MENU_BOX_04.position = SF.vector2(scale_x + 80, scale_y + 130)
        MENU_BOX_04.size = SF.vector2(115, 40)
        MENU_TEXT_04.position = MENU_BOX_04.position + SF.vector2(30, 1)
        MENU_TEXT_04.string = "Hair"
        MENU_TEXT_04.color = SF::Color::Black

        MENU_BOX_05.position = SF.vector2(scale_x + 560, scale_y + 130)
        MENU_BOX_05.size = SF.vector2(115, 40)
        MENU_TEXT_05.position = MENU_BOX_05.position + SF.vector2(30, 1)
        MENU_TEXT_05.string = "Hair"
        MENU_TEXT_05.color = SF::Color::Black

        MENU_BOX_06.position = SF.vector2(scale_x + 80, scale_y + 200)
        MENU_BOX_06.size = SF.vector2(115, 40)
        MENU_TEXT_06.position = MENU_BOX_06.position + SF.vector2(30, 1)
        MENU_TEXT_06.string = "Face"
        MENU_TEXT_06.color = SF::Color::Black

        MENU_BOX_07.position = SF.vector2(scale_x + 560, scale_y + 200)
        MENU_BOX_07.size = SF.vector2(115, 40)
        MENU_TEXT_07.position = MENU_BOX_07.position + SF.vector2(30, 1)
        MENU_TEXT_07.string = "Face"
        MENU_TEXT_07.color = SF::Color::Black

        MENU_BOX_08.position = SF.vector2(scale_x + 80, scale_y + 270)
        MENU_BOX_08.size = SF.vector2(115, 40)
        MENU_TEXT_08.position = MENU_BOX_08.position + SF.vector2(30, 1)
        MENU_TEXT_08.string = "Shirt"
        MENU_TEXT_08.color = SF::Color::Black

        MENU_BOX_09.position = SF.vector2(scale_x + 560, scale_y + 270)
        MENU_BOX_09.size = SF.vector2(115, 40)
        MENU_TEXT_09.position = MENU_BOX_09.position + SF.vector2(30, 1)
        MENU_TEXT_09.string = "Shirt"
        MENU_TEXT_09.color = SF::Color::Black

        MENU_BOX_10.position = SF.vector2(scale_x + 80, scale_y + 340)
        MENU_BOX_10.size = SF.vector2(115, 40)
        MENU_TEXT_10.position = MENU_BOX_10.position + SF.vector2(20, 1)
        MENU_TEXT_10.string = "Pants"
        MENU_TEXT_10.color = SF::Color::Black

        MENU_BOX_11.position = SF.vector2(scale_x + 560, scale_y + 340)
        MENU_BOX_11.size = SF.vector2(115, 40)
        MENU_TEXT_11.position = MENU_BOX_11.position + SF.vector2(20, 1)
        MENU_TEXT_11.string = "Pants"
        MENU_TEXT_11.color = SF::Color::Black

        MENU_BOX_12.position = SF.vector2(scale_x + 80, scale_y + 410)
        MENU_BOX_12.size = SF.vector2(115, 40)
        MENU_TEXT_12.position = MENU_BOX_12.position + SF.vector2(20, 1)
        MENU_TEXT_12.string = "Shoes"
        MENU_TEXT_12.color = SF::Color::Black

        MENU_BOX_13.position = SF.vector2(scale_x + 560, scale_y + 410)
        MENU_BOX_13.size = SF.vector2(115, 40)
        MENU_TEXT_13.position = MENU_BOX_13.position + SF.vector2(20, 1)
        MENU_TEXT_13.string = "Shoes"
        MENU_TEXT_13.color = SF::Color::Black

        MENU_BOX_14.position = SF.vector2(scale_x + 660, scale_y + 540)
        MENU_TEXT_14.position = MENU_BOX_14.position + SF.vector2(15, 1)
        MENU_BOX_14.size = SF.vector2(115, 40)
        MENU_TEXT_14.string = "Next"
        MENU_TEXT_14.color = SF::Color::Black

        sleep 0.15.seconds
        SystemMenus.system_menu=("character_creation_menu")
        Sprites::Player.is_drawn=(true)
     end

     def SystemMenus.draw_charater_creation_menu(window)

        window.draw(MENU_BOX_01)
        window.draw(MENU_BOX_02)
        window.draw(MENU_BOX_03)
        window.draw(MENU_BOX_04)
        window.draw(MENU_BOX_05)
        window.draw(MENU_BOX_06)
        window.draw(MENU_BOX_07)
        window.draw(MENU_BOX_08)
        window.draw(MENU_BOX_09)
        window.draw(MENU_BOX_10)
        window.draw(MENU_BOX_11)
        window.draw(MENU_BOX_12)
        window.draw(MENU_BOX_13)
        window.draw(MENU_BOX_14)

        window.draw(MENU_TEXT_01)
        window.draw(MENU_TEXT_02)
        window.draw(MENU_TEXT_03)
        window.draw(MENU_TEXT_04)
        window.draw(MENU_TEXT_05)
        window.draw(MENU_TEXT_06)
        window.draw(MENU_TEXT_07)
        window.draw(MENU_TEXT_08)
        window.draw(MENU_TEXT_09)
        window.draw(MENU_TEXT_10)
        window.draw(MENU_TEXT_11)
        window.draw(MENU_TEXT_12)
        window.draw(MENU_TEXT_13)
        window.draw(MENU_TEXT_14)
        if SF::Mouse.button_pressed?(SF::Mouse::Left)
            SystemMenus.character_creation_menu_mouse_handling(window)
        end
     end

     def SystemMenus.character_creation_menu_mouse_handling(window)
        mouse_position = SF::Mouse.get_position(window)
        mouse_x = mouse_position.x
        mouse_y = mouse_position.y

        menu_box_1_x = MENU_BOX_01.position.x
        menu_box_1_y = MENU_BOX_01.position.y

        menu_box_2_x = MENU_BOX_02.position.x
        menu_box_2_y = MENU_BOX_02.position.y

        menu_box_3_x = MENU_BOX_03.position.x
        menu_box_3_y = MENU_BOX_03.position.y

        menu_box_4_x = MENU_BOX_04.position.x
        menu_box_4_y = MENU_BOX_04.position.y

        menu_box_5_x = MENU_BOX_05.position.x
        menu_box_5_y = MENU_BOX_05.position.y

        menu_box_6_x = MENU_BOX_06.position.x
        menu_box_6_y = MENU_BOX_06.position.y

        menu_box_7_x = MENU_BOX_07.position.x
        menu_box_7_y = MENU_BOX_07.position.y

        menu_box_8_x = MENU_BOX_08.position.x
        menu_box_8_y = MENU_BOX_08.position.y

        menu_box_9_x = MENU_BOX_09.position.x
        menu_box_9_y = MENU_BOX_09.position.y

        menu_box_10_x = MENU_BOX_10.position.x
        menu_box_10_y = MENU_BOX_10.position.y

        menu_box_11_x = MENU_BOX_11.position.x
        menu_box_11_y = MENU_BOX_11.position.y

        menu_box_12_x = MENU_BOX_12.position.x
        menu_box_12_y = MENU_BOX_12.position.y

        menu_box_13_x = MENU_BOX_13.position.x
        menu_box_13_y = MENU_BOX_13.position.y

        menu_box_14_x = MENU_BOX_14.position.x
        menu_box_14_y = MENU_BOX_14.position.y

        current_size = window.size
        original_width = 800
        original_height = 600
    
        scale_x = current_size.x.to_f / original_width
        scale_y = current_size.y.to_f / original_height
    
        scaled_mouse_x = mouse_x / scale_x
        scaled_mouse_y = mouse_y / scale_y
        if (scaled_mouse_x >= menu_box_1_x && scaled_mouse_x <= menu_box_1_x + MENU_BOX_01.size.x) && (scaled_mouse_y >= menu_box_1_y && scaled_mouse_y <= menu_box_1_y + MENU_BOX_01.size.y)
            Sprites::Player.is_drawn=(false)
            SystemMenus.system_menu=("save_menu")
            sleep 0.15.seconds
        end
        if (scaled_mouse_x >= menu_box_2_x && scaled_mouse_x <= menu_box_2_x + MENU_BOX_02.size.x) && (scaled_mouse_y >= menu_box_2_y && scaled_mouse_y <= menu_box_2_y + MENU_BOX_02.size.y)
            Player::Appearance.change_skin(Sprites::Player.change_skin("character_creation", "left"))
            Sprites::Player.refresh_player_sprite(window)
            sleep 0.15.seconds
        end
        if (scaled_mouse_x >= menu_box_3_x && scaled_mouse_x <= menu_box_3_x + MENU_BOX_03.size.x) && (scaled_mouse_y >= menu_box_3_y && scaled_mouse_y <= menu_box_3_y + MENU_BOX_03.size.y)
            Player::Appearance.change_skin(Sprites::Player.change_skin("character_creation", "right"))
            Sprites::Player.refresh_player_sprite(window)
            sleep 0.15.seconds
        end
        if (scaled_mouse_x >= menu_box_4_x && scaled_mouse_x <= menu_box_4_x + MENU_BOX_04.size.x) && (scaled_mouse_y >= menu_box_4_y && scaled_mouse_y <= menu_box_4_y + MENU_BOX_04.size.y)
            Player::Appearance.change_hair(Sprites::Player.change_hair("character_creation", "left"))
            Sprites::Player.refresh_player_sprite(window)
            sleep 0.15.seconds
        end
        if (scaled_mouse_x >= menu_box_5_x && scaled_mouse_x <= menu_box_5_x + MENU_BOX_05.size.x) && (scaled_mouse_y >= menu_box_5_y && scaled_mouse_y <= menu_box_5_y + MENU_BOX_05.size.y)
            Player::Appearance.change_hair(Sprites::Player.change_hair("character_creation", "right"))
            Sprites::Player.refresh_player_sprite(window)
            sleep 0.15.seconds
        end
        if (scaled_mouse_x >= menu_box_6_x && scaled_mouse_x <= menu_box_6_x + MENU_BOX_06.size.x) && (scaled_mouse_y >= menu_box_6_y && scaled_mouse_y <= menu_box_6_y + MENU_BOX_06.size.y)
            Player::Appearance.change_face(Sprites::Player.change_face("character_creation", "left"))
            Sprites::Player.refresh_player_sprite(window)
            sleep 0.15.seconds
        end
        if (scaled_mouse_x >= menu_box_7_x && scaled_mouse_x <= menu_box_7_x + MENU_BOX_07.size.x) && (scaled_mouse_y >= menu_box_7_y && scaled_mouse_y <= menu_box_7_y + MENU_BOX_07.size.y)
            Player::Appearance.change_face(Sprites::Player.change_face("character_creation", "right"))
            Sprites::Player.refresh_player_sprite(window)
            sleep 0.15.seconds
        end
        if (scaled_mouse_x >= menu_box_8_x && scaled_mouse_x <= menu_box_8_x + MENU_BOX_08.size.x) && (scaled_mouse_y >= menu_box_8_y && scaled_mouse_y <= menu_box_8_y + MENU_BOX_08.size.y)
            Player::Appearance.change_shirt(Sprites::Player.change_shirt("character_creation", "left"))
            Sprites::Player.refresh_player_sprite(window)
            sleep 0.15.seconds
        end
        if (scaled_mouse_x >= menu_box_9_x && scaled_mouse_x <= menu_box_9_x + MENU_BOX_09.size.x) && (scaled_mouse_y >= menu_box_9_y && scaled_mouse_y <= menu_box_9_y + MENU_BOX_09.size.y)
            Player::Appearance.change_shirt(Sprites::Player.change_shirt("character_creation", "right"))
            Sprites::Player.refresh_player_sprite(window)
            sleep 0.15.seconds
        end
        if (scaled_mouse_x >= menu_box_10_x && scaled_mouse_x <= menu_box_10_x + MENU_BOX_10.size.x) && (scaled_mouse_y >= menu_box_10_y && scaled_mouse_y <= menu_box_10_y + MENU_BOX_10.size.y)
            Player::Appearance.change_pants(Sprites::Player.change_pants("character_creation", "left"))
            Sprites::Player.refresh_player_sprite(window)
            sleep 0.15.seconds
        end
        if (scaled_mouse_x >= menu_box_11_x && scaled_mouse_x <= menu_box_11_x + MENU_BOX_11.size.x) && (scaled_mouse_y >= menu_box_11_y && scaled_mouse_y <= menu_box_11_y + MENU_BOX_11.size.y)
            Player::Appearance.change_pants(Sprites::Player.change_pants("character_creation", "right"))
            Sprites::Player.refresh_player_sprite(window)
            sleep 0.15.seconds
        end
        if (scaled_mouse_x >= menu_box_12_x && scaled_mouse_x <= menu_box_12_x + MENU_BOX_12.size.x) && (scaled_mouse_y >= menu_box_12_y && scaled_mouse_y <= menu_box_12_y + MENU_BOX_12.size.y)
            Player::Appearance.change_shoes(Sprites::Player.change_shoes("character_creation", "left"))
            Sprites::Player.refresh_player_sprite(window)
            sleep 0.15.seconds
        end
        if (scaled_mouse_x >= menu_box_13_x && scaled_mouse_x <= menu_box_13_x + MENU_BOX_13.size.x) && (scaled_mouse_y >= menu_box_13_y && scaled_mouse_y <= menu_box_13_y + MENU_BOX_13.size.y)
            Player::Appearance.change_shoes(Sprites::Player.change_shoes("character_creation", "right"))
            Sprites::Player.refresh_player_sprite(window)
            sleep 0.15.seconds
        end
        if (scaled_mouse_x >= menu_box_14_x && scaled_mouse_x <= menu_box_14_x + MENU_BOX_14.size.x) && (scaled_mouse_y >= menu_box_14_y && scaled_mouse_y <= menu_box_14_y + MENU_BOX_14.size.y)
            Sprites::Player.is_drawn=(true)
            SystemMenus.system_menu=("hud")
            SystemMenus.initialize_hud(window)
            sleep 0.15.seconds
        end
     end

     def SystemMenus.initialize_hud(window)
        Sprites::Player.refresh_player_sprite(window)
        Sprites::Player.resize_player_sprite(window, 1, 1)
        Sprites::Player.position_player_sprite(window, 250, 50)

        current_size = window.size
        original_width = 800 
        original_height = 600
    
        scale_x = current_size.x.to_f / original_width
        scale_y = current_size.y.to_f / original_height


        MENU_BOX_01.position = SF.vector2(scale_x + 20, scale_y + 540)
        MENU_TEXT_01.position = MENU_BOX_01.position + SF.vector2(15, 1)
        MENU_BOX_01.size = SF.vector2(115, 40)
        MENU_TEXT_01.string = "Back"
     end

     def SystemMenus.draw_hud(window)
        window.draw(MENU_BOX_01)
        window.draw(MENU_TEXT_01)
        if SF::Mouse.button_pressed?(SF::Mouse::Left)
            SystemMenus.hud_mouse_handling(window)
        end
     end

     def SystemMenus.hud_mouse_handling(window)
        mouse_position = SF::Mouse.get_position(window)
        mouse_x = mouse_position.x
        mouse_y = mouse_position.y

        menu_box_1_x = MENU_BOX_01.position.x
        menu_box_1_y = MENU_BOX_01.position.y
     end

    end
end