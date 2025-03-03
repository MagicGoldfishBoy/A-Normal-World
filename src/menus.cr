require "crsfml"
require "json"
require "../src/textures.cr"
require "../src/fonts.cr"
require "../src/sprites.cr"
require "../src/serialization.cr"
require "../src/keyboard.cr"

module Menus

    class SystemMenus

        HUD_BOTTOM = SF::RectangleShape.new(SF.vector2(1000, 500))
        HUD_BOTTOM.fill_color = SF.color(200, 212, 219)

        HP_BAR = SF::RectangleShape.new(SF.vector2(300, 15))
        HP_COLOR_BAR = SF::RectangleShape.new(SF.vector2(300, 15))
        HP_COLOR_BAR.fill_color = SF.color( 122, 14, 14 )

        MP_BAR = SF::RectangleShape.new(SF.vector2(300, 15))
        MP_COLOR_BAR = SF::RectangleShape.new(SF.vector2(300, 15))
        MP_COLOR_BAR.fill_color = SF.color( 23, 81, 159 )

        EXP_BAR = SF::RectangleShape.new(SF.vector2(300, 15))
        EXP_COLOR_BAR = SF::RectangleShape.new(SF.vector2(300, 15))
        EXP_COLOR_BAR.fill_color = SF.color( 170, 183, 38 )

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
            SystemMenus.draw_settings_menu(window)
        when "hud"
            SystemMenus.draw_hud(window)
        when "debug"
            SystemMenus.draw_debug_menu(window)
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
            SystemMenus.initialize_save_menu(window)
            SystemMenus.system_menu=(this)
        elsif (scaled_mouse_x >= menu_box_2_x && scaled_mouse_x <= menu_box_2_x + 200) && (scaled_mouse_y >= menu_box_2_y && scaled_mouse_y <= menu_box_2_y + 80)
            MENU_BOX_02.outline_color = SF.color(97, 140, 165)
            SystemMenus.initialize_settings_menu(window)
            SystemMenus.system_menu=("settings_menu")
        elsif (scaled_mouse_x >= menu_box_3_x && scaled_mouse_x <= menu_box_3_x + 150) && (scaled_mouse_y >= menu_box_3_y && scaled_mouse_y <= menu_box_3_y + 80)
            MENU_BOX_03.outline_color = SF.color(97, 140, 165)
            window.close
        end
     end

     def SystemMenus.initialize_settings_menu(window)
        current_size = window.size
        original_width = 800 
        original_height = 600
    
        scale_x = current_size.x.to_f / original_width
        scale_y = current_size.y.to_f / original_height

        MENU_BOX_01.position = SF.vector2(scale_x + 20, scale_y + 540)
        MENU_TEXT_01.position = MENU_BOX_01.position + SF.vector2(15, 1)
        MENU_BOX_01.size = SF.vector2(115, 40)
        MENU_TEXT_01.string = "Back"

        MENU_BOX_02.size = SF.vector2(100, 50)
        MENU_BOX_02.position = SF.vector2(scale_x + 50, scale_y + 20)
        MENU_TEXT_02.color = SF::Color::Blue
        MENU_TEXT_02.character_size = 25
        MENU_TEXT_02.position = MENU_BOX_02.position + SF.vector2(8, 8)
        MENU_TEXT_02.string = "Debug"

     end

     def SystemMenus.draw_settings_menu(window)
        window.draw(MENU_BOX_01)
        window.draw(MENU_TEXT_01)
        window.draw(MENU_BOX_02)
        window.draw(MENU_TEXT_02)
        if SF::Mouse.button_pressed?(SF::Mouse::Left)
        SystemMenus.settings_menu_mouse_handling(window)
        end
     end

     def SystemMenus.settings_menu_mouse_handling(window)
        mouse_position = SF::Mouse.get_position(window)
        mouse_x = mouse_position.x
        mouse_y = mouse_position.y
        menu_box_1_x = MENU_BOX_01.position.x
        menu_box_1_y = MENU_BOX_01.position.y
        menu_box_2_x = MENU_BOX_02.position.x
        menu_box_2_y = MENU_BOX_02.position.y

        current_size = window.size
        original_width = 800
        original_height = 600
    
        scale_x = current_size.x.to_f / original_width
        scale_y = current_size.y.to_f / original_height
    
        scaled_mouse_x = mouse_x / scale_x
        scaled_mouse_y = mouse_y / scale_y

        if (scaled_mouse_x >= menu_box_1_x && scaled_mouse_x <= menu_box_1_x + MENU_BOX_01.size.x) && (scaled_mouse_y >= menu_box_1_y && scaled_mouse_y <= menu_box_1_y + MENU_BOX_01.size.y)
            SystemMenus.system_menu=("main_menu")
        end

        if (scaled_mouse_x >= menu_box_2_x && scaled_mouse_x <= menu_box_2_x + MENU_BOX_02.size.x) && (scaled_mouse_y >= menu_box_2_y && scaled_mouse_y <= menu_box_2_y + MENU_BOX_02.size.y)
            SystemMenus.initialize_debug_menu(window)
            SystemMenus.system_menu=("debug")
        end
     end

     def SystemMenus.initialize_debug_menu(window)
        current_size = window.size
        original_width = 800 
        original_height = 600
    
        scale_x = current_size.x.to_f / original_width
        scale_y = current_size.y.to_f / original_height

        MENU_BOX_01.position = SF.vector2(scale_x + 20, scale_y + 540)
        MENU_TEXT_01.position = MENU_BOX_01.position + SF.vector2(15, 1)
        MENU_BOX_01.size = SF.vector2(115, 40)
        MENU_TEXT_01.string = "Back"

        MENU_BOX_02.size = SF.vector2(155, 50)
        MENU_BOX_02.position = SF.vector2(scale_x + 50, scale_y + 20)
        MENU_TEXT_02.color = SF::Color::Blue
        MENU_TEXT_02.character_size = 25
        MENU_TEXT_02.position = MENU_BOX_02.position + SF.vector2(8, 8)
        MENU_TEXT_02.string = "level_editor"
     end

     def SystemMenus.draw_debug_menu(window)
        window.draw(MENU_BOX_01)
        window.draw(MENU_TEXT_01)
        window.draw(MENU_BOX_02)
        window.draw(MENU_TEXT_02)
        if SF::Mouse.button_pressed?(SF::Mouse::Left)
        SystemMenus.settings_menu_mouse_handling(window)
        end
     end

     def SystemMenus.initialize_save_menu(window)
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

        if !File.exists?("src/saves/save01")
            MENU_TEXT_02.string = "Empty"
        else
            MENU_TEXT_02.string = Serialization::SaveFile.retrieve_data("src/saves/save01", "name").to_s
            SystemMenus.center_save_file_text(MENU_TEXT_02)
        end
        if !File.exists?("src/saves/save02")
            MENU_TEXT_03.string = "Empty"
        else
            MENU_TEXT_03.string = Serialization::SaveFile.retrieve_data("src/saves/save02", "name").to_s
            SystemMenus.center_save_file_text(MENU_TEXT_03)
        end
        if !File.exists?("src/saves/save03")
            MENU_TEXT_04.string = "Empty"
        else
            MENU_TEXT_04.string = Serialization::SaveFile.retrieve_data("src/saves/save03", "name").to_s
            SystemMenus.center_save_file_text(MENU_TEXT_04)
        end
        if !File.exists?("src/saves/save04")
            MENU_TEXT_05.string = "Empty"
        else
            MENU_TEXT_05.string = Serialization::SaveFile.retrieve_data("src/saves/save04", "name").to_s
            SystemMenus.center_save_file_text(MENU_TEXT_05)
        end
        if !File.exists?("src/saves/save05")
            MENU_TEXT_06.string = "Empty"
        else
            MENU_TEXT_06.string = Serialization::SaveFile.retrieve_data("src/saves/save05", "name").to_s
            SystemMenus.center_save_file_text(MENU_TEXT_06)
        end
        if !File.exists?("src/saves/save06")
            MENU_TEXT_07.string = "Empty"
        else
            MENU_TEXT_07.string = Serialization::SaveFile.retrieve_data("src/saves/save06", "name").to_s
            SystemMenus.center_save_file_text(MENU_TEXT_07)
        end
        if !File.exists?("src/saves/save07")
            MENU_TEXT_08.string = "Empty"
        else
            MENU_TEXT_08.string = Serialization::SaveFile.retrieve_data("src/saves/save07", "name").to_s
            SystemMenus.center_save_file_text(MENU_TEXT_08)
        end
     end

     def SystemMenus.draw_save_menu(window)

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

     def SystemMenus.center_save_file_text(this)
        if this.string.size > 5 && this.string.size < 10
            x = this.position.x - (this.string.size + 5)
            this.position = SF.vector2(x, this.position.y)
        elsif this.string.size >= 10 && this.character_size > 30
            this.character_size = this.character_size - 2

            x = this.position.x - (this.string.size + 5)
            this.position = SF.vector2(x, this.position.y)
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
        current_size = window.size
        original_width = 800
        original_height = 600
    
        scale_x = current_size.x.to_f / original_width
        scale_y = current_size.y.to_f / original_height
    
        scaled_mouse_x = mouse_x / scale_x
        scaled_mouse_y = mouse_y / scale_y
        if (scaled_mouse_x >= menu_box_1_x && scaled_mouse_x <= menu_box_1_x + MENU_BOX_01.size.x) && (scaled_mouse_y >= menu_box_1_y && scaled_mouse_y <= menu_box_1_y + MENU_BOX_01.size.y)
            SystemMenus.system_menu=("main_menu")
        end
        if (scaled_mouse_x >= menu_box_2_x && scaled_mouse_x <= menu_box_2_x + MENU_BOX_02.size.x) && (scaled_mouse_y >= menu_box_2_y && scaled_mouse_y <= menu_box_2_y + MENU_BOX_02.size.y)
            if !File.exists?("src/saves/save01")
            Player::Stats.initialize_player_stats
            Serialization::SaveFile.save_file=("save01")
            Serialization::SaveFile.initial_save("save01")
            SystemMenus.initialize_character_creation_menu(window)
            else
             Serialization::SaveFile.save_file=("save01")
             Serialization::SaveFile.load_game("src/saves/save01")
             Sprites::Player.is_drawn=(true)
             SystemMenus.system_menu=("hud")
             SystemMenus.initialize_hud(window)
             Keyboard::Gameplay.gameplay_mode=("normal")
             Levels::PhysicsTest.initialize_platform_test(window)
             Levels::LevelSelectionLogic.level=("physics_test")
             SystemMenus.initialize_hud(window)
            end
        end
        if (scaled_mouse_x >= menu_box_3_x && scaled_mouse_x <= menu_box_3_x + MENU_BOX_03.size.x) && (scaled_mouse_y >= menu_box_3_y && scaled_mouse_y <= menu_box_3_y + MENU_BOX_03.size.y)
            Player::Stats.initialize_player_stats
            Serialization::SaveFile.save_file=("save02")
            Serialization::SaveFile.initial_save("save02")
            SystemMenus.initialize_character_creation_menu(window)
        end
        if (scaled_mouse_x >= menu_box_4_x && scaled_mouse_x <= menu_box_4_x + MENU_BOX_04.size.x) && (scaled_mouse_y >= menu_box_4_y && scaled_mouse_y <= menu_box_4_y + MENU_BOX_04.size.y)
            Player::Stats.initialize_player_stats
            Serialization::SaveFile.save_file=("save03")
            Serialization::SaveFile.initial_save("save03")
            SystemMenus.initialize_character_creation_menu(window)
        end
        if (scaled_mouse_x >= menu_box_5_x && scaled_mouse_x <= menu_box_5_x + MENU_BOX_05.size.x) && (scaled_mouse_y >= menu_box_5_y && scaled_mouse_y <= menu_box_5_y + MENU_BOX_05.size.y)
            Player::Stats.initialize_player_stats
            Serialization::SaveFile.save_file=("save04")
            Serialization::SaveFile.initial_save("save04")
            SystemMenus.initialize_character_creation_menu(window)
        end
        if (scaled_mouse_x >= menu_box_6_x && scaled_mouse_x <= menu_box_6_x + MENU_BOX_06.size.x) && (scaled_mouse_y >= menu_box_6_y && scaled_mouse_y <= menu_box_6_y + MENU_BOX_06.size.y)
            Player::Stats.initialize_player_stats
            Serialization::SaveFile.save_file=("save05")
            Serialization::SaveFile.initial_save("save05")
            SystemMenus.initialize_character_creation_menu(window)
        end
        if (scaled_mouse_x >= menu_box_7_x && scaled_mouse_x <= menu_box_7_x + MENU_BOX_07.size.x) && (scaled_mouse_y >= menu_box_7_y && scaled_mouse_y <= menu_box_7_y + MENU_BOX_07.size.y)
            Player::Stats.initialize_player_stats
            Serialization::SaveFile.save_file=("save06")
            Serialization::SaveFile.initial_save("save06")
            SystemMenus.initialize_character_creation_menu(window)
        end
        if (scaled_mouse_x >= menu_box_8_x && scaled_mouse_x <= menu_box_8_x + MENU_BOX_08.size.x) && (scaled_mouse_y >= menu_box_8_y && scaled_mouse_y <= menu_box_8_y + MENU_BOX_08.size.y)
            Player::Stats.initialize_player_stats
            Serialization::SaveFile.save_file=("save07")
            Serialization::SaveFile.initial_save("save07")
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
        MENU_TEXT_01.character_size = 24

        MENU_BOX_02.position = SF.vector2(scale_x + 80, scale_y + 60)
        MENU_BOX_02.size = SF.vector2(115, 40)
        MENU_TEXT_02.position = MENU_BOX_02.position + SF.vector2(30, 1)
        MENU_TEXT_02.string = "Skin"
        MENU_TEXT_02.color = SF::Color::Black
        MENU_TEXT_02.character_size = 24

        MENU_BOX_03.position = SF.vector2(scale_x + 560, scale_y + 60)
        MENU_BOX_03.size = SF.vector2(115, 40)
        MENU_TEXT_03.position = MENU_BOX_03.position + SF.vector2(30, 1)
        MENU_TEXT_03.string = "Skin"
        MENU_TEXT_03.color = SF::Color::Black
        MENU_TEXT_03.character_size = 24

        MENU_BOX_04.position = SF.vector2(scale_x + 80, scale_y + 130)
        MENU_BOX_04.size = SF.vector2(115, 40)
        MENU_TEXT_04.position = MENU_BOX_04.position + SF.vector2(30, 1)
        MENU_TEXT_04.string = "Hair"
        MENU_TEXT_04.color = SF::Color::Black
        MENU_TEXT_04.character_size = 24

        MENU_BOX_05.position = SF.vector2(scale_x + 560, scale_y + 130)
        MENU_BOX_05.size = SF.vector2(115, 40)
        MENU_TEXT_05.position = MENU_BOX_05.position + SF.vector2(30, 1)
        MENU_TEXT_05.string = "Hair"
        MENU_TEXT_05.color = SF::Color::Black
        MENU_TEXT_05.character_size = 24

        MENU_BOX_06.position = SF.vector2(scale_x + 80, scale_y + 200)
        MENU_BOX_06.size = SF.vector2(115, 40)
        MENU_TEXT_06.position = MENU_BOX_06.position + SF.vector2(30, 1)
        MENU_TEXT_06.string = "Face"
        MENU_TEXT_06.color = SF::Color::Black
        MENU_TEXT_06.character_size = 24

        MENU_BOX_07.position = SF.vector2(scale_x + 560, scale_y + 200)
        MENU_BOX_07.size = SF.vector2(115, 40)
        MENU_TEXT_07.position = MENU_BOX_07.position + SF.vector2(30, 1)
        MENU_TEXT_07.string = "Face"
        MENU_TEXT_07.color = SF::Color::Black
        MENU_TEXT_07.character_size = 24

        MENU_BOX_08.position = SF.vector2(scale_x + 80, scale_y + 270)
        MENU_BOX_08.size = SF.vector2(115, 40)
        MENU_TEXT_08.position = MENU_BOX_08.position + SF.vector2(30, 1)
        MENU_TEXT_08.string = "Shirt"
        MENU_TEXT_08.color = SF::Color::Black
        MENU_TEXT_08.character_size = 24

        MENU_BOX_09.position = SF.vector2(scale_x + 560, scale_y + 270)
        MENU_BOX_09.size = SF.vector2(115, 40)
        MENU_TEXT_09.position = MENU_BOX_09.position + SF.vector2(30, 1)
        MENU_TEXT_09.string = "Shirt"
        MENU_TEXT_09.color = SF::Color::Black
        MENU_TEXT_09.character_size = 24

        MENU_BOX_10.position = SF.vector2(scale_x + 80, scale_y + 340)
        MENU_BOX_10.size = SF.vector2(115, 40)
        MENU_TEXT_10.position = MENU_BOX_10.position + SF.vector2(20, 1)
        MENU_TEXT_10.string = "Pants"
        MENU_TEXT_10.color = SF::Color::Black
        MENU_TEXT_10.character_size = 24

        MENU_BOX_11.position = SF.vector2(scale_x + 560, scale_y + 340)
        MENU_BOX_11.size = SF.vector2(115, 40)
        MENU_TEXT_11.position = MENU_BOX_11.position + SF.vector2(20, 1)
        MENU_TEXT_11.string = "Pants"
        MENU_TEXT_11.color = SF::Color::Black
        MENU_TEXT_11.character_size = 24

        MENU_BOX_12.position = SF.vector2(scale_x + 80, scale_y + 410)
        MENU_BOX_12.size = SF.vector2(115, 40)
        MENU_TEXT_12.position = MENU_BOX_12.position + SF.vector2(20, 1)
        MENU_TEXT_12.string = "Shoes"
        MENU_TEXT_12.color = SF::Color::Black
        MENU_TEXT_12.character_size = 24

        MENU_BOX_13.position = SF.vector2(scale_x + 560, scale_y + 410)
        MENU_BOX_13.size = SF.vector2(115, 40)
        MENU_TEXT_13.position = MENU_BOX_13.position + SF.vector2(20, 1)
        MENU_TEXT_13.string = "Shoes"
        MENU_TEXT_13.color = SF::Color::Black
        MENU_TEXT_13.character_size = 24

        MENU_BOX_14.position = SF.vector2(scale_x + 660, scale_y + 540)
        MENU_TEXT_14.position = MENU_BOX_14.position + SF.vector2(15, 1)
        MENU_BOX_14.size = SF.vector2(115, 40)
        MENU_TEXT_14.string = "Next"
        MENU_TEXT_14.color = SF::Color::Black
        MENU_TEXT_14.character_size = 24

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
            SystemMenus.initialize_save_menu(window)
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
            Keyboard::Gameplay.gameplay_mode=("normal")
            Levels::PhysicsTest.initialize_platform_test(window)
            Levels::LevelSelectionLogic.level=("physics_test")
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
        HUD_BOTTOM.scale = SF.vector2(scale_x, scale_y / 5)
        HUD_BOTTOM.position = SF.vector2(0_f32, current_size.y.to_f32 - HUD_BOTTOM.global_bounds.height)

        MENU_BOX_01.position = SF.vector2(HUD_BOTTOM.position.x + 150, current_size.y.to_f32 - MENU_BOX_01.global_bounds.height - 10)
        MENU_BOX_01.scale = SF.vector2(scale_x, scale_y)

        MENU_BOX_02.position = SF.vector2(HUD_BOTTOM.position.x + 550, current_size.y.to_f32 - MENU_BOX_02.global_bounds.height - 10)
        MENU_BOX_02.scale = SF.vector2(scale_x, scale_y)

        MENU_TEXT_01.position = MENU_BOX_01.position + SF.vector2(50 - Player::Stats.lvl.to_s.size, 1)
        MENU_BOX_01.size = SF.vector2(115, 40)

        MENU_TEXT_01.string = Player::Stats.lvl.to_s
        MENU_TEXT_01.character_size = 24
        MENU_TEXT_01.scale = SF.vector2(scale_x, scale_y)

        MENU_TEXT_02.string = "Menu"
        MENU_TEXT_02.character_size = 24
        MENU_TEXT_02.scale = SF.vector2(scale_x, scale_y)

        HP_BAR.position = SF.vector2(HUD_BOTTOM.position.x + 190, current_size.y.to_f32 - MENU_BOX_01.global_bounds.height - 10)
        MP_BAR.position = SF.vector2(HUD_BOTTOM.position.x + 190, current_size.y.to_f32 - MENU_BOX_01.global_bounds.height - 20)
        
     end

     def SystemMenus.draw_hud(window) 
     if SF::Event::Resized #the HUD will never scale correctly without this
        current_size = window.size
        original_width = 800 
        original_height = 600
        scale_x = current_size.x.to_f / original_width
        scale_y = current_size.y.to_f / original_height
        HUD_BOTTOM.scale = SF.vector2(scale_x, scale_y / 5)
        HUD_BOTTOM.position = SF.vector2(0_f32, current_size.y.to_f32 - HUD_BOTTOM.global_bounds.height)

        scale_ratio = [scale_x, scale_y].min
        MENU_BOX_01.scale = SF.vector2(scale_x, scale_y)
        MENU_BOX_01.position = SF.vector2(30_f32 * scale_x, HUD_BOTTOM.position.y - MENU_BOX_01.global_bounds.height + 90 * scale_y)

        MENU_TEXT_01.scale = SF.vector2(scale_ratio, scale_ratio)
        MENU_TEXT_01.position = MENU_BOX_01.position + SF.vector2((50 - Player::Stats.lvl.to_s.size) * scale_x, 1 * scale_y)

        MENU_BOX_02.scale = SF.vector2(scale_x, scale_y)
        MENU_BOX_02.position = SF.vector2(650_f32 * scale_x, HUD_BOTTOM.position.y - MENU_BOX_01.global_bounds.height + 90 * scale_y)

        MENU_TEXT_02.scale = SF.vector2(scale_ratio, scale_ratio)
        MENU_TEXT_02.position = MENU_BOX_02.position + SF.vector2(28 + scale_x, scale_y)

        #so much math lol

        HP_BAR.position = SF.vector2(HUD_BOTTOM.position.x + 190 * scale_x, HUD_BOTTOM.position.y - MENU_BOX_01.global_bounds.height + 85 * scale_y)
        HP_BAR.scale = SF.vector2(scale_ratio, scale_ratio)

        HP_COLOR_BAR.position = SF.vector2(HUD_BOTTOM.position.x + 190 * scale_x, HUD_BOTTOM.position.y - MENU_BOX_01.global_bounds.height + 85 * scale_y)
        HP_COLOR_BAR.scale = SF.vector2((Player::Stats.current_hp.not_nil! / Player::Stats.max_hp.not_nil!) * scale_ratio, scale_ratio) 

        MP_BAR.position = SF.vector2(HUD_BOTTOM.position.x + 190 * scale_x, HUD_BOTTOM.position.y - MENU_BOX_01.global_bounds.height + 105 * scale_y)
        MP_BAR.scale = SF.vector2(scale_ratio, scale_ratio)

        MP_COLOR_BAR.position = SF.vector2(HUD_BOTTOM.position.x + 190 * scale_x, HUD_BOTTOM.position.y - MENU_BOX_01.global_bounds.height + 105 * scale_y)
        MP_COLOR_BAR.scale = SF.vector2((Player::Stats.current_mp.not_nil! / Player::Stats.max_mp.not_nil!) * scale_ratio, scale_ratio) 

        EXP_BAR.position = SF.vector2(HUD_BOTTOM.position.x + 190 * scale_x, HUD_BOTTOM.position.y - MENU_BOX_01.global_bounds.height + 125 * scale_y)
        EXP_BAR.scale = SF.vector2(scale_ratio, scale_ratio)

        EXP_COLOR_BAR.position = SF.vector2(HUD_BOTTOM.position.x + 190 * scale_x, HUD_BOTTOM.position.y - MENU_BOX_01.global_bounds.height + 125 * scale_y)
        EXP_COLOR_BAR.scale = SF.vector2((Player::Stats.exp.not_nil! / Player::Stats.exp_cap.not_nil!) * scale_ratio, scale_ratio) 
     end
        window_size = window.size
        hud_view = SF::View.new(SF::FloatRect.new(0_f32, window_size.y.to_f32 / 2_f32, window_size.x.to_f32, window_size.y.to_f32 / 2_f32))
        hud_view.viewport = SF::FloatRect.new(0_f32, 0.5_f32, 1_f32, 0.5_f32)
        window.view = hud_view
        window.draw(HUD_BOTTOM)
        window.draw(MENU_BOX_01)
        window.draw(MENU_TEXT_01)
        window.draw(MENU_BOX_02)
        window.draw(MENU_TEXT_02)
        window.draw(HP_BAR)
        window.draw(HP_COLOR_BAR)
        window.draw(MP_BAR)
        window.draw(MP_COLOR_BAR)
        window.draw(EXP_BAR)
        window.draw(EXP_COLOR_BAR)
        window.view = window.default_view
        if SF::Mouse.button_pressed?(SF::Mouse::Left)
            SystemMenus.hud_mouse_handling(window)
        end
     end

     def SystemMenus.hud_mouse_handling(window)
        mouse_position = SF::Mouse.get_position(window)
        mouse_x = mouse_position.x
        mouse_y = mouse_position.y

        menu_box_2_x = MENU_BOX_02.position.x
        menu_box_2_y = MENU_BOX_02.position.y

        current_size = window.size
        original_width = 800
        original_height = 600
    
        scale_x = current_size.x.to_f / original_width
        scale_y = current_size.y.to_f / original_height
    
        scaled_mouse_x = mouse_x / scale_x
        scaled_mouse_y = mouse_y / scale_y

        if (scaled_mouse_x >= menu_box_2_x / scale_x && scaled_mouse_x <= menu_box_2_x + MENU_BOX_02.size.x / scale_x) && 
            (scaled_mouse_y >= menu_box_2_y / scale_y && scaled_mouse_y <= menu_box_2_y / scale_y + MENU_BOX_02.size.y / scale_y)
            if Windows.is_hud_menu_open == false
                Windows.is_hud_menu_open=(true)
            else
                Windows.is_hud_menu_open=(false)
            end
            sleep 0.15.seconds
        end
     end

    end

    class Windows # I now know why everyone hates coding UI shit -_-

        WINDOW_01 = SF::RectangleShape.new(SF.vector2(260, 80)) #it ain't perfect, but it's good enough :P
        WINDOW_01.fill_color = SF.color(200, 212, 219)
        WINDOW_01.outline_thickness = 10
        WINDOW_01.outline_color = SF.color(151, 179, 194)

        WINDOW_02 = SF::RectangleShape.new(SF.vector2(260, 20))
        WINDOW_02.fill_color = SF.color(116, 153, 195)

        WINDOW_02_TEXT = SF::Text.new
        WINDOW_02_TEXT.font = QUICKSAND
        WINDOW_02_TEXT.string = "Save"
        WINDOW_02_TEXT.character_size = 24

        WINDOW_03 = SF::RectangleShape.new(SF.vector2(260, 20))
        WINDOW_03.fill_color = SF.color(116, 153, 195)

        WINDOW_03_TEXT = SF::Text.new
        WINDOW_03_TEXT.font = QUICKSAND
        WINDOW_03_TEXT.string = "Save & Quit"
        WINDOW_03_TEXT.character_size = 24

        WINDOW_04 = SF::RectangleShape.new(SF.vector2(260, 20))
        WINDOW_04.fill_color = SF.color(116, 153, 195)

        WINDOW_04_TEXT = SF::Text.new
        WINDOW_04_TEXT.font = QUICKSAND
        WINDOW_04_TEXT.string = "Stats"
        WINDOW_04_TEXT.character_size = 24

        STATS_MENU = SF::RectangleShape.new(SF.vector2(500, 400))
        STATS_MENU.fill_color = SF.color(116, 153, 195)
        STATS_MENU.outline_thickness = 10
        STATS_MENU.outline_color = SF.color(151, 179, 194)

        NAME_BOX = SF::RectangleShape.new(SF.vector2(250, 50))
        NAME_BOX.fill_color = SF.color(116, 153, 195)
        NAME_BOX.outline_thickness = 5
        NAME_BOX.outline_color = SF.color(151, 179, 194)

        NAME_BOX_TEXT = SF::Text.new
        NAME_BOX_TEXT.font = QUICKSAND
        NAME_BOX_TEXT.character_size = 24

        MONEY_BOX = SF::RectangleShape.new(SF.vector2(190, 50))
        MONEY_BOX.fill_color = SF.color(116, 153, 195)
        MONEY_BOX.outline_thickness = 5
        MONEY_BOX.outline_color = SF.color(151, 179, 194)

        MONEY_BOX_TEXT = SF::Text.new
        MONEY_BOX_TEXT.font = QUICKSAND
        MONEY_BOX_TEXT.character_size = 24

        HP_BOX = SF::RectangleShape.new(SF.vector2(220, 50))
        HP_BOX.fill_color = SF.color(116, 153, 195)
        HP_BOX.outline_thickness = 5
        HP_BOX.outline_color = SF.color(151, 179, 194)

        HP_BOX_TEXT = SF::Text.new
        HP_BOX_TEXT.font = QUICKSAND
        HP_BOX_TEXT.character_size = 24

        MP_BOX = SF::RectangleShape.new(SF.vector2(220, 50))
        MP_BOX.fill_color = SF.color(116, 153, 195)
        MP_BOX.outline_thickness = 5
        MP_BOX.outline_color = SF.color(151, 179, 194)

        MP_BOX_TEXT = SF::Text.new
        MP_BOX_TEXT.font = QUICKSAND
        MP_BOX_TEXT.character_size = 24

        LVL_BOX = SF::RectangleShape.new(SF.vector2(220, 50))
        LVL_BOX.fill_color = SF.color(116, 153, 195)
        LVL_BOX.outline_thickness = 5
        LVL_BOX.outline_color = SF.color(151, 179, 194)

        LVL_BOX_TEXT = SF::Text.new
        LVL_BOX_TEXT.font = QUICKSAND
        LVL_BOX_TEXT.character_size = 24

        EXP_BOX = SF::RectangleShape.new(SF.vector2(220, 50))
        EXP_BOX.fill_color = SF.color(116, 153, 195)
        EXP_BOX.outline_thickness = 5
        EXP_BOX.outline_color = SF.color(151, 179, 194)

        EXP_BOX_TEXT = SF::Text.new
        EXP_BOX_TEXT.font = QUICKSAND
        EXP_BOX_TEXT.character_size = 24

        STR_BOX = SF::RectangleShape.new(SF.vector2(220, 50))
        STR_BOX.fill_color = SF.color(116, 153, 195)
        STR_BOX.outline_thickness = 5
        STR_BOX.outline_color = SF.color(151, 179, 194)

        STR_BOX_TEXT = SF::Text.new
        STR_BOX_TEXT.font = QUICKSAND
        STR_BOX_TEXT.character_size = 24

        DEX_BOX = SF::RectangleShape.new(SF.vector2(220, 50))
        DEX_BOX.fill_color = SF.color(116, 153, 195)
        DEX_BOX.outline_thickness = 5
        DEX_BOX.outline_color = SF.color(151, 179, 194)

        DEX_BOX_TEXT = SF::Text.new
        DEX_BOX_TEXT.font = QUICKSAND
        DEX_BOX_TEXT.character_size = 24

        INT_BOX = SF::RectangleShape.new(SF.vector2(220, 50))
        INT_BOX.fill_color = SF.color(116, 153, 195)
        INT_BOX.outline_thickness = 5
        INT_BOX.outline_color = SF.color(151, 179, 194)

        INT_BOX_TEXT = SF::Text.new
        INT_BOX_TEXT.font = QUICKSAND
        INT_BOX_TEXT.character_size = 24

        LUK_BOX = SF::RectangleShape.new(SF.vector2(220, 50))
        LUK_BOX.fill_color = SF.color(116, 153, 195)
        LUK_BOX.outline_thickness = 5
        LUK_BOX.outline_color = SF.color(151, 179, 194)

        LUK_BOX_TEXT = SF::Text.new
        LUK_BOX_TEXT.font = QUICKSAND
        LUK_BOX_TEXT.character_size = 24

        LEFT_ARROW_01 = SF::RectangleShape.new(SF.vector2(50, 15))
        LEFT_ARROW_01.fill_color = SF.color( 137, 170, 208 )
        LEFT_ARROW_01.outline_thickness = 5
        LEFT_ARROW_01.outline_color = SF.color( 154, 191, 232 )

        RIGHT_ARROW_01 = SF::RectangleShape.new(SF.vector2(50, 15))
        RIGHT_ARROW_01.fill_color = SF.color( 137, 170, 208 )
        RIGHT_ARROW_01.outline_thickness = 5
        RIGHT_ARROW_01.outline_color = SF.color( 154, 191, 232 )

        LEFT_ARROW_02 = SF::RectangleShape.new(SF.vector2(50, 15))
        LEFT_ARROW_02.fill_color = SF.color( 137, 170, 208 )
        LEFT_ARROW_02.outline_thickness = 5
        LEFT_ARROW_02.outline_color = SF.color( 154, 191, 232 )

        RIGHT_ARROW_02 = SF::RectangleShape.new(SF.vector2(50, 15))
        RIGHT_ARROW_02.fill_color = SF.color( 137, 170, 208 )
        RIGHT_ARROW_02.outline_thickness = 5
        RIGHT_ARROW_02.outline_color = SF.color( 154, 191, 232 )

        LEFT_ARROW_03 = SF::RectangleShape.new(SF.vector2(50, 15))
        LEFT_ARROW_03.fill_color = SF.color( 137, 170, 208 )
        LEFT_ARROW_03.outline_thickness = 5
        LEFT_ARROW_03.outline_color = SF.color( 154, 191, 232 )

        RIGHT_ARROW_03 = SF::RectangleShape.new(SF.vector2(50, 15))
        RIGHT_ARROW_03.fill_color = SF.color( 137, 170, 208 )
        RIGHT_ARROW_03.outline_thickness = 5
        RIGHT_ARROW_03.outline_color = SF.color( 154, 191, 232 )

        LEFT_ARROW_04 = SF::RectangleShape.new(SF.vector2(50, 15))
        LEFT_ARROW_04.fill_color = SF.color( 137, 170, 208 )
        LEFT_ARROW_04.outline_thickness = 5
        LEFT_ARROW_04.outline_color = SF.color( 154, 191, 232 )

        RIGHT_ARROW_04 = SF::RectangleShape.new(SF.vector2(50, 15))
        RIGHT_ARROW_04.fill_color = SF.color( 137, 170, 208 )
        RIGHT_ARROW_04.outline_thickness = 5
        RIGHT_ARROW_04.outline_color = SF.color( 154, 191, 232 )

        LEFT_ARROW_05 = SF::RectangleShape.new(SF.vector2(50, 15))
        LEFT_ARROW_05.fill_color = SF.color( 137, 170, 208 )
        LEFT_ARROW_05.outline_thickness = 5
        LEFT_ARROW_05.outline_color = SF.color( 154, 191, 232 )

        RIGHT_ARROW_05 = SF::RectangleShape.new(SF.vector2(50, 15))
        RIGHT_ARROW_05.fill_color = SF.color( 137, 170, 208 )
        RIGHT_ARROW_05.outline_thickness = 5
        RIGHT_ARROW_05.outline_color = SF.color( 154, 191, 232 )

        LEFT_ARROW_06 = SF::RectangleShape.new(SF.vector2(50, 15))
        LEFT_ARROW_06.fill_color = SF.color( 137, 170, 208 )
        LEFT_ARROW_06.outline_thickness = 5
        LEFT_ARROW_06.outline_color = SF.color( 154, 191, 232 )

        RIGHT_ARROW_06 = SF::RectangleShape.new(SF.vector2(50, 15))
        RIGHT_ARROW_06.fill_color = SF.color( 137, 170, 208 )
        RIGHT_ARROW_06.outline_thickness = 5
        RIGHT_ARROW_06.outline_color = SF.color( 154, 191, 232 )


        def initialize(is_hud_menu_open : Bool, @@is_stats_menu_open : Bool)
            @@is_hud_menu_open = is_hud_menu_open
            @@is_hud_menu_open = false

            @@is_stats_menu_open = is_stats_menu_open
            @@is_stats_menu_open = false
        end

        def Windows.is_hud_menu_open
            @@is_hud_menu_open
        end

        def Windows.is_hud_menu_open=(this)
            @@is_hud_menu_open = this
        end

        def Windows.is_stats_menu_open
            @@is_stats_menu_open
        end

        def Windows.is_stats_menu_open=(this)
            @@is_stats_menu_open = this
        end

        def Windows.draw_hud_menu(window)
            window.draw(WINDOW_01)
            window.draw(WINDOW_02)
            window.draw(WINDOW_02_TEXT)
            window.draw(WINDOW_03)
            window.draw(WINDOW_03_TEXT)
            window.draw(WINDOW_04)
            window.draw(WINDOW_04_TEXT)
            if SF::Mouse.button_pressed?(SF::Mouse::Left)
                Windows.window_mouse_handling(window)
            end
        end

        def Windows.draw_stats_menu(window)
            window.draw(STATS_MENU)
            window.draw(NAME_BOX)
            window.draw(NAME_BOX_TEXT)
            window.draw(MONEY_BOX)
            window.draw(MONEY_BOX_TEXT)
            window.draw(HP_BOX)
            window.draw(HP_BOX_TEXT)
            window.draw(MP_BOX)
            window.draw(MP_BOX_TEXT)
            window.draw(LVL_BOX)
            window.draw(LVL_BOX_TEXT)
            window.draw(EXP_BOX)
            window.draw(EXP_BOX_TEXT)
            window.draw(STR_BOX)
            window.draw(STR_BOX_TEXT)
            window.draw(DEX_BOX)
            window.draw(DEX_BOX_TEXT)
            window.draw(INT_BOX)
            window.draw(INT_BOX_TEXT)
            window.draw(LUK_BOX)
            window.draw(LUK_BOX_TEXT)
            window.draw(LEFT_ARROW_01)
            window.draw(RIGHT_ARROW_01)
            window.draw(LEFT_ARROW_02)
            window.draw(RIGHT_ARROW_02)
            window.draw(LEFT_ARROW_03)
            window.draw(RIGHT_ARROW_03)
            window.draw(LEFT_ARROW_04)
            window.draw(RIGHT_ARROW_04)
            window.draw(LEFT_ARROW_05)
            window.draw(RIGHT_ARROW_05)
            window.draw(LEFT_ARROW_06)
            window.draw(RIGHT_ARROW_06)
            if SF::Mouse.button_pressed?(SF::Mouse::Left)
                Windows.window_mouse_handling(window)
            end
        end

        def Windows.which_views_are_open(window)
            current_size = window.size
            original_width = 800 
            original_height = 600
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
            window_width = current_size.x.to_f
            window_height = current_size.y.to_f
            scale_ratio = [scale_x, scale_y].min

            max_scale = 1.5 # Adjust this to whatever max size feels right
            clamped_scale = [scale_ratio, max_scale].min
          
            if @@is_hud_menu_open == true
    
              margin_right = 30 
              margin_bottom = 30 
              
              WINDOW_01.position = SF.vector2(510 * scale_x, 470 * scale_y)
              WINDOW_01.scale = SF.vector2(scale_x, scale_ratio)
              
              WINDOW_02.position = SF.vector2(510 * scale_x, 465 * scale_y)
              WINDOW_02.scale = SF.vector2(scale_x, scale_ratio)
              
              WINDOW_02_TEXT.position = SF.vector2(605 * scale_x, 460 * scale_y)
              WINDOW_02_TEXT.scale = SF.vector2(scale_ratio, scale_ratio)
              
              WINDOW_03.position = SF.vector2(510 * scale_x, 488 * scale_y)
              WINDOW_03.scale = SF.vector2(scale_x, scale_ratio)
              
              WINDOW_03_TEXT.position = SF.vector2(580 * scale_x, 482 * scale_y)
              WINDOW_03_TEXT.scale = SF.vector2(scale_ratio, scale_ratio)
              
              WINDOW_04.position = SF.vector2(510 * scale_x, 511 * scale_y)
              WINDOW_04.scale = SF.vector2(scale_x, scale_ratio)
              
              WINDOW_04_TEXT.position = SF.vector2(610 * scale_x, 506 * scale_y)
              WINDOW_04_TEXT.scale = SF.vector2(scale_ratio, scale_ratio)

              window_size = window.size
              window_01_view = SF::View.new(SF::FloatRect.new(0_f32, window_size.y.to_f32 / 2_f32, window_size.x.to_f32, window_size.y.to_f32 / 2_f32))
              window_01_view.viewport = SF::FloatRect.new(0.485_f32, 0_f32, 0.5_f32, 1_f32)
              window.view = window_01_view
              Windows.draw_hud_menu(window)
            end

            if @@is_stats_menu_open == true
                window.view = window.default_view
                STATS_MENU.position = SF.vector2(50 * max_scale, 50 * max_scale)
                STATS_MENU.scale = SF.vector2(0.5, 1)

                NAME_BOX.position = STATS_MENU.position + SF.vector2(5 * max_scale, 5 * max_scale)
                NAME_BOX.scale = STATS_MENU.scale

                NAME_BOX_TEXT.position = NAME_BOX.position + SF.vector2(32 * max_scale, 5 * max_scale)
                NAME_BOX_TEXT.scale = NAME_BOX.scale
                NAME_BOX_TEXT.string = Player::Stats.name.not_nil!
                SystemMenus.center_save_file_text(NAME_BOX_TEXT)

                MONEY_BOX.position = STATS_MENU.position + SF.vector2(98 * max_scale, 5 * max_scale)
                MONEY_BOX.scale = STATS_MENU.scale

                MONEY_BOX_TEXT.position = MONEY_BOX.position + SF.vector2(28 * max_scale, 5 * max_scale)
                MONEY_BOX_TEXT.scale = MONEY_BOX.scale
                MONEY_BOX_TEXT.string = "Cash: " + Player::Stats.money.not_nil!.to_s
                SystemMenus.center_save_file_text(MONEY_BOX_TEXT)

                HP_BOX.position = STATS_MENU.position + SF.vector2(5 * max_scale, 90 * max_scale)
                HP_BOX.scale = STATS_MENU.scale

                HP_BOX_TEXT.position = HP_BOX.position + SF.vector2(11 * max_scale, 5 * max_scale)
                HP_BOX_TEXT.scale = HP_BOX.scale
                HP_BOX_TEXT.string = "HP: #{Player::Stats.current_hp.not_nil!.to_s}/#{Player::Stats.max_hp.not_nil!.to_s}"
                SystemMenus.center_save_file_text(HP_BOX_TEXT)

                LEFT_ARROW_01.position = HP_BOX.position + SF.vector2(0 * max_scale, 42 * max_scale)
                LEFT_ARROW_01.scale = STATS_MENU.scale

                RIGHT_ARROW_01.position = HP_BOX.position + SF.vector2(56 * max_scale, 42 * max_scale)
                RIGHT_ARROW_01.scale = STATS_MENU.scale

                MP_BOX.position = STATS_MENU.position + SF.vector2(87 * max_scale, 90 * max_scale)
                MP_BOX.scale = STATS_MENU.scale

                MP_BOX_TEXT.position = MP_BOX.position + SF.vector2(11 * max_scale, 5 * max_scale)
                MP_BOX_TEXT.scale = MP_BOX.scale
                MP_BOX_TEXT.string = "MP: #{Player::Stats.current_mp.not_nil!.to_s}/#{Player::Stats.max_mp.not_nil!.to_s}"
                SystemMenus.center_save_file_text(MP_BOX_TEXT)

                LEFT_ARROW_02.position = MP_BOX.position + SF.vector2(0 * max_scale, 42 * max_scale)
                LEFT_ARROW_02.scale = STATS_MENU.scale

                RIGHT_ARROW_02.position = MP_BOX.position + SF.vector2(56 * max_scale, 42 * max_scale)
                RIGHT_ARROW_02.scale = STATS_MENU.scale

                LVL_BOX.position = STATS_MENU.position + SF.vector2(5 * max_scale, 48 * max_scale)
                LVL_BOX.scale = STATS_MENU.scale

                LVL_BOX_TEXT.position = LVL_BOX.position + SF.vector2(14 * max_scale, 5 * max_scale)
                LVL_BOX_TEXT.scale = LVL_BOX.scale
                LVL_BOX_TEXT.string = "Lvl: " + Player::Stats.lvl.not_nil!.to_s + " Pts: " + Player::Stats.lvl_points.not_nil!.to_s
                SystemMenus.center_save_file_text(LVL_BOX_TEXT)

                EXP_BOX.position = STATS_MENU.position + SF.vector2(87 * max_scale, 48 * max_scale)
                EXP_BOX.scale = STATS_MENU.scale

                EXP_BOX_TEXT.position = EXP_BOX.position + SF.vector2(14 * max_scale, 5 * max_scale)
                EXP_BOX_TEXT.scale = EXP_BOX.scale
                EXP_BOX_TEXT.string = "EXP: #{Player::Stats.exp.not_nil!.to_s}/#{Player::Stats.exp_cap.not_nil!.to_s}"
                SystemMenus.center_save_file_text(EXP_BOX_TEXT)

                STR_BOX.position = STATS_MENU.position + SF.vector2(5 * max_scale, 152 * max_scale)
                STR_BOX.scale = STATS_MENU.scale

                STR_BOX_TEXT.position = STR_BOX.position + SF.vector2(28 * max_scale, 5 * max_scale)
                STR_BOX_TEXT.scale = STR_BOX.scale
                STR_BOX_TEXT.string = "Str: " + Player::Stats.str.not_nil!.to_s
                SystemMenus.center_save_file_text(STR_BOX_TEXT)

                LEFT_ARROW_03.position = STR_BOX.position + SF.vector2(0 * max_scale, 42 * max_scale)
                LEFT_ARROW_03.scale = STATS_MENU.scale

                RIGHT_ARROW_03.position = STR_BOX.position + SF.vector2(56 * max_scale, 42 * max_scale)
                RIGHT_ARROW_03.scale = STATS_MENU.scale

                DEX_BOX.position = STATS_MENU.position + SF.vector2(87 * max_scale, 152 * max_scale)
                DEX_BOX.scale = STATS_MENU.scale

                DEX_BOX_TEXT.position = DEX_BOX.position + SF.vector2(28 * max_scale, 5 * max_scale)
                DEX_BOX_TEXT.scale = DEX_BOX.scale
                DEX_BOX_TEXT.string = "Dex: " + Player::Stats.dex.not_nil!.to_s
                SystemMenus.center_save_file_text(DEX_BOX_TEXT)

                LEFT_ARROW_04.position = DEX_BOX.position + SF.vector2(0 * max_scale, 42 * max_scale)
                LEFT_ARROW_04.scale = STATS_MENU.scale

                RIGHT_ARROW_04.position = DEX_BOX.position + SF.vector2(56 * max_scale, 42 * max_scale)
                RIGHT_ARROW_04.scale = STATS_MENU.scale

                INT_BOX.position = STATS_MENU.position + SF.vector2(5 * max_scale, 214 * max_scale)
                INT_BOX.scale = STATS_MENU.scale

                INT_BOX_TEXT.position = INT_BOX.position + SF.vector2(28 * max_scale, 5 * max_scale)
                INT_BOX_TEXT.scale = INT_BOX.scale
                INT_BOX_TEXT.string = "Int: " + Player::Stats.int.not_nil!.to_s
                SystemMenus.center_save_file_text(INT_BOX_TEXT)

                LEFT_ARROW_05.position = INT_BOX.position + SF.vector2(0 * max_scale, 42 * max_scale)
                LEFT_ARROW_05.scale = STATS_MENU.scale

                RIGHT_ARROW_05.position = INT_BOX.position + SF.vector2(56 * max_scale, 42 * max_scale)
                RIGHT_ARROW_05.scale = STATS_MENU.scale

                LUK_BOX.position = STATS_MENU.position + SF.vector2(87 * max_scale, 214 * max_scale)
                LUK_BOX.scale = STATS_MENU.scale

                LUK_BOX_TEXT.position = LUK_BOX.position + SF.vector2(28 * max_scale, 5 * max_scale)
                LUK_BOX_TEXT.scale = LUK_BOX.scale
                LUK_BOX_TEXT.string = "Luk: " + Player::Stats.luk.not_nil!.to_s
                SystemMenus.center_save_file_text(LUK_BOX_TEXT)

                LEFT_ARROW_06.position = LUK_BOX.position + SF.vector2(0 * max_scale, 42 * max_scale)
                LEFT_ARROW_06.scale = STATS_MENU.scale

                RIGHT_ARROW_06.position = LUK_BOX.position + SF.vector2(56 * max_scale, 42 * max_scale)
                RIGHT_ARROW_06.scale = STATS_MENU.scale

                Windows.draw_stats_menu(window)
            end
        end

        def Windows.window_mouse_handling(window)
            mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window), window.view)
            mouse_x = mouse_position.x
            mouse_y = mouse_position.y
    
            menu_box_2_x = WINDOW_02.position.x
            menu_box_2_y = WINDOW_02.position.y
    
            menu_box_3_x = WINDOW_03.position.x
            menu_box_3_y = WINDOW_03.position.y
    
            menu_box_4_x = WINDOW_04.position.x
            menu_box_4_y = WINDOW_04.position.y
    
            arrow_left_1_x = LEFT_ARROW_01.position.x
            arrow_left_1_y = LEFT_ARROW_01.position.y
    
            arrow_right_1_x = RIGHT_ARROW_01.position.x
            arrow_right_1_y = RIGHT_ARROW_01.position.y
    
            arrow_left_2_x = LEFT_ARROW_02.position.x
            arrow_left_2_y = LEFT_ARROW_02.position.y
    
            arrow_right_2_x = RIGHT_ARROW_02.position.x
            arrow_right_2_y = RIGHT_ARROW_02.position.y
    
            current_size = window.size
            original_width = 800
            original_height = 600
        
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
        
            scaled_mouse_x = mouse_x / scale_x
            scaled_mouse_y = mouse_y / scale_y
    
            if (scaled_mouse_x >= menu_box_2_x / scale_x && scaled_mouse_x <= menu_box_2_x + WINDOW_02.size.x / scale_x) && 
                (scaled_mouse_y >= menu_box_2_y / scale_y && scaled_mouse_y <= menu_box_2_y / scale_y + WINDOW_02.size.y / scale_y)
                Serialization::SaveFile.normal_save
                sleep 0.15.seconds
            end
    
            if (scaled_mouse_x >= menu_box_3_x / scale_x && scaled_mouse_x <= menu_box_3_x + WINDOW_03.size.x / scale_x) && 
                (scaled_mouse_y >= menu_box_3_y / scale_y && scaled_mouse_y <= menu_box_3_y / scale_y + WINDOW_03.size.y / scale_y)
                Serialization::SaveFile.normal_save
                sleep 0.15.seconds
                window.close
            end
    
            if (scaled_mouse_x >= menu_box_4_x / scale_x && scaled_mouse_x <= menu_box_4_x + WINDOW_04.size.x / scale_x) && 
                (scaled_mouse_y >= menu_box_4_y / scale_y && scaled_mouse_y <= menu_box_4_y / scale_y + WINDOW_04.size.y / scale_y)
                if Windows.is_stats_menu_open == false
                Windows.is_stats_menu_open=(true)
                else
                Windows.is_stats_menu_open=(false)
                end
                sleep 0.15.seconds
            end
    
            if (scaled_mouse_x >= arrow_left_1_x / scale_x && scaled_mouse_x <= arrow_left_1_x + LEFT_ARROW_01.size.x / scale_x) && 
                (scaled_mouse_y >= arrow_left_1_y / scale_y && scaled_mouse_y <= arrow_left_1_y / scale_y + LEFT_ARROW_01.size.y / scale_y)
                if Player::Stats.max_hp.not_nil! >= 5
                    Player::Stats.max_hp=(Player::Stats.max_hp.not_nil! - 1)
                    Player::Stats.current_hp=(Player::Stats.current_hp.not_nil! - 1)
                    Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! + 1)
                end
                sleep 0.15.seconds
            end
    
            if (scaled_mouse_x >= arrow_right_1_x / scale_x && scaled_mouse_x <= arrow_right_1_x + RIGHT_ARROW_01.size.x / scale_x) && 
                (scaled_mouse_y >= arrow_right_1_y / scale_y && scaled_mouse_y <= arrow_right_1_y / scale_y + RIGHT_ARROW_01.size.y / scale_y)
                if Player::Stats.lvl_points.not_nil! >= 1
                    Player::Stats.max_hp=(Player::Stats.max_hp.not_nil! + 1)
                    Player::Stats.current_hp=(Player::Stats.current_hp.not_nil! + 1)
                    Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! - 1)
                end
                sleep 0.15.seconds
            end
    
            if (scaled_mouse_x >= arrow_left_2_x / scale_x && scaled_mouse_x <= arrow_left_2_x + LEFT_ARROW_02.size.x / scale_x) && 
                (scaled_mouse_y >= arrow_left_2_y / scale_y && scaled_mouse_y <= arrow_left_2_y / scale_y + LEFT_ARROW_02.size.y / scale_y)
                if Player::Stats.max_mp.not_nil! >= 5
                    Player::Stats.max_mp=(Player::Stats.max_mp.not_nil! - 1)
                    Player::Stats.current_mp=(Player::Stats.current_mp.not_nil! - 1)
                    Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! + 1)
                end
                sleep 0.15.seconds
            end
    
            if (scaled_mouse_x >= arrow_right_2_x / scale_x && scaled_mouse_x <= arrow_right_2_x + RIGHT_ARROW_02.size.x / scale_x) && 
                (scaled_mouse_y >= arrow_right_2_y / scale_y && scaled_mouse_y <= arrow_right_2_y / scale_y + RIGHT_ARROW_02.size.y / scale_y)
                if Player::Stats.lvl_points.not_nil! >= 1
                    Player::Stats.max_mp=(Player::Stats.max_mp.not_nil! + 1)
                    Player::Stats.current_mp=(Player::Stats.current_mp.not_nil! + 1)
                    Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! - 1)
                end
                sleep 0.15.seconds
            end
         end
    end
end