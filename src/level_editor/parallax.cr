require "crsfml"
require "../../src/textures.cr"
require "../../src/level_elements.cr"

module Parallax include LevelElements
    class ParallaxMethods
        def self.change_parallax(index, direction)
            index = Utility::ArrayUtilities.navigate_array(direction, 
            LevelElements::ParallaxBase::PARALLAX_ARRAY, LevelEditor::LevelEditorLogic.current_parallax_index)
            return LevelElements::ParallaxBase::PARALLAX_ARRAY[LevelEditor::LevelEditorLogic.current_parallax_index]
        end
    end
    class ParallaxSky < ParallaxBase
        @@sunset_01 = ParallaxSky.new("Sunset", "sunset_01", 0, -500, SF::Sprite.new(SUNSET_PARALLAX_TEXTURE_01))
        PARALLAX_SPRITE_HASH[@@sunset_01.id] = @@sunset_01.sprite
    end
end