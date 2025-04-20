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
    class DecorPlant < DecorBase
        @@fallen_leaves01 = DecorPlant.new("Red Fallen Leaves", "fallen_leaves01", 0, 0, 
        SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(0, 0, 20, 10)), 1)
        DECOR_SPRITE_HASH["fallen_leaves01"] = SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(0, 0, 20, 10))
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@fallen_leaves01

        @@fallen_leaves02 = DecorPlant.new("Orange Fallen Leaves", "fallen_leaves02", 0, 0,
        SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(20, 0, 20, 10)), 1)
        DECOR_SPRITE_HASH["fallen_leaves02"] = SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(20, 0, 20, 10))
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@fallen_leaves02

        @@fallen_leaves03 = DecorPlant.new("Yellow Fallen Leaves", "fallen_leaves03", 0, 0,
        SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(40, 0, 20, 10)), 1)
        DECOR_SPRITE_HASH["fallen_leaves03"] = SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(40, 0, 20, 10))
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@fallen_leaves03

        @@fallen_leaves04 = DecorPlant.new("Mixed Fallen Leaves", "fallen_leaves04", 0, 0,
        SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(60, 0, 30, 10)), 1)
        DECOR_SPRITE_HASH["fallen_leaves04"] = SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(60, 0, 30, 10))
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@fallen_leaves04

        @@single_daisy = DecorPlant.new("Single Daisy", "single_daisy", 0, 0,
        SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(0, 10, 10, 10)), 1)
        DECOR_SPRITE_HASH["single_daisy"] = SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(0, 10, 10, 10))
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@single_daisy

        @@double_daisy = DecorPlant.new("Double Daisy", "double_daisy", 0, 0,
        SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(10, 10, 10, 10)), 1)
        DECOR_SPRITE_HASH["double_daisy"] = SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(10, 10, 10, 10))
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@double_daisy

        @@dandelion = DecorPlant.new("Dandelion", "dandelion", 0, 0,
        SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(20, 10, 10, 10)), 1)
        DECOR_SPRITE_HASH["dandelion"] = SF::Sprite.new(NATURAL_DECOR_TEXTURE, SF::Rect.new(20, 10, 10, 10))
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@dandelion
    end
    class DecorGarbage < DecorBase
        @@small_garbage_bag_01 = DecorGarbage.new("Small Garbage Bag", "small_garbage_bag_01", 0, 0, SF::Sprite.new(GARBAGE_TEXTURE, SF::Rect.new(0, 0, 20, 20)), 1)
        DECOR_SPRITE_HASH[@@small_garbage_bag_01.id] = @@small_garbage_bag_01.sprite
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@small_garbage_bag_01

        @@garbage_bag_01 = DecorGarbage.new("Garbage Bag", "garbage_bag_01", 0, 0, SF::Sprite.new(GARBAGE_TEXTURE, SF::Rect.new(0, 20, 40, 40)), 1)
        DECOR_SPRITE_HASH[@@garbage_bag_01.id] = @@garbage_bag_01.sprite
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@garbage_bag_01

        @@toxic_waste_bag_01 = DecorGarbage.new("Toxic Waste Bag", "toxic_waste_bag_01", 0, 0, SF::Sprite.new(GARBAGE_TEXTURE, SF::Rect.new(0, 60, 40, 40)), 1)
        DECOR_SPRITE_HASH[@@toxic_waste_bag_01.id] = @@toxic_waste_bag_01.sprite
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@toxic_waste_bag_01


        @@eight_inch_floppy_disk = DecorGarbage.new("8-Inch Floppy Disk", "eight_inch_floppy_disk", 0, 0, SF::Sprite.new(GARBAGE_TEXTURE, SF::Rect.new(40, 0, 20, 20)), 1)
        DECOR_SPRITE_HASH[@@eight_inch_floppy_disk.id] = @@eight_inch_floppy_disk.sprite
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@eight_inch_floppy_disk

        @@five_point_twenty_five_floppy_disk = DecorGarbage.new("5.25-Inch Floppy Disk", "five_point_twenty_five_floppy_disk", 0, 0, SF::Sprite.new(GARBAGE_TEXTURE, SF::Rect.new(60, 0, 20, 20)), 1)
        DECOR_SPRITE_HASH[@@five_point_twenty_five_floppy_disk.id] = @@five_point_twenty_five_floppy_disk.sprite
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@five_point_twenty_five_floppy_disk

        @@three_point_five_inch_floppy_disk = DecorGarbage.new("3.5-Inch Floppy Disk", "three_point_five_inch_floppy_disk", 0, 0, SF::Sprite.new(GARBAGE_TEXTURE, SF::Rect.new(80, 0, 20, 20)), 1)
        DECOR_SPRITE_HASH[@@three_point_five_inch_floppy_disk.id] = @@three_point_five_inch_floppy_disk.sprite
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@three_point_five_inch_floppy_disk


        @@small_can_01 = DecorGarbage.new("Small Can", "small_can_01", 0, 0, SF::Sprite.new(GARBAGE_TEXTURE, SF::Rect.new(20, 0, 10, 10)), 1)
        DECOR_SPRITE_HASH[@@small_can_01.id] = @@small_can_01.sprite
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@small_can_01

        @@beverage_can_01 = DecorGarbage.new("Beverage Can", "beverage_can_01", 0, 0, SF::Sprite.new(GARBAGE_TEXTURE, SF::Rect.new(40, 20, 20, 20)), 1)
        DECOR_SPRITE_HASH[@@beverage_can_01.id] = @@beverage_can_01.sprite
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@beverage_can_01


        @@broken_glass_clear_01 = DecorGarbage.new("Broken Glass", "broken_glass_clear_01", 0, 0, SF::Sprite.new(GARBAGE_TEXTURE, SF::Rect.new(40, 40, 20, 20)), 1)
        DECOR_SPRITE_HASH[@@broken_glass_clear_01.id] = @@broken_glass_clear_01.sprite
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@broken_glass_clear_01

        @@broken_glass_clear_02 = DecorGarbage.new("Broken Glass", "broken_glass_clear_02", 0, 0, SF::Sprite.new(GARBAGE_TEXTURE, SF::Rect.new(60, 40, 20, 20)), 1)
        DECOR_SPRITE_HASH[@@broken_glass_clear_02.id] = @@broken_glass_clear_02.sprite
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@broken_glass_clear_02

        @@broken_glass_brown_01 = DecorGarbage.new("Brown Broken Glass", "broken_glass_brown_01", 0, 0, SF::Sprite.new(GARBAGE_TEXTURE, SF::Rect.new(80, 40, 20, 20)), 1)
        DECOR_SPRITE_HASH[@@broken_glass_brown_01.id] = @@broken_glass_brown_01.sprite
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@broken_glass_brown_01

        @@broken_glass_brown_02 = DecorGarbage.new("Brown Broken Glass", "broken_glass_brown_02", 0, 0, SF::Sprite.new(GARBAGE_TEXTURE, SF::Rect.new(100, 40, 20, 20)), 1)
        DECOR_SPRITE_HASH[@@broken_glass_brown_02.id] = @@broken_glass_brown_02.sprite
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@broken_glass_brown_02

        @@broken_glass_green_01 = DecorGarbage.new("Green Broken Glass", "broken_glass_green_01", 0, 0, SF::Sprite.new(GARBAGE_TEXTURE, SF::Rect.new(120, 40, 20, 20)), 1)
        DECOR_SPRITE_HASH[@@broken_glass_green_01.id] = @@broken_glass_green_01.sprite
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@broken_glass_green_01

        @@broken_glass_green_02 = DecorGarbage.new("Green Broken Glass", "broken_glass_green_02", 0, 0, SF::Sprite.new(GARBAGE_TEXTURE, SF::Rect.new(140, 40, 20, 20)), 1)
        DECOR_SPRITE_HASH[@@broken_glass_green_02.id] = @@broken_glass_green_02.sprite
        LevelElements::DecorBase::DECOR_TEMPLATE_ARRAY << @@broken_glass_green_02
    end
end