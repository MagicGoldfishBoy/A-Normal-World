require "crsfml"
require "../src/sprites.cr"
require "../src/inventory.cr"
require "../src/clothing.cr"
require "../src/combat.cr"
require "../src/consumables.cr"
require "../src/level_editor.cr"
require "../src/level_elements.cr"
require "../src/serialization.cr"

module Keyboard
    class Gameplay
        def initialize(@@gameplay_mode : String)
        end

        def Gameplay.gameplay_mode
            @@gameplay_mode
        end

        def Gameplay.gameplay_mode=(this)
            @@gameplay_mode = this
        end

        def Gameplay.determine_gameplay_controls(window)
            case Gameplay.gameplay_mode
            when "none"
                "does nothing lol"
            when "normal"
                Gameplay.normal_gameplay(window)
            when "level_editor"
                Gameplay.level_editor(window)
            end
        end

        def Gameplay.normal_gameplay(window)
            keys_to_check = [
            SF::Keyboard::Left, SF::Keyboard::Right, SF::Keyboard::Up, SF::Keyboard::Down,
            SF::Keyboard::W, SF::Keyboard::A, SF::Keyboard::S, SF::Keyboard::D,
            SF::Keyboard::Space, SF::Keyboard::LShift, SF::Keyboard::LControl, SF::Keyboard::LAlt, SF::Keyboard::Return
            ]
            if !keys_to_check.any? { |key| SF::Keyboard.key_pressed?(key) }
            Player::Movement.movement_state=("idle")
            Sprites::Player.movement_state=("idle")
            end
            if SF::Keyboard.key_pressed?(SF::Keyboard::Left)
                direction = "left"
                Player::Movement.movement_state=("walking")
                Sprites::Player.movement_state=("walking")
                Sprites::Player.direction=("left")
                Player::Movement.movement_direction=("left")
                Player::Movement.move_horizontal(window, direction)
                Sprites::Player.refresh_player_sprite(window)
            end
            if SF::Keyboard.key_pressed?(SF::Keyboard::Right)
                direction = "right"
                Player::Movement.movement_state=("walking")
                Sprites::Player.movement_state=("walking")
                Sprites::Player.direction=("right")
                Player::Movement.movement_direction=("right")
                Player::Movement.move_horizontal(window, direction)
                Sprites::Player.refresh_player_sprite(window)
            end
            if SF::Keyboard.key_pressed?(SF::Keyboard::Space)
                Levels::Level_Physics.jump(window)
            end
            if SF::Keyboard.key_pressed?(SF::Keyboard::I)
                Inventory::InventoryManager.is_inventory_open=(!Inventory::InventoryManager.is_inventory_open)
                Inventory::ClothingTabShirt.is_open=(!Inventory::ClothingTabShirt.is_open)
                Inventory::ClothingTabShirt.initialize_clothing_tab(window)
                Inventory::WeaponTab.initialize_equipment_tab(window)
                Inventory::ClothingTabShirt.assign_slot_textures(window)
                sleep 0.25.seconds
            end
            if SF::Keyboard.key_pressed?(SF::Keyboard::E)
                #Inventory::ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Small HP Potion").not_nil!, 51)
                #Player::Stats.current_hp = Player::Stats.current_hp - 2
                Serialization::LevelFile.save_level("test2")
                #Serialization::LevelFile.load_level("serialization_fucking_sucks")
                sleep 0.25.seconds
            end
            if SF::Keyboard.key_pressed?(SF::Keyboard::A)
                Sprites::Player.movement_state=("attacking")
                Player::Movement.movement_state=("attacking")
                player_strength = Player::Stats.str
                Combat::Player.normal_attack(window, player_strength)
                Sprites::Player.refresh_player_sprite(window)
            end
        end
        def Gameplay.level_editor(window)
            if SF::Keyboard.key_pressed?(SF::Keyboard::K)
                Serialization::LevelFile.save_level("test2")
                sleep 0.25.seconds
            end
            if SF::Keyboard.key_pressed?(SF::Keyboard::L)
                Serialization::LevelFile.load_level("test2")
                LevelEditor::LevelEditorLogic.spawned_element_array = LevelEditor::LevelEditorLogic.spawned_platform_array + 
                LevelEditor::LevelEditorLogic.spawned_decor_array
                sleep 0.25.seconds
            end
            if SF::Keyboard.key_pressed?(SF::Keyboard::Left)
                LevelEditor::LevelDisplay.view_center.x -= LevelEditor::LevelDisplay.move_speed
                LevelEditor::LevelDisplay.move_view(window, -LevelEditor::LevelDisplay.move_speed, 0)
            end
            if SF::Keyboard.key_pressed?(SF::Keyboard::Right)
                LevelEditor::LevelDisplay.view_center.x += LevelEditor::LevelDisplay.move_speed
                LevelEditor::LevelDisplay.move_view(window, LevelEditor::LevelDisplay.move_speed, 0)
            end
            if SF::Keyboard.key_pressed?(SF::Keyboard::Up)
                LevelEditor::LevelDisplay.view_center.y -= LevelEditor::LevelDisplay.move_speed
                LevelEditor::LevelDisplay.move_view(window, 0, -LevelEditor::LevelDisplay.move_speed)
            end
            if SF::Keyboard.key_pressed?(SF::Keyboard::Down)
                LevelEditor::LevelDisplay.view_center.y += LevelEditor::LevelDisplay.move_speed
                LevelEditor::LevelDisplay.move_view(window, 0, LevelEditor::LevelDisplay.move_speed)
            end
            if SF::Keyboard.key_pressed?(SF::Keyboard::Hyphen)
                LevelEditor::LevelDisplay.zoom_view(window, 0.05)
            end
            if SF::Keyboard.key_pressed?(SF::Keyboard::Equal)
                LevelEditor::LevelDisplay.zoom_view(window, -0.05)
            end
            if SF::Keyboard.key_pressed?(SF::Keyboard::A)
                LevelEditor::LevelEditorLogic.move_current_element(window, -LevelEditor::LevelDisplay.move_speed, 0)
            end
            if SF::Keyboard.key_pressed?(SF::Keyboard::D)
                LevelEditor::LevelEditorLogic.move_current_element(window, LevelEditor::LevelDisplay.move_speed, 0)
            end
            if SF::Keyboard.key_pressed?(SF::Keyboard::W)
                LevelEditor::LevelEditorLogic.move_current_element(window, 0, -LevelEditor::LevelDisplay.move_speed)
            end
            if SF::Keyboard.key_pressed?(SF::Keyboard::S)
                LevelEditor::LevelEditorLogic.move_current_element(window, 0, LevelEditor::LevelDisplay.move_speed)
            end
        end
    end
end