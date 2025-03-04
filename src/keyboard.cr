require "crsfml"
require "../src/sprites.cr"
require "../src/inventory.cr"

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
            end
            if SF::Keyboard.key_pressed?(SF::Keyboard::Right)
                direction = "right"
                Player::Movement.movement_state=("walking")
                Sprites::Player.movement_state=("walking")
                Sprites::Player.direction=("right")
                Player::Movement.movement_direction=("right")
                Player::Movement.move_horizontal(window, direction)
            end
            if SF::Keyboard.key_pressed?(SF::Keyboard::Space)
                Levels::Level_Physics.jump(window)
            end
            if SF::Keyboard.key_pressed?(SF::Keyboard::I)
                Inventory::InventoryManager.is_inventory_open=(!Inventory::InventoryManager.is_inventory_open)
                Inventory::ClothingTab.is_open=(!Inventory::ClothingTab.is_open)
                Inventory::ClothingTab.initialize_clothing_tab(window)
                sleep 0.25.seconds
            end
        end
    end
end