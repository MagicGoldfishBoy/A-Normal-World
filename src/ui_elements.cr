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
  end