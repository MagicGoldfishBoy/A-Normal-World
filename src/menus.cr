require "crsfml"
require "json"
require "../src/textures.cr"
require "../src/fonts.cr"
require "../src/sprites.cr"
require "../src/serialization.cr"
require "../src/keyboard.cr"
require "../src/ui_elements.cr"
require "../src/level_editor.cr"
require "../src/menus/menu_handling.cr"

module Menus

    class SystemMenus

        HP_BAR = SF::RectangleShape.new(SF.vector2(300, 15))
        HP_COLOR_BAR = SF::RectangleShape.new(SF.vector2(300, 15))
        HP_COLOR_BAR.fill_color = SF.color( 122, 14, 14 )

        MP_BAR = SF::RectangleShape.new(SF.vector2(300, 15))
        MP_COLOR_BAR = SF::RectangleShape.new(SF.vector2(300, 15))
        MP_COLOR_BAR.fill_color = SF.color( 23, 81, 159 )

        EXP_BAR = SF::RectangleShape.new(SF.vector2(300, 15))
        EXP_COLOR_BAR = SF::RectangleShape.new(SF.vector2(300, 15))
        EXP_COLOR_BAR.fill_color = SF.color( 170, 183, 38 )

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
        when "level_editor"
            SystemMenus.draw_level_editor_ui(window)
        else
            puts @@system_menu
            window.close
        end
     end

     def SystemMenus.initialize_settings_menu(window)
        current_size = window.size
        original_width = 800 
        original_height = 600
    
        scale_x = current_size.x.to_f / original_width
        scale_y = current_size.y.to_f / original_height

        Ui_Elements::MenuBoxes::BACK_BUTTON.sprite.position = SF.vector2(scale_x + 20, scale_y + 540)
        Ui_Elements::MenuText::BACK_BUTTON_TEXT.text.position = Ui_Elements::MenuBoxes::BACK_BUTTON.sprite.position + SF.vector2(28, 1)

        Ui_Elements::MenuBoxes::DEBUG_BUTTON.sprite.position = SF.vector2(scale_x + 50, scale_y + 20)
        Ui_Elements::MenuText::DEBUG_BUTTON_TEXT.text.position = Ui_Elements::MenuBoxes::DEBUG_BUTTON.sprite.position + SF.vector2(8, 8)

     end

     def SystemMenus.draw_settings_menu(window)
        window.draw(Ui_Elements::MenuBoxes::BACK_BUTTON.sprite)
        window.draw(Ui_Elements::MenuText::BACK_BUTTON_TEXT.text)
        window.draw(Ui_Elements::MenuBoxes::DEBUG_BUTTON.sprite)
        window.draw(Ui_Elements::MenuText::DEBUG_BUTTON_TEXT.text)
        if SF::Mouse.button_pressed?(SF::Mouse::Left)
        SystemMenus.settings_menu_mouse_handling(window)
        end
     end

     def SystemMenus.settings_menu_mouse_handling(window)
        mouse_position = SF::Mouse.get_position(window)
        mouse_x = mouse_position.x
        mouse_y = mouse_position.y
        menu_box_1_x = Ui_Elements::MenuBoxes::BACK_BUTTON.sprite.position.x
        menu_box_1_y = Ui_Elements::MenuBoxes::BACK_BUTTON.sprite.position.y
        menu_box_2_x = Ui_Elements::MenuBoxes::DEBUG_BUTTON.sprite.position.x
        menu_box_2_y = Ui_Elements::MenuBoxes::DEBUG_BUTTON.sprite.position.y

        current_size = window.size
        original_width = 800
        original_height = 600
    
        scale_x = current_size.x.to_f / original_width
        scale_y = current_size.y.to_f / original_height
    
        scaled_mouse_x = mouse_x / scale_x
        scaled_mouse_y = mouse_y / scale_y

        if (scaled_mouse_x >= menu_box_1_x && scaled_mouse_x <= menu_box_1_x + Ui_Elements::MenuBoxes::BACK_BUTTON.width) && 
           (scaled_mouse_y >= menu_box_1_y && scaled_mouse_y <= menu_box_1_y + Ui_Elements::MenuBoxes::BACK_BUTTON.height)
            SystemMenus.system_menu=("main_menu")
            MenuHandling::Menu.current_menu = "main_menu"
            sleep 0.15.seconds
        end

        if (scaled_mouse_x >= menu_box_2_x && scaled_mouse_x <= menu_box_2_x + Ui_Elements::MenuBoxes::DEBUG_BUTTON.width) && 
           (scaled_mouse_y >= menu_box_2_y && scaled_mouse_y <= menu_box_2_y + Ui_Elements::MenuBoxes::DEBUG_BUTTON.height)
            SystemMenus.initialize_debug_menu(window)
            SystemMenus.system_menu=("debug")
            MenuHandling::Menu.current_menu = "debug"
            sleep 0.15.seconds
        end

     end

     def SystemMenus.initialize_debug_menu(window)
        current_size = window.size
        original_width = 800 
        original_height = 600
    
        scale_x = current_size.x.to_f / original_width
        scale_y = current_size.y.to_f / original_height

        Ui_Elements::MenuBoxes::BACK_BUTTON.sprite.position = SF.vector2(scale_x + 20, scale_y + 540)
        Ui_Elements::MenuText::BACK_BUTTON_TEXT.text.position = Ui_Elements::MenuBoxes::BACK_BUTTON.sprite.position + SF.vector2(28, 1)

        Ui_Elements::MenuBoxes::LEVEL_EDITOR_BUTTON.sprite.position = SF.vector2(scale_x + 50, scale_y + 20)
        Ui_Elements::MenuText::LEVEL_EDITOR_BUTTON_TEXT.text.position = Ui_Elements::MenuBoxes::LEVEL_EDITOR_BUTTON.sprite.position + SF.vector2(8, 8)
     end

     def SystemMenus.draw_debug_menu(window)
        window.draw(Ui_Elements::MenuBoxes::BACK_BUTTON.sprite)
        window.draw(Ui_Elements::MenuText::BACK_BUTTON_TEXT.text)
        window.draw(Ui_Elements::MenuBoxes::LEVEL_EDITOR_BUTTON.sprite)
        window.draw(Ui_Elements::MenuText::LEVEL_EDITOR_BUTTON_TEXT.text)
        if SF::Mouse.button_pressed?(SF::Mouse::Left)
        SystemMenus.debug_menu_mouse_handling(window)
        end
     end

     def SystemMenus.debug_menu_mouse_handling(window)
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

        menu_box_1_x = Ui_Elements::MenuBoxes::LEVEL_EDITOR_BUTTON.sprite.position.x
        menu_box_1_y = Ui_Elements::MenuBoxes::LEVEL_EDITOR_BUTTON.sprite.position.y
        menu_box_2_x = Ui_Elements::MenuBoxes::BACK_BUTTON.sprite.position.x
        menu_box_2_y = Ui_Elements::MenuBoxes::BACK_BUTTON.sprite.position.y

        if (scaled_mouse_x >= menu_box_1_x && scaled_mouse_x <= menu_box_1_x + Ui_Elements::MenuBoxes::LEVEL_EDITOR_BUTTON.width) && 
           (scaled_mouse_y >= menu_box_1_y && scaled_mouse_y <= menu_box_1_y + Ui_Elements::MenuBoxes::LEVEL_EDITOR_BUTTON.height)
            #SystemMenus.initialize_level_editor_ui(window)
            SystemMenus.system_menu=("level_editor")
            Keyboard::Gameplay.gameplay_mode=("level_editor")
            MenuHandling::Menu.current_menu = "level_editor"
            LevelEditor::LevelEditorLogic.set_current_index
            LevelEditor::LevelEditorLogic.set_current_array
            sleep 0.15.seconds
        end

        if (scaled_mouse_x >= menu_box_2_x && scaled_mouse_x <= menu_box_2_x + Ui_Elements::MenuBoxes::BACK_BUTTON.width) && 
           (scaled_mouse_y >= menu_box_2_y && scaled_mouse_y <= menu_box_2_y + Ui_Elements::MenuBoxes::BACK_BUTTON.height)
            SystemMenus.system_menu=("settings_menu")
            MenuHandling::Menu.current_menu = "settings_menu"
            sleep 0.15.seconds
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

     def SystemMenus.initialize_hud(window)
        Sprites::Player.refresh_player_sprite(window)
        Sprites::Player.resize_player_sprite(window, 1, 1)
        Sprites::Player.position_player_sprite(window, 250, 50)

        current_size = window.size
        original_width = 800 
        original_height = 600
    
        scale_x = current_size.x.to_f / original_width
        scale_y = current_size.y.to_f / original_height
        Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.scale = SF.vector2(scale_x, scale_y / 5)
        Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.position = SF.vector2(0_f32, current_size.y.to_f32 - Ui_Elements::MenuBoxes::MAIN_HUD_BOX.height)
        Ui_Elements::MenuBoxes::LEVEL_BOX.sprite.scale = SF.vector2(scale_x, scale_y)

        Ui_Elements::MenuBoxes::MENU_BOX.sprite.position = SF.vector2(Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.position.x + 550, 
        current_size.y.to_f32 - Ui_Elements::MenuBoxes::MENU_BOX.height - 10)
        Ui_Elements::MenuBoxes::MENU_BOX.sprite.scale = SF.vector2(scale_x, scale_y)

        Ui_Elements::MenuText::LEVEL_BOX_TEXT.text.position = Ui_Elements::MenuBoxes::LEVEL_BOX.sprite.position + SF.vector2(50 - Player::Stats.lvl.to_s.size, 1)

        Ui_Elements::MenuText::LEVEL_BOX_TEXT.text.string = Player::Stats.lvl.to_s
        Ui_Elements::MenuText::LEVEL_BOX_TEXT.text.scale = SF.vector2(scale_x, scale_y)

        Ui_Elements::MenuText::MENU_BOX_TEXT.text.scale = SF.vector2(scale_x, scale_y)

        HP_BAR.position = SF.vector2(Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.position.x + 190, current_size.y.to_f32 - Ui_Elements::MenuBoxes::LEVEL_BOX.height - 10)
        MP_BAR.position = SF.vector2(Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.position.x + 190, current_size.y.to_f32 - Ui_Elements::MenuBoxes::LEVEL_BOX.height - 20)
        
     end

     def SystemMenus.draw_hud(window) 
      if SF::Event::Resized #the HUD will never scale correctly without this
        current_size = window.size
        original_width = 800 
        original_height = 600
        scale_x = current_size.x.to_f / original_width
        scale_y = current_size.y.to_f / original_height
        Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.scale = SF.vector2(scale_x, scale_y / 5)
        Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.position = SF.vector2(0_f32, current_size.y.to_f32 - Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.global_bounds.height)

        scale_ratio = [scale_x, scale_y].min
        Ui_Elements::MenuBoxes::LEVEL_BOX.sprite.scale = SF.vector2(scale_x, scale_y)
        Ui_Elements::MenuBoxes::LEVEL_BOX.sprite.position = SF.vector2(30_f32 * scale_x, 
        Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.position.y - Ui_Elements::MenuBoxes::LEVEL_BOX.height + 70 * scale_y)

        Ui_Elements::MenuText::LEVEL_BOX_TEXT.text.scale = SF.vector2(scale_ratio, scale_ratio)
        Ui_Elements::MenuText::LEVEL_BOX_TEXT.text.position = Ui_Elements::MenuBoxes::LEVEL_BOX.sprite.position + SF.vector2((50 - Player::Stats.lvl.to_s.size) * scale_x, 1 * scale_y)

        Ui_Elements::MenuBoxes::MENU_BOX.sprite.scale = SF.vector2(scale_x, scale_y)
        Ui_Elements::MenuBoxes::MENU_BOX.sprite.position = SF.vector2(650_f32 * scale_x, Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.position.y - Ui_Elements::MenuBoxes::LEVEL_BOX.height + 70 * scale_y)

        Ui_Elements::MenuText::MENU_BOX_TEXT.text.scale = SF.vector2(scale_ratio, scale_ratio)
        Ui_Elements::MenuText::MENU_BOX_TEXT.text.position = Ui_Elements::MenuBoxes::MENU_BOX.sprite.position + SF.vector2(28 + scale_x, scale_y)

        #so much math lol

        HP_BAR.position = SF.vector2(Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.position.x + 190 * scale_x, Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.position.y - Ui_Elements::MenuBoxes::LEVEL_BOX.height + 65 * scale_y)
        HP_BAR.scale = SF.vector2(scale_ratio, scale_ratio)

        HP_COLOR_BAR.position = SF.vector2(Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.position.x + 190 * scale_x, Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.position.y - Ui_Elements::MenuBoxes::LEVEL_BOX.height + 65 * scale_y)
        HP_COLOR_BAR.scale = SF.vector2((Player::Stats.current_hp.not_nil! / Player::Stats.max_hp.not_nil!) * scale_ratio, scale_ratio) 

        MP_BAR.position = SF.vector2(Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.position.x + 190 * scale_x, Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.position.y - Ui_Elements::MenuBoxes::LEVEL_BOX.height + 85 * scale_y)
        MP_BAR.scale = SF.vector2(scale_ratio, scale_ratio)

        MP_COLOR_BAR.position = SF.vector2(Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.position.x + 190 * scale_x, Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.position.y - Ui_Elements::MenuBoxes::LEVEL_BOX.height + 85 * scale_y)
        MP_COLOR_BAR.scale = SF.vector2((Player::Stats.current_mp.not_nil! / Player::Stats.max_mp.not_nil!) * scale_ratio, scale_ratio) 

        EXP_BAR.position = SF.vector2(Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.position.x + 190 * scale_x, Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.position.y - Ui_Elements::MenuBoxes::LEVEL_BOX.height + 105 * scale_y)
        EXP_BAR.scale = SF.vector2(scale_ratio, scale_ratio)

        EXP_COLOR_BAR.position = SF.vector2(Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.position.x + 190 * scale_x, Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.position.y - Ui_Elements::MenuBoxes::LEVEL_BOX.height + 105 * scale_y)
        EXP_COLOR_BAR.scale = SF.vector2((Player::Stats.exp.not_nil! / Player::Stats.exp_cap.not_nil!) * scale_ratio, scale_ratio) 
      end
        window_size = window.size
        hud_view = SF::View.new(SF::FloatRect.new(0_f32, window_size.y.to_f32 / 2_f32, window_size.x.to_f32, window_size.y.to_f32 / 2_f32))
        hud_view.viewport = SF::FloatRect.new(0_f32, 0.5_f32, 1_f32, 0.5_f32)
        window.view = hud_view
        window.draw(Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite)
        window.draw(Ui_Elements::MenuBoxes::LEVEL_BOX.sprite)
        window.draw(Ui_Elements::MenuText::LEVEL_BOX_TEXT.text)
        window.draw(Ui_Elements::MenuBoxes::MENU_BOX.sprite)
        window.draw(Ui_Elements::MenuText::MENU_BOX_TEXT.text)
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
        window_size = window.size
        hud_view = SF::View.new(SF::FloatRect.new(0_f32, window_size.y.to_f32 / 2_f32, window_size.x.to_f32, window_size.y.to_f32 / 2_f32))
        hud_view.viewport = SF::FloatRect.new(0_f32, 0.5_f32, 1_f32, 0.5_f32)
        window.view = hud_view
        mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window), window.view)

        mouse_x = mouse_position.x
        mouse_y = mouse_position.y

        menu_box_2_x = Ui_Elements::MenuBoxes::MENU_BOX.sprite.position.x
        menu_box_2_y = Ui_Elements::MenuBoxes::MENU_BOX.sprite.position.y

        current_size = window.size
        original_width = 800
        original_height = 600
    
        scale_x = current_size.x.to_f / original_width
        scale_y = current_size.y.to_f / original_height
    
        scaled_mouse_x = mouse_x / scale_x
        scaled_mouse_y = mouse_y / scale_y

        if (scaled_mouse_x >= menu_box_2_x / scale_x && scaled_mouse_x <= menu_box_2_x + Ui_Elements::MenuBoxes::MENU_BOX.width / scale_x) && 
            (scaled_mouse_y >= menu_box_2_y / scale_y && scaled_mouse_y <= menu_box_2_y / scale_y + Ui_Elements::MenuBoxes::MENU_BOX.height / scale_y)
            if Windows.is_hud_menu_open == false
                Windows.is_hud_menu_open=(true)
            else
                Windows.is_hud_menu_open=(false)
            end
            sleep 0.25.seconds
        end
     end

     def SystemMenus.draw_level_editor_ui(window)
        if SF::Event::Resized #the HUD will never scale correctly without this
            current_size = window.size
            original_width = 800 
            original_height = 600
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
            scale_ratio = [scale_x, scale_y].min
            max_scale = 1.5
            clamped_scale = [scale_ratio, max_scale].min
            
            Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.scale = SF.vector2(scale_x, scale_y / 5)
            Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.position = SF.vector2(0_f32, current_size.y.to_f32 - Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.global_bounds.height)
    
            Ui_Elements::MenuBoxes::CURRENT_LEVEL_ELEMENT_BOX.sprite.scale = SF.vector2(scale_x, scale_y)
            Ui_Elements::MenuBoxes::CURRENT_LEVEL_ELEMENT_BOX.sprite.position = Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.position + SF.vector2(55 * scale_x, 55 * scale_y)

            Ui_Elements::MenuText::CURRENT_LEVEL_ELEMENT_BOX_TEXT.text.scale = SF.vector2(scale_x, scale_y)
            Ui_Elements::MenuText::CURRENT_LEVEL_ELEMENT_BOX_TEXT.text.position = Ui_Elements::MenuBoxes::CURRENT_LEVEL_ELEMENT_BOX.sprite.position + SF.vector2(75 * clamped_scale, 12 * scale_ratio)
            Ui_Elements::MenuText::CURRENT_LEVEL_ELEMENT_BOX_TEXT.text.string = "" #LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY[LevelEditor::LevelEditorLogic.current_platform_index].name
            if !LevelEditor::LevelEditorLogic.current_element_array.empty?
                Ui_Elements::MenuText::CURRENT_LEVEL_ELEMENT_BOX_TEXT.text.string = LevelEditor::LevelEditorLogic.current_element_array[LevelEditor::LevelEditorLogic.current_index].name 
            end

            Ui_Elements::MenuBoxes::CURRENT_LEVEL_LEFT_ARROW.sprite.scale = SF.vector2(scale_x, scale_y)
            Ui_Elements::MenuBoxes::CURRENT_LEVEL_LEFT_ARROW.sprite.position = Ui_Elements::MenuBoxes::CURRENT_LEVEL_ELEMENT_BOX.sprite.position - SF.vector2(50 * scale_x, 0)

            Ui_Elements::MenuBoxes::CURRENT_LEVEL_RIGHT_ARROW.sprite.scale = SF.vector2(scale_x, scale_y)
            Ui_Elements::MenuBoxes::CURRENT_LEVEL_RIGHT_ARROW.sprite.position = Ui_Elements::MenuBoxes::CURRENT_LEVEL_ELEMENT_BOX.sprite.position + 
            SF.vector2(Ui_Elements::MenuBoxes::CURRENT_LEVEL_ELEMENT_BOX.sprite.global_bounds.width, 0)


            Ui_Elements::MenuBoxes::SELECTED_LEVEL_ELEMENT_BOX.sprite.scale = SF.vector2(scale_x, scale_y)
            Ui_Elements::MenuBoxes::SELECTED_LEVEL_ELEMENT_BOX.sprite.position = Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.position + SF.vector2(55 * scale_x, 5 * scale_y)

            Ui_Elements::MenuText::CURRENT_LEVEL_TEXT.text.scale = SF.vector2(scale_x, scale_y)
            Ui_Elements::MenuText::CURRENT_LEVEL_TEXT.text.position = Ui_Elements::MenuBoxes::SELECTED_LEVEL_ELEMENT_BOX.sprite.position + SF.vector2(75 * clamped_scale, 12 * scale_ratio)
            Ui_Elements::MenuText::CURRENT_LEVEL_TEXT.text.string = LevelEditor::LevelDisplay.current_element.name

            Ui_Elements::MenuBoxes::SELECTED_LEVEL_LEFT_ARROW.sprite.scale = SF.vector2(scale_x, scale_y)
            Ui_Elements::MenuBoxes::SELECTED_LEVEL_LEFT_ARROW.sprite.position = Ui_Elements::MenuBoxes::SELECTED_LEVEL_ELEMENT_BOX.sprite.position - SF.vector2(50 * scale_x, 0)
            Ui_Elements::MenuBoxes::SELECTED_LEVEL_RIGHT_ARROW.sprite.scale = SF.vector2(scale_x, scale_y)

            Ui_Elements::MenuBoxes::SELECTED_LEVEL_RIGHT_ARROW.sprite.scale = SF.vector2(scale_x, scale_y)
            Ui_Elements::MenuBoxes::SELECTED_LEVEL_RIGHT_ARROW.sprite.position = Ui_Elements::MenuBoxes::SELECTED_LEVEL_ELEMENT_BOX.sprite.position +
            SF.vector2(Ui_Elements::MenuBoxes::SELECTED_LEVEL_ELEMENT_BOX.sprite.global_bounds.width, 0)


            Ui_Elements::MenuBoxes::LEVEL_ELEMENT_TYPE_MENU.sprite.scale = SF.vector2(scale_x, scale_y)
            Ui_Elements::MenuBoxes::LEVEL_ELEMENT_TYPE_MENU.sprite.position = Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite.position + SF.vector2(325 * scale_x, 55 * scale_y)

            Ui_Elements::MenuText::LEVEL_ELEMENT_TYPE_TEXT.text.scale = SF.vector2(scale_x, scale_y)
            Ui_Elements::MenuText::LEVEL_ELEMENT_TYPE_TEXT.text.position = Ui_Elements::MenuBoxes::LEVEL_ELEMENT_TYPE_MENU.sprite.position + SF.vector2(75 * clamped_scale, 12 * scale_ratio)
            Ui_Elements::MenuText::LEVEL_ELEMENT_TYPE_TEXT.text.string = LevelEditor::LevelEditorLogic.current_element_type
            Utility::StringUtilities.center_text(Ui_Elements::MenuText::LEVEL_ELEMENT_TYPE_TEXT.text)

            Ui_Elements::MenuBoxes::LEVEL_ELEMENT_LEFT_ARROW.sprite.scale = SF.vector2(scale_x, scale_y)
            Ui_Elements::MenuBoxes::LEVEL_ELEMENT_LEFT_ARROW.sprite.position = Ui_Elements::MenuBoxes::LEVEL_ELEMENT_TYPE_MENU.sprite.position - SF.vector2(50 * scale_x, 0)
            Ui_Elements::MenuBoxes::LEVEL_ELEMENT_LEFT_ARROW.sprite.scale = SF.vector2(scale_x, scale_y)

            Ui_Elements::MenuBoxes::LEVEL_ELEMENT_RIGHT_ARROW.sprite.scale = SF.vector2(scale_x, scale_y)
            Ui_Elements::MenuBoxes::LEVEL_ELEMENT_RIGHT_ARROW.sprite.position = Ui_Elements::MenuBoxes::LEVEL_ELEMENT_TYPE_MENU.sprite.position +
            SF.vector2(Ui_Elements::MenuBoxes::LEVEL_ELEMENT_TYPE_MENU.sprite.global_bounds.width, 0)
        end
        LevelEditor::LevelDisplay.draw_level(window)
        window_size = window.size
        hud_view = SF::View.new(SF::FloatRect.new(0_f32, window_size.y.to_f32 / 2_f32, window_size.x.to_f32, window_size.y.to_f32 / 2_f32))
        hud_view.viewport = SF::FloatRect.new(0_f32, 0.5_f32, 1_f32, 0.5_f32)
        window.view = hud_view

        Utility::StringUtilities.center_text(Ui_Elements::MenuText::CURRENT_LEVEL_ELEMENT_BOX_TEXT.text)
        Utility::StringUtilities.center_text(Ui_Elements::MenuText::CURRENT_LEVEL_TEXT.text)

        window.draw(Ui_Elements::MenuBoxes::MAIN_HUD_BOX.sprite)

        window.draw(Ui_Elements::MenuBoxes::CURRENT_LEVEL_ELEMENT_BOX.sprite)
        window.draw(Ui_Elements::MenuText::CURRENT_LEVEL_ELEMENT_BOX_TEXT.text)
        window.draw(Ui_Elements::MenuBoxes::CURRENT_LEVEL_LEFT_ARROW.sprite)
        window.draw(Ui_Elements::MenuBoxes::CURRENT_LEVEL_RIGHT_ARROW.sprite)

        window.draw(Ui_Elements::MenuBoxes::SELECTED_LEVEL_ELEMENT_BOX.sprite)
        window.draw(Ui_Elements::MenuText::CURRENT_LEVEL_TEXT.text)
        window.draw(Ui_Elements::MenuBoxes::SELECTED_LEVEL_LEFT_ARROW.sprite)
        window.draw(Ui_Elements::MenuBoxes::SELECTED_LEVEL_RIGHT_ARROW.sprite)

        window.draw(Ui_Elements::MenuBoxes::LEVEL_ELEMENT_TYPE_MENU.sprite)
        window.draw(Ui_Elements::MenuText::LEVEL_ELEMENT_TYPE_TEXT.text)
        window.draw(Ui_Elements::MenuBoxes::LEVEL_ELEMENT_LEFT_ARROW.sprite)
        window.draw(Ui_Elements::MenuBoxes::LEVEL_ELEMENT_RIGHT_ARROW.sprite)
        if SF::Mouse.button_pressed?(SF::Mouse::Left)
            SystemMenus.level_editor_ui_mouse_handling(window)
        end
    end
    def SystemMenus.level_editor_ui_mouse_handling(window)
        window_size = window.size
        hud_view = SF::View.new(SF::FloatRect.new(0_f32, window_size.y.to_f32 / 2_f32, window_size.x.to_f32, window_size.y.to_f32 / 2_f32))
        hud_view.viewport = SF::FloatRect.new(0_f32, 0.5_f32, 1_f32, 0.5_f32)
        window.view = hud_view
        mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window), window.view)

        mouse_x = mouse_position.x
        mouse_y = mouse_position.y

        menu_box_2_x = Ui_Elements::MenuBoxes::CURRENT_LEVEL_LEFT_ARROW.sprite.position.x
        menu_box_2_y = Ui_Elements::MenuBoxes::CURRENT_LEVEL_LEFT_ARROW.sprite.position.y

        menu_box_3_x = Ui_Elements::MenuBoxes::CURRENT_LEVEL_RIGHT_ARROW.sprite.position.x
        menu_box_3_y = Ui_Elements::MenuBoxes::CURRENT_LEVEL_RIGHT_ARROW.sprite.position.y

        menu_box_4_x = Ui_Elements::MenuBoxes::CURRENT_LEVEL_ELEMENT_BOX.sprite.position.x
        menu_box_4_y = Ui_Elements::MenuBoxes::CURRENT_LEVEL_ELEMENT_BOX.sprite.position.y

        menu_box_5_x = Ui_Elements::MenuBoxes::SELECTED_LEVEL_LEFT_ARROW.sprite.position.x
        menu_box_5_y = Ui_Elements::MenuBoxes::SELECTED_LEVEL_LEFT_ARROW.sprite.position.y

        menu_box_6_x = Ui_Elements::MenuBoxes::SELECTED_LEVEL_RIGHT_ARROW.sprite.position.x
        menu_box_6_y = Ui_Elements::MenuBoxes::SELECTED_LEVEL_RIGHT_ARROW.sprite.position.y
        
        menu_box_7_x = Ui_Elements::MenuBoxes::LEVEL_ELEMENT_LEFT_ARROW.sprite.position.x
        menu_box_7_y = Ui_Elements::MenuBoxes::LEVEL_ELEMENT_LEFT_ARROW.sprite.position.y

        menu_box_8_x = Ui_Elements::MenuBoxes::LEVEL_ELEMENT_RIGHT_ARROW.sprite.position.x
        menu_box_8_y = Ui_Elements::MenuBoxes::LEVEL_ELEMENT_RIGHT_ARROW.sprite.position.y

        current_size = window.size
        original_width = 800
        original_height = 600
    
        scale_x = current_size.x.to_f / original_width
        scale_y = current_size.y.to_f / original_height
    
        scaled_mouse_x = mouse_x / scale_x
        scaled_mouse_y = mouse_y / scale_y

        if (scaled_mouse_x >= menu_box_2_x / scale_x && scaled_mouse_x <= menu_box_2_x + Ui_Elements::MenuBoxes::CURRENT_LEVEL_LEFT_ARROW.width / scale_x) && 
            (scaled_mouse_y >= menu_box_2_y / scale_y && scaled_mouse_y <= menu_box_2_y / scale_y + Ui_Elements::MenuBoxes::CURRENT_LEVEL_LEFT_ARROW.height / scale_y)

            LevelEditor::LevelEditorLogic.current_index = Utility::ArrayUtilities.navigate_array("backward", LevelEditor::LevelEditorLogic.current_element_array, 
            LevelEditor::LevelEditorLogic.current_index)

          sleep 0.15.seconds
        end
        if (scaled_mouse_x >= menu_box_3_x / scale_x && scaled_mouse_x <= menu_box_3_x + Ui_Elements::MenuBoxes::CURRENT_LEVEL_RIGHT_ARROW.width / scale_x) && 
            (scaled_mouse_y >= menu_box_3_y / scale_y && scaled_mouse_y <= menu_box_3_y / scale_y + Ui_Elements::MenuBoxes::CURRENT_LEVEL_RIGHT_ARROW.height / scale_y)

            LevelEditor::LevelEditorLogic.current_index = Utility::ArrayUtilities.navigate_array("forward", LevelEditor::LevelEditorLogic.current_element_array, 
            LevelEditor::LevelEditorLogic.current_index)
            
          sleep 0.15.seconds
        end
        if (scaled_mouse_x >= menu_box_4_x / scale_x && scaled_mouse_x <= menu_box_4_x + Ui_Elements::MenuBoxes::CURRENT_LEVEL_ELEMENT_BOX.width / scale_x) && 
            (scaled_mouse_y >= menu_box_4_y / scale_y && scaled_mouse_y <= menu_box_4_y / scale_y + Ui_Elements::MenuBoxes::CURRENT_LEVEL_ELEMENT_BOX.height / scale_y)
            LevelEditor::LevelEditorLogic.spawn_element(window)
            LevelEditor::LevelEditorLogic.update_spawned_element_array
            sleep 0.15.seconds
        end
        if (scaled_mouse_x >= menu_box_5_x / scale_x && scaled_mouse_x <= menu_box_5_x + Ui_Elements::MenuBoxes::SELECTED_LEVEL_LEFT_ARROW.width / scale_x) && 
            (scaled_mouse_y >= menu_box_5_y / scale_y && scaled_mouse_y <= menu_box_5_y / scale_y + Ui_Elements::MenuBoxes::SELECTED_LEVEL_LEFT_ARROW.height / scale_y)

            LevelEditor::LevelEditorLogic.spawned_element_index = Utility::ArrayUtilities.navigate_array("backward", LevelEditor::LevelEditorLogic.spawned_element_array, 
            LevelEditor::LevelEditorLogic.spawned_element_index)

            if LevelEditor::LevelEditorLogic.spawned_element_array.size > 0
                LevelEditor::LevelDisplay.current_element = LevelEditor::LevelEditorLogic.spawned_element_array[LevelEditor::LevelEditorLogic.spawned_element_index]
            end
          sleep 0.15.seconds
        end
        if (scaled_mouse_x >= menu_box_6_x / scale_x && scaled_mouse_x <= menu_box_6_x + Ui_Elements::MenuBoxes::SELECTED_LEVEL_RIGHT_ARROW.width / scale_x) && 
            (scaled_mouse_y >= menu_box_6_y / scale_y && scaled_mouse_y <= menu_box_6_y / scale_y + Ui_Elements::MenuBoxes::SELECTED_LEVEL_RIGHT_ARROW.height / scale_y)
            LevelEditor::LevelEditorLogic.spawned_element_index = Utility::ArrayUtilities.navigate_array("forward", LevelEditor::LevelEditorLogic.spawned_element_array, 
            LevelEditor::LevelEditorLogic.spawned_element_index)

            if LevelEditor::LevelEditorLogic.spawned_element_array.size > 0
                LevelEditor::LevelDisplay.current_element = LevelEditor::LevelEditorLogic.spawned_element_array[LevelEditor::LevelEditorLogic.spawned_element_index]
            end
          sleep 0.15.seconds
        end
        if (scaled_mouse_x >= menu_box_7_x / scale_x && scaled_mouse_x <= menu_box_7_x + Ui_Elements::MenuBoxes::SELECTED_LEVEL_RIGHT_ARROW.width / scale_x) && 
            (scaled_mouse_y >= menu_box_7_y / scale_y && scaled_mouse_y <= menu_box_7_y / scale_y + Ui_Elements::MenuBoxes::SELECTED_LEVEL_RIGHT_ARROW.height / scale_y)
            LevelEditor::LevelEditorLogic.current_element_index = Utility::ArrayUtilities.navigate_array("backward", LevelEditor::LevelEditorLogic.element_array, LevelEditor::LevelEditorLogic.current_element_index)
            LevelEditor::LevelEditorLogic.current_element_type = LevelEditor::LevelEditorLogic.element_array[LevelEditor::LevelEditorLogic.current_element_index]
            LevelEditor::LevelEditorLogic.set_current_index
            LevelEditor::LevelEditorLogic.set_current_array
            sleep 0.15.seconds
        end
        if (scaled_mouse_x >= menu_box_8_x / scale_x && scaled_mouse_x <= menu_box_8_x + Ui_Elements::MenuBoxes::SELECTED_LEVEL_RIGHT_ARROW.width / scale_x) && 
            (scaled_mouse_y >= menu_box_8_y / scale_y && scaled_mouse_y <= menu_box_8_y / scale_y + Ui_Elements::MenuBoxes::SELECTED_LEVEL_RIGHT_ARROW.height / scale_y)
            LevelEditor::LevelEditorLogic.current_element_index = Utility::ArrayUtilities.navigate_array("forward", LevelEditor::LevelEditorLogic.element_array, LevelEditor::LevelEditorLogic.current_element_index)
            LevelEditor::LevelEditorLogic.current_element_type = LevelEditor::LevelEditorLogic.element_array[LevelEditor::LevelEditorLogic.current_element_index]
            LevelEditor::LevelEditorLogic.set_current_index
            LevelEditor::LevelEditorLogic.set_current_array
            sleep 0.15.seconds
        end
     end
  end

    class Windows # I now know why everyone hates coding UI shit -_-
        #I hate coding ui, I haaaate it!

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
            if SF::Event::Resized
                current_size = window.size
                original_width = 800 
                original_height = 600
                scale_x = current_size.x.to_f / original_width
                scale_y = current_size.y.to_f / original_height
        
                scale_ratio = [scale_x, scale_y].min
            end
            window.draw(Ui_Elements::WindowBoxes::HUD_MENU_BOX.sprite)

            window.draw(Ui_Elements::WindowBoxes::HUD_MENU_SAVE_BOX.sprite)
            window.draw(Ui_Elements::WindowText::HUD_MENU_SAVE_TEXT.text)

            window.draw(Ui_Elements::WindowBoxes::HUD_MENU_QUIT_BOX.sprite)
            window.draw(Ui_Elements::WindowText::HUD_MENU_QUIT_TEXT.text)

            window.draw(Ui_Elements::WindowBoxes::HUD_MENU_STATS_BOX.sprite)
            window.draw(Ui_Elements::WindowText::HUD_MENU_STATS_TEXT.text)

            window.draw(Ui_Elements::WindowBoxes::HUD_MENU_SETTINGS_BOX.sprite)
            window.draw(Ui_Elements::WindowText::HUD_MENU_SETTINGS_TEXT.text)
            if SF::Mouse.button_pressed?(SF::Mouse::Left)
                if Windows.is_hud_menu_open == true
                Windows.hud_menu_mouse_handling(window)
                end
                if Windows.is_stats_menu_open == true
                Windows.stats_menu_mouse_handling(window)
                end
            end
        end

        def Windows.draw_stats_menu(window)
            if SF::Event::Resized
                current_size = window.size
                original_width = 800 
                original_height = 600
                scale_x = current_size.x.to_f / original_width
                scale_y = current_size.y.to_f / original_height
        
                scale_ratio = [scale_x, scale_y].min
            end
            window.draw(Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite)

            window.draw(Ui_Elements::WindowBoxes::STATS_MENU_NAME_BOX.sprite)
            window.draw(Ui_Elements::WindowText::STATS_MENU_NAME_TEXT.text)

            window.draw(Ui_Elements::WindowBoxes::STATS_MENU_MONEY_BOX.sprite)
            window.draw(Ui_Elements::WindowText::STATS_MENU_MONEY_TEXT.text)

            window.draw(Ui_Elements::WindowBoxes::STATS_MENU_HP_BOX.sprite)
            window.draw(Ui_Elements::WindowText::STATS_MENU_HP_TEXT.text)

            window.draw(Ui_Elements::WindowBoxes::STATS_MENU_MP_BOX.sprite)
            window.draw(Ui_Elements::WindowText::STATS_MENU_MP_TEXT.text)

            window.draw(Ui_Elements::WindowBoxes::STATS_MENU_LVL_BOX.sprite)
            window.draw(Ui_Elements::WindowText::STATS_MENU_LVL_TEXT.text)

            window.draw(Ui_Elements::WindowBoxes::STATS_MENU_EXP_BOX.sprite)
            window.draw(Ui_Elements::WindowText::STATS_MENU_EXP_TEXT.text)

            window.draw(Ui_Elements::WindowBoxes::STATS_MENU_STR_BOX.sprite)
            window.draw(Ui_Elements::WindowText::STATS_MENU_STR_TEXT.text)

            window.draw(Ui_Elements::WindowBoxes::STATS_MENU_DEX_BOX.sprite)
            window.draw(Ui_Elements::WindowText::STATS_MENU_DEX_TEXT.text)

            window.draw(Ui_Elements::WindowBoxes::STATS_MENU_INT_BOX.sprite)
            window.draw(Ui_Elements::WindowText::STATS_MENU_INT_TEXT.text)

            window.draw(Ui_Elements::WindowBoxes::STATS_MENU_LUK_BOX.sprite)
            window.draw(Ui_Elements::WindowText::STATS_MENU_LUK_TEXT.text)

            window.draw(Ui_Elements::WindowBoxes::STATS_MENU_LEFT_HP_ARROW.sprite)
            window.draw(Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_HP_ARROW.sprite)
            window.draw(Ui_Elements::WindowBoxes::STATS_MENU_LEFT_MP_ARROW.sprite)
            window.draw(Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_MP_ARROW.sprite)
            window.draw(Ui_Elements::WindowBoxes::STATS_MENU_LEFT_STR_ARROW.sprite)
            window.draw(Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_STR_ARROW.sprite)
            window.draw(Ui_Elements::WindowBoxes::STATS_MENU_LEFT_DEX_ARROW.sprite)
            window.draw(Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_DEX_ARROW.sprite)
            window.draw(Ui_Elements::WindowBoxes::STATS_MENU_LEFT_INT_ARROW.sprite)
            window.draw(Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_INT_ARROW.sprite)
            window.draw(Ui_Elements::WindowBoxes::STATS_MENU_LEFT_LUK_ARROW.sprite)
            window.draw(Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_LUK_ARROW.sprite)
        end

        def Windows.update_open_views(window)
            current_size = window.size
            original_width = 800 
            original_height = 600
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
            window_width = current_size.x.to_f
            window_height = current_size.y.to_f
            scale_ratio = [scale_x, scale_y].min

            max_scale = 1.5
            clamped_scale = [scale_ratio, max_scale].min
          
            if @@is_hud_menu_open
            window_size = window.size
            hud_view = SF::View.new(SF::FloatRect.new(0_f32, window_size.y.to_f32 / 2_f32, window_size.x.to_f32, window_size.y.to_f32 / 2_f32))
            hud_view.viewport = SF::FloatRect.new(0_f32, 0.5_f32, 1_f32, 0.5_f32)
            window.view = hud_view

            Ui_Elements::WindowBoxes::HUD_MENU_BOX.sprite.position = Ui_Elements::MenuBoxes::MENU_BOX.sprite.position + SF.vector2(-2.75 * clamped_scale, -Ui_Elements::WindowBoxes::HUD_MENU_BOX.height * clamped_scale)
            Ui_Elements::WindowBoxes::HUD_MENU_BOX.sprite.scale = SF.vector2(scale_x - clamped_scale * 0.005, scale_ratio)
              
              Ui_Elements::WindowBoxes::HUD_MENU_SAVE_BOX.sprite.position = Ui_Elements::WindowBoxes::HUD_MENU_BOX.sprite.position + SF.vector2(2 * clamped_scale, 2 * clamped_scale)
              Ui_Elements::WindowBoxes::HUD_MENU_SAVE_BOX.sprite.scale = SF.vector2(scale_x, clamped_scale)

              Ui_Elements::WindowText::HUD_MENU_SAVE_TEXT.text.position = Ui_Elements::WindowBoxes::HUD_MENU_SAVE_BOX.sprite.position + SF.vector2((40 * (scale_x - 0.25)), 2 * clamped_scale)
              Ui_Elements::WindowText::HUD_MENU_SAVE_TEXT.text.scale = SF.vector2(clamped_scale, clamped_scale)
              

              Ui_Elements::WindowBoxes::HUD_MENU_QUIT_BOX.sprite.position = Ui_Elements::WindowBoxes::HUD_MENU_SAVE_BOX.sprite.position + SF.vector2(0, 44 * clamped_scale)
              Ui_Elements::WindowBoxes::HUD_MENU_QUIT_BOX.sprite.scale = SF.vector2(scale_x, clamped_scale)

              Ui_Elements::WindowText::HUD_MENU_QUIT_TEXT.text.position = Ui_Elements::WindowBoxes::HUD_MENU_QUIT_BOX.sprite.position + SF.vector2(18 * (scale_x * scale_ratio), 6 * clamped_scale)
              Ui_Elements::WindowText::HUD_MENU_QUIT_TEXT.text.scale = SF.vector2(clamped_scale - 0.25, clamped_scale)
              

              Ui_Elements::WindowBoxes::HUD_MENU_STATS_BOX.sprite.position = Ui_Elements::WindowBoxes::HUD_MENU_QUIT_BOX.sprite.position + SF.vector2(0, 44 * clamped_scale)
              Ui_Elements::WindowBoxes::HUD_MENU_STATS_BOX.sprite.scale = SF.vector2(scale_x, clamped_scale)

              Ui_Elements::WindowText::HUD_MENU_STATS_TEXT.text.position = Ui_Elements::WindowBoxes::HUD_MENU_STATS_BOX.sprite.position + SF.vector2((40 * (scale_x - 0.25)), 2 * clamped_scale)
              Ui_Elements::WindowText::HUD_MENU_STATS_TEXT.text.scale = SF.vector2(clamped_scale, clamped_scale)


              Ui_Elements::WindowBoxes::HUD_MENU_SETTINGS_BOX.sprite.position = Ui_Elements::WindowBoxes::HUD_MENU_STATS_BOX.sprite.position + SF.vector2(0, 44 * clamped_scale)
              Ui_Elements::WindowBoxes::HUD_MENU_SETTINGS_BOX.sprite.scale = SF.vector2(scale_x, clamped_scale)

              Ui_Elements::WindowText::HUD_MENU_SETTINGS_TEXT.text.position = Ui_Elements::WindowBoxes::HUD_MENU_SETTINGS_BOX.sprite.position + SF.vector2((15 * (scale_x * clamped_scale * scale_ratio)), 2 * clamped_scale)
              Ui_Elements::WindowText::HUD_MENU_SETTINGS_TEXT.text.scale = SF.vector2(clamped_scale, clamped_scale)

              Windows.draw_hud_menu(window)
            end

            if @@is_stats_menu_open
                window.view = window.default_view
                Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.position = SF.vector2(50 * max_scale, 50 * max_scale)
                Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale = SF.vector2(0.5, 1)


                Ui_Elements::WindowBoxes::STATS_MENU_NAME_BOX.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.position + SF.vector2(5 * max_scale, 7 * max_scale)
                Ui_Elements::WindowBoxes::STATS_MENU_NAME_BOX.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale

                Ui_Elements::WindowText::STATS_MENU_NAME_TEXT.text.position = Ui_Elements::WindowBoxes::STATS_MENU_NAME_BOX.sprite.position + SF.vector2(32 * max_scale, 5 * max_scale)
                Ui_Elements::WindowText::STATS_MENU_NAME_TEXT.text.scale = Ui_Elements::WindowBoxes::STATS_MENU_NAME_BOX.sprite.scale
                Ui_Elements::WindowText::STATS_MENU_NAME_TEXT.text.string = Player::Stats.name.not_nil!
                SystemMenus.center_save_file_text(Ui_Elements::WindowText::STATS_MENU_NAME_TEXT.text)


                Ui_Elements::WindowBoxes::STATS_MENU_MONEY_BOX.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.position + SF.vector2(98 * max_scale, 7 * max_scale)
                Ui_Elements::WindowBoxes::STATS_MENU_MONEY_BOX.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale

                Ui_Elements::WindowText::STATS_MENU_MONEY_TEXT.text.position = Ui_Elements::WindowBoxes::STATS_MENU_MONEY_BOX.sprite.position + SF.vector2(28 * max_scale, 5 * max_scale)
                Ui_Elements::WindowText::STATS_MENU_MONEY_TEXT.text.scale = Ui_Elements::WindowBoxes::STATS_MENU_MONEY_BOX.sprite.scale
                Ui_Elements::WindowText::STATS_MENU_MONEY_TEXT.text.string = "Cash: " + Player::Stats.money.not_nil!.to_s
                SystemMenus.center_save_file_text(Ui_Elements::WindowText::STATS_MENU_MONEY_TEXT.text)


                Ui_Elements::WindowBoxes::STATS_MENU_HP_BOX.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.position + SF.vector2(5 * max_scale, 90 * max_scale)
                Ui_Elements::WindowBoxes::STATS_MENU_HP_BOX.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale

                Ui_Elements::WindowText::STATS_MENU_HP_TEXT.text.position = Ui_Elements::WindowBoxes::STATS_MENU_HP_BOX.sprite.position + SF.vector2(11 * max_scale, 5 * max_scale)
                Ui_Elements::WindowText::STATS_MENU_HP_TEXT.text.scale = Ui_Elements::WindowBoxes::STATS_MENU_HP_BOX.sprite.scale
                Ui_Elements::WindowText::STATS_MENU_HP_TEXT.text.string = "HP: #{Player::Stats.current_hp.not_nil!.to_s}/#{Player::Stats.max_hp.not_nil!.to_s}"
                SystemMenus.center_save_file_text(Ui_Elements::WindowText::STATS_MENU_HP_TEXT.text)

                Ui_Elements::WindowBoxes::STATS_MENU_LEFT_HP_ARROW.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_HP_BOX.sprite.position + SF.vector2(0 * max_scale, 42 * max_scale)
                Ui_Elements::WindowBoxes::STATS_MENU_LEFT_HP_ARROW.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale

                Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_HP_ARROW.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_HP_BOX.sprite.position + SF.vector2(56 * max_scale, 42 * max_scale)
                Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_HP_ARROW.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale


                Ui_Elements::WindowBoxes::STATS_MENU_MP_BOX.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.position + SF.vector2(87 * max_scale, 90 * max_scale)
                Ui_Elements::WindowBoxes::STATS_MENU_MP_BOX.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale

                Ui_Elements::WindowText::STATS_MENU_MP_TEXT.text.position = Ui_Elements::WindowBoxes::STATS_MENU_MP_BOX.sprite.position + SF.vector2(11 * max_scale, 5 * max_scale)
                Ui_Elements::WindowText::STATS_MENU_MP_TEXT.text.scale = Ui_Elements::WindowBoxes::STATS_MENU_MP_BOX.sprite.scale
                Ui_Elements::WindowText::STATS_MENU_MP_TEXT.text.string = "MP: #{Player::Stats.current_mp.not_nil!.to_s}/#{Player::Stats.max_mp.not_nil!.to_s}"
                SystemMenus.center_save_file_text(Ui_Elements::WindowText::STATS_MENU_MP_TEXT.text)

                Ui_Elements::WindowBoxes::STATS_MENU_LEFT_MP_ARROW.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_MP_BOX.sprite.position + SF.vector2(0 * max_scale, 42 * max_scale)
                Ui_Elements::WindowBoxes::STATS_MENU_LEFT_MP_ARROW.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale

                Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_MP_ARROW.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_MP_BOX.sprite.position + SF.vector2(56 * max_scale, 42 * max_scale)
                Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_MP_ARROW.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale


                Ui_Elements::WindowBoxes::STATS_MENU_LVL_BOX.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.position + SF.vector2(5 * max_scale, 48 * max_scale)
                Ui_Elements::WindowBoxes::STATS_MENU_LVL_BOX.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale

                Ui_Elements::WindowText::STATS_MENU_LVL_TEXT.text.position = Ui_Elements::WindowBoxes::STATS_MENU_LVL_BOX.sprite.position + SF.vector2(14 * max_scale, 5 * max_scale)
                Ui_Elements::WindowText::STATS_MENU_LVL_TEXT.text.scale = Ui_Elements::WindowBoxes::STATS_MENU_LVL_BOX.sprite.scale
                Ui_Elements::WindowText::STATS_MENU_LVL_TEXT.text.string = "Lvl: " + Player::Stats.lvl.not_nil!.to_s + " Pts: " + Player::Stats.lvl_points.not_nil!.to_s
                SystemMenus.center_save_file_text(Ui_Elements::WindowText::STATS_MENU_LVL_TEXT.text)


                Ui_Elements::WindowBoxes::STATS_MENU_EXP_BOX.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.position + SF.vector2(87 * max_scale, 48 * max_scale)
                Ui_Elements::WindowBoxes::STATS_MENU_EXP_BOX.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale

                Ui_Elements::WindowText::STATS_MENU_EXP_TEXT.text.position = Ui_Elements::WindowBoxes::STATS_MENU_EXP_BOX.sprite.position + SF.vector2(14 * max_scale, 5 * max_scale)
                Ui_Elements::WindowText::STATS_MENU_EXP_TEXT.text.scale = Ui_Elements::WindowBoxes::STATS_MENU_EXP_BOX.sprite.scale
                Ui_Elements::WindowText::STATS_MENU_EXP_TEXT.text.string = "EXP: #{Player::Stats.exp.not_nil!.to_s}/#{Player::Stats.exp_cap.not_nil!.to_s}"
                SystemMenus.center_save_file_text(Ui_Elements::WindowText::STATS_MENU_EXP_TEXT.text)


                Ui_Elements::WindowBoxes::STATS_MENU_STR_BOX.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.position + SF.vector2(5 * max_scale, 152 * max_scale)
                Ui_Elements::WindowBoxes::STATS_MENU_STR_BOX.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale

                Ui_Elements::WindowText::STATS_MENU_STR_TEXT.text.position = Ui_Elements::WindowBoxes::STATS_MENU_STR_BOX.sprite.position + SF.vector2(28 * max_scale, 5 * max_scale)
                Ui_Elements::WindowText::STATS_MENU_STR_TEXT.text.scale = Ui_Elements::WindowBoxes::STATS_MENU_STR_BOX.sprite.scale
                Ui_Elements::WindowText::STATS_MENU_STR_TEXT.text.string = "Str: " + Player::Stats.str.not_nil!.to_s
                SystemMenus.center_save_file_text(Ui_Elements::WindowText::STATS_MENU_STR_TEXT.text)

                Ui_Elements::WindowBoxes::STATS_MENU_LEFT_STR_ARROW.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_STR_BOX.sprite.position + SF.vector2(0 * max_scale, 42 * max_scale)
                Ui_Elements::WindowBoxes::STATS_MENU_LEFT_STR_ARROW.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale

                Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_STR_ARROW.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_STR_BOX.sprite.position + SF.vector2(56 * max_scale, 42 * max_scale)
                Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_STR_ARROW.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale


                Ui_Elements::WindowBoxes::STATS_MENU_DEX_BOX.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.position + SF.vector2(87 * max_scale, 152 * max_scale)
                Ui_Elements::WindowBoxes::STATS_MENU_DEX_BOX.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale

                Ui_Elements::WindowText::STATS_MENU_DEX_TEXT.text.position = Ui_Elements::WindowBoxes::STATS_MENU_DEX_BOX.sprite.position + SF.vector2(28 * max_scale, 5 * max_scale)
                Ui_Elements::WindowText::STATS_MENU_DEX_TEXT.text.scale = Ui_Elements::WindowBoxes::STATS_MENU_DEX_BOX.sprite.scale
                Ui_Elements::WindowText::STATS_MENU_DEX_TEXT.text.string = "Dex: " + Player::Stats.dex.not_nil!.to_s
                SystemMenus.center_save_file_text(Ui_Elements::WindowText::STATS_MENU_DEX_TEXT.text)

                Ui_Elements::WindowBoxes::STATS_MENU_LEFT_DEX_ARROW.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_DEX_BOX.sprite.position + SF.vector2(0 * max_scale, 42 * max_scale)
                Ui_Elements::WindowBoxes::STATS_MENU_LEFT_DEX_ARROW.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale

                Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_DEX_ARROW.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_DEX_BOX.sprite.position + SF.vector2(56 * max_scale, 42 * max_scale)
                Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_DEX_ARROW.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale


                Ui_Elements::WindowBoxes::STATS_MENU_INT_BOX.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.position + SF.vector2(5 * max_scale, 214 * max_scale)
                Ui_Elements::WindowBoxes::STATS_MENU_INT_BOX.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale

                Ui_Elements::WindowText::STATS_MENU_INT_TEXT.text.position = Ui_Elements::WindowBoxes::STATS_MENU_INT_BOX.sprite.position + SF.vector2(28 * max_scale, 5 * max_scale)
                Ui_Elements::WindowText::STATS_MENU_INT_TEXT.text.scale = Ui_Elements::WindowBoxes::STATS_MENU_INT_BOX.sprite.scale
                Ui_Elements::WindowText::STATS_MENU_INT_TEXT.text.string = "Int: " + Player::Stats.int.not_nil!.to_s
                SystemMenus.center_save_file_text(Ui_Elements::WindowText::STATS_MENU_INT_TEXT.text)

                Ui_Elements::WindowBoxes::STATS_MENU_LEFT_INT_ARROW.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_INT_BOX.sprite.position + SF.vector2(0 * max_scale, 42 * max_scale)
                Ui_Elements::WindowBoxes::STATS_MENU_LEFT_INT_ARROW.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale

                Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_INT_ARROW.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_INT_BOX.sprite.position + SF.vector2(56 * max_scale, 42 * max_scale)
                Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_INT_ARROW.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale


                Ui_Elements::WindowBoxes::STATS_MENU_LUK_BOX.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.position + SF.vector2(87 * max_scale, 214 * max_scale)
                Ui_Elements::WindowBoxes::STATS_MENU_LUK_BOX.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale

                Ui_Elements::WindowText::STATS_MENU_LUK_TEXT.text.position = Ui_Elements::WindowBoxes::STATS_MENU_LUK_BOX.sprite.position + SF.vector2(28 * max_scale, 5 * max_scale)
                Ui_Elements::WindowText::STATS_MENU_LUK_TEXT.text.scale = Ui_Elements::WindowBoxes::STATS_MENU_LUK_BOX.sprite.scale
                Ui_Elements::WindowText::STATS_MENU_LUK_TEXT.text.string = "Luk: " + Player::Stats.luk.not_nil!.to_s
                SystemMenus.center_save_file_text(Ui_Elements::WindowText::STATS_MENU_LUK_TEXT.text)

                Ui_Elements::WindowBoxes::STATS_MENU_LEFT_LUK_ARROW.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_LUK_BOX.sprite.position + SF.vector2(0 * max_scale, 42 * max_scale)
                Ui_Elements::WindowBoxes::STATS_MENU_LEFT_LUK_ARROW.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale

                Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_LUK_ARROW.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_LUK_BOX.sprite.position + SF.vector2(56 * max_scale, 42 * max_scale)
                Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_LUK_ARROW.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale

                Windows.draw_stats_menu(window)
            end
        end

        def Windows.hud_menu_mouse_handling(window)
            window_size = window.size
            hud_view = SF::View.new(SF::FloatRect.new(0_f32, window_size.y.to_f32 / 2_f32, window_size.x.to_f32, window_size.y.to_f32 / 2_f32))
            hud_view.viewport = SF::FloatRect.new(0_f32, 0.5_f32, 1_f32, 0.5_f32)
            window.view = hud_view

            mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window), window.view)
            mouse_x = mouse_position.x
            mouse_y = mouse_position.y
        
            original_width = 800
            original_height = 600
        
            scale_x = window.view.size.x / original_width
            scale_y = window.view.size.y / original_height
        
            scaled_mouse_x = (mouse_x + window_size.x * window.view.viewport.left) * scale_x
            scaled_mouse_y = (mouse_y + window_size.y * window.view.viewport.top) * scale_y
        
            menu_box_2_x = (Ui_Elements::WindowBoxes::HUD_MENU_SAVE_BOX.sprite.position.x + window_size.x * window.view.viewport.left) * scale_x
            menu_box_2_y = (Ui_Elements::WindowBoxes::HUD_MENU_SAVE_BOX.sprite.position.y + window_size.y * window.view.viewport.top) * scale_y
            menu_box_2_width = Ui_Elements::WindowBoxes::HUD_MENU_SAVE_BOX.sprite.global_bounds.width * scale_x
            menu_box_2_height = Ui_Elements::WindowBoxes::HUD_MENU_SAVE_BOX.sprite.global_bounds.height * scale_y
        
            menu_box_3_x = (Ui_Elements::WindowBoxes::HUD_MENU_QUIT_BOX.sprite.position.x + window_size.x * window.view.viewport.left) * scale_x
            menu_box_3_y = (Ui_Elements::WindowBoxes::HUD_MENU_QUIT_BOX.sprite.position.y + window_size.y * window.view.viewport.top) * scale_y
            menu_box_3_width = Ui_Elements::WindowBoxes::HUD_MENU_QUIT_BOX.sprite.global_bounds.width * scale_x
            menu_box_3_height = Ui_Elements::WindowBoxes::HUD_MENU_QUIT_BOX.sprite.global_bounds.height * scale_y
        
            menu_box_4_x = (Ui_Elements::WindowBoxes::HUD_MENU_STATS_BOX.sprite.position.x + window_size.x * window.view.viewport.left) * scale_x
            menu_box_4_y = (Ui_Elements::WindowBoxes::HUD_MENU_STATS_BOX.sprite.position.y + window_size.y * window.view.viewport.top) * scale_y
            menu_box_4_width = Ui_Elements::WindowBoxes::HUD_MENU_STATS_BOX.sprite.global_bounds.width * scale_x
            menu_box_4_height = Ui_Elements::WindowBoxes::HUD_MENU_STATS_BOX.sprite.global_bounds.height * scale_y
        
            menu_box_5_x = (Ui_Elements::WindowBoxes::HUD_MENU_SETTINGS_BOX.sprite.position.x + window_size.x * window.view.viewport.left) * scale_x
            menu_box_5_y = (Ui_Elements::WindowBoxes::HUD_MENU_SETTINGS_BOX.sprite.position.y + window_size.y * window.view.viewport.top) * scale_y
            menu_box_5_width = Ui_Elements::WindowBoxes::HUD_MENU_SETTINGS_BOX.sprite.global_bounds.width * scale_x
            menu_box_5_height = Ui_Elements::WindowBoxes::HUD_MENU_SETTINGS_BOX.sprite.global_bounds.height * scale_y

            if (scaled_mouse_x >= menu_box_2_x && scaled_mouse_x <= menu_box_2_x + menu_box_2_width) &&
               (scaled_mouse_y >= menu_box_2_y && scaled_mouse_y <= menu_box_2_y + menu_box_2_height)
                Serialization::SaveFile.normal_save
                puts "save"
                sleep 0.15.seconds
        
            elsif (scaled_mouse_x >= menu_box_3_x && scaled_mouse_x <= menu_box_3_x + menu_box_3_width) &&
                  (scaled_mouse_y >= menu_box_3_y && scaled_mouse_y <= menu_box_3_y + menu_box_3_height)
                Serialization::SaveFile.normal_save
                sleep 0.15.seconds
                window.close
        
            elsif (scaled_mouse_x >= menu_box_4_x && scaled_mouse_x <= menu_box_4_x + menu_box_4_width) &&
                  (scaled_mouse_y >= menu_box_4_y && scaled_mouse_y <= menu_box_4_y + menu_box_4_height)
                Windows.is_stats_menu_open = !Windows.is_stats_menu_open
                sleep 0.15.seconds

            elsif (scaled_mouse_x >= menu_box_5_x && scaled_mouse_x <= menu_box_5_x + menu_box_5_width) &&
                  (scaled_mouse_y >= menu_box_5_y && scaled_mouse_y <= menu_box_5_y + menu_box_5_height)
                  puts "settings"
                #Settings::SettingsMenu.is_settings_menu_open = !Settings::SettingsMenu.is_settings_menu_open
                sleep 0.15.seconds
            end
        end

        def Windows.stats_menu_mouse_handling(window)

            mouse_position = SF::Mouse.get_position(window)
            mouse_x = mouse_position.x
            mouse_y = mouse_position.y
        
            current_size = window.size
            original_width = 800 
            original_height = 600 

            scale_x = (current_size.x.to_f / original_width)
            scale_y = current_size.y.to_f / original_height
        
            scaled_mouse_x = mouse_x * scale_x
            scaled_mouse_y = mouse_y * scale_y
        

    
            arrow_left_1_x = Ui_Elements::WindowBoxes::STATS_MENU_LEFT_HP_ARROW.sprite.position.x
            arrow_left_1_y = Ui_Elements::WindowBoxes::STATS_MENU_LEFT_HP_ARROW.sprite.position.y
    
            arrow_right_1_x = Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_HP_ARROW.sprite.position.x
            arrow_right_1_y = Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_HP_ARROW.sprite.position.y
    
            arrow_left_2_x = Ui_Elements::WindowBoxes::STATS_MENU_LEFT_MP_ARROW.sprite.position.x
            arrow_left_2_y = Ui_Elements::WindowBoxes::STATS_MENU_LEFT_MP_ARROW.sprite.position.y
    
            arrow_right_2_x = Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_MP_ARROW.sprite.position.x
            arrow_right_2_y = Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_MP_ARROW.sprite.position.y
    
            arrow_left_3_x = Ui_Elements::WindowBoxes::STATS_MENU_LEFT_STR_ARROW.sprite.position.x
            arrow_left_3_y = Ui_Elements::WindowBoxes::STATS_MENU_LEFT_STR_ARROW.sprite.position.y
    
            arrow_right_3_x = Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_STR_ARROW.sprite.position.x
            arrow_right_3_y = Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_STR_ARROW.sprite.position.y
    
            arrow_left_4_x = Ui_Elements::WindowBoxes::STATS_MENU_LEFT_DEX_ARROW.sprite.position.x
            arrow_left_4_y = Ui_Elements::WindowBoxes::STATS_MENU_LEFT_DEX_ARROW.sprite.position.y
    
            arrow_right_4_x = Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_DEX_ARROW.sprite.position.x
            arrow_right_4_y = Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_DEX_ARROW.sprite.position.y
    
            arrow_left_5_x = Ui_Elements::WindowBoxes::STATS_MENU_LEFT_INT_ARROW.sprite.position.x
            arrow_left_5_y = Ui_Elements::WindowBoxes::STATS_MENU_LEFT_INT_ARROW.sprite.position.y
    
            arrow_right_5_x = Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_INT_ARROW.sprite.position.x
            arrow_right_5_y = Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_INT_ARROW.sprite.position.y
    
            arrow_left_6_x = Ui_Elements::WindowBoxes::STATS_MENU_LEFT_LUK_ARROW.sprite.position.x
            arrow_left_6_y = Ui_Elements::WindowBoxes::STATS_MENU_LEFT_LUK_ARROW.sprite.position.y
    
            arrow_right_6_x = Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_LUK_ARROW.sprite.position.x
            arrow_right_6_y = Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_LUK_ARROW.sprite.position.y
    
            current_size = window.size
            original_width = 800
            original_height = 600
        
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
        
            scaled_mouse_x = mouse_x / scale_x
            scaled_mouse_y = mouse_y / scale_y
    

    
            if (scaled_mouse_x >= arrow_left_1_x && scaled_mouse_x <= arrow_left_1_x + Ui_Elements::WindowBoxes::STATS_MENU_LEFT_HP_ARROW.sprite.global_bounds.width) && 
               (scaled_mouse_y >= arrow_left_1_y && scaled_mouse_y <= arrow_left_1_y + Ui_Elements::WindowBoxes::STATS_MENU_LEFT_HP_ARROW.sprite.global_bounds.height)
                if Player::Stats.max_hp.not_nil! >= 5
                    Player::Stats.max_hp=(Player::Stats.max_hp.not_nil! - 1)
                    Player::Stats.current_hp=(Player::Stats.current_hp.not_nil! - 1)
                    Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! + 1)
                end
                sleep 0.15.seconds

    
            elsif (scaled_mouse_x >= arrow_right_1_x && scaled_mouse_x <= arrow_right_1_x + Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_HP_ARROW.sprite.global_bounds.width) && 
                  (scaled_mouse_y >= arrow_right_1_y && scaled_mouse_y <= arrow_right_1_y + Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_HP_ARROW.sprite.global_bounds.height)
                if Player::Stats.lvl_points.not_nil! > 0
                    Player::Stats.max_hp=(Player::Stats.max_hp.not_nil! + 1)
                    Player::Stats.current_hp=(Player::Stats.current_hp.not_nil! + 1)
                    Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! - 1)
                end
                sleep 0.15.seconds
            
    
            elsif (scaled_mouse_x >= arrow_left_2_x && scaled_mouse_x <= arrow_left_2_x + Ui_Elements::WindowBoxes::STATS_MENU_LEFT_MP_ARROW.sprite.global_bounds.width) && 
                  (scaled_mouse_y >= arrow_left_2_y && scaled_mouse_y <= arrow_left_2_y + Ui_Elements::WindowBoxes::STATS_MENU_LEFT_MP_ARROW.sprite.global_bounds.height)
                if Player::Stats.max_mp.not_nil! >= 5
                    Player::Stats.max_mp=(Player::Stats.max_mp.not_nil! - 1)
                    Player::Stats.current_mp=(Player::Stats.current_mp.not_nil! - 1)
                    Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! + 1)
                end
                sleep 0.15.seconds
           
    
            elsif (scaled_mouse_x >= arrow_right_2_x && scaled_mouse_x <= arrow_right_2_x + Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_MP_ARROW.sprite.global_bounds.width) && 
                  (scaled_mouse_y >= arrow_right_2_y && scaled_mouse_y <= arrow_right_2_y + Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_MP_ARROW.sprite.global_bounds.height)
                if Player::Stats.lvl_points.not_nil! > 0
                    Player::Stats.max_mp=(Player::Stats.max_mp.not_nil! + 1)
                    Player::Stats.current_mp=(Player::Stats.current_mp.not_nil! + 1)
                    Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! - 1)
                end
                sleep 0.15.seconds
           
    
            elsif (scaled_mouse_x >= arrow_left_3_x && scaled_mouse_x <= arrow_left_3_x + Ui_Elements::WindowBoxes::STATS_MENU_LEFT_STR_ARROW.sprite.global_bounds.width) && 
                  (scaled_mouse_y >= arrow_left_3_y && scaled_mouse_y <= arrow_left_3_y + Ui_Elements::WindowBoxes::STATS_MENU_LEFT_STR_ARROW.sprite.global_bounds.height)
                if Player::Stats.str.not_nil! >= 5
                    Player::Stats.str=(Player::Stats.str.not_nil! - 1)
                    Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! + 1)
                end
                sleep 0.15.seconds
           
    
            elsif (scaled_mouse_x >= arrow_right_3_x && scaled_mouse_x <= arrow_right_3_x + Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_STR_ARROW.sprite.global_bounds.width) && 
                  (scaled_mouse_y >= arrow_right_3_y && scaled_mouse_y <= arrow_right_3_y + Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_STR_ARROW.sprite.global_bounds.height)
                if Player::Stats.lvl_points.not_nil! > 0
                    Player::Stats.str=(Player::Stats.str.not_nil! + 1)
                    Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! - 1)
                end
                sleep 0.15.seconds
           
    
            elsif (scaled_mouse_x >= arrow_left_4_x && scaled_mouse_x <= arrow_left_4_x + Ui_Elements::WindowBoxes::STATS_MENU_LEFT_DEX_ARROW.sprite.global_bounds.width) && 
                  (scaled_mouse_y >= arrow_left_4_y && scaled_mouse_y <= arrow_left_4_y + Ui_Elements::WindowBoxes::STATS_MENU_LEFT_DEX_ARROW.sprite.global_bounds.height)
                if Player::Stats.dex.not_nil! >= 5
                    Player::Stats.dex=(Player::Stats.dex.not_nil! - 1)
                    Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! + 1)
                end
                sleep 0.15.seconds
        
    
            elsif (scaled_mouse_x >= arrow_right_4_x && scaled_mouse_x <= arrow_right_4_x + Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_DEX_ARROW.sprite.global_bounds.width) && 
                  (scaled_mouse_y >= arrow_right_4_y && scaled_mouse_y <= arrow_right_4_y + Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_DEX_ARROW.sprite.global_bounds.height)
                if Player::Stats.lvl_points.not_nil! > 0
                    Player::Stats.dex=(Player::Stats.dex.not_nil! + 1)
                    Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! - 1)
                end
                sleep 0.15.seconds
       
    
            elsif (scaled_mouse_x >= arrow_left_5_x && scaled_mouse_x <= arrow_left_5_x + Ui_Elements::WindowBoxes::STATS_MENU_LEFT_INT_ARROW.sprite.global_bounds.width) && 
                  (scaled_mouse_y >= arrow_left_5_y && scaled_mouse_y <= arrow_left_5_y + Ui_Elements::WindowBoxes::STATS_MENU_LEFT_INT_ARROW.sprite.global_bounds.height)
                if Player::Stats.int.not_nil! >= 5
                    Player::Stats.int=(Player::Stats.int.not_nil! - 1)
                    Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! + 1)
                end
                sleep 0.15.seconds
      
    
            elsif (scaled_mouse_x >= arrow_right_5_x && scaled_mouse_x <= arrow_right_5_x + Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_INT_ARROW.sprite.global_bounds.width) && 
                  (scaled_mouse_y >= arrow_right_5_y && scaled_mouse_y <= arrow_right_5_y + Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_INT_ARROW.sprite.global_bounds.height)
                if Player::Stats.lvl_points.not_nil! > 0
                    Player::Stats.int=(Player::Stats.int.not_nil! + 1)
                    Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! - 1)
                end
                sleep 0.15.seconds
        
    
            elsif (scaled_mouse_x >= arrow_left_6_x && scaled_mouse_x <= arrow_left_6_x + Ui_Elements::WindowBoxes::STATS_MENU_LEFT_LUK_ARROW.sprite.global_bounds.width) && 
                  (scaled_mouse_y >= arrow_left_6_y && scaled_mouse_y <= arrow_left_6_y + Ui_Elements::WindowBoxes::STATS_MENU_LEFT_LUK_ARROW.sprite.global_bounds.height)
                if Player::Stats.luk.not_nil! >= 5
                    Player::Stats.luk=(Player::Stats.luk.not_nil! - 1)
                    Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! + 1)
                end
                sleep 0.15.seconds
      
    
            elsif (scaled_mouse_x >= arrow_right_6_x && scaled_mouse_x <= arrow_right_6_x + Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_LUK_ARROW.sprite.global_bounds.width) && 
                  (scaled_mouse_y >= arrow_right_6_y && scaled_mouse_y <= arrow_right_6_y + Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_LUK_ARROW.sprite.global_bounds.height)
                if Player::Stats.lvl_points.not_nil! > 0
                    Player::Stats.luk=(Player::Stats.luk.not_nil! + 1)
                    Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! - 1)
                end
                sleep 0.15.seconds
            end
         end
    end
end