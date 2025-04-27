require "crsfml"
require "crsfml/audio"
require "../../src/textures.cr"
require "../inventory/inventory.cr"

module InventoryWindow
    class InventoryWindowElements

        INVENTORY_WINDOW_BOX_ARRAY = [] of Ui_Elements::Ui_BoxBase
        INVENTORY_TEXT_ARRAY = [] of Ui_Elements::Ui_TextBase


        INVENTORY_BOX = Ui_Elements::Ui_BoxBase.new("Inventory Box", "InvBox01", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(400, 700, 600, 600)), 600.0, 600.0, 4)
        INVENTORY_WINDOW_BOX_ARRAY << INVENTORY_BOX


        LEFT_ARROW = Ui_Elements::Ui_BoxBase.new("Left Arrow", "InvArrow01", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(900, 158, 39, 34)), 39.0, 34.0, 2)
        INVENTORY_WINDOW_BOX_ARRAY << LEFT_ARROW

        RIGHT_ARROW = Ui_Elements::Ui_BoxBase.new("Right Arrow", "InvArrow02", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(961, 158, 39, 34)), 39.0, 34.0, 2)
        INVENTORY_WINDOW_BOX_ARRAY << RIGHT_ARROW


        COSMETICS_TAB = Ui_Elements::Ui_BoxBase.new("Cosmetics", "InvTab01", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(1000, 650, 100, 50)), 100.0, 50.0, 3)
        INVENTORY_WINDOW_BOX_ARRAY << COSMETICS_TAB

        COSMETICS_TAB_TEXT = Ui_Elements::Ui_TextBase.new("Cosmetics Tab Text", "InvTabText01", SF::Text.new(COSMETICS_TAB.name, QUICKSAND, 18))
        INVENTORY_TEXT_ARRAY << COSMETICS_TAB_TEXT


        EQUIPMENT_TAB = Ui_Elements::Ui_BoxBase.new("Equipment", "InvTab02", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(1000, 650, 100, 50)), 100.0, 50.0, 3)
        INVENTORY_WINDOW_BOX_ARRAY << EQUIPMENT_TAB

        EQUIPMENT_TAB_TEXT = Ui_Elements::Ui_TextBase.new("Equipment Tab Text", "InvTabText02", SF::Text.new(EQUIPMENT_TAB.name, QUICKSAND, 18))
        INVENTORY_TEXT_ARRAY << EQUIPMENT_TAB_TEXT


        USE_TAB = Ui_Elements::Ui_BoxBase.new("Usable", "InvTab03", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 650, 100, 50)), 100.0, 50.0, 3)
        INVENTORY_WINDOW_BOX_ARRAY << USE_TAB

        USE_TAB_TEXT = Ui_Elements::Ui_TextBase.new("Use Tab Text", "InvText03", SF::Text.new(USE_TAB.name, QUICKSAND, 18))
        INVENTORY_TEXT_ARRAY << USE_TAB_TEXT


        MISC_TAB = Ui_Elements::Ui_BoxBase.new("Misc", "InvTab04", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 650, 100, 50)), 100.0, 50.0, 3)
        INVENTORY_WINDOW_BOX_ARRAY << MISC_TAB

        MISC_TAB_TEXT = Ui_Elements::Ui_TextBase.new("Misc Tab Text", "InvText04", SF::Text.new(MISC_TAB.name, QUICKSAND, 18))
        INVENTORY_TEXT_ARRAY << MISC_TAB_TEXT


        INVENTORY_SLOT_01 = Ui_Elements::Ui_BoxBase.new("Slot 1", "InvSlot01", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 700, 100, 100)), 100.0, 100.0, 1)
        INVENTORY_WINDOW_BOX_ARRAY << INVENTORY_SLOT_01

        INVENTORY_SLOT_02 = Ui_Elements::Ui_BoxBase.new("Slot 2", "InvSlot02", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 700, 100, 100)), 100.0, 100.0, 1)
        INVENTORY_WINDOW_BOX_ARRAY << INVENTORY_SLOT_02

        INVENTORY_SLOT_03 = Ui_Elements::Ui_BoxBase.new("Slot 3", "InvSlot03", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 700, 100, 100)), 100.0, 100.0, 1)
        INVENTORY_WINDOW_BOX_ARRAY << INVENTORY_SLOT_03

        INVENTORY_SLOT_04 = Ui_Elements::Ui_BoxBase.new("Slot 4", "InvSlot04", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 700, 100, 100)), 100.0, 100.0, 1)
        INVENTORY_WINDOW_BOX_ARRAY << INVENTORY_SLOT_04

        INVENTORY_SLOT_05 = Ui_Elements::Ui_BoxBase.new("Slot 5", "InvSlot05", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 700, 100, 100)), 100.0, 100.0, 1)
        INVENTORY_WINDOW_BOX_ARRAY << INVENTORY_SLOT_05

        INVENTORY_SLOT_06 = Ui_Elements::Ui_BoxBase.new("Slot 6", "InvSlot06", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 700, 100, 100)), 100.0, 100.0, 1)
        INVENTORY_WINDOW_BOX_ARRAY << INVENTORY_SLOT_06

        INVENTORY_SLOT_07 = Ui_Elements::Ui_BoxBase.new("Slot 7", "InvSlot07", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 700, 100, 100)), 100.0, 100.0, 1)
        INVENTORY_WINDOW_BOX_ARRAY << INVENTORY_SLOT_07

        INVENTORY_SLOT_08 = Ui_Elements::Ui_BoxBase.new("Slot 8", "InvSlot08", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 700, 100, 100)), 100.0, 100.0, 1)
        INVENTORY_WINDOW_BOX_ARRAY << INVENTORY_SLOT_08

        INVENTORY_SLOT_09 = Ui_Elements::Ui_BoxBase.new("Slot 9", "InvSlot09", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 700, 100, 100)), 100.0, 100.0, 1)
        INVENTORY_WINDOW_BOX_ARRAY << INVENTORY_SLOT_09

        INVENTORY_SLOT_10 = Ui_Elements::Ui_BoxBase.new("Slot 10", "InvSlot10", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 700, 100, 100)), 100.0, 100.0, 1)
        INVENTORY_WINDOW_BOX_ARRAY << INVENTORY_SLOT_10

        INVENTORY_SLOT_11 = Ui_Elements::Ui_BoxBase.new("Slot 11", "InvSlot11", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 700, 100, 100)), 100.0, 100.0, 1)
        INVENTORY_WINDOW_BOX_ARRAY << INVENTORY_SLOT_11

        INVENTORY_SLOT_12 = Ui_Elements::Ui_BoxBase.new("Slot 12", "InvSlot012", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 700, 100, 100)), 100.0, 100.0, 1)
        INVENTORY_WINDOW_BOX_ARRAY << INVENTORY_SLOT_12

        INVENTORY_SLOT_13 = Ui_Elements::Ui_BoxBase.new("Slot 13", "InvSlot13", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 700, 100, 100)), 100.0, 100.0, 1)
        INVENTORY_WINDOW_BOX_ARRAY << INVENTORY_SLOT_13

        INVENTORY_SLOT_14 = Ui_Elements::Ui_BoxBase.new("Slot 14", "InvSlot14", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 700, 100, 100)), 100.0, 100.0, 1)
        INVENTORY_WINDOW_BOX_ARRAY << INVENTORY_SLOT_14

        INVENTORY_SLOT_15 = Ui_Elements::Ui_BoxBase.new("Slot 15", "InvSlot15", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1000, 700, 100, 100)), 100.0, 100.0, 1)
        INVENTORY_WINDOW_BOX_ARRAY << INVENTORY_SLOT_15
        

        def self.position_inventory_window_elements(window)
            current_size = window.size
            original_width = 800 
            original_height = 600
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
    
            scale_ratio = [scale_x, scale_y].min
            max_scale = 1.5
            clamped_scale = [scale_ratio, max_scale].min

            window.view = window.default_view

            INVENTORY_BOX.sprite.position = SF.vector2(80 * max_scale, 40 * max_scale)
            INVENTORY_BOX.sprite.scale = SF.vector2(1.05, 1)

            LEFT_ARROW.sprite.position = INVENTORY_BOX.sprite.position + SF.vector2(200 * max_scale, 15 * max_scale)
            RIGHT_ARROW.sprite.position = LEFT_ARROW.sprite.position + SF.vector2(50 * max_scale, 1 * max_scale)

            COSMETICS_TAB.sprite.position = INVENTORY_BOX.sprite.position - SF.vector2(-2 * max_scale, 50)
            COSMETICS_TAB_TEXT.text.position = COSMETICS_TAB.sprite.position + SF.vector2(4 * max_scale, 7 * max_scale)

            EQUIPMENT_TAB.sprite.position = INVENTORY_BOX.sprite.position - SF.vector2(-70 * max_scale, 50)
            EQUIPMENT_TAB_TEXT.text.position = EQUIPMENT_TAB.sprite.position + SF.vector2(4 * max_scale, 7 * max_scale)

            USE_TAB.sprite.position = INVENTORY_BOX.sprite.position - SF.vector2(-138 * max_scale, 50)
            USE_TAB_TEXT.text.position = USE_TAB.sprite.position + SF.vector2(12 * max_scale, 7 * max_scale)

            MISC_TAB.sprite.position = INVENTORY_BOX.sprite.position - SF.vector2(-206 * max_scale, 50)
            MISC_TAB_TEXT.text.position = MISC_TAB.sprite.position + SF.vector2(20 * max_scale, 7 * max_scale)

            INVENTORY_SLOT_01.sprite.position = INVENTORY_BOX.sprite.position + SF.vector2(35, 75)
            INVENTORY_SLOT_02.sprite.position = INVENTORY_SLOT_01.sprite.position + SF.vector2(115, 0)
            INVENTORY_SLOT_03.sprite.position = INVENTORY_SLOT_02.sprite.position + SF.vector2(115, 0)
            INVENTORY_SLOT_04.sprite.position = INVENTORY_SLOT_03.sprite.position + SF.vector2(115, 0)
            INVENTORY_SLOT_05.sprite.position = INVENTORY_SLOT_04.sprite.position + SF.vector2(115, 0)
            INVENTORY_SLOT_06.sprite.position = INVENTORY_SLOT_01.sprite.position + SF.vector2(0, 115)
            INVENTORY_SLOT_07.sprite.position = INVENTORY_SLOT_06.sprite.position + SF.vector2(115, 0)
            INVENTORY_SLOT_08.sprite.position = INVENTORY_SLOT_07.sprite.position + SF.vector2(115, 0)
            INVENTORY_SLOT_09.sprite.position = INVENTORY_SLOT_08.sprite.position + SF.vector2(115, 0)
            INVENTORY_SLOT_10.sprite.position = INVENTORY_SLOT_09.sprite.position + SF.vector2(115, 0)
            INVENTORY_SLOT_11.sprite.position = INVENTORY_SLOT_01.sprite.position + SF.vector2(0, 230)
            INVENTORY_SLOT_12.sprite.position = INVENTORY_SLOT_11.sprite.position + SF.vector2(115, 0)
            INVENTORY_SLOT_13.sprite.position = INVENTORY_SLOT_12.sprite.position + SF.vector2(115, 0)
            INVENTORY_SLOT_14.sprite.position = INVENTORY_SLOT_13.sprite.position + SF.vector2(115, 0)
            INVENTORY_SLOT_15.sprite.position = INVENTORY_SLOT_14.sprite.position + SF.vector2(115, 0)

        end

    end
    class InventoryWindowDisplay
        
        def self.display(window)
            
         InventoryWindowElements.position_inventory_window_elements(window)

         InventoryWindowElements::INVENTORY_WINDOW_BOX_ARRAY.each { |box|
         window.draw(box.sprite)}

         InventoryWindowElements::INVENTORY_TEXT_ARRAY.each { |text|
         window.draw(text.text)}

         Inventory::InventoryManager.draw_inventory(window)
        end
    end
    class InventoryWindowHandling
        def initialize(current_tab : String)
            @current_tab = current_tab
        end

        class_property current_tab : String = "cosmetics"
    end
end