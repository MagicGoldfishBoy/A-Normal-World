require "crsfml"
require "../src/textures.cr"
require "../src/level_elements.cr"

module Walls include LevelElements
    class WallBase < LevelElementBase
        WALL_TEMPLATE_ARRAY = [] of WallBase
        WALL_SPRITE_HASH = Hash(String, SF::Sprite).new
        def initialize(name : String, id : String, x : Float32, y : Float32, sprite : SF::Sprite)
            @name = name
            @id = id
            @x = x
            @y = y
            @sprite = sprite
        end

        property name : String
        property id : String
        property x : Float32
        property y : Float32
        property sprite : SF::Sprite

        def open_menu(window)
            puts "⛔ Walls don't have a menu"
        end
    end
    class WallsMethods
        class_property wall_number : Int32 = 1

        def WallsMethods.spawn_wall(window)
            if LevelEditor::LevelEditorLogic.current_index >= Walls::WallBase::WALL_TEMPLATE_ARRAY.size
                puts "Error: No wall available to spawn. Index was '#{LevelEditor::LevelEditorLogic.current_index}'"
                if Walls::WallBase::WALL_TEMPLATE_ARRAY.empty?
                    puts "Wall array is empty."
                end
                return
            end
            current_wall = Walls::WallBase::WALL_TEMPLATE_ARRAY[LevelEditor::LevelEditorLogic.current_index]
            name = "Wall_#{wall_number}"
            wall = Walls::WallBase.new(
                name,
                current_wall.id,
                current_wall.x,
                current_wall.y,
                Walls::WallBase::WALL_SPRITE_HASH[current_wall.id].dup,
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
          
            walls_json = parsed["level"]?.try &.["walls"]?.try &.as_a? || [] of JSON::Any
          
            walls = walls_json.compact_map do |wall_json|
              name  = wall_json["name"]?.try(&.as_s?) || "unknown"
              id    = wall_json["id"]?.try(&.as_s?) || "missing_id"
              x     = wall_json["x"]?.try(&.as_f32?) || 0.0_f32
              y     = wall_json["y"]?.try(&.as_f32?) || 0.0_f32
          
              sprite = Walls::WallBase::WALL_SPRITE_HASH[id]?.try(&.dup)
              unless sprite
                puts "⚠️  Sprite not found for wall ID: #{id}, skipping."
                next
              end
              wall = Walls::WallBase.new(name, id, x, y, sprite)
              LevelEditor::LevelEditorLogic.spawned_wall_array << wall
              puts "✅ Loaded wall: #{name}, ID: #{id}, X: #{x}, Y: #{y}"
              wall
            end
        end
    end
    class StoneWalls < WallBase
        @@short_stone_wall = StoneWalls.new("Short Stone Wall", "short_stone_wall", 0, 0, 
        SF::Sprite.new(STONE_WALL_TEXTURE_01, SF::Rect.new(10, 0, 20, 110)))
        WALL_SPRITE_HASH["short_stone_wall"] = @@short_stone_wall.sprite
        Walls::WallBase::WALL_TEMPLATE_ARRAY << @@short_stone_wall

        @@stone_wall = StoneWalls.new("Stone Wall", "stone_wall", 0, 0,
        SF::Sprite.new(STONE_WALL_TEXTURE_01, SF::Rect.new(10, 110, 20, 160)))
        WALL_SPRITE_HASH["stone_wall"] = @@stone_wall.sprite
        Walls::WallBase::WALL_TEMPLATE_ARRAY << @@stone_wall

        @@tall_stone_wall = StoneWalls.new("Tall Stone Wall", "tall_stone_wall", 0, 0,
        SF::Sprite.new(STONE_WALL_TEXTURE_01, SF::Rect.new(10, 270, 20, 230)))
        WALL_SPRITE_HASH["tall_stone_wall"] = @@tall_stone_wall.sprite
        Walls::WallBase::WALL_TEMPLATE_ARRAY << @@tall_stone_wall


        @@short_dirty_stone_wall = StoneWalls.new("Short Dirty Stone Wall", "short_dirty_stone_wall", 0, 0,
        SF::Sprite.new(STONE_WALL_TEXTURE_01, SF::Rect.new(50, 0, 20, 110)))
        WALL_SPRITE_HASH[@@short_dirty_stone_wall.id] = @@short_dirty_stone_wall.sprite
        Walls::WallBase::WALL_TEMPLATE_ARRAY << @@short_dirty_stone_wall

        @@dirty_stone_wall = StoneWalls.new("Dirty Stone Wall", "dirty_stone_wall", 0, 0,
        SF::Sprite.new(STONE_WALL_TEXTURE_01, SF::Rect.new(50, 110, 20, 160)))
        WALL_SPRITE_HASH[@@dirty_stone_wall.id] = @@dirty_stone_wall.sprite
        Walls::WallBase::WALL_TEMPLATE_ARRAY << @@dirty_stone_wall

        @@tall_dirty_stone_wall = StoneWalls.new("Tall Dirty Stone Wall", "tall_dirty_stone_wall", 0, 0,
        SF::Sprite.new(STONE_WALL_TEXTURE_01, SF::Rect.new(50, 270, 20, 230)))
        WALL_SPRITE_HASH[@@tall_dirty_stone_wall.id] = @@tall_dirty_stone_wall.sprite
        Walls::WallBase::WALL_TEMPLATE_ARRAY << @@tall_dirty_stone_wall


        @@short_concrete_wall = StoneWalls.new("Short Concrete Wall", "short_concrete_wall", 0, 0,
        SF::Sprite.new(STONE_WALL_TEXTURE_01, SF::Rect.new(30, 0, 20, 110)))
        WALL_SPRITE_HASH[@@short_concrete_wall.id] = @@short_concrete_wall.sprite
        Walls::WallBase::WALL_TEMPLATE_ARRAY << @@short_concrete_wall

        @@concrete_wall = StoneWalls.new("Concrete Wall", "concrete_wall", 0, 0,
        SF::Sprite.new(STONE_WALL_TEXTURE_01, SF::Rect.new(30, 110, 20, 160)))
        WALL_SPRITE_HASH[@@concrete_wall.id] = @@short_concrete_wall.sprite
        Walls::WallBase::WALL_TEMPLATE_ARRAY << @@concrete_wall

        @@tall_concrete_wall = StoneWalls.new("Tall Concrete Wall", "tall_concrete_wall", 0, 0,
        SF::Sprite.new(STONE_WALL_TEXTURE_01, SF::Rect.new(30, 270, 20, 230)))
        WALL_SPRITE_HASH[@@tall_concrete_wall.id] = @@tall_concrete_wall.sprite
        Walls::WallBase::WALL_TEMPLATE_ARRAY << @@tall_concrete_wall
    end
end