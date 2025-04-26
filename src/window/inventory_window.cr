require "crsfml"
require "crsfml/audio"
require "../../src/textures.cr"

module InventoryWindow
    class InventoryWindowElements

        INVENTORY_WINDOW_BOX_ARRAY = [] of Ui_Elements::Ui_BoxBase
        INVENTORY_TEXT_ARRAY = [] of Ui_Elements::Ui_TextBase


        INVENTORY_BOX = Ui_Elements::Ui_BoxBase.new("Inventory Box", "InvBox01", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(400, 700, 650, 600)), 650.0, 600.0, 4)
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

        end

    end
    class InventoryWindowDisplay
        
        def self.display(window)
            
         InventoryWindowElements.position_inventory_window_elements(window)

         InventoryWindowElements::INVENTORY_WINDOW_BOX_ARRAY.each { |box|
         window.draw(box.sprite)}

         InventoryWindowElements::INVENTORY_TEXT_ARRAY.each { |text|
         window.draw(text.text)}

        end
    end
end