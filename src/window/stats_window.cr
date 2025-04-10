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

        TEXT_OFFSET_MARGIN = SF.vector2(28 * max_scale, 5 * max_scale)

        STATS_WINDOW_BOX = Ui_Elements::WindowBoxes.new("Stats Window Box", "StatMen1", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(1000, 200, 500, 410)), 500.0, 410.0, 4)


        NAME_BOX = Ui_Elements::WindowBoxes.new("Name Box", "StatMen2", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(400, 100, 250, 50)), 250.0, 50.0, 3)

        NAME_TEXT = Ui_Elements::WindowText.new("Name Text", "StatMen3", SF::Text.new(
        "Name", QUICKSAND, 24))


        MONEY_BOX = Ui_Elements::WindowBoxes.new("Money Box", "StatMen4", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(700, 100, 190, 50)), 190.0, 50.0, 3)

        MONEY_TEXT = Ui_Elements::WindowText.new("Money Text", "StatMen5", SF::Text.new(
        "Money", QUICKSAND, 24))


        LVL_BOX = Ui_Elements::WindowBoxes.new("Level Box", "StatMen6", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(400, 150, 220, 50)), 220.0, 50.0, 3)

        LVL_TEXT = Ui_Elements::WindowText.new("Level Text", "StatMen7", SF::Text.new(
        "Level", QUICKSAND, 24))


        EXP_BOX = Ui_Elements::WindowBoxes.new("Exp Box", "StatMen8", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(400, 150, 220, 50)), 220.0, 50.0, 3)

        EXP_TEXT = Ui_Elements::WindowText.new("Exp Text", "StatMen9", SF::Text.new(
        "Exp", QUICKSAND, 24))


        HP_BOX = Ui_Elements::WindowBoxes.new("HP Box", "StatMen10", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(400, 150, 220, 50)), 220.0, 50.0, 2)

        HP_TEXT = Ui_Elements::WindowText.new("HP Text", "StatMen11", SF::Text.new("HP", QUICKSAND, 24))

        LEFT_HP_ARROW = Ui_Elements::WindowBoxes.new("Left HP Arrow", "StatMen12", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(200, 140, 50, 15)), 50.0, 15.0, 1)

        RIGHT_HP_ARROW = Ui_Elements::WindowBoxes.new("Right HP Arrow", "StatMen13", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(200, 155, 50, 15)), 50.0, 15.0, 1)


        MP_BOX = Ui_Elements::WindowBoxes.new("MP Box", "StatMen14", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(400, 150, 220, 50)), 220.0, 50.0, 2)

        MP_TEXT = WindowText.new("MP Text", "StatMen15", SF::Text.new("MP", QUICKSAND, 24))

        LEFT_MP_ARROW = Ui_Elements::WindowBoxes.new("Left MP Arrow", "StatMen16", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(200, 140, 50, 15)), 50.0, 15.0, 1)

        RIGHT_MP_ARROW = Ui_Elements::WindowBoxes.new("Right MP Arrow", "StatMen17", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(200, 155, 50, 15)), 50.0, 15.0, 1)


        STR_BOX = Ui_Elements::WindowBoxes.new("STR Box", "StatMen18", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(400, 150, 220, 50)), 220.0, 50.0, 2)

        STR_TEXT = Ui_Elements::WindowText.new("STR Text", "StatMen19", SF::Text.new("STR", QUICKSAND, 24))

        LEFT_STR_ARROW = Ui_Elements::WindowBoxes.new("Left STR Arrow", "StatMen20", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(200, 140, 50, 15)), 50.0, 15.0, 1)

        RIGHT_STR_ARROW = Ui_Elements::WindowBoxes.new("Right STR Arrow", "StatMen21", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(200, 155, 50, 15)), 50.0, 15.0, 1)


        DEX_BOX = Ui_Elements::WindowBoxes.new("DEX Box", "StatMen22", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(400, 150, 220, 50)), 220.0, 50.0, 2)

        DEX_TEXT = Ui_Elements::WindowText.new("DEX Text", "StatMen23", SF::Text.new("DEX", QUICKSAND, 24))

        LEFT_DEX_ARROW = Ui_Elements::WindowBoxes.new("Left DEX Arrow", "StatMen24", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(200, 140, 50, 15)), 50.0, 15.0, 1)

        RIGHT_DEX_ARROW = Ui_Elements::WindowBoxes.new("Right DEX Arrow", "StatMen25", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(200, 155, 50, 15)), 50.0, 15.0, 1)


        INT_BOX = Ui_Elements::WindowBoxes.new("INT Box", "StatMen26", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(400, 150, 220, 50)), 220.0, 50.0, 2)

        INT_TEXT = Ui_Elements::WindowText.new("INT Text", "StatMen27", SF::Text.new("INT", QUICKSAND, 24))

        LEFT_INT_ARROW = Ui_Elements::WindowBoxes.new("Left INT Arrow", "StatMen28", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(200, 140, 50, 15)), 50.0, 15.0, 1)

        RIGHT_INT_ARROW = Ui_Elements::WindowBoxes.new("Right INT Arrow", "StatMen29", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(200, 155, 50, 15)), 50.0, 15.0, 1)


        LUK_BOX = Ui_Elements::WindowBoxes.new("LUK Box", "StatMen30", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(400, 150, 220, 50)), 220.0, 50.0, 2)

        LUK_TEXT = Ui_Elements::WindowText.new("LUK Text", "StatMen31", SF::Text.new("LUK", QUICKSAND, 24))

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

             NAME_TEXT.text.position = NAME_BOX.sprite.position + SF.vector2(32 * max_scale, 5 * max_scale)
             NAME_TEXT.text.scale = NAME_BOX.sprite.scale
             NAME_TEXT.text.string = Player::Stats.name.not_nil!
             Utility::StringUtilities.center_text(NAME_TEXT.text)


             MONEY_BOX.sprite.position = STATS_WINDOW_BOX.sprite.position + SF.vector2(98 * max_scale, 7 * max_scale)
             MONEY_BOX.sprite.scale = STATS_WINDOW_BOX.sprite.scale

             MONEY_TEXT.text.position = MONEY_BOX.sprite.position + SF.vector2(28 * max_scale, 5 * max_scale)
             MONEY_TEXT.text.scale = MONEY_BOX.sprite.scale
             MONEY_TEXT.text.string = "Cash: " + Player::Stats.money.not_nil!.to_s
             Utility::StringUtilities.center_text(MONEY_TEXT.text)


             LVL_BOX.sprite.position = STATS_WINDOW_BOX.sprite.position + SF.vector2(5 * max_scale, 48 * max_scale)
             LVL_BOX.sprite.scale = STATS_WINDOW_BOX.sprite.scale

             LVL_TEXT.text.position = LVL_BOX.sprite.position + SF.vector2(14 * max_scale, 5 * max_scale)
             LVL_TEXT.text.scale = LVL_BOX.sprite.scale
             LVL_TEXT.text.string = "Lvl: " + Player::Stats.lvl.not_nil!.to_s + " Pts: " + Player::Stats.lvl_points.not_nil!.to_s
             Utility::StringUtilities.center_text(LVL_TEXT.text)


             EXP_BOX.sprite.position = STATS_WINDOW_BOX.sprite.position + SF.vector2(87 * max_scale, 48 * max_scale)
             EXP_BOX.sprite.scale = STATS_WINDOW_BOX.sprite.scale

             EXP_TEXT.text.position = EXP_BOX.sprite.position + SF.vector2(14 * max_scale, 5 * max_scale)
             EXP_TEXT.text.scale = LVL_BOX.sprite.scale
             EXP_TEXT.text.string = "EXP: #{Player::Stats.exp.not_nil!.to_s}/#{Player::Stats.exp_cap.not_nil!.to_s}"
             Utility::StringUtilities.center_text(EXP_TEXT.text)


             HP_BOX.sprite.position = STATS_WINDOW_BOX.sprite.position + SF.vector2(5 * max_scale, 90 * max_scale)
             HP_BOX.sprite.scale = STATS_WINDOW_BOX.sprite.scale

             HP_TEXT.text.position = HP_BOX.sprite.position + SF.vector2(11 * max_scale, 5 * max_scale)
             HP_TEXT.text.scale = HP_BOX.sprite.scale
             HP_TEXT.text.string = "HP: #{Player::Stats.current_hp.not_nil!.to_s}/#{Player::Stats.max_hp.not_nil!.to_s}"
             Utility::StringUtilities.center_text(HP_TEXT.text)

             LEFT_HP_ARROW.sprite.position = HP_BOX.sprite.position + SF.vector2(0 * max_scale, 42 * max_scale)
             LEFT_HP_ARROW.sprite.scale = STATS_WINDOW_BOX.sprite.scale
             
             RIGHT_HP_ARROW.sprite.position = HP_BOX.sprite.position + SF.vector2(56 * max_scale, 42 * max_scale)
             RIGHT_HP_ARROW.sprite.scale = STATS_WINDOW_BOX.sprite.scale


             MP_BOX.sprite.position = STATS_WINDOW_BOX.sprite.position + SF.vector2(87 * max_scale, 90 * max_scale)
             MP_BOX.sprite.scale = STATS_WINDOW_BOX.sprite.scale

             MP_TEXT.text.position = MP_BOX.sprite.position + SF.vector2(11 * max_scale, 5 * max_scale)
             MP_TEXT.text.scale = MP_BOX.sprite.scale
             MP_TEXT.text.string = "MP: #{Player::Stats.current_mp.not_nil!.to_s}/#{Player::Stats.max_mp.not_nil!.to_s}"
             Utility::StringUtilities.center_text(MP_TEXT.text)

             LEFT_MP_ARROW.sprite.position = MP_BOX.sprite.position + SF.vector2(0 * max_scale, 42 * max_scale)
             LEFT_MP_ARROW.sprite.scale = STATS_WINDOW_BOX.sprite.scale

             RIGHT_MP_ARROW.sprite.position = MP_BOX.sprite.position + SF.vector2(56 * max_scale, 42 * max_scale)
             RIGHT_MP_ARROW.sprite.scale = STATS_MENU_BOX.sprite.scale


             STR_BOX.sprite.position = STATS_WINDOW_BOX.sprite.position + SF.vector2(5 * max_scale, 152 * max_scale)
             STR_BOX.sprite.scale = STATS_WINDOW_BOX.sprite.scale

             STR_TEXT.text.position = STR_BOX.sprite.position + TEXT_OFFSET_MARGIN
             STR_TEXT.text.scale = STR_BOX.sprite.scale
             STR_TEXT.text.string = "Str: " + Player::Stats.str.not_nil!.to_s
             Utility::StringUtilities.center_text(STR_TEXT.text)

             LEFT_STR_ARROW.sprite.position = STR_BOX.sprite.position + SF.vector2(0 * max_scale, 42 * max_scale)
             LEFT_STR_ARROW.sprite.scale = STATS_WINDOW_BOX.sprite.scale

             RIGHT_STR_ARROW.sprite.position = STR_BOX.sprite.position + SF.vector2(56 * max_scale, 42 * max_scale)
             RIGHT_STR_ARROW.sprite.scale = STATS_WINDOW_BOX.sprite.scale


             DEX_BOX.sprite.position = STATS_WINDOW_BOX.sprite.positon + SF.vector2(87 * max_scale, 152 * max_scale)
             DEX_BOX.sprite.scale = STATS_WINDOW_BOX.sprite.scale

             DEX_TEXT.text.position = DEX_BOX.sprite.position + TEXT_OFFSET_MARGIN
             DEX_TEXT.text.scale = DEX_BOX.sprite.scale
             DEX_TEXT.text.string = "Dex: " + Player::Stats.dex.not_nil!.to_s
             Utility::StringUtilities.center_text(DEX_TEXT.text)

             LEFT_DEX_ARROW.sprite.position = DEX_BOX.sprite.position + SF.vector2(0 * max_scale, 42 * max_scale)
             LEFT_DEX_ARROW.sprite.scale = STATS_WINDOW_BOX.sprite.scale

             RIGHT_DEX_ARROW.sprite.position = DEX_BOX.sprite.position + SF.vector2(56 * max_scale, 42 * max_scale)
             RIGHT_DEX_ARROW.sprite.scale = STATS_WINDOW_BOX.sprite.scale


             INT_BOX.sprite.position = STATS_WINDOW_BOX.sprite.position + SF.vector2(5 * max_scale, 214 * max_scale)
             INT_BOX.sprite.scale = STATS_WINDOW_BOX.sprite.scale


            #     Ui_Elements::WindowBoxes::STATS_MENU_INT_BOX.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.position + SF.vector2(5 * max_scale, 214 * max_scale)
            #     Ui_Elements::WindowBoxes::STATS_MENU_INT_BOX.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale

            #     Ui_Elements::WindowText::STATS_MENU_INT_TEXT.text.position = Ui_Elements::WindowBoxes::STATS_MENU_INT_BOX.sprite.position + SF.vector2(28 * max_scale, 5 * max_scale)
            #     Ui_Elements::WindowText::STATS_MENU_INT_TEXT.text.scale = Ui_Elements::WindowBoxes::STATS_MENU_INT_BOX.sprite.scale
            #     Ui_Elements::WindowText::STATS_MENU_INT_TEXT.text.string = "Int: " + Player::Stats.int.not_nil!.to_s
            #     SystemMenus.center_save_file_text(Ui_Elements::WindowText::STATS_MENU_INT_TEXT.text)

            #     Ui_Elements::WindowBoxes::STATS_MENU_LEFT_INT_ARROW.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_INT_BOX.sprite.position + SF.vector2(0 * max_scale, 42 * max_scale)
            #     Ui_Elements::WindowBoxes::STATS_MENU_LEFT_INT_ARROW.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale

            #     Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_INT_ARROW.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_INT_BOX.sprite.position + SF.vector2(56 * max_scale, 42 * max_scale)
            #     Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_INT_ARROW.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale


            #     Ui_Elements::WindowBoxes::STATS_MENU_LUK_BOX.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.position + SF.vector2(87 * max_scale, 214 * max_scale)
            #     Ui_Elements::WindowBoxes::STATS_MENU_LUK_BOX.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale

            #     Ui_Elements::WindowText::STATS_MENU_LUK_TEXT.text.position = Ui_Elements::WindowBoxes::STATS_MENU_LUK_BOX.sprite.position + SF.vector2(28 * max_scale, 5 * max_scale)
            #     Ui_Elements::WindowText::STATS_MENU_LUK_TEXT.text.scale = Ui_Elements::WindowBoxes::STATS_MENU_LUK_BOX.sprite.scale
            #     Ui_Elements::WindowText::STATS_MENU_LUK_TEXT.text.string = "Luk: " + Player::Stats.luk.not_nil!.to_s
            #     SystemMenus.center_save_file_text(Ui_Elements::WindowText::STATS_MENU_LUK_TEXT.text)

            #     Ui_Elements::WindowBoxes::STATS_MENU_LEFT_LUK_ARROW.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_LUK_BOX.sprite.position + SF.vector2(0 * max_scale, 42 * max_scale)
            #     Ui_Elements::WindowBoxes::STATS_MENU_LEFT_LUK_ARROW.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale

            #     Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_LUK_ARROW.sprite.position = Ui_Elements::WindowBoxes::STATS_MENU_LUK_BOX.sprite.position + SF.vector2(56 * max_scale, 42 * max_scale)
            #     Ui_Elements::WindowBoxes::STATS_MENU_RIGHT_LUK_ARROW.sprite.scale = Ui_Elements::WindowBoxes::STATS_MENU_BOX.sprite.scale
        end
    end
end