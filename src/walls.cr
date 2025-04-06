require "crsfml"
require "../src/textures.cr"
require "../src/level_elements.cr"

module Walls include LevelElements
    class WallsMethods
        class_property wall_number : Int32 = 1

        def WallsMethods.spawn_wall(window)
            if LevelEditor::LevelEditorLogic.current_index >= LevelElements::WallBase::WALL_TEMPLATE_ARRAY.size
                puts "Error: No wall available to spawn. Index was '#{LevelEditor::LevelEditorLogic.current_index}'"
                if LevelElements::WallBase::WALL_TEMPLATE_ARRAY.empty?
                    puts "Wall array is empty."
                end
                return
            end
            current_wall = LevelElements::WallBase::WALL_TEMPLATE_ARRAY[LevelEditor::LevelEditorLogic.current_index]
            name = "Wall_#{wall_number}"
            wall = LevelElements::WallBase.new(
                name,
                current_wall.id,
                current_wall.x,
                current_wall.y,
                LevelElements::WallBase::WALL_SPRITE_HASH[current_wall.id].dup,
            )
            wall.sprite.position = SF::Vector2f.new(wall.x, wall.y)
            LevelEditor::LevelEditorLogic.spawned_wall_array << wall
            LevelEditor::LevelDisplay.current_element = wall
            self.wall_number += 1
        end
        def WallsMethods.save_wall(json)
            wall = LevelEditor::LevelEditorLogic.spawned_wall_array
            wall.each do |wall|
                json.object do
                json.field "name", wall.name
                json.field "id", wall.id
                json.field "x", wall.x
                json.field "y", wall.y
                end
            end
        end
        def WallsMethods.load_wall(path, json_data, parsed)
            LevelEditor::LevelEditorLogic.spawned_wall_array.clear
          
            walls = parsed["level"]?.try &.["walls"]?.try &.as_a? || [] of JSON::Any
          
            wall = walls.map do |wall_json|
              name  = wall_json["name"]?.try(&.as_s?) || "unknown"
              id    = wall_json["id"]?.try(&.as_s?) || "missing_id"
              x     = wall_json["x"]?.try(&.as_f32?) || 0.0_f32
              y     = wall_json["y"]?.try(&.as_f32?) || 0.0_f32
          
              sprite = LevelElements::WallBase::WALL_SPRITE_HASH[id]?.try(&.dup) || next
          
              LevelEditor::LevelEditorLogic.spawned_wall_array << LevelElements::WallBase.new(name, id, x, y, sprite)
              puts "Loaded wall: #{name}, ID: #{id}, X: #{x}, Y: #{y}"
            end
        end
    end
    class StoneWalls < WallBase
        @@short_stone_wall = StoneWalls.new("Short Stone Wall", "short_stone_wall", 0, 0, 
        SF::Sprite.new(WALL_TEXTURE, SF::Rect.new(0, 0, 10, 20)))
        WALL_SPRITE_HASH["short_stone_wall"] = @@short_stone_wall.sprite
        LevelElements::WallBase::WALL_TEMPLATE_ARRAY << @@short_stone_wall

        @@stone_wall = StoneWalls.new("Stone Wall", "stone_wall", 0, 0,
        SF::Sprite.new(WALL_TEXTURE, SF::Rect.new(0, 20, 10, 30)))
        WALL_SPRITE_HASH["stone_wall"] = @@stone_wall.sprite
        LevelElements::WallBase::WALL_TEMPLATE_ARRAY << @@stone_wall

        @@tall_stone_wall = StoneWalls.new("Tall Stone Wall", "tall_stone_wall", 0, 0,
        SF::Sprite.new(WALL_TEXTURE, SF::Rect.new(0, 50, 10, 40)))
        WALL_SPRITE_HASH["tall_stone_wall"] = @@tall_stone_wall.sprite
        LevelElements::WallBase::WALL_TEMPLATE_ARRAY << @@tall_stone_wall
    end
end