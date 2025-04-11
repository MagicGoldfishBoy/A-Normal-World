require "crsfml"
require "../../src/textures.cr"
require "../../src/fonts.cr"
require "../../src/utility.cr"
require "../../src/ui_elements.cr"
require "../../src/player.cr"
require "../menus/menu_handling.cr"
require "../gui/gameplay_gui.cr"

module StatsWindow
    class StatsWindowElements
        MAX_SCALE = 1.5

        TEXT_OFFSET_MARGIN = SF.vector2(10 * MAX_SCALE, 10 * MAX_SCALE)
        TEXT_FONT_SIZE = 16

        STATS_WINDOW_BOX = Ui_Elements::WindowBoxes.new("Stats Window Box", "StatMen1", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(1000, 200, 500, 410)), 500.0, 410.0, 4)


        NAME_BOX = Ui_Elements::WindowBoxes.new("Name Box", "StatMen2", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(400, 100, 250, 50)), 250.0, 50.0, 3)

        NAME_TEXT = Ui_Elements::WindowText.new("Name Text", "StatMen3", SF::Text.new(
        "Name", QUICKSAND, TEXT_FONT_SIZE))
        Utility::StringUtilities.center_text(NAME_TEXT.text)


        MONEY_BOX = Ui_Elements::WindowBoxes.new("Money Box", "StatMen4", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(700, 100, 190, 50)), 190.0, 50.0, 3)

        MONEY_TEXT = Ui_Elements::WindowText.new("Money Text", "StatMen5", SF::Text.new(
        "Money", QUICKSAND, TEXT_FONT_SIZE))
        Utility::StringUtilities.center_text(MONEY_TEXT.text)


        LVL_BOX = Ui_Elements::WindowBoxes.new("Level Box", "StatMen6", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(400, 150, 220, 50)), 220.0, 50.0, 3)

        LVL_TEXT = Ui_Elements::WindowText.new("Level Text", "StatMen7", SF::Text.new(
        "Level", QUICKSAND, TEXT_FONT_SIZE))
        Utility::StringUtilities.center_text(LVL_TEXT.text)


        EXP_BOX = Ui_Elements::WindowBoxes.new("Exp Box", "StatMen8", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(400, 150, 220, 50)), 220.0, 50.0, 3)

        EXP_TEXT = Ui_Elements::WindowText.new("Exp Text", "StatMen9", SF::Text.new(
        "Exp", QUICKSAND, TEXT_FONT_SIZE))
        Utility::StringUtilities.center_text(EXP_TEXT.text)


        HP_BOX = Ui_Elements::WindowBoxes.new("HP Box", "StatMen10", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(400, 150, 220, 50)), 220.0, 50.0, 2)

        HP_TEXT = Ui_Elements::WindowText.new("HP Text", "StatMen11", SF::Text.new("HP", QUICKSAND, TEXT_FONT_SIZE))
        Utility::StringUtilities.center_text(HP_TEXT.text)

        LEFT_HP_ARROW = Ui_Elements::WindowBoxes.new("Left HP Arrow", "StatMen12", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(200, 140, 50, 15)), 50.0, 15.0, 1)

        RIGHT_HP_ARROW = Ui_Elements::WindowBoxes.new("Right HP Arrow", "StatMen13", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(200, 155, 50, 15)), 50.0, 15.0, 1)


        MP_BOX = Ui_Elements::WindowBoxes.new("MP Box", "StatMen14", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(400, 150, 220, 50)), 220.0, 50.0, 2)

        MP_TEXT = Ui_Elements::WindowText.new("MP Text", "StatMen15", SF::Text.new("MP", QUICKSAND, TEXT_FONT_SIZE))
        Utility::StringUtilities.center_text(MP_TEXT.text)

        LEFT_MP_ARROW = Ui_Elements::WindowBoxes.new("Left MP Arrow", "StatMen16", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(200, 140, 50, 15)), 50.0, 15.0, 1)

        RIGHT_MP_ARROW = Ui_Elements::WindowBoxes.new("Right MP Arrow", "StatMen17", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(200, 155, 50, 15)), 50.0, 15.0, 1)


        STR_BOX = Ui_Elements::WindowBoxes.new("STR Box", "StatMen18", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(400, 150, 220, 50)), 220.0, 50.0, 2)

        STR_TEXT = Ui_Elements::WindowText.new("STR Text", "StatMen19", SF::Text.new("STR", QUICKSAND, TEXT_FONT_SIZE))
        Utility::StringUtilities.center_text(STR_TEXT.text)

        LEFT_STR_ARROW = Ui_Elements::WindowBoxes.new("Left STR Arrow", "StatMen20", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(200, 140, 50, 15)), 50.0, 15.0, 1)

        RIGHT_STR_ARROW = Ui_Elements::WindowBoxes.new("Right STR Arrow", "StatMen21", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(200, 155, 50, 15)), 50.0, 15.0, 1)


        DEX_BOX = Ui_Elements::WindowBoxes.new("DEX Box", "StatMen22", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(400, 150, 220, 50)), 220.0, 50.0, 2)

        DEX_TEXT = Ui_Elements::WindowText.new("DEX Text", "StatMen23", SF::Text.new("DEX", QUICKSAND, TEXT_FONT_SIZE))
        Utility::StringUtilities.center_text(DEX_TEXT.text)

        LEFT_DEX_ARROW = Ui_Elements::WindowBoxes.new("Left DEX Arrow", "StatMen24", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(200, 140, 50, 15)), 50.0, 15.0, 1)

        RIGHT_DEX_ARROW = Ui_Elements::WindowBoxes.new("Right DEX Arrow", "StatMen25", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(200, 155, 50, 15)), 50.0, 15.0, 1)


        INT_BOX = Ui_Elements::WindowBoxes.new("INT Box", "StatMen26", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(400, 150, 220, 50)), 220.0, 50.0, 2)

        INT_TEXT = Ui_Elements::WindowText.new("INT Text", "StatMen27", SF::Text.new("INT", QUICKSAND, TEXT_FONT_SIZE))
        Utility::StringUtilities.center_text(INT_TEXT.text)

        LEFT_INT_ARROW = Ui_Elements::WindowBoxes.new("Left INT Arrow", "StatMen28", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(200, 140, 50, 15)), 50.0, 15.0, 1)

        RIGHT_INT_ARROW = Ui_Elements::WindowBoxes.new("Right INT Arrow", "StatMen29", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(200, 155, 50, 15)), 50.0, 15.0, 1)


        LUK_BOX = Ui_Elements::WindowBoxes.new("LUK Box", "StatMen30", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(400, 150, 220, 50)), 220.0, 50.0, 2)

        LUK_TEXT = Ui_Elements::WindowText.new("LUK Text", "StatMen31", SF::Text.new("LUK", QUICKSAND, TEXT_FONT_SIZE))
        Utility::StringUtilities.center_text(LUK_TEXT.text)

        LEFT_LUK_ARROW = Ui_Elements::WindowBoxes.new("Left LUK Arrow", "StatMen32", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(200, 140, 50, 15)), 50.0, 15.0, 1)

        RIGHT_LUK_ARROW = Ui_Elements::WindowBoxes.new("Right LUK Arrow", "StatMen33", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(200, 155, 50, 15)), 50.0, 15.0, 1)

        def self.position_stat_window_elements(window)
             window.view = window.default_view

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

             STATS_WINDOW_BOX.sprite.position = SF.vector2(50 * max_scale, 50 * max_scale)
             STATS_WINDOW_BOX.sprite.scale = SF.vector2(0.5, 1)


             NAME_BOX.sprite.position = STATS_WINDOW_BOX.sprite.position + SF.vector2(5 * max_scale, 7 * max_scale)
             NAME_BOX.sprite.scale = STATS_WINDOW_BOX.sprite.scale

             NAME_TEXT.text.position = NAME_BOX.sprite.position + TEXT_OFFSET_MARGIN
             NAME_TEXT.text.string = Player::Stats.name.not_nil!
             #NOTE: This creates an interesting effect I might use later: NAME_TEXT.text.character_size *= clamped_scale.to_i * 2


             MONEY_BOX.sprite.position = STATS_WINDOW_BOX.sprite.position + SF.vector2(98 * max_scale, 7 * max_scale)
             MONEY_BOX.sprite.scale = STATS_WINDOW_BOX.sprite.scale

             MONEY_TEXT.text.position = MONEY_BOX.sprite.position + TEXT_OFFSET_MARGIN
             MONEY_TEXT.text.string = "Cash: " + Player::Stats.money.not_nil!.to_s


             LVL_BOX.sprite.position = STATS_WINDOW_BOX.sprite.position + SF.vector2(5 * max_scale, 48 * max_scale)
             LVL_BOX.sprite.scale = STATS_WINDOW_BOX.sprite.scale

             LVL_TEXT.text.position = LVL_BOX.sprite.position + TEXT_OFFSET_MARGIN
             LVL_TEXT.text.string = "Lvl: " + Player::Stats.lvl.not_nil!.to_s + " Pts: " + Player::Stats.lvl_points.not_nil!.to_s


             EXP_BOX.sprite.position = STATS_WINDOW_BOX.sprite.position + SF.vector2(87 * max_scale, 48 * max_scale)
             EXP_BOX.sprite.scale = STATS_WINDOW_BOX.sprite.scale

             EXP_TEXT.text.position = EXP_BOX.sprite.position + TEXT_OFFSET_MARGIN
             EXP_TEXT.text.string = "EXP: #{Player::Stats.exp.not_nil!.to_s}/#{Player::Stats.exp_cap.not_nil!.to_s}"


             HP_BOX.sprite.position = STATS_WINDOW_BOX.sprite.position + SF.vector2(5 * max_scale, 90 * max_scale)
             HP_BOX.sprite.scale = STATS_WINDOW_BOX.sprite.scale

             HP_TEXT.text.position = HP_BOX.sprite.position + TEXT_OFFSET_MARGIN
             HP_TEXT.text.string = "HP: #{Player::Stats.current_hp.not_nil!.to_s}/#{Player::Stats.max_hp.not_nil!.to_s}"

             LEFT_HP_ARROW.sprite.position = HP_BOX.sprite.position + SF.vector2(0 * max_scale, 42 * max_scale)
             LEFT_HP_ARROW.sprite.scale = STATS_WINDOW_BOX.sprite.scale
             
             RIGHT_HP_ARROW.sprite.position = HP_BOX.sprite.position + SF.vector2(56 * max_scale, 42 * max_scale)
             RIGHT_HP_ARROW.sprite.scale = STATS_WINDOW_BOX.sprite.scale


             MP_BOX.sprite.position = STATS_WINDOW_BOX.sprite.position + SF.vector2(87 * max_scale, 90 * max_scale)
             MP_BOX.sprite.scale = STATS_WINDOW_BOX.sprite.scale

             MP_TEXT.text.position = MP_BOX.sprite.position + TEXT_OFFSET_MARGIN
             MP_TEXT.text.string = "MP: #{Player::Stats.current_mp.not_nil!.to_s}/#{Player::Stats.max_mp.not_nil!.to_s}"

             LEFT_MP_ARROW.sprite.position = MP_BOX.sprite.position + SF.vector2(0 * max_scale, 42 * max_scale)
             LEFT_MP_ARROW.sprite.scale = STATS_WINDOW_BOX.sprite.scale

             RIGHT_MP_ARROW.sprite.position = MP_BOX.sprite.position + SF.vector2(56 * max_scale, 42 * max_scale)
             RIGHT_MP_ARROW.sprite.scale = STATS_WINDOW_BOX.sprite.scale


             STR_BOX.sprite.position = STATS_WINDOW_BOX.sprite.position + SF.vector2(5 * max_scale, 152 * max_scale)
             STR_BOX.sprite.scale = STATS_WINDOW_BOX.sprite.scale

             STR_TEXT.text.position = STR_BOX.sprite.position + TEXT_OFFSET_MARGIN
             STR_TEXT.text.string = "Str: " + Player::Stats.str.not_nil!.to_s

             LEFT_STR_ARROW.sprite.position = STR_BOX.sprite.position + SF.vector2(0 * max_scale, 42 * max_scale)
             LEFT_STR_ARROW.sprite.scale = STATS_WINDOW_BOX.sprite.scale

             RIGHT_STR_ARROW.sprite.position = STR_BOX.sprite.position + SF.vector2(56 * max_scale, 42 * max_scale)
             RIGHT_STR_ARROW.sprite.scale = STATS_WINDOW_BOX.sprite.scale


             DEX_BOX.sprite.position = STATS_WINDOW_BOX.sprite.position + SF.vector2(87 * max_scale, 152 * max_scale)
             DEX_BOX.sprite.scale = STATS_WINDOW_BOX.sprite.scale

             DEX_TEXT.text.position = DEX_BOX.sprite.position + TEXT_OFFSET_MARGIN
             DEX_TEXT.text.string = "Dex: " + Player::Stats.dex.not_nil!.to_s

             LEFT_DEX_ARROW.sprite.position = DEX_BOX.sprite.position + SF.vector2(0 * max_scale, 42 * max_scale)
             LEFT_DEX_ARROW.sprite.scale = STATS_WINDOW_BOX.sprite.scale

             RIGHT_DEX_ARROW.sprite.position = DEX_BOX.sprite.position + SF.vector2(56 * max_scale, 42 * max_scale)
             RIGHT_DEX_ARROW.sprite.scale = STATS_WINDOW_BOX.sprite.scale


             INT_BOX.sprite.position = STATS_WINDOW_BOX.sprite.position + SF.vector2(5 * max_scale, 214 * max_scale)
             INT_BOX.sprite.scale = STATS_WINDOW_BOX.sprite.scale

             INT_TEXT.text.position = INT_BOX.sprite.position + TEXT_OFFSET_MARGIN
             INT_TEXT.text.string = "Int: " + Player::Stats.int.not_nil!.to_s

             LEFT_INT_ARROW.sprite.position = INT_BOX.sprite.position + SF.vector2(0 * max_scale, 42 * max_scale)
             LEFT_INT_ARROW.sprite.scale = STATS_WINDOW_BOX.sprite.scale

             RIGHT_INT_ARROW.sprite.position = INT_BOX.sprite.position + SF.vector2(56 * max_scale, 42 * max_scale)
             RIGHT_INT_ARROW.sprite.scale = STATS_WINDOW_BOX.sprite.scale


             LUK_BOX.sprite.position = STATS_WINDOW_BOX.sprite.position + SF.vector2(87 * max_scale, 214 * max_scale)
             LUK_BOX.sprite.scale = STATS_WINDOW_BOX.sprite.scale

             LUK_TEXT.text.position = LUK_BOX.sprite.position + TEXT_OFFSET_MARGIN
             LUK_TEXT.text.string = "Luk: " + Player::Stats.luk.not_nil!.to_s

             LEFT_LUK_ARROW.sprite.position = LUK_BOX.sprite.position + SF.vector2(0 * max_scale, 42 * max_scale)
             LEFT_LUK_ARROW.sprite.scale = STATS_WINDOW_BOX.sprite.scale

             RIGHT_LUK_ARROW.sprite.position = LUK_BOX.sprite.position + SF.vector2(56 * max_scale, 42 * max_scale)
             RIGHT_LUK_ARROW.sprite.scale = STATS_WINDOW_BOX.sprite.scale
        end
    end
    class StatsWindowDisplay
        def self.display_stats_window(window)
          if SF::Event::Resized
            current_size = window.size
            original_width = 800 
            original_height = 600
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
    
            scale_ratio = [scale_x, scale_y].min
            
            StatsWindowElements.position_stat_window_elements(window)
          end
          window.draw(StatsWindowElements::STATS_WINDOW_BOX.sprite)

          window.draw(StatsWindowElements::NAME_BOX.sprite)
          window.draw(StatsWindowElements::MONEY_BOX.sprite)
          window.draw(StatsWindowElements::LVL_BOX.sprite)
          window.draw(StatsWindowElements::EXP_BOX.sprite)
          window.draw(StatsWindowElements::HP_BOX.sprite)
          window.draw(StatsWindowElements::MP_BOX.sprite)
          window.draw(StatsWindowElements::STR_BOX.sprite)
          window.draw(StatsWindowElements::DEX_BOX.sprite)
          window.draw(StatsWindowElements::INT_BOX.sprite)
          window.draw(StatsWindowElements::LUK_BOX.sprite)

          window.draw(StatsWindowElements::NAME_TEXT.text)
          window.draw(StatsWindowElements::MONEY_TEXT.text)
          window.draw(StatsWindowElements::LVL_TEXT.text)
          window.draw(StatsWindowElements::EXP_TEXT.text)
          window.draw(StatsWindowElements::HP_TEXT.text)
          window.draw(StatsWindowElements::MP_TEXT.text)
          window.draw(StatsWindowElements::STR_TEXT.text)
          window.draw(StatsWindowElements::DEX_TEXT.text)
          window.draw(StatsWindowElements::INT_TEXT.text)
          window.draw(StatsWindowElements::LUK_TEXT.text)

          window.draw(StatsWindowElements::LEFT_HP_ARROW.sprite)
          window.draw(StatsWindowElements::LEFT_MP_ARROW.sprite)
          window.draw(StatsWindowElements::LEFT_STR_ARROW.sprite)
          window.draw(StatsWindowElements::LEFT_DEX_ARROW.sprite)
          window.draw(StatsWindowElements::LEFT_INT_ARROW.sprite)
          window.draw(StatsWindowElements::LEFT_LUK_ARROW.sprite)

          window.draw(StatsWindowElements::RIGHT_HP_ARROW.sprite)
          window.draw(StatsWindowElements::RIGHT_MP_ARROW.sprite)
          window.draw(StatsWindowElements::RIGHT_STR_ARROW.sprite)
          window.draw(StatsWindowElements::RIGHT_DEX_ARROW.sprite)
          window.draw(StatsWindowElements::RIGHT_INT_ARROW.sprite)
          window.draw(StatsWindowElements::RIGHT_LUK_ARROW.sprite)
          if SF::Mouse.button_pressed?(SF::Mouse::Left)
            StatsWindowMouseHandling.stats_menu_mouse_handling(window)
          end
        end
    end
    class StatsWindowMouseHandling
      def self.stats_menu_mouse_handling(window)

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

        if MouseHandling::ClickHandling.button_clicked?(StatsWindowElements::LEFT_HP_ARROW.sprite, scaled_mouse_x, scaled_mouse_y)
         if Player::Stats.max_hp.not_nil! >= 5
            Player::Stats.max_hp=(Player::Stats.max_hp.not_nil! - 1)
            Player::Stats.current_hp=(Player::Stats.current_hp.not_nil! - 1)
            Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! + 1)
         end
         sleep 0.15.seconds
        elsif MouseHandling::ClickHandling.button_clicked?(StatsWindowElements::RIGHT_HP_ARROW.sprite, scaled_mouse_x, scaled_mouse_y)
         if Player::Stats.lvl_points.not_nil! > 0
            Player::Stats.max_hp=(Player::Stats.max_hp.not_nil! + 1)
            Player::Stats.current_hp=(Player::Stats.current_hp.not_nil! + 1)
            Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! - 1)
         end
         sleep 0.15.seconds
        elsif MouseHandling::ClickHandling.button_clicked?(StatsWindowElements::LEFT_MP_ARROW.sprite, scaled_mouse_x, scaled_mouse_y)
         if Player::Stats.max_mp.not_nil! >= 5
            Player::Stats.max_mp=(Player::Stats.max_mp.not_nil! - 1)
            Player::Stats.current_mp=(Player::Stats.current_mp.not_nil! - 1)
            Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! + 1)
         end
         sleep 0.15.seconds
        elsif MouseHandling::ClickHandling.button_clicked?(StatsWindowElements::RIGHT_MP_ARROW.sprite, scaled_mouse_x, scaled_mouse_y)
         if Player::Stats.lvl_points.not_nil! > 0
            Player::Stats.max_mp=(Player::Stats.max_mp.not_nil! + 1)
            Player::Stats.current_mp=(Player::Stats.current_mp.not_nil! + 1)
            Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! - 1)
         end
         sleep 0.15.seconds
        elsif MouseHandling::ClickHandling.button_clicked?(StatsWindowElements::LEFT_STR_ARROW.sprite, scaled_mouse_x, scaled_mouse_y)
         if Player::Stats.str.not_nil! >= 5
            Player::Stats.str=(Player::Stats.str.not_nil! - 1)
            Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! + 1)
         end
         sleep 0.15.seconds
        elsif MouseHandling::ClickHandling.button_clicked?(StatsWindowElements::RIGHT_STR_ARROW.sprite, scaled_mouse_x, scaled_mouse_y)
         if Player::Stats.lvl_points.not_nil! > 0
            Player::Stats.str=(Player::Stats.str.not_nil! + 1)
            Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! - 1)
         end
         sleep 0.15.seconds
        elsif MouseHandling::ClickHandling.button_clicked?(StatsWindowElements::LEFT_DEX_ARROW.sprite, scaled_mouse_x, scaled_mouse_y)
         if Player::Stats.dex.not_nil! >= 5
            Player::Stats.dex=(Player::Stats.dex.not_nil! - 1)
            Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! + 1)
         end
         sleep 0.15.seconds
        elsif MouseHandling::ClickHandling.button_clicked?(StatsWindowElements::RIGHT_DEX_ARROW.sprite, scaled_mouse_x, scaled_mouse_y)
         if Player::Stats.lvl_points.not_nil! > 0
            Player::Stats.dex=(Player::Stats.dex.not_nil! + 1)
            Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! - 1)
         end
         sleep 0.15.seconds
        elsif MouseHandling::ClickHandling.button_clicked?(StatsWindowElements::LEFT_INT_ARROW.sprite, scaled_mouse_x, scaled_mouse_y)
         if Player::Stats.int.not_nil! >= 5
            Player::Stats.int=(Player::Stats.int.not_nil! - 1)
            Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! + 1)
         end
         sleep 0.15.seconds
        elsif MouseHandling::ClickHandling.button_clicked?(StatsWindowElements::RIGHT_INT_ARROW.sprite, scaled_mouse_x, scaled_mouse_y)
         if Player::Stats.lvl_points.not_nil! > 0
            Player::Stats.int=(Player::Stats.int.not_nil! + 1)
            Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! - 1)
         end
         sleep 0.15.seconds
        elsif MouseHandling::ClickHandling.button_clicked?(StatsWindowElements::LEFT_LUK_ARROW.sprite, scaled_mouse_x, scaled_mouse_y)
         if Player::Stats.luk.not_nil! >= 5
            Player::Stats.luk=(Player::Stats.luk.not_nil! - 1)
            Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! + 1)
         end
         sleep 0.15.seconds
        elsif MouseHandling::ClickHandling.button_clicked?(StatsWindowElements::RIGHT_LUK_ARROW.sprite, scaled_mouse_x, scaled_mouse_y)
         if Player::Stats.lvl_points.not_nil! > 0
            Player::Stats.luk=(Player::Stats.luk.not_nil! + 1)
            Player::Stats.lvl_points=(Player::Stats.lvl_points.not_nil! - 1)
         end
         sleep 0.15.seconds
        end
      end
    end
end