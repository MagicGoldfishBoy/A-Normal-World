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

            climbeables = parsed["level"]?.try &.["climbeables"]?.try &.as_a? || [] of JSON::Any

            climbeable = climbeables.map do |climbeable_json|
                name  = climbeable_json["name"]?.try(&.as_s?) || "unknown"
                id    = climbeable_json["id"]?.try(&.as_s?) || "missing_id"
                x     = climbeable_json["x"]?.try(&.as_f32?) || 0.0_f32
                y     = climbeable_json["y"]?.try(&.as_f32?) || 0.0_f32

                sprite = LevelElements::ClimbeableBase::CLIMBEABLE_SPRITE_HASH[id]?.try(&.dup) || next

                LevelEditor::LevelEditorLogic.spawned_climbeable_array << LevelElements::ClimbeableBase.new(name, id, x, y, sprite)
                puts "Loaded climbeable: #{name}, ID: #{id}, X: #{x}, Y: #{y}"
            end
        end
    end
    class Ladders < ClimbeableBase
        @@short_rusty_ladder = Ladders.new("Rusty Ladder", "short_ladder_rusty", 0, 0, SF::Sprite.new(LADDER_TEXTURE, SF::Rect.new(0, 0, 20, 20)))
        CLIMBEABLE_SPRITE_HASH["short_ladder_rusty"] = SF::Sprite.new(LADDER_TEXTURE, SF::Rect.new(0, 0, 20, 20))
        LevelElements::ClimbeableBase::CLIMBEABLE_TEMPLATE_ARRAY << @@short_rusty_ladder
    end
end