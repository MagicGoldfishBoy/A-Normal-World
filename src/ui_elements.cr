require "crsfml"
require "../src/textures.cr"
require "../src/fonts.cr"
#Note: Stay away from people with the last name "Calloway"
  module Ui_Elements
    class Ui_BoxBase
        BOX_ARRAY = [] of Ui_BoxBase
        def initialize(name : String, id : String, sprite : SF::Sprite, width : Float64, height : Float64)
            @name = name
            @id = id
            @sprite = sprite
            @width = width
            @height = height
        end

        property name : String
        property id : String
        property sprite : SF::Sprite
        property width : Float64
        property height : Float64

    end
    class Ui_TextBase
        def initialize(name : String, id : String, text : SF::Text)
            @name = name
            @id = id
            @text = text
        end

        property name : String
        property id : String
        property text : SF::Text

    end

    class MenuThemes
        def initialize(
            name : String,
            texture01 : SF::Texture, color01 : SF::Color,
            texture02 : SF::Texture, color02 : SF::Color,
            texture03 : SF::Texture, color03 : SF::Color,
            texture04 : SF::Texture, color04 : SF::Color
            )

            @name = name
            @texture01 = texture01
            @color01 = color01
            @texture02 = texture02
            @color02 = color02
            @texture03 = texture03
            @color03 = color03
            @texture04 = texture04
            @color04 = color04
        end

        property name : String
        property texture01 : SF::Texture
        property color01 : SF::Color
        property texture02 : SF::Texture
        property color02 : SF::Color
        property texture03 : SF::Texture
        property color03 : SF::Color
        property texture04 : SF::Texture
        property color04 : SF::Color

        class_property current_theme : MenuThemes = PRE_ALPHA_THEME

        PRE_ALPHA_THEME = MenuThemes.new(
            "Pre Alpha Theme",
            BLANK_TEXTURE, SF::Color.new(91, 173, 240),
            BLANK_TEXTURE, SF::Color.new(52, 152, 235),
            BLANK_TEXTURE, SF::Color.new(41, 110, 166),
            PRE_ALPHA_THEME_TEXTURE, SF::Color.new(19, 66, 105)
        )

        def self.apply_theme
            MenuBoxes::PLAY_BUTTON.sprite.texture = current_theme.texture04
            MenuBoxes::PLAY_BUTTON.sprite.color = current_theme.color01

            MenuBoxes::BACK_BUTTON.sprite.texture = current_theme.texture04
            MenuBoxes::BACK_BUTTON.sprite.color = current_theme.color01

            MenuBoxes::SETTINGS_BUTTON.sprite.texture = current_theme.texture04
            MenuBoxes::SETTINGS_BUTTON.sprite.color = current_theme.color01

            MenuBoxes::QUIT_BUTTON.sprite.texture = current_theme.texture04
            MenuBoxes::QUIT_BUTTON.sprite.color = current_theme.color01

            MenuBoxes::NEXT_BUTTON.sprite.texture = current_theme.texture04
            MenuBoxes::NEXT_BUTTON.sprite.color = current_theme.color01

            MenuBoxes::DEBUG_BUTTON.sprite.texture = current_theme.texture04
            MenuBoxes::DEBUG_BUTTON.sprite.color = current_theme.color01

            MenuBoxes::LEVEL_EDITOR_BUTTON.sprite.texture = current_theme.texture04
            MenuBoxes::LEVEL_EDITOR_BUTTON.sprite.color = current_theme.color01

            MenuBoxes::SAVE_BOX_01.sprite.texture = current_theme.texture04
            MenuBoxes::SAVE_BOX_01.sprite.color = current_theme.color02
            MenuBoxes::SAVE_BOX_02.sprite.texture = current_theme.texture04
            MenuBoxes::SAVE_BOX_02.sprite.color = current_theme.color02
            MenuBoxes::SAVE_BOX_03.sprite.texture = current_theme.texture04
            MenuBoxes::SAVE_BOX_03.sprite.color = current_theme.color02
            MenuBoxes::SAVE_BOX_04.sprite.texture = current_theme.texture04
            MenuBoxes::SAVE_BOX_04.sprite.color = current_theme.color02
            MenuBoxes::SAVE_BOX_05.sprite.texture = current_theme.texture04
            MenuBoxes::SAVE_BOX_05.sprite.color = current_theme.color02
            MenuBoxes::SAVE_BOX_06.sprite.texture = current_theme.texture04
            MenuBoxes::SAVE_BOX_06.sprite.color = current_theme.color02
            MenuBoxes::SAVE_BOX_07.sprite.color = current_theme.color02
            MenuBoxes::SAVE_BOX_07.sprite.texture = current_theme.texture04

            MenuBoxes::SKIN_BOX_LEFT.sprite.texture = current_theme.texture04
            MenuBoxes::SKIN_BOX_LEFT.sprite.color = current_theme.color01
            MenuBoxes::SKIN_BOX_RIGHT.sprite.texture = current_theme.texture04
            MenuBoxes::SKIN_BOX_RIGHT.sprite.color = current_theme.color01
            MenuBoxes::HAIR_BOX_LEFT.sprite.texture = current_theme.texture04
            MenuBoxes::HAIR_BOX_LEFT.sprite.color = current_theme.color01
            MenuBoxes::HAIR_BOX_RIGHT.sprite.texture = current_theme.texture04
            MenuBoxes::HAIR_BOX_RIGHT.sprite.color = current_theme.color01
            MenuBoxes::FACE_BOX_LEFT.sprite.texture = current_theme.texture04
            MenuBoxes::FACE_BOX_LEFT.sprite.color = current_theme.color01
            MenuBoxes::FACE_BOX_RIGHT.sprite.texture = current_theme.texture04
            MenuBoxes::FACE_BOX_RIGHT.sprite.color = current_theme.color01
            MenuBoxes::SHIRT_BOX_LEFT.sprite.texture = current_theme.texture04
            MenuBoxes::SHIRT_BOX_LEFT.sprite.color = current_theme.color01
            MenuBoxes::SHIRT_BOX_RIGHT.sprite.texture = current_theme.texture04
            MenuBoxes::SHIRT_BOX_RIGHT.sprite.color = current_theme.color01
            MenuBoxes::PANTS_BOX_LEFT.sprite.texture = current_theme.texture04
            MenuBoxes::PANTS_BOX_LEFT.sprite.color = current_theme.color01
            MenuBoxes::PANTS_BOX_RIGHT.sprite.texture = current_theme.texture04
            MenuBoxes::PANTS_BOX_RIGHT.sprite.color = current_theme.color01
            MenuBoxes::SHOES_BOX_LEFT.sprite.texture = current_theme.texture04
            MenuBoxes::SHOES_BOX_LEFT.sprite.color = current_theme.color01
            MenuBoxes::SHOES_BOX_RIGHT.sprite.texture = current_theme.texture04
            MenuBoxes::SHOES_BOX_RIGHT.sprite.color = current_theme.color01

            MenuBoxes::MENU_BOX.sprite.texture = current_theme.texture04
            MenuBoxes::MENU_BOX.sprite.color = current_theme.color01

            MenuBoxes::MAIN_HUD_BOX.sprite.texture = current_theme.texture04
            MenuBoxes::MAIN_HUD_BOX.sprite.color = current_theme.color04

            MenuBoxes::LEVEL_BOX.sprite.texture = current_theme.texture04
            MenuBoxes::LEVEL_BOX.sprite.color = current_theme.color01
        end

    end
    

    class MenuBoxes < Ui_BoxBase
        PLAY_BUTTON = MenuBoxes.new("Play Button", "Main1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 0, 150, 80)), 150.0, 80.0)
        BACK_BUTTON = MenuBoxes.new("Back Button", "Main2", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 100, 115, 40)), 115.0, 40.0)
        SETTINGS_BUTTON = MenuBoxes.new("Settings Button", "Main3", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(200, 0, 200, 80)), 200.0, 80.0)
        QUIT_BUTTON = MenuBoxes.new("Quit Button", "Main4", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 0, 150, 80)), 150.0, 80.0)
        NEXT_BUTTON = MenuBoxes.new("Next Button", "Main5", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 140, 115, 40)), 115.0, 40.0)

        DEBUG_BUTTON = MenuBoxes.new("Debug Button", "Settings1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(600, 0, 100, 50)), 100.0, 50.0)

        LEVEL_EDITOR_BUTTON = MenuBoxes.new("Level Editor Button", "Debug1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(700, 0, 155, 50)), 155.0, 50.0)

        SAVE_BOX_01 = MenuBoxes.new("Save Box 1", "Save01", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 800, 150, 250)), 150.0, 250.0)
        SAVE_BOX_02 = MenuBoxes.new("Save Box 2", "Save02", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 800, 150, 250)), 150.0, 250.0)
        SAVE_BOX_03 = MenuBoxes.new("Save Box 3", "Save03", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 800, 150, 250)), 150.0, 250.0)
        SAVE_BOX_04 = MenuBoxes.new("Save Box 4", "Save04", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 800, 150, 250)), 150.0, 250.0)
        SAVE_BOX_05 = MenuBoxes.new("Save Box 5", "Save05", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 800, 150, 250)), 150.0, 250.0)
        SAVE_BOX_06 = MenuBoxes.new("Save Box 6", "Save06", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 800, 150, 250)), 150.0, 250.0)
        SAVE_BOX_07 = MenuBoxes.new("Save Box 7", "Save07", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 800, 150, 250)), 150.0, 250.0)

        SKIN_BOX_LEFT = MenuBoxes.new("Skin Box Left", "SkinL1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 100, 115, 40)), 115.0, 40.0)
        SKIN_BOX_RIGHT = MenuBoxes.new("Skin Box Right", "SkinR1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 140, 115, 40)), 115.0, 40.0)
        HAIR_BOX_LEFT = MenuBoxes.new("Hair Box Left", "HairL1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 100, 115, 40)), 115.0, 40.0)
        HAIR_BOX_RIGHT = MenuBoxes.new("Hair Box Right", "HairR1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 140, 115, 40)), 115.0, 40.0)
        FACE_BOX_LEFT = MenuBoxes.new("Face Box Left", "FaceL1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 100, 115, 40)), 115.0, 40.0)
        FACE_BOX_RIGHT = MenuBoxes.new("Face Box Right", "FaceR1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 140, 115, 40)), 115.0, 40.0)
        SHIRT_BOX_LEFT = MenuBoxes.new("Shirt Box Left", "ShirtL1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 100, 115, 40)), 115.0, 40.0)
        SHIRT_BOX_RIGHT = MenuBoxes.new("Shirt Box Right", "ShirtR1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 140, 115, 40)), 115.0, 40.0)
        PANTS_BOX_LEFT = MenuBoxes.new("Pants Box Left", "PantsL1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 100, 115, 40)), 115.0, 40.0)
        PANTS_BOX_RIGHT = MenuBoxes.new("Pants Box Right", "PantsR1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 140, 115, 40)), 115.0, 40.0)
        SHOES_BOX_LEFT = MenuBoxes.new("Shoes Box Left", "ShoesL1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 100, 115, 40)), 115.0, 40.0)
        SHOES_BOX_RIGHT = MenuBoxes.new("Shoes Box Right", "ShoesR1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 140, 115, 40)), 115.0, 40.0)

        MENU_BOX = MenuBoxes.new("Menu Box", "HudMen1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(400, 0, 115, 40)), 115.0, 40.0)

        MAIN_HUD_BOX = MenuBoxes.new("Main Hud Box", "HUD1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 200, 1000, 500)), 1000.0, 100.0)
        MAIN_HUD_BOX.sprite.texture.not_nil!.repeated = true
        LEVEL_BOX = MenuBoxes.new("Level Box", "Stats1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(400, 0, 115, 40)), 115.0, 40.0)
    end
    class MenuText < Ui_TextBase
        PLAY_BUTTON_TEXT = MenuText.new("Play Button Text", "Main1", SF::Text.new("Play                    Settings                    Quit", QUICKSAND, 34))

        BACK_BUTTON_TEXT = MenuText.new("Back Button Text", "Main2", SF::Text.new("Back", QUICKSAND, 34))
        
        SETTINGS_BUTTON_TEXT = MenuText.new("Settings Button Text", "Main3", SF::Text.new("Settings", QUICKSAND, 34))
        QUIT_BUTTON_TEXT = MenuText.new("Quit Button Text", "Main4", SF::Text.new("Quit", QUICKSAND, 34))
        NEXT_BUTTON_TEXT = MenuText.new("Next Button Text", "Main5", SF::Text.new("Next", QUICKSAND, 34))
        DEBUG_BUTTON_TEXT = MenuText.new("Debug Button Text", "Settings1", SF::Text.new("Debug", QUICKSAND, 34))
        LEVEL_EDITOR_BUTTON_TEXT = MenuText.new("Level Editor Button Text", "Debug1", SF::Text.new("Level Editor", QUICKSAND, 34))
        SAVE_BOX_01_TEXT = MenuText.new("Save Box 1 Text", "Save01", SF::Text.new("Save 1", QUICKSAND, 34))
        SAVE_BOX_02_TEXT = MenuText.new("Save Box 2 Text", "Save02", SF::Text.new("Save 2", QUICKSAND, 34))
        SAVE_BOX_03_TEXT = MenuText.new("Save Box 3 Text", "Save03", SF::Text.new("Save 3", QUICKSAND, 34))
        SAVE_BOX_04_TEXT = MenuText.new("Save Box 4 Text", "Save04", SF::Text.new("Save 4", QUICKSAND, 34))
        SAVE_BOX_05_TEXT = MenuText.new("Save Box 5 Text", "Save05", SF::Text.new("Save 5", QUICKSAND, 34))
        SAVE_BOX_06_TEXT = MenuText.new("Save Box 6 Text", "Save06", SF::Text.new("Save 6", QUICKSAND, 34))
        SAVE_BOX_07_TEXT = MenuText.new("Save Box 7 Text", "Save07", SF::Text.new("Save 7", QUICKSAND, 34))
        SKIN_BOX_LEFT_TEXT = MenuText.new("Skin Box Left Text", "SkinL1", SF::Text.new("Skin Left", QUICKSAND, 34))
        SKIN_BOX_RIGHT_TEXT = MenuText.new("Skin Box Right Text", "SkinR1", SF::Text.new("Skin Right", QUICKSAND, 34))
        HAIR_BOX_LEFT_TEXT = MenuText.new("Hair Box Left Text", "HairL1", SF::Text.new("Hair Left", QUICKSAND, 34))
        HAIR_BOX_RIGHT_TEXT = MenuText.new("Hair Box Right Text", "HairR1", SF::Text.new("Hair Right", QUICKSAND, 34))
        FACE_BOX_LEFT_TEXT = MenuText.new("Face Box Left Text", "FaceL1", SF::Text.new("Face Left", QUICKSAND, 34))
        FACE_BOX_RIGHT_TEXT = MenuText.new("Face Box Right Text", "FaceR1", SF::Text.new("Face Right", QUICKSAND, 34))
        SHIRT_BOX_LEFT_TEXT = MenuText.new("Shirt Box Left Text", "ShirtL1", SF::Text.new("Shirt Left", QUICKSAND, 34))
        SHIRT_BOX_RIGHT_TEXT = MenuText.new("Shirt Box Right Text", "ShirtR1", SF::Text.new("Shirt Right", QUICKSAND, 34))
        PANTS_BOX_LEFT_TEXT = MenuText.new("Pants Box Left Text", "PantsL1", SF::Text.new("Pants Left", QUICKSAND, 34))
        PANTS_BOX_RIGHT_TEXT = MenuText.new("Pants Box Right Text", "PantsR1", SF::Text.new("Pants Right", QUICKSAND, 34))
        SHOES_BOX_LEFT_TEXT = MenuText.new("Shoes Box Left Text", "ShoesL1", SF::Text.new("Shoes Left", QUICKSAND, 34))
        SHOES_BOX_RIGHT_TEXT = MenuText.new("Shoes Box Right Text", "ShoesR1", SF::Text.new("Shoes Right", QUICKSAND, 34))
        MENU_BOX_TEXT = MenuText.new("Menu Box Text", "HudMen1", SF::Text.new("Menu", QUICKSAND, 34))
        MAIN_HUD_BOX_TEXT = MenuText.new("Main Hud Box Text", "HUD1", SF::Text.new("Main Hud", QUICKSAND, 34))
        LEVEL_BOX_TEXT = MenuText.new("Level Box Text", "Stats1", SF::Text.new("Level", QUICKSAND, 34))
    end
  end