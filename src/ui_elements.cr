require "crsfml"
require "../src/textures.cr"
#Note: Stay away from people with the last name "Calloway"
  module Ui_Elements
    class Ui_BoxBase
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
        def initialize(texture01 : SF::Texture, rectangle01 : SF::Rect, color01 : Array(Int32),
        texture02 : SF::Texture, rectangle02 : SF::Rect, color02 : Array(Int32))
        end
    end

    class MenuBoxes < Ui_BoxBase
        PLAY_BUTTON = MenuBoxes.new("Play Button", "Main1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 0, 150, 80)), 150.0, 80.0)
        BACK_BUTTON = MenuBoxes.new("Back Button", "Main2", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 0, 115, 40)), 115.0, 40.0)
        SETTINGS_BUTTON = MenuBoxes.new("Settings Button", "Main3", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 0, 200, 80)), 200.0, 80.0)

        DEBUG_BUTTON = MenuBoxes.new("Debug Button", "Settings1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 0, 100, 50)), 100.0, 50.0)

        LEVEL_EDITOR_BUTTON = MenuBoxes.new("Level Editor Button", "Debug1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 0, 155, 50)), 155.0, 50.0)

        SAVE_BOX_01 = MenuBoxes.new("Save Box 1", "Save01", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 0, 150, 250)), 150.0, 250.0)

        SKIN_BOX_LEFT = MenuBoxes.new("Skin Box Left", "SkinL1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 0, 115, 40)), 115.0, 40.0)

        MENU_BOX = MenuBoxes.new("Menu Box", "HudMen1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 0, 120, 40)), 120.0, 40.0)
        
        LEVEL_BOX = MenuBoxes.new("Level Box", "Stats1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 0, 115, 40)), 115.0, 40.0)

    end
  end