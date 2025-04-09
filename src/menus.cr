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