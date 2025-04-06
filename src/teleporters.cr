require "crsfml"
require "../src/textures.cr"
require "../src/level_elements.cr"

module Teleporters include LevelElements
    class TeleporterMethods
        class_property teleporter_number : Int32 = 1

        def TeleporterMethods.spawn_teleporter(window)
            if LevelEditor::LevelEditorLogic.current_index >= LevelElements::TeleportBase::TELEPORT_TEMPLATE_ARRAY.size
                puts "Error: No teleporter available to spawn. Index was '#{LevelEditor::LevelEditorLogic.current_index}'"
                if LevelElements::TeleportBase::TELEPORT_TEMPLATE_ARRAY.empty?
                    puts "Teleporter array is empty."
                end
                return
            end
            current_teleporter = LevelElements::TeleportBase::TELEPORT_TEMPLATE_ARRAY[LevelEditor::LevelEditorLogic.current_index]
            name = "Teleporter_#{teleporter_number}"
            teleporter = LevelElements::TeleportBase.new(
                name,
                current_teleporter.id,
                current_teleporter.x,
                current_teleporter.y,
                LevelElements::TeleportBase::TELEPORT_SPRITE_HASH[current_teleporter.id].dup,
                current_teleporter.destination,
                current_teleporter.requirement,
                current_teleporter.sound
            )
            teleporter.sprite.position = SF::Vector2f.new(teleporter.x, teleporter.y)
            LevelEditor::LevelEditorLogic.spawned_teleport_array << teleporter
            LevelEditor::LevelDisplay.current_element = teleporter
            self.teleporter_number += 1
        end

        def TeleporterMethods.save_teleporters(json)
            teleporters = LevelEditor::LevelEditorLogic.spawned_teleport_array
            teleporters.each do |teleporter|
                json.object do
                    json.field "name", teleporter.name
                    json.field "id", teleporter.id
                    json.field "x", teleporter.x
                    json.field "y", teleporter.y
                    json.field "destination", teleporter.destination
                    json.field "requirement", teleporter.requirement
                    json.field "sound", teleporter.sound
                end
            end
        end

        def TeleporterMethods.load_teleporters(path, json_data, parsed)
            LevelEditor::LevelEditorLogic.spawned_teleport_array.clear

            teleporters = parsed["level"]?.try &.["teleporters"]?.try &.as_a? || [] of JSON::Any

            teleporters.map do |teleporter_json|
                name  = teleporter_json["name"]?.try(&.as_s?) || "unknown"
                id    = teleporter_json["id"]?.try(&.as_s?) || "missing_id"
                x     = teleporter_json["x"]?.try(&.as_f32?) || 0.0_f32
                y     = teleporter_json["y"]?.try(&.as_f32?) || 0.0_f32
                destination = teleporter_json["destination"]?.try(&.as_s?) || "missing_destination"
                requirement = teleporter_json["requirement"]?.try(&.as_s?) || "missing_requirement"
                sound = teleporter_json["sound"]?.try(&.as_s?) || "missing_sound"
                sprite = LevelElements::TeleportBase::TELEPORT_SPRITE_HASH[id]?.try(&.dup) || next
                LevelEditor::LevelEditorLogic.spawned_teleport_array << LevelElements::TeleportBase.new(name, id, x, y, sprite, destination, 
                requirement, sound)
                puts "Loaded teleporter: #{name}, ID: #{id}, X: #{x}, Y: #{y}, Destination: #{destination}, Requirement: #{requirement}, Sound: #{sound}"
            end
        end
    end 
    class MapTeleporter < TeleportBase
        @@map_teleporter = MapTeleporter.new("Map Teleporter", "map_teleporter", 0, 0, 
        SF::Sprite.new(TELEPORTER_TEXTURE, SF::Rect.new(0, 0, 40, 100)), "map", "none", "teleport_sound")
        TELEPORT_SPRITE_HASH["map_teleporter"] = @@map_teleporter.sprite
        LevelElements::TeleportBase::TELEPORT_TEMPLATE_ARRAY << @@map_teleporter
    end
end