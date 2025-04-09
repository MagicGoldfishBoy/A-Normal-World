require "crsfml"
require "../src/textures.cr"
require "../src/fonts.cr"
#Note: Stay away from people with the last name "Calloway"
  module Ui_Elements
    class Ui_BoxBase
        BOX_ARRAY = [] of Ui_BoxBase
        def initialize(name : String, id : String, sprite : SF::Sprite, width : Float64, height : Float64, 
            color_num : Int32)
            @name = name
            @id = id
            @sprite = sprite
            @width = width
            @height = height
            @color_num = color_num
            BOX_ARRAY.push(self)
        end

        property name : String
        property id : String
        property sprite : SF::Sprite
        property width : Float64
        property height : Float64
        property color_num : Int32

    end
    class Ui_TextBase
        TEXT_ARRAY = [] of Ui_TextBase
        def initialize(name : String, id : String, text : SF::Text)
            @name = name
            @id = id
            @text = text
            TEXT_ARRAY.push(self)
        end

        property name : String
        property id : String
        property text : SF::Text

    end

    class MenuThemes
        def initialize(
            name : String,
            menu_texture : SF::Texture, color01 : SF::Color,
            effect_texture : SF::Texture, color02 : SF::Color,
            color03 : SF::Color, color04 : SF::Color, font01 : SF::Font,
            font02 : SF::Font
            )

            @name = name
            @menu_texture = menu_texture
            @color01 = color01
            @effect_texture = effect_texture
            @color02 = color02
            @color03 = color03
            @color04 = color04
            @font01 = font01
            @font02 = font02
        end

        property name : String
        property menu_texture : SF::Texture
        property color01 : SF::Color
        property effect_texture : SF::Texture
        property color02 : SF::Color
        property color03 : SF::Color
        property color04 : SF::Color
        property font01 : SF::Font
        property font02 : SF::Font

        class_property current_theme : MenuThemes = PRE_ALPHA_THEME

        PRE_ALPHA_THEME = MenuThemes.new(
            "Pre Alpha Theme",
            PRE_ALPHA_THEME_TEXTURE, SF::Color.new(91, 173, 240),
            BLANK_TEXTURE, SF::Color.new(52, 152, 235),
            SF::Color.new(41, 110, 166), SF::Color.new(19, 66, 105),
            QUICKSAND, QUICKSAND_BOLD
        )

        def self.apply_theme

            Ui_BoxBase::BOX_ARRAY.each do |box|
                box.sprite.texture = current_theme.menu_texture
                case box.color_num
                when 1
                    box.sprite.color = current_theme.color01
                when 2
                    box.sprite.color = current_theme.color02
                when 3
                    box.sprite.color = current_theme.color03
                when 4
                    box.sprite.color = current_theme.color04
                end
            end

            MenuText::TEXT_ARRAY.each do |text|
                text.text.color = current_theme.color04
                text.text.font = current_theme.font01
            end
            MainMenu::MainMenuElements::TITLE_TEXT.text.font = current_theme.font02
        end

    end
    

    class MenuBoxes < Ui_BoxBase
        BACK_BUTTON = MenuBoxes.new("Back Button", "Main2", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 100, 115, 40)), 115.0, 40.0, 1)

        NEXT_BUTTON = MenuBoxes.new("Next Button", "Main5", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 140, 115, 40)), 115.0, 40.0, 1)

        MENU_BOX = MenuBoxes.new("Menu Box", "HudMen1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(400, 0, 115, 40)), 115.0, 40.0, 1)

        MAIN_HUD_BOX = MenuBoxes.new("Main Hud Box", "HUD1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 200, 1000, 500)), 1000.0, 100.0, 4)

    end
    class MenuText < Ui_TextBase

        BACK_BUTTON_TEXT = MenuText.new("Back Button Text", "Main2", SF::Text.new("Back", QUICKSAND, 28))

        NEXT_BUTTON_TEXT = MenuText.new("Next Button Text", "Main5", SF::Text.new("Next", QUICKSAND, 28))

        MAIN_HUD_BOX_TEXT = MenuText.new("Main Hud Box Text", "HUD1", SF::Text.new("Main Hud", QUICKSAND, 34))

    end
    class WindowBoxes < Ui_BoxBase
        # HUD_MENU_BOX = WindowBoxes.new("Hud Menu Box", "HudMen1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(200, 800, 120, 176)), 120.0, 176.0, 3)
        # HUD_MENU_SAVE_BOX = WindowBoxes.new("Hud Menu Save Box", "HudMen2", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(200, 100, 116, 40)), 116.0, 40.0, 1)
        # HUD_MENU_QUIT_BOX = WindowBoxes.new("Hud Menu Quit Box", "HudMen3", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(200, 100, 116, 40)), 116.0, 40.0, 1)
        # HUD_MENU_STATS_BOX = WindowBoxes.new("Hud Menu Stats Box", "HudMen4", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(200, 100, 116, 40)), 116.0, 40.0, 1)
        # HUD_MENU_SETTINGS_BOX = WindowBoxes.new("Hud Menu Settings Box", "HudMen5", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(200, 100, 116, 40)), 116.0, 40.0, 1)
        # HUD_MENU_SAVE_BOX.sprite.position = HUD_MENU_BOX.sprite.position + SF.vector2(5, 0)

        STATS_MENU_BOX = WindowBoxes.new("Stats Menu Box", "StatMen1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 200, 500, 410)), 500.0, 410.0, 4)
        STATS_MENU_NAME_BOX = WindowBoxes.new("Stats Menu Name Box", "StatMen2", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(400, 100, 250, 50)), 250.0, 50.0, 3)
        STATS_MENU_MONEY_BOX = WindowBoxes.new("Stats Menu Money Box", "StatMen3", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(700, 100, 190, 50)), 190.0, 50.0, 3)
        STATS_MENU_LVL_BOX = WindowBoxes.new("Stats Menu Level Box", "StatMen4", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(400, 150, 220, 50)), 220.0, 50.0, 3)
        STATS_MENU_EXP_BOX = WindowBoxes.new("Stats Menu Exp Box", "StatMen5", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(400, 150, 220, 50)), 220.0, 50.0, 3)
        STATS_MENU_HP_BOX = WindowBoxes.new("Stats Menu HP Box", "StatMen6", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(400, 150, 220, 50)), 220.0, 50.0, 2)
        STATS_MENU_MP_BOX = WindowBoxes.new("Stats Menu MP Box", "StatMen7", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(400, 150, 220, 50)), 220.0, 50.0, 2)
        STATS_MENU_STR_BOX = WindowBoxes.new("Stats Menu STR Box", "StatMen8", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(400, 150, 220, 50)), 220.0, 50.0, 2)
        STATS_MENU_DEX_BOX = WindowBoxes.new("Stats Menu DEX Box", "StatMen9", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(400, 150, 220, 50)), 220.0, 50.0, 2)
        STATS_MENU_INT_BOX = WindowBoxes.new("Stats Menu INT Box", "StatMen10", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(400, 150, 220, 50)), 220.0, 50.0, 2)
        STATS_MENU_LUK_BOX = WindowBoxes.new("Stats Menu LUK Box", "StatMen11", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(400, 150, 220, 50)), 220.0, 50.0, 2)

        STATS_MENU_LEFT_HP_ARROW = WindowBoxes.new("Stats Menu Left HP Arrow", "StatMen12", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(200, 140, 50, 15)), 50.0, 15.0, 1)
        STATS_MENU_RIGHT_HP_ARROW = WindowBoxes.new("Stats Menu Right HP Arrow", "StatMen13", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(200, 155, 50, 15)), 50.0, 15.0, 1)
        STATS_MENU_LEFT_MP_ARROW = WindowBoxes.new("Stats Menu Left MP Arrow", "StatMen14", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(200, 140, 50, 15)), 50.0, 15.0, 1)
        STATS_MENU_RIGHT_MP_ARROW = WindowBoxes.new("Stats Menu Right MP Arrow", "StatMen15", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(200, 155, 50, 15)), 50.0, 15.0, 1)
        STATS_MENU_LEFT_STR_ARROW = WindowBoxes.new("Stats Menu Left STR Arrow", "StatMen16", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(200, 140, 50, 15)), 50.0, 15.0, 1)
        STATS_MENU_RIGHT_STR_ARROW = WindowBoxes.new("Stats Menu Right STR Arrow", "StatMen17", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(200, 155, 50, 15)), 50.0, 15.0, 1)
        STATS_MENU_LEFT_DEX_ARROW = WindowBoxes.new("Stats Menu Left DEX Arrow", "StatMen18", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(200, 140, 50, 15)), 50.0, 15.0, 1)
        STATS_MENU_RIGHT_DEX_ARROW = WindowBoxes.new("Stats Menu Right DEX Arrow", "StatMen19", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(200, 155, 50, 15)), 50.0, 15.0, 1)
        STATS_MENU_LEFT_INT_ARROW = WindowBoxes.new("Stats Menu Left INT Arrow", "StatMen20", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(200, 140, 50, 15)), 50.0, 15.0, 1)
        STATS_MENU_RIGHT_INT_ARROW = WindowBoxes.new("Stats Menu Right INT Arrow", "StatMen21", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(200, 155, 50, 15)), 50.0, 15.0, 1)
        STATS_MENU_LEFT_LUK_ARROW = WindowBoxes.new("Stats Menu Left LUK Arrow", "StatMen22", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(200, 140, 50, 15)), 50.0, 15.0, 1)
        STATS_MENU_RIGHT_LUK_ARROW = WindowBoxes.new("Stats Menu Right LUK Arrow", "StatMen23", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(200, 155, 50, 15)), 50.0, 15.0, 1)
        
    end
    class WindowText < Ui_TextBase
        HUD_MENU_SAVE_TEXT = WindowText.new("Hud Menu Save Text", "HudMen1", SF::Text.new("Save", QUICKSAND, 24))
        HUD_MENU_QUIT_TEXT = WindowText.new("Hud Menu Quit Text", "HudMen2", SF::Text.new("Save & Quit", QUICKSAND, 20))
        HUD_MENU_STATS_TEXT = WindowText.new("Hud Menu Stats Text", "HudMen3", SF::Text.new("Stats", QUICKSAND, 24))
        HUD_MENU_SETTINGS_TEXT = WindowText.new("Hud Menu Settings Text", "HudMen4", SF::Text.new("Settings", QUICKSAND, 24))

        STATS_MENU_NAME_TEXT = WindowText.new("Stats Menu Name Text", "StatMen1", SF::Text.new("Name", QUICKSAND, 24))
        STATS_MENU_MONEY_TEXT = WindowText.new("Stats Menu Money Text", "StatMen2", SF::Text.new("Money", QUICKSAND, 24))
        STATS_MENU_LVL_TEXT = WindowText.new("Stats Menu Level Text", "StatMen3", SF::Text.new("Level", QUICKSAND, 24))
        STATS_MENU_EXP_TEXT = WindowText.new("Stats Menu Exp Text", "StatMen4", SF::Text.new("Exp", QUICKSAND, 24))
        STATS_MENU_HP_TEXT = WindowText.new("Stats Menu HP Text", "StatMen5", SF::Text.new("HP", QUICKSAND, 24))
        STATS_MENU_MP_TEXT = WindowText.new("Stats Menu MP Text", "StatMen6", SF::Text.new("MP", QUICKSAND, 24))
        STATS_MENU_STR_TEXT = WindowText.new("Stats Menu STR Text", "StatMen7", SF::Text.new("STR", QUICKSAND, 24))
        STATS_MENU_DEX_TEXT = WindowText.new("Stats Menu DEX Text", "StatMen8", SF::Text.new("DEX", QUICKSAND, 24))
        STATS_MENU_INT_TEXT = WindowText.new("Stats Menu INT Text", "StatMen9", SF::Text.new("INT", QUICKSAND, 24))
        STATS_MENU_LUK_TEXT = WindowText.new("Stats Menu LUK Text", "StatMen10", SF::Text.new("LUK", QUICKSAND, 24))
    end
  end