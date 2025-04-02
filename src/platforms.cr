require "crsfml"
require "../src/textures.cr"
require "../src/level_elements.cr"

module Platforms include LevelElements
    class Natural_Platform < PlatformBase

        class_property very_small_grassy_platform : Natural_Platform = new("very_small_grassy_platform", 
        "very_small_grassy_platform", 500, 500,
        SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 0, 25, 20)), true)

        @@very_small_grassy_platform = Natural_Platform.new("very_small_grassy_platform", 
        "very_small_grassy_platform", 500, 500, 
        SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 0, 10, 20)), true)
        PLATFORM_SPRITE_HASH["very_small_grassy_platform"] = SF::Sprite.new(BLANK_TEXTURE, 
        SF::Rect.new(0, 0, 10, 20))

        @@small_grassy_platform = Natural_Platform.new("small_grassy_platform", 
        "small_grassy_platform", 0, 0,
        SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 0, 25, 20)), true)
        PLATFORM_SPRITE_HASH["small_grassy_platform"] = SF::Sprite.new(BLANK_TEXTURE, 
        SF::Rect.new(0, 0, 25, 20))
    end
end