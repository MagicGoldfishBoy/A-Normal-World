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
                puts box.name
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
            MenuText::TITLE_TEXT.text.font = current_theme.font02
        end

    end
    

    class MenuBoxes < Ui_BoxBase
        PLAY_BUTTON = MenuBoxes.new("Play Button", "Main1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 0, 150, 80)), 150.0, 80.0, 1)
        BACK_BUTTON = MenuBoxes.new("Back Button", "Main2", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 100, 115, 40)), 115.0, 40.0, 1)
        SETTINGS_BUTTON = MenuBoxes.new("Settings Button", "Main3", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(200, 0, 200, 80)), 200.0, 80.0, 1)
        QUIT_BUTTON = MenuBoxes.new("Quit Button", "Main4", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 0, 150, 80)), 150.0, 80.0, 1)
        NEXT_BUTTON = MenuBoxes.new("Next Button", "Main5", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 140, 115, 40)), 115.0, 40.0, 1)

        DEBUG_BUTTON = MenuBoxes.new("Debug Button", "Settings1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(600, 0, 100, 50)), 100.0, 50.0, 1)

        LEVEL_EDITOR_BUTTON = MenuBoxes.new("Level Editor Button", "Debug1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(700, 0, 155, 50)), 155.0, 50.0, 1)

        SAVE_BOX_01 = MenuBoxes.new("Save Box 1", "Save01", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 800, 150, 250)), 150.0, 250.0, 2)
        SAVE_BOX_02 = MenuBoxes.new("Save Box 2", "Save02", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 800, 150, 250)), 150.0, 250.0, 2)
        SAVE_BOX_03 = MenuBoxes.new("Save Box 3", "Save03", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 800, 150, 250)), 150.0, 250.0, 2)
        SAVE_BOX_04 = MenuBoxes.new("Save Box 4", "Save04", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 800, 150, 250)), 150.0, 250.0, 2)
        SAVE_BOX_05 = MenuBoxes.new("Save Box 5", "Save05", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 800, 150, 250)), 150.0, 250.0, 2)
        SAVE_BOX_06 = MenuBoxes.new("Save Box 6", "Save06", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 800, 150, 250)), 150.0, 250.0, 2)
        SAVE_BOX_07 = MenuBoxes.new("Save Box 7", "Save07", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 800, 150, 250)), 150.0, 250.0, 2)

        SKIN_BOX_LEFT = MenuBoxes.new("Skin Box Left", "SkinL1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 100, 115, 40)), 115.0, 40.0, 1)
        SKIN_BOX_RIGHT = MenuBoxes.new("Skin Box Right", "SkinR1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 140, 115, 40)), 115.0, 40.0, 1)
        HAIR_BOX_LEFT = MenuBoxes.new("Hair Box Left", "HairL1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 100, 115, 40)), 115.0, 40.0, 1)
        HAIR_BOX_RIGHT = MenuBoxes.new("Hair Box Right", "HairR1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 140, 115, 40)), 115.0, 40.0, 1)
        FACE_BOX_LEFT = MenuBoxes.new("Face Box Left", "FaceL1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 100, 115, 40)), 115.0, 40.0, 1)
        FACE_BOX_RIGHT = MenuBoxes.new("Face Box Right", "FaceR1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 140, 115, 40)), 115.0, 40.0, 1)
        SHIRT_BOX_LEFT = MenuBoxes.new("Shirt Box Left", "ShirtL1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 100, 115, 40)), 115.0, 40.0, 1)
        SHIRT_BOX_RIGHT = MenuBoxes.new("Shirt Box Right", "ShirtR1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 140, 115, 40)), 115.0, 40.0, 1)
        PANTS_BOX_LEFT = MenuBoxes.new("Pants Box Left", "PantsL1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 100, 115, 40)), 115.0, 40.0, 1)
        PANTS_BOX_RIGHT = MenuBoxes.new("Pants Box Right", "PantsR1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 140, 115, 40)), 115.0, 40.0, 1)
        SHOES_BOX_LEFT = MenuBoxes.new("Shoes Box Left", "ShoesL1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 100, 115, 40)), 115.0, 40.0, 1)
        SHOES_BOX_RIGHT = MenuBoxes.new("Shoes Box Right", "ShoesR1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 140, 115, 40)), 115.0, 40.0, 1)

        MENU_BOX = MenuBoxes.new("Menu Box", "HudMen1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(400, 0, 115, 40)), 115.0, 40.0, 1)

        MAIN_HUD_BOX = MenuBoxes.new("Main Hud Box", "HUD1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 200, 1000, 500)), 1000.0, 100.0, 4)
        MAIN_HUD_BOX.sprite.texture.not_nil!.repeated = true
        LEVEL_BOX = MenuBoxes.new("Level Box", "Stats1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(400, 0, 115, 40)), 115.0, 40.0, 1)
    end
    class MenuText < Ui_TextBase
        PLAY_BUTTON_TEXT = MenuText.new("Play Button Text", "Main1", SF::Text.new("Play                    Settings                    Quit", QUICKSAND, 34))

        BACK_BUTTON_TEXT = MenuText.new("Back Button Text", "Main2", SF::Text.new("Back", QUICKSAND, 28))

        TITLE_TEXT = MenuText.new("Settings Button Text", "Main3", SF::Text.new("A Normal World", QUICKSAND, 50))

        NEXT_BUTTON_TEXT = MenuText.new("Next Button Text", "Main5", SF::Text.new("Next", QUICKSAND, 28))

        DEBUG_BUTTON_TEXT = MenuText.new("Debug Button Text", "Settings1", SF::Text.new("Debug", QUICKSAND, 25))
        
        LEVEL_EDITOR_BUTTON_TEXT = MenuText.new("Level Editor Button Text", "Debug1", SF::Text.new("Level Editor", QUICKSAND, 25))
 
        SAVE_BOX_01_TEXT = MenuText.new("Save Box 1 Text", "Save01", SF::Text.new("Save 1", QUICKSAND, 25))

        SAVE_BOX_02_TEXT = MenuText.new("Save Box 2 Text", "Save02", SF::Text.new("Save 2", QUICKSAND, 25))
        SAVE_BOX_03_TEXT = MenuText.new("Save Box 3 Text", "Save03", SF::Text.new("Save 3", QUICKSAND, 25))
        SAVE_BOX_04_TEXT = MenuText.new("Save Box 4 Text", "Save04", SF::Text.new("Save 4", QUICKSAND, 25))
        SAVE_BOX_05_TEXT = MenuText.new("Save Box 5 Text", "Save05", SF::Text.new("Save 5", QUICKSAND, 25))
        SAVE_BOX_06_TEXT = MenuText.new("Save Box 6 Text", "Save06", SF::Text.new("Save 6", QUICKSAND, 25))
        SAVE_BOX_07_TEXT = MenuText.new("Save Box 7 Text", "Save07", SF::Text.new("Save 7", QUICKSAND, 25))

        SKIN_BOX_LEFT_TEXT = MenuText.new("Skin Box Left Text", "SkinL1", SF::Text.new("Skin", QUICKSAND, 24))
        SKIN_BOX_RIGHT_TEXT = MenuText.new("Skin Box Right Text", "SkinR1", SF::Text.new("Skin", QUICKSAND, 24))
        HAIR_BOX_LEFT_TEXT = MenuText.new("Hair Box Left Text", "HairL1", SF::Text.new("Hair", QUICKSAND, 24))
        HAIR_BOX_RIGHT_TEXT = MenuText.new("Hair Box Right Text", "HairR1", SF::Text.new("Hair", QUICKSAND, 24))
        FACE_BOX_LEFT_TEXT = MenuText.new("Face Box Left Text", "FaceL1", SF::Text.new("Face", QUICKSAND, 24))
        FACE_BOX_RIGHT_TEXT = MenuText.new("Face Box Right Text", "FaceR1", SF::Text.new("Face", QUICKSAND, 24))
        SHIRT_BOX_LEFT_TEXT = MenuText.new("Shirt Box Left Text", "ShirtL1", SF::Text.new("Shirt", QUICKSAND, 24))
        SHIRT_BOX_RIGHT_TEXT = MenuText.new("Shirt Box Right Text", "ShirtR1", SF::Text.new("Shirt", QUICKSAND, 24))
        PANTS_BOX_LEFT_TEXT = MenuText.new("Pants Box Left Text", "PantsL1", SF::Text.new("Pants", QUICKSAND, 24))
        PANTS_BOX_RIGHT_TEXT = MenuText.new("Pants Box Right Text", "PantsR1", SF::Text.new("Pants", QUICKSAND, 24))
        SHOES_BOX_LEFT_TEXT = MenuText.new("Shoes Box Left Text", "ShoesL1", SF::Text.new("Shoes", QUICKSAND, 24))
        SHOES_BOX_RIGHT_TEXT = MenuText.new("Shoes Box Right Text", "ShoesR1", SF::Text.new("Shoes", QUICKSAND, 24))

        MENU_BOX_TEXT = MenuText.new("Menu Box Text", "HudMen1", SF::Text.new("Menu", QUICKSAND, 24))
        MAIN_HUD_BOX_TEXT = MenuText.new("Main Hud Box Text", "HUD1", SF::Text.new("Main Hud", QUICKSAND, 34))
        LEVEL_BOX_TEXT = MenuText.new("Level Box Text", "Stats1", SF::Text.new("Level", QUICKSAND, 34))
    end
    class WindowBoxes < Ui_BoxBase
        HUD_MENU_BOX = WindowBoxes.new("Hud Menu Box", "HudMen1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(200, 800, 120, 176)), 120.0, 176.0, 3)
        HUD_MENU_SAVE_BOX = WindowBoxes.new("Hud Menu Save Box", "HudMen2", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(200, 100, 116, 40)), 116.0, 40.0, 1)
        HUD_MENU_QUIT_BOX = WindowBoxes.new("Hud Menu Quit Box", "HudMen3", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(200, 100, 116, 40)), 116.0, 40.0, 1)
        HUD_MENU_STATS_BOX = WindowBoxes.new("Hud Menu Stats Box", "HudMen4", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(200, 100, 116, 40)), 116.0, 40.0, 1)
        HUD_MENU_SETTINGS_BOX = WindowBoxes.new("Hud Menu Settings Box", "HudMen5", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(200, 100, 116, 40)), 116.0, 40.0, 1)
        HUD_MENU_SAVE_BOX.sprite.position = HUD_MENU_BOX.sprite.position + SF.vector2(5, 0)

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
        
    end
    class WindowText < Ui_TextBase
        HUD_MENU_SAVE_TEXT = WindowText.new("Hud Menu Save Text", "HudMen1", SF::Text.new("Save", QUICKSAND, 24))
        HUD_MENU_QUIT_TEXT = WindowText.new("Hud Menu Quit Text", "HudMen2", SF::Text.new("Save & Quit", QUICKSAND, 20))
        HUD_MENU_STATS_TEXT = WindowText.new("Hud Menu Stats Text", "HudMen3", SF::Text.new("Stats", QUICKSAND, 24))
        HUD_MENU_SETTINGS_TEXT = WindowText.new("Hud Menu Settings Text", "HudMen4", SF::Text.new("Settings", QUICKSAND, 24))
    end
  end