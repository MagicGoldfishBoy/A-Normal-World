require "crsfml"
require "../src/textures.cr"
require "../src/level_elements.cr"

module Platforms include LevelElements
    class PlatformMethods
        class_property platform_number : Int32 = 1
        def PlatformMethods.spawn_platform(window)
            if LevelEditor::LevelEditorLogic.current_index >= LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY.size
                puts "Error: No platform available to spawn. Index was '#{LevelEditor::LevelEditorLogic.current_index}'"
                if LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY.empty?
                    puts "Platform array is empty."
                end
                return
            end
            current_platform = LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY[LevelEditor::LevelEditorLogic.current_index]
            name = "Platform_#{platform_number}"
            platform = LevelElements::PlatformBase.new(
                name,
                current_platform.id,
                current_platform.x,
                current_platform.y,
                LevelElements::PlatformBase::PLATFORM_SPRITE_HASH[current_platform.id].dup,
                current_platform.can_jump_down
            )
            platform.sprite.position = SF::Vector2f.new(platform.x, platform.y)
            LevelElements::PlatformBase.current_platform_array << platform
            LevelEditor::LevelEditorLogic.spawned_platform_array << platform
            LevelEditor::LevelDisplay.current_element = platform
            self.platform_number += 1
        end
        def PlatformMethods.save_platforms(json)
            platforms = LevelEditor::LevelEditorLogic.spawned_platform_array
            platforms.each do |platform|
                json.object do
                json.field "name", platform.name
                json.field "id", platform.id
                json.field "x", platform.x
                json.field "y", platform.y
                json.field "can_jump_down", platform.can_jump_down
                end
                end
        end
        def PlatformMethods.load_platforms(path, json_data, parsed)
            LevelEditor::LevelEditorLogic.spawned_platform_array.clear
          
            # Safely get the "platforms" array or return empty array
            platforms_json = parsed["level"]?.try &.["platforms"]?.try &.as_a? || [] of JSON::Any
          
            platforms = platforms_json.map do |platform_json|
              name          = platform_json["name"]?.try(&.as_s?) || "unknown"
              id            = platform_json["id"]?.try(&.as_s?) || "missing_id"
              x             = platform_json["x"]?.try(&.as_f32?) || 0.0_f32
              y             = platform_json["y"]?.try(&.as_f32?) || 0.0_f32
              can_jump_down = platform_json["can_jump_down"]?.try(&.as_bool?) || false
          
              # If sprite is missing from hash, skip this platform
              sprite = LevelElements::PlatformBase::PLATFORM_SPRITE_HASH[id]?.try(&.dup) || next
          
              LevelEditor::LevelEditorLogic.spawned_platform_array << LevelElements::PlatformBase.new(name, id, x, y, sprite, can_jump_down)
              puts "Loaded platform: #{name}, ID: #{id}, X: #{x}, Y: #{y}, Can Jump Down: #{can_jump_down}"
            end
          
            Platforms::PlatformMethods.platform_number = LevelEditor::LevelEditorLogic.spawned_platform_array.size
          
            platforms
          end
          
    end
    class Natural_Platform < PlatformBase

        class_property very_small_grassy_platform : Natural_Platform = new("very_small_grassy_platform", 
        "very_small_grassy_platform", 0, 0,
        SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(0, 0, 25, 20)), true)

        @@very_small_grassy_platform = Natural_Platform.new("very_small_grassy_platform", 
        "very_small_grassy_platform", 0, 0, 
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