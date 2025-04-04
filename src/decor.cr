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
    end
end