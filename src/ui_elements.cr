require "crsfml"
require "../src/textures.cr"
#Note: Stay away from people with the last name "Calloway"
  module Ui_Elements
    class Ui_BoxBase
        def initialize(name : String, id : String, sprite : SF::Sprite)
            @name = name
            @id = id
            @sprite = sprite
        end

        property name : String
        property id : String
        property sprite : SF::Sprite

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

    class MenuBoxes < Ui_BoxBase
        PLAY_BUTTON = MenuBoxes.new("Play Button", "Main1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 0, 150, 80)))

    end
  end