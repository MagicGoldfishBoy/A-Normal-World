require "crsfml"
require "../src/textures.cr"
require "../src/level_elements.cr"

module Decor include LevelElements
    class DecorMethods
        class_property decor_number : Int32 = 1
        def DecorMethods.spawn_decor(window)
            if LevelEditor::LevelEditorLogic.current_index >= LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY.size
                puts "Error: No decor available to spawn. Index was '#{LevelEditor::LevelEditorLogic.current_index}'"
                if LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY.empty?
                    puts "Decor array is empty."
                end
                return
            end
            current_decor = LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY[LevelEditor::LevelEditorLogic.current_index]
            name = "Decor_#{decor_number}"
            decor = LevelElements::DecorBase.new(
                name,
                current_decor.id,
                current_decor.x,
                current_decor.y,
                LevelElements::DecorBase::DECOR_SPRITE_HASH[current_decor.id].dup,
                current_decor.layer
            )
            decor.sprite.position = SF::Vector2f.new(decor.x, decor.y)
            LevelEditor::LevelEditorLogic.spawned_decor_array << decor
            LevelEditor::LevelDisplay.current_element = decor
            self.decor_number += 1
        end
        
        def DecorMethods.save_decor(json)
            decor = LevelEditor::LevelEditorLogic.spawned_decor_array
            decor.each do |decor|
                json.object do
                json.field "name", decor.name
                json.field "id", decor.id
                json.field "x", decor.x
                json.field "y", decor.y
                json.field "layer", decor.layer
                end
                end
        end
        def DecorMethods.load_decor(path, json_data, parsed)
            LevelEditor::LevelEditorLogic.spawned_decor_array.clear        
            decors_json = parsed["level"]?.try &.["decors"]?.try &.as_a? || [] of JSON::Any
          
            decors = decors_json.compact_map do |decor_json|
              name  = decor_json["name"]?.try(&.as_s?) || "unknown"
              id    = decor_json["id"]?.try(&.as_s?) || "missing_id"
              x     = decor_json["x"]?.try(&.as_f32?) || 0.0_f32
              y     = decor_json["y"]?.try(&.as_f32?) || 0.0_f32
              layer = decor_json["layer"]?.try(&.as_i?) || 0
          
              sprite = LevelElements::DecorBase::DECOR_SPRITE_HASH[id]?.try(&.dup)
              unless sprite
                puts "⚠️  Sprite not found for decor ID: #{id}, skipping."
                next
              end
          
              decor = LevelElements::DecorBase.new(name, id, x, y, sprite, layer)
              LevelEditor::LevelEditorLogic.spawned_decor_array << decor
              puts "✅ Loaded decor: #{name}, ID: #{id}, X: #{x}, Y: #{y}, Layer: #{layer}"
              decor
            end
          end
          
    end
    class DecorPlants < DecorBase
        @@fallen_leaves01 = DecorPlants.new("Red Fallen Leaves", "fallen_leaves01", 0, 0, 
        SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(0, 0, 20, 10)), 1)
        DECOR_SPRITE_HASH["fallen_leaves01"] = SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(0, 0, 20, 10))
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@fallen_leaves01

        @@fallen_leaves02 = DecorPlants.new("Orange Fallen Leaves", "fallen_leaves02", 0, 0,
        SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(20, 0, 20, 10)), 1)
        DECOR_SPRITE_HASH["fallen_leaves02"] = SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(20, 0, 20, 10))
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@fallen_leaves02

        @@fallen_leaves03 = DecorPlants.new("Yellow Fallen Leaves", "fallen_leaves03", 0, 0,
        SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(40, 0, 20, 10)), 1)
        DECOR_SPRITE_HASH["fallen_leaves03"] = SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(40, 0, 20, 10))
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@fallen_leaves03

        @@fallen_leaves04 = DecorPlants.new("Mixed Fallen Leaves", "fallen_leaves04", 0, 0,
        SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(60, 0, 30, 10)), 1)
        DECOR_SPRITE_HASH["fallen_leaves04"] = SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(60, 0, 30, 10))
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@fallen_leaves04

        @@single_daisy = DecorPlants.new("Single Daisy", "single_daisy", 0, 0,
        SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(0, 10, 10, 10)), 1)
        DECOR_SPRITE_HASH["single_daisy"] = SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(0, 10, 10, 10))
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@single_daisy

        @@double_daisy = DecorPlants.new("Double Daisy", "double_daisy", 0, 0,
        SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(10, 10, 10, 10)), 1)
        DECOR_SPRITE_HASH["double_daisy"] = SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(10, 10, 10, 10))
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@double_daisy

        @@dandelion = DecorPlants.new("Dandelion", "dandelion", 0, 0,
        SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(20, 10, 10, 10)), 1)
        DECOR_SPRITE_HASH["dandelion"] = SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(20, 10, 10, 10))
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@dandelion
    end
end