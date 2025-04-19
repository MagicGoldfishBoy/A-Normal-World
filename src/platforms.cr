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
            platforms_json = parsed["level"]?.try &.["platforms"]?.try &.as_a? || [] of JSON::Any
            platforms = platforms_json.compact_map do |platform_json|
                name          = platform_json["name"]?.try(&.as_s?) || "unknown"
                id            = platform_json["id"]?.try(&.as_s?) || "missing_id"
                x             = platform_json["x"]?.try(&.as_f32?) || 0.0_f32
                y             = platform_json["y"]?.try(&.as_f32?) || 0.0_f32
                can_jump_down = platform_json["can_jump_down"]?.try(&.as_bool?) || false
              
                sprite = LevelElements::PlatformBase::PLATFORM_SPRITE_HASH[id]?.try(&.dup)
                unless sprite
                  puts "⚠️  Sprite not found for platform ID: #{id}, skipping."
                  next
                end
              
                platform = LevelElements::PlatformBase.new(name, id, x, y, sprite, can_jump_down)
                LevelEditor::LevelEditorLogic.spawned_platform_array << platform
                puts "✅ Loaded platform: #{name}, ID: #{id}, X: #{x}, Y: #{y}, Can Jump Down: #{can_jump_down}"
                platform
              end
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
        SF::Sprite.new(DIRT_PLATFORM_TEXTURE, SF::Rect.new(0, 0, 20, 60)), true)
        PLATFORM_SPRITE_HASH["very_small_dirt_platform"] = SF::Sprite.new(DIRT_PLATFORM_TEXTURE,
        SF::Rect.new(0, 0, 20, 60))
        LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY << @@very_small_dirt_platform

        @@small_dirt_platform = Natural_Platform.new("small_dirt_platform",
        "small_dirt_platform", 0, 0,
        SF::Sprite.new(DIRT_PLATFORM_TEXTURE, SF::Rect.new(20, 0, 40, 60)), true)
        PLATFORM_SPRITE_HASH["small_dirt_platform"] = SF::Sprite.new(DIRT_PLATFORM_TEXTURE,
        SF::Rect.new(20, 0, 40, 60))
        LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY << @@small_dirt_platform

        @@medium_dirt_platform = Natural_Platform.new("medium_dirt_platform",
        "medium_dirt_platform", 0, 0,
        SF::Sprite.new(DIRT_PLATFORM_TEXTURE, SF::Rect.new(60, 0, 60, 60)), true)
        PLATFORM_SPRITE_HASH["medium_dirt_platform"] = SF::Sprite.new(DIRT_PLATFORM_TEXTURE,
        SF::Rect.new(60, 0, 60, 60))
        LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY << @@medium_dirt_platform

        @@large_dirt_platform = Natural_Platform.new("large_dirt_platform",
        "large_dirt_platform", 0, 0,
        SF::Sprite.new(DIRT_PLATFORM_TEXTURE, SF::Rect.new(120, 0, 80, 60)), true)
        PLATFORM_SPRITE_HASH["large_dirt_platform"] = SF::Sprite.new(DIRT_PLATFORM_TEXTURE,
        SF::Rect.new(120, 0, 80, 60))
        LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY << @@large_dirt_platform

        @@very_large_dirt_platform = Natural_Platform.new("very_large_dirt_platform",
        "very_large_dirt_platform", 0, 0,
        SF::Sprite.new(DIRT_PLATFORM_TEXTURE, SF::Rect.new(200, 0, 100, 60)), true)
        PLATFORM_SPRITE_HASH["very_large_dirt_platform"] = SF::Sprite.new(DIRT_PLATFORM_TEXTURE,
        SF::Rect.new(200, 0, 100, 60))
        LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY << @@very_large_dirt_platform

        @@huge_dirt_platform = Natural_Platform.new("huge_dirt_platform",
        "huge_dirt_platform", 0, 0,
        SF::Sprite.new(DIRT_PLATFORM_TEXTURE, SF::Rect.new(300, 0, 200, 60)), true)
        PLATFORM_SPRITE_HASH["huge_dirt_platform"] = SF::Sprite.new(DIRT_PLATFORM_TEXTURE,
        SF::Rect.new(300, 0, 200, 60))
        LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY << @@huge_dirt_platform

        @@giant_dirt_platform = Natural_Platform.new("giant_dirt_platform",
        "giant_dirt_platform", 0, 0,
        SF::Sprite.new(DIRT_PLATFORM_TEXTURE, SF::Rect.new(0, 60, 300, 60)), true)
        PLATFORM_SPRITE_HASH["giant_dirt_platform"] = SF::Sprite.new(DIRT_PLATFORM_TEXTURE,
        SF::Rect.new(0, 60, 300, 60))
        LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY << @@giant_dirt_platform

        @@colossal_dirt_platform = Natural_Platform.new("colossal_dirt_platform",
        "colossal_dirt_platform", 0, 0,
        SF::Sprite.new(DIRT_PLATFORM_TEXTURE, SF::Rect.new(0, 120, 500, 60)), true)
        PLATFORM_SPRITE_HASH["colossal_dirt_platform"] = SF::Sprite.new(DIRT_PLATFORM_TEXTURE,
        SF::Rect.new(0, 120, 500, 60))
        LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY << @@colossal_dirt_platform

        @@dirt_ground = Natural_Platform.new("dirt_ground", "dirt_ground", 0, 0, 
        SF::Sprite.new(DIRT_PLATFORM_TEXTURE, SF::Rect.new(0, 340, 500, 160)), false)
        PLATFORM_SPRITE_HASH["dirt_ground"] = SF::Sprite.new(DIRT_PLATFORM_TEXTURE,
        SF::Rect.new(0, 340, 500, 160))
        LevelElements::PlatformBase::PLATFORM_TEMPLATE_ARRAY << @@dirt_ground
    end
end