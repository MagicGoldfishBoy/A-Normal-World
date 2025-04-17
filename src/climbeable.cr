require "crsfml"
require "../src/textures.cr"
require "../src/level_elements.cr"

module Climbeable include LevelElements
    class ClimbeableMethods
        class_property climbeable_number : Int32 = 1

        def ClimbeableMethods.spawn_climbeable(window)
            if LevelEditor::LevelEditorLogic.current_index >= LevelElements::ClimbeableBase::CLIMBEABLE_TEMPLATE_ARRAY.size
                puts "Error: No climbeable available to spawn. Index was '#{LevelEditor::LevelEditorLogic.current_index}'"
                if LevelElements::ClimbeableBase::CLIMBEABLE_TEMPLATE_ARRAY.empty?
                    puts "Climbeable array is empty."
                end
                return
            end
            current_climbeable = LevelElements::ClimbeableBase::CLIMBEABLE_TEMPLATE_ARRAY[LevelEditor::LevelEditorLogic.current_index]
            name = "Climbeable_#{climbeable_number}"
            climbeable = LevelElements::ClimbeableBase.new(
                name,
                current_climbeable.id,
                current_climbeable.x,
                current_climbeable.y,
                LevelElements::ClimbeableBase::CLIMBEABLE_SPRITE_HASH[current_climbeable.id].dup,
            )
            climbeable.sprite.position = SF::Vector2f.new(climbeable.x, climbeable.y)
            LevelEditor::LevelEditorLogic.spawned_climbeable_array << climbeable
            LevelEditor::LevelDisplay.current_element = climbeable
            self.climbeable_number += 1
        end
        def ClimbeableMethods.save_climbeable(json)
            climbeable = LevelEditor::LevelEditorLogic.spawned_climbeable_array
            climbeable.each do |climbeable|
                json.object do
                    json.field "name", climbeable.name
                    json.field "id", climbeable.id
                    json.field "x", climbeable.x
                    json.field "y", climbeable.y
                end
            end
        end
        def ClimbeableMethods.load_climbeable(path, json_data, parsed)
            LevelEditor::LevelEditorLogic.spawned_climbeable_array.clear

            climbeables_json = parsed["level"]?.try &.["climbeables"]?.try &.as_a? || [] of JSON::Any

            climbeables = climbeables_json.compact_map do |climbeable_json|
                name  = climbeable_json["name"]?.try(&.as_s?) || "unknown"
                id    = climbeable_json["id"]?.try(&.as_s?) || "missing_id"
                x     = climbeable_json["x"]?.try(&.as_f32?) || 0.0_f32
                y     = climbeable_json["y"]?.try(&.as_f32?) || 0.0_f32

                sprite = LevelElements::ClimbeableBase::CLIMBEABLE_SPRITE_HASH[id]?.try(&.dup)
                unless sprite
                    puts "⚠️  Sprite not found for climbeable ID: #{id}, skipping."
                    next
                end
                climbeable = LevelElements::ClimbeableBase.new(name, id, x, y, sprite)
                LevelEditor::LevelEditorLogic.spawned_climbeable_array << climbeable
                puts "✅ Loaded climbeable: #{name}, ID: #{id}, X: #{x}, Y: #{y}"
                climbeable
            end
        end
    end
    class MetalLadder < ClimbeableBase

        @@very_short_steel_ladder = MetalLadder.new("Very Short Steel Ladder", "very_short_ladder_steel", 0, 0, SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(0, 0, 40, 40)))
        CLIMBEABLE_SPRITE_HASH["very_short_ladder_steel"] = SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(0, 0, 40, 40))
        LevelElements::ClimbeableBase::CLIMBEABLE_TEMPLATE_ARRAY << @@very_short_steel_ladder

        @@short_steel_ladder = MetalLadder.new("Short Steel Ladder", "short_ladder_steel", 0, 0, SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(0, 40, 40, 60)))
        CLIMBEABLE_SPRITE_HASH["short_ladder_steel"] = SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(0, 40, 40, 60))
        LevelElements::ClimbeableBase::CLIMBEABLE_TEMPLATE_ARRAY << @@short_steel_ladder

        @@steel_ladder = MetalLadder.new("Steel Ladder", "ladder_steel", 0, 0, SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(0, 100, 40, 80)))
        CLIMBEABLE_SPRITE_HASH["ladder_steel"] = SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(0, 100, 40, 80))
        LevelElements::ClimbeableBase::CLIMBEABLE_TEMPLATE_ARRAY << @@steel_ladder

        @@tall_steel_ladder = MetalLadder.new("Tall Steel Ladder", "tall_ladder_steel", 0, 0, SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(0, 180, 40, 100)))
        CLIMBEABLE_SPRITE_HASH["tall_ladder_steel"] = SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(0, 180, 40, 100))
        LevelElements::ClimbeableBase::CLIMBEABLE_TEMPLATE_ARRAY << @@tall_steel_ladder

        @@very_tall_steel_ladder = MetalLadder.new("Very Tall Steel Ladder", "very_tall_ladder_steel", 0, 0, SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(0, 280, 40, 120)))
        CLIMBEABLE_SPRITE_HASH["very_tall_ladder_steel"] = SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(0, 280, 40, 120))
        LevelElements::ClimbeableBase::CLIMBEABLE_TEMPLATE_ARRAY << @@very_tall_steel_ladder

        @@extremely_tall_steel_ladder = MetalLadder.new("Extremely Tall Steel Ladder", "extremely_tall_ladder_steel", 0, 0, SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(0, 400, 40, 140)))
        CLIMBEABLE_SPRITE_HASH["extremely_tall_ladder_steel"] = SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(0, 400, 40, 140))
        LevelElements::ClimbeableBase::CLIMBEABLE_TEMPLATE_ARRAY << @@extremely_tall_steel_ladder


        @@very_short_rusty_ladder = MetalLadder.new("Very Short Rusty Ladder", "very_short_ladder_rusty", 0, 0, SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(40, 0, 40, 40)))
        CLIMBEABLE_SPRITE_HASH["very_short_ladder_rusty"] = SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(40, 0, 40, 40))
        LevelElements::ClimbeableBase::CLIMBEABLE_TEMPLATE_ARRAY << @@very_short_rusty_ladder

        @@short_rusty_ladder = MetalLadder.new("Short Rusty Ladder", "short_ladder_rusty", 0, 0, SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(40, 40, 40, 60)))
        CLIMBEABLE_SPRITE_HASH["short_ladder_rusty"] = SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(40, 40, 40, 60))
        LevelElements::ClimbeableBase::CLIMBEABLE_TEMPLATE_ARRAY << @@short_rusty_ladder

        @@rusty_ladder = MetalLadder.new("Rusty Ladder", "ladder_rusty", 0, 0, SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(40, 100, 40, 80)))
        CLIMBEABLE_SPRITE_HASH["ladder_rusty"] = SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(40, 100, 40, 80))
        LevelElements::ClimbeableBase::CLIMBEABLE_TEMPLATE_ARRAY << @@rusty_ladder

        @@tall_rusty_ladder = MetalLadder.new("Tall Rusty Ladder", "tall_ladder_rusty", 0, 0, SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(40, 180, 40, 100)))
        CLIMBEABLE_SPRITE_HASH["tall_ladder_rusty"] = SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(40, 180, 40, 100))
        LevelElements::ClimbeableBase::CLIMBEABLE_TEMPLATE_ARRAY << @@tall_rusty_ladder

        @@very_tall_rusty_ladder = MetalLadder.new("Very Tall Rusty Ladder", "very_tall_ladder_rusty", 0, 0, SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(40, 280, 40, 120)))
        CLIMBEABLE_SPRITE_HASH["very_tall_ladder_rusty"] = SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(40, 280, 40, 120))
        LevelElements::ClimbeableBase::CLIMBEABLE_TEMPLATE_ARRAY << @@very_tall_rusty_ladder

        @@extremely_tall_rusty_ladder = MetalLadder.new("Extremely Tall Rusty Ladder", "extremely_tall_ladder_rusty", 0, 0, SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(40, 400, 40, 140)))
        CLIMBEABLE_SPRITE_HASH["extremely_tall_ladder_rusty"] = SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(40, 400, 40, 140))
        LevelElements::ClimbeableBase::CLIMBEABLE_TEMPLATE_ARRAY << @@extremely_tall_rusty_ladder
    end
end