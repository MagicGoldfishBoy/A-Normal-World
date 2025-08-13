require "crsfml"
require "crsfml/audio"
require "../../src/textures.cr"
require "../inventory/inventory.cr"

module EquippedItemsWindow
    class EquippedItemsWindowManager
        def initialize(current_category : String)
            @current_category = current_category
            @is_dragging = is_dragging
            @window_position_x = window_position_x
            @window_position_y = window_position_y
        end

        class_property current_category : String = "equipment"
        class_property is_dragging : Bool = false
        class_property window_position_x : Float64 = 80.0
        class_property window_position_y : Float64 = 40.0
    end
    class EquippedItemsWindowElements

        EQUIPPED_ITEMS_WINDOW_BOXES = [] of Ui_Elements::Ui_BoxBase
        EQUIPPED_ITEMS_WINDOW_TEXTS = [] of Ui_Elements::Ui_TextBase

        EQUIPMENT_SLOTS = [] of Ui_Elements::Ui_BoxBase

        COSMETIC_SLOTS = [] of Ui_Elements::Ui_BoxBase

        EQUIPPED_ITEMS_WINDOW_BOX = Ui_Elements::Ui_BoxBase.new("Equipped Items Window", "EquItemBox01", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1100, 650, 300, 450)), 400.0, 550.0, 4)
        EQUIPPED_ITEMS_WINDOW_BOXES << EQUIPPED_ITEMS_WINDOW_BOX


        EQUIPMENT_TAB_BOX = Ui_Elements::Ui_BoxBase.new("Equipment", "EquItemBox02", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 650, 100, 50)), 100.0, 50.0, 3)
        EQUIPPED_ITEMS_WINDOW_BOXES << EQUIPMENT_TAB_BOX

        EQUIPMENT_TAB_TEXT = Ui_Elements::Ui_TextBase.new("Equipment", "EquItemText01", SF::Text.new(EQUIPMENT_TAB_BOX.name, QUICKSAND, 18))
        EQUIPPED_ITEMS_WINDOW_TEXTS << EQUIPMENT_TAB_TEXT


        COSMETICS_TAB_BOX = Ui_Elements::Ui_BoxBase.new("Cosmetics", "EquItemBox03", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 650, 100, 50)), 100.0, 50.0, 3)
        EQUIPPED_ITEMS_WINDOW_BOXES << COSMETICS_TAB_BOX

        COSMETICS_TAB_TEXT = Ui_Elements::Ui_TextBase.new("Cosmetics", "EquItemText02", SF::Text.new(COSMETICS_TAB_BOX.name, QUICKSAND, 18))
        EQUIPPED_ITEMS_WINDOW_TEXTS << COSMETICS_TAB_TEXT


        SOUL_ORB_SLOT_BOX = Ui_Elements::Ui_BoxBase.new("Head Slot", "EquItemBox04", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 700, 100, 100)), 100.0, 100.0, 1)
        EQUIPMENT_SLOTS << SOUL_ORB_SLOT_BOX

        CATALYST_SLOT_BOX = Ui_Elements::Ui_BoxBase.new("Catalyst Slot", "EquItemBox05", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 700, 100, 100)), 100.0, 100.0, 1)
        EQUIPMENT_SLOTS << CATALYST_SLOT_BOX

        JEWEL_SLOT_BOX_01 = Ui_Elements::Ui_BoxBase.new("Jewelry Slot 1", "EquItemBox06", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 850, 50, 50)), 50.0, 50.0, 2)
        EQUIPMENT_SLOTS << JEWEL_SLOT_BOX_01 #This is only for testing, when soul orbs and jewels are fully implemented the slots should be removed from this array and only display based on the amount of slots

        JEWEL_SLOT_BOX_02 = Ui_Elements::Ui_BoxBase.new("Jewelry Slot 2", "EquItemBox07", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 850, 50, 50)), 50.0, 50.0, 2)
        EQUIPMENT_SLOTS << JEWEL_SLOT_BOX_02

        JEWEL_SLOT_BOX_03 = Ui_Elements::Ui_BoxBase.new("Jewelry Slot 3", "EquItemBox08", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 850, 50, 50)), 50.0, 50.0, 2)
        EQUIPMENT_SLOTS << JEWEL_SLOT_BOX_03

        JEWEL_SLOT_BOX_04 = Ui_Elements::Ui_BoxBase.new("Jewelry Slot 4", "EquItemBox09", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 850, 50, 50)), 50.0, 50.0, 2)
        EQUIPMENT_SLOTS << JEWEL_SLOT_BOX_04

        JEWEL_SLOT_BOX_05 = Ui_Elements::Ui_BoxBase.new("Jewelry Slot 5", "EquItemBox10", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 850, 50, 50)), 50.0, 50.0, 2)
        EQUIPMENT_SLOTS << JEWEL_SLOT_BOX_05

        JEWEL_SLOT_BOX_06 = Ui_Elements::Ui_BoxBase.new("Jewelry Slot 6", "EquItemBox11", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 850, 50, 50)), 50.0, 50.0, 2)
        EQUIPMENT_SLOTS << JEWEL_SLOT_BOX_06

        JEWEL_SLOT_BOX_07 = Ui_Elements::Ui_BoxBase.new("Jewelry Slot 7", "EquItemBox12", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 850, 50, 50)), 50.0, 50.0, 2)
        EQUIPMENT_SLOTS << JEWEL_SLOT_BOX_07

        JEWEL_SLOT_BOX_08 = Ui_Elements::Ui_BoxBase.new("Jewelry Slot 8", "EquItemBox13", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 850, 50, 50)), 50.0, 50.0, 2)
        EQUIPMENT_SLOTS << JEWEL_SLOT_BOX_08

        CLOSE_BUTTON_BOX = Ui_Elements::Ui_BoxBase.new("Close Button", "EquItemBox14", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1200, 0, 9, 9)), 9.0, 9.0, 3)
        EQUIPPED_ITEMS_WINDOW_BOXES << CLOSE_BUTTON_BOX

        DRAG_BUTTON_BOX = Ui_Elements::Ui_BoxBase.new("Drag Button", "EquItemBox15", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1210, 0, 9, 9)), 9.0, 9.0, 3)
        EQUIPPED_ITEMS_WINDOW_BOXES << DRAG_BUTTON_BOX

        def self.position_elements(window, is_dragging)
            current_size = window.size
            original_width = 800 
            original_height = 600
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
    
            scale_ratio = [scale_x, scale_y].min
            max_scale = 1.5
            clamped_scale = [scale_ratio, max_scale].min

            window.view = window.default_view

            if is_dragging == false
             EQUIPPED_ITEMS_WINDOW_BOX.sprite.position = SF.vector2(EquippedItemsWindowManager.window_position_x * max_scale, EquippedItemsWindowManager.window_position_y * max_scale)
            end

            EQUIPMENT_TAB_BOX.sprite.position = EQUIPPED_ITEMS_WINDOW_BOX.sprite.position - SF.vector2(-2 * max_scale, 50)
            EQUIPMENT_TAB_TEXT.text.position = EQUIPMENT_TAB_BOX.sprite.position + SF.vector2(4 * max_scale, 7 * max_scale)

            COSMETICS_TAB_BOX.sprite.position = EQUIPPED_ITEMS_WINDOW_BOX.sprite.position - SF.vector2(-70 * max_scale, 50)
            COSMETICS_TAB_TEXT.text.position = COSMETICS_TAB_BOX.sprite.position + SF.vector2(4 * max_scale, 7 * max_scale)

            SOUL_ORB_SLOT_BOX.sprite.position = EQUIPPED_ITEMS_WINDOW_BOX.sprite.position + SF.vector2(65 * max_scale, 50 * max_scale)

            CATALYST_SLOT_BOX.sprite.position = EQUIPPED_ITEMS_WINDOW_BOX.sprite.position + SF.vector2(65 * max_scale, 200 * max_scale)

            JEWEL_SLOT_BOX_01.sprite.position = EQUIPPED_ITEMS_WINDOW_BOX.sprite.position + SF.vector2(80 * max_scale, 10 * max_scale)
            JEWEL_SLOT_BOX_02.sprite.position = EQUIPPED_ITEMS_WINDOW_BOX.sprite.position + SF.vector2(138 * max_scale, 10 * max_scale)
            JEWEL_SLOT_BOX_03.sprite.position = EQUIPPED_ITEMS_WINDOW_BOX.sprite.position + SF.vector2(138 * max_scale, 65 * max_scale)
            JEWEL_SLOT_BOX_04.sprite.position = EQUIPPED_ITEMS_WINDOW_BOX.sprite.position + SF.vector2(138 * max_scale, 125 * max_scale)
            JEWEL_SLOT_BOX_05.sprite.position = EQUIPPED_ITEMS_WINDOW_BOX.sprite.position + SF.vector2(80 * max_scale, 125 * max_scale)
            JEWEL_SLOT_BOX_06.sprite.position = EQUIPPED_ITEMS_WINDOW_BOX.sprite.position + SF.vector2(20 * max_scale, 125 * max_scale)
            JEWEL_SLOT_BOX_07.sprite.position = EQUIPPED_ITEMS_WINDOW_BOX.sprite.position + SF.vector2(20 * max_scale, 65 * max_scale)
            JEWEL_SLOT_BOX_08.sprite.position = EQUIPPED_ITEMS_WINDOW_BOX.sprite.position + SF.vector2(20 * max_scale, 10 * max_scale)

            CLOSE_BUTTON_BOX.sprite.position = EQUIPPED_ITEMS_WINDOW_BOX.sprite.position + SF.vector2(190 * max_scale, 5 * max_scale)
            DRAG_BUTTON_BOX.sprite.position = EQUIPPED_ITEMS_WINDOW_BOX.sprite.position + SF.vector2(180 * max_scale, 5 * max_scale)
        end

    end
    class EquippedItemsWindowDisplay
        @@drag_offset : SF::Vector2(Int32) | Nil = nil
        def self.display(window)
            current_size = window.size
            original_width = 800 
            original_height = 600
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height

            scale_ratio = [scale_x, scale_y].min
            max_scale = 1.5
            clamped_scale = [scale_ratio, max_scale].min

            window.view = window.default_view

            soul_orb_sprite = Player::Appearance.soul_orb != nil ? Player::Appearance.soul_orb.as(SoulOrb::SoulOrbBase).sprite : SF::Sprite.new
            soul_orb_sprite.not_nil!.position = EquippedItemsWindowElements::SOUL_ORB_SLOT_BOX.sprite.not_nil!.position + SF.vector2(7 * max_scale, 7 * max_scale)

            if EquippedItemsWindowManager.is_dragging
            mouse_position = SF::Mouse.get_position(window)
            drag_button_pos = EquippedItemsWindowElements::DRAG_BUTTON_BOX.sprite.position
            mouse_position_int = SF::Vector2.new(mouse_position.x.to_i, mouse_position.y.to_i)
            drag_button_pos_int = SF::Vector2.new(drag_button_pos.x.to_i, drag_button_pos.y.to_i)
            if @@drag_offset.nil?
                @@drag_offset = mouse_position_int - drag_button_pos_int
            end
            box_pos = mouse_position_int - @@drag_offset.not_nil!
            drag_button_offset = EquippedItemsWindowElements::DRAG_BUTTON_BOX.sprite.position - EquippedItemsWindowElements::EQUIPPED_ITEMS_WINDOW_BOX.sprite.position
            box_pos = box_pos - SF::Vector2.new(drag_button_offset.x.to_i, drag_button_offset.y.to_i)
            EquippedItemsWindowElements::EQUIPPED_ITEMS_WINDOW_BOX.sprite.position = SF::Vector2.new(box_pos.x.to_f, box_pos.y.to_f)
            EquippedItemsWindowManager.window_position_x = EquippedItemsWindowElements::EQUIPPED_ITEMS_WINDOW_BOX.sprite.position.x / max_scale
            EquippedItemsWindowManager.window_position_y = EquippedItemsWindowElements::EQUIPPED_ITEMS_WINDOW_BOX.sprite.position.y / max_scale
            EquippedItemsWindowElements.position_elements(window, true)
            else
            @@drag_offset = nil
            EquippedItemsWindowElements.position_elements(window, false)
            end
            EquippedItemsWindowElements::EQUIPPED_ITEMS_WINDOW_BOXES.each { |box|
            window.draw(box.sprite)
            }
            EquippedItemsWindowElements::EQUIPPED_ITEMS_WINDOW_TEXTS.each { |text|
            window.draw(text.text)
            }
            if EquippedItemsWindowManager.current_category == "equipment"
            EquippedItemsWindowElements::EQUIPMENT_SLOTS.each { |slot|
                window.draw(slot.sprite)
            }
            elsif EquippedItemsWindowManager.current_category == "cosmetics"
            EquippedItemsWindowElements::COSMETIC_SLOTS.each { |slot|
                window.draw(slot.sprite)
            }
            end
            window.draw(soul_orb_sprite.not_nil!)
            if SF::Mouse.button_pressed?(SF::Mouse::Left)
            self.mouse_handling(window)
            end
            if !SF::Mouse.button_pressed?(SF::Mouse::Left)
            EquippedItemsWindowManager.is_dragging = false
            end
        end
        def self.mouse_handling(window)
            if MouseHandling::ClickHandling.was_button_clicked?(EquippedItemsWindowElements::EQUIPMENT_TAB_BOX.sprite, window)
                EquippedItemsWindowManager.current_category = "equipment"
            elsif MouseHandling::ClickHandling.was_button_clicked?(EquippedItemsWindowElements::COSMETICS_TAB_BOX.sprite, window)
                EquippedItemsWindowManager.current_category = "cosmetics"
            elsif MouseHandling::ClickHandling.was_button_clicked?(EquippedItemsWindowElements::CLOSE_BUTTON_BOX.sprite, window)
                MenuHandling::Window.is_equipped_items_window_open = false
            elsif MouseHandling::ClickHandling.was_button_clicked?(EquippedItemsWindowElements::DRAG_BUTTON_BOX.sprite, window)
                EquippedItemsWindowManager.is_dragging = true
            end
        end
        #         def self.drag_window(window)
        #     current_size = window.size
        #     original_width = 800 
        #     original_height = 600
        #     scale_x = current_size.x.to_f / original_width
        #     scale_y = current_size.y.to_f / original_height
    
        #     scale_ratio = [scale_x, scale_y].min
        #     max_scale = 1.5
        #     clamped_scale = [scale_ratio, max_scale].min

        #     window.view = window.default_view
        
        #     while SF::Mouse.button_pressed?(SF::Mouse::Left)
        #     EquippedItemsWindowElements::EQUIPPED_ITEMS_WINDOW_BOX.sprite.position = SF::Mouse.get_position(window) - SF.vector2(180 * max_scale, 5 * max_scale)
        #     EquippedItemsWindowElements.position_elements(window, true)
        #     EquippedItemsWindowDisplay.display(window)
        #     end

        # end
    end
end