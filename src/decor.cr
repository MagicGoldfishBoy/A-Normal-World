require "crsfml"
require "../src/textures.cr"
require "../src/level_elements.cr"

module Decor include LevelElements
    class DecorPlants < DecorBase
        @@fallen_leaves = DecorPlants.new("Fallen Leaves", "fallen_leaves", 0, 0, 
        SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 0, 10, 20)), 1)
        DECOR_SPRITE_HASH["fallen_leaves"] = SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 0, 10, 20))
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@fallen_leaves
    end
end