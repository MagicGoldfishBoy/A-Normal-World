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
    class Ladders < ClimbeableBase
        @@short_steel_ladder = Ladders.new("Short Steel Ladder", "short_ladder_steel", 0, 0, SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(0, 0, 40, 40)))
        CLIMBEABLE_SPRITE_HASH["short_ladder_steel"] = SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(0, 0, 40, 40))
        LevelElements::ClimbeableBase::CLIMBEABLE_TEMPLATE_ARRAY << @@short_steel_ladder


        @@short_rusty_ladder = Ladders.new("Short Rusty Ladder", "short_ladder_rusty", 0, 0, SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(40, 0, 40, 40)))
        CLIMBEABLE_SPRITE_HASH["short_ladder_rusty"] = SF::Sprite.new(INDUSTRIAL_CLIMBEABLE_TEXTURE, SF::Rect.new(40, 0, 40, 40))
        LevelElements::ClimbeableBase::CLIMBEABLE_TEMPLATE_ARRAY << @@short_rusty_ladder

        @@rusty_ladder = Ladders.new("Rusty Ladder", "ladder_rusty", 0, 0, SF::Sprite.new(LADDER_TEXTURE, SF::Rect.new(0, 20, 20, 30)))
        CLIMBEABLE_SPRITE_HASH["ladder_rusty"] = SF::Sprite.new(LADDER_TEXTURE, SF::Rect.new(0, 20, 20, 30))
        LevelElements::ClimbeableBase::CLIMBEABLE_TEMPLATE_ARRAY << @@rusty_ladder

        @@tall_rusty_ladder = Ladders.new("Tall Rusty Ladder", "tall_ladder_rusty", 0, 0, SF::Sprite.new(LADDER_TEXTURE, SF::Rect.new(0, 50, 20, 50)))
        CLIMBEABLE_SPRITE_HASH["tall_ladder_rusty"] = SF::Sprite.new(LADDER_TEXTURE, SF::Rect.new(0, 50, 20, 50))
        LevelElements::ClimbeableBase::CLIMBEABLE_TEMPLATE_ARRAY << @@tall_rusty_ladder

        @@very_tall_rusty_ladder = Ladders.new("Very Tall Rusty Ladder", "very_tall_ladder_rusty", 0, 0, SF::Sprite.new(LADDER_TEXTURE, SF::Rect.new(0, 100, 20, 70)))
        CLIMBEABLE_SPRITE_HASH["very_tall_ladder_rusty"] = SF::Sprite.new(LADDER_TEXTURE, SF::Rect.new(0, 100, 20, 70))
        LevelElements::ClimbeableBase::CLIMBEABLE_TEMPLATE_ARRAY << @@very_tall_rusty_ladder

        @@extremely_tall_rusty_ladder = Ladders.new("Extremely Tall Rusty Ladder", "extremely_tall_ladder_rusty", 0, 0, SF::Sprite.new(LADDER_TEXTURE, SF::Rect.new(0, 170, 20, 100)))
        CLIMBEABLE_SPRITE_HASH["extremely_tall_ladder_rusty"] = SF::Sprite.new(LADDER_TEXTURE, SF::Rect.new(0, 170, 20, 100))
        LevelElements::ClimbeableBase::CLIMBEABLE_TEMPLATE_ARRAY << @@extremely_tall_rusty_ladder
    end
end