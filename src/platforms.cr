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
        SF::Sprite.new(PLATFORM_TEXTURE, SF::Rect.new(0, 0, 10, 20)), true)
        PLATFORM_SPRITE_HASH["very_small_grassy_platform"] = SF::Sprite.new(PLATFORM_TEXTURE, 
        SF::Rect.new(0, 0, 10, 20))
        LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY << @@very_small_grassy_platform

        @@small_grassy_platform = Natural_Platform.new("small_grassy_platform", 
        "small_grassy_platform", 0, 0,
        SF::Sprite.new(PLATFORM_TEXTURE, SF::Rect.new(0, 0, 25, 20)), true)
        PLATFORM_SPRITE_HASH["small_grassy_platform"] = SF::Sprite.new(PLATFORM_TEXTURE, 
        SF::Rect.new(0, 0, 25, 20))
        LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY << @@small_grassy_platform

        @@medium_grassy_platform = Natural_Platform.new("medium_grassy_platform",
        "medium_grassy_platform", 0, 0,
        SF::Sprite.new(PLATFORM_TEXTURE, SF::Rect.new(0, 0, 50, 20)), true)
        PLATFORM_SPRITE_HASH["medium_grassy_platform"] = SF::Sprite.new(PLATFORM_TEXTURE,
        SF::Rect.new(0, 0, 50, 20))
        LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY << @@medium_grassy_platform

        @@large_grassy_platform = Natural_Platform.new("large_grassy_platform",
        "large_grassy_platform", 0, 0,
        SF::Sprite.new(PLATFORM_TEXTURE, SF::Rect.new(0, 0, 100, 20)), true)
        PLATFORM_SPRITE_HASH["large_grassy_platform"] = SF::Sprite.new(PLATFORM_TEXTURE,
        SF::Rect.new(0, 0, 100, 20))
        LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY << @@large_grassy_platform

        @@very_large_grassy_platform = Natural_Platform.new("very_large_grassy_platform",
        "very_large_grassy_platform", 0, 0,
        SF::Sprite.new(PLATFORM_TEXTURE, SF::Rect.new(0, 0, 200, 20)), true)
        PLATFORM_SPRITE_HASH["very_large_grassy_platform"] = SF::Sprite.new(PLATFORM_TEXTURE,
        SF::Rect.new(0, 0, 200, 20))
        LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY << @@very_large_grassy_platform

        @@huge_grassy_platform = Natural_Platform.new("huge_grassy_platform",
        "huge_grassy_platform", 0, 0,
        SF::Sprite.new(PLATFORM_TEXTURE, SF::Rect.new(0, 0, 300, 20)), true)
        PLATFORM_SPRITE_HASH["huge_grassy_platform"] = SF::Sprite.new(PLATFORM_TEXTURE,
        SF::Rect.new(0, 0, 300, 20))
        LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY << @@huge_grassy_platform

        @@giant_grassy_platform = Natural_Platform.new("giant_grassy_platform",
        "giant_grassy_platform", 0, 0,
        SF::Sprite.new(PLATFORM_TEXTURE, SF::Rect.new(0, 0, 400, 20)), true)
        PLATFORM_SPRITE_HASH["giant_grassy_platform"] = SF::Sprite.new(PLATFORM_TEXTURE,
        SF::Rect.new(0, 0, 400, 20))
        LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY << @@giant_grassy_platform

        @@colossal_grassy_platform = Natural_Platform.new("colossal_grassy_platform",
        "colossal_grassy_platform", 0, 0,
        SF::Sprite.new(PLATFORM_TEXTURE, SF::Rect.new(0, 0, 500, 20)), true)
        PLATFORM_SPRITE_HASH["colossal_grassy_platform"] = SF::Sprite.new(PLATFORM_TEXTURE,
        SF::Rect.new(0, 0, 500, 20))
        LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY << @@colossal_grassy_platform


        @@very_small_dirt_platform = Natural_Platform.new("very_small_dirt_platform",
        "very_small_dirt_platform", 0, 0,
        SF::Sprite.new(PLATFORM_TEXTURE, SF::Rect.new(0, 20, 25, 20)), true)
        PLATFORM_SPRITE_HASH["very_small_dirt_platform"] = SF::Sprite.new(PLATFORM_TEXTURE,
        SF::Rect.new(0, 20, 25, 20))
        LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY << @@very_small_dirt_platform

        @@small_dirt_platform = Natural_Platform.new("small_dirt_platform",
        "small_dirt_platform", 0, 0,
        SF::Sprite.new(PLATFORM_TEXTURE, SF::Rect.new(0, 20, 25, 20)), true)
        PLATFORM_SPRITE_HASH["small_dirt_platform"] = SF::Sprite.new(PLATFORM_TEXTURE,
        SF::Rect.new(0, 20, 25, 20))
        LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY << @@small_dirt_platform

        @@medium_dirt_platform = Natural_Platform.new("medium_dirt_platform",
        "medium_dirt_platform", 0, 0,
        SF::Sprite.new(PLATFORM_TEXTURE, SF::Rect.new(0, 20, 50, 20)), true)
        PLATFORM_SPRITE_HASH["medium_dirt_platform"] = SF::Sprite.new(PLATFORM_TEXTURE,
        SF::Rect.new(0, 20, 50, 20))
        LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY << @@medium_dirt_platform

        @@large_dirt_platform = Natural_Platform.new("large_dirt_platform",
        "large_dirt_platform", 0, 0,
        SF::Sprite.new(PLATFORM_TEXTURE, SF::Rect.new(0, 20, 100, 20)), true)
        PLATFORM_SPRITE_HASH["large_dirt_platform"] = SF::Sprite.new(PLATFORM_TEXTURE,
        SF::Rect.new(0, 20, 100, 20))
        LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY << @@large_dirt_platform

        @@very_large_dirt_platform = Natural_Platform.new("very_large_dirt_platform",
        "very_large_dirt_platform", 0, 0,
        SF::Sprite.new(PLATFORM_TEXTURE, SF::Rect.new(0, 20, 200, 20)), true)
        PLATFORM_SPRITE_HASH["very_large_dirt_platform"] = SF::Sprite.new(PLATFORM_TEXTURE,
        SF::Rect.new(0, 20, 200, 20))
        LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY << @@very_large_dirt_platform

        @@huge_dirt_platform = Natural_Platform.new("huge_dirt_platform",
        "huge_dirt_platform", 0, 0,
        SF::Sprite.new(PLATFORM_TEXTURE, SF::Rect.new(0, 20, 300, 20)), true)
        PLATFORM_SPRITE_HASH["huge_dirt_platform"] = SF::Sprite.new(PLATFORM_TEXTURE,
        SF::Rect.new(0, 20, 300, 20))
        LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY << @@huge_dirt_platform

        @@giant_dirt_platform = Natural_Platform.new("giant_dirt_platform",
        "giant_dirt_platform", 0, 0,
        SF::Sprite.new(PLATFORM_TEXTURE, SF::Rect.new(0, 20, 400, 20)), true)
        PLATFORM_SPRITE_HASH["giant_dirt_platform"] = SF::Sprite.new(PLATFORM_TEXTURE,
        SF::Rect.new(0, 20, 400, 20))
        LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY << @@giant_dirt_platform

        @@colossal_dirt_platform = Natural_Platform.new("colossal_dirt_platform",
        "colossal_dirt_platform", 0, 0,
        SF::Sprite.new(PLATFORM_TEXTURE, SF::Rect.new(0, 20, 500, 20)), true)
        PLATFORM_SPRITE_HASH["colossal_dirt_platform"] = SF::Sprite.new(PLATFORM_TEXTURE,
        SF::Rect.new(0, 20, 500, 20))
        LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY << @@colossal_dirt_platform
    end
end