require "crsfml"
require "crsfml/audio"
require "../../src/textures.cr"
require "../../src/utility.cr"
require "../../src/inventory/clothing/clothing.cr"
require "../../src/window/inventory_window.cr"
require "../inventory/inventory.cr"

module ConsumableInventory
    class ConsumableInventoryManager
        class_property current_tab : String = "potion"
    end
    class ConsumableInventoryElements
        CONSUMABLE_INVENTORY_BOX_ARRAY = [] of Ui_Elements::Ui_BoxBase
        CONSUMABLE_INVENTORY_TEXT_ARRAY = [] of Ui_Elements::Ui_TextBase


        POTION_TAB_BOX = Ui_Elements::Ui_BoxBase.new("Potions", "ConBox01", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1001, 800, 100, 34)), 100.0, 34.0, 3)
        CONSUMABLE_INVENTORY_BOX_ARRAY << POTION_TAB_BOX

        POTION_TAB_TEXT = Ui_Elements::Ui_TextBase.new("Potions", "ConText01", SF::Text.new(POTION_TAB_BOX.name, QUICKSAND, 18))
        CONSUMABLE_INVENTORY_TEXT_ARRAY << POTION_TAB_TEXT


        #tickets are for teleportation
        TICKET_TAB_BOX = Ui_Elements::Ui_BoxBase.new("Tickets", "ConBox02", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1101, 800, 100, 34)), 100.0, 34.0, 3)
        CONSUMABLE_INVENTORY_BOX_ARRAY << TICKET_TAB_BOX

        TICKET_TAB_TEXT = Ui_Elements::Ui_TextBase.new("Tickets", "ConText02", SF::Text.new(TICKET_TAB_BOX.name, QUICKSAND, 18))
        CONSUMABLE_INVENTORY_TEXT_ARRAY << TICKET_TAB_TEXT


        #soul marbles are for upgrading weapons
        MARBLE_TAB_BOX = Ui_Elements::Ui_BoxBase.new("Marbles", "ConBox03", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1201, 800, 100, 34)), 100.0, 34.0, 3)
        CONSUMABLE_INVENTORY_BOX_ARRAY << MARBLE_TAB_BOX

        MARBLE_TAB_TEXT = Ui_Elements::Ui_TextBase.new("Marbles", "ConText03", SF::Text.new(MARBLE_TAB_BOX.name, QUICKSAND, 18))
        CONSUMABLE_INVENTORY_TEXT_ARRAY << MARBLE_TAB_TEXT

        def self.position_elements(window)
            current_size = window.size
            original_width = 800 
            original_height = 600
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
    
            scale_ratio = [scale_x, scale_y].min
            max_scale = 1.5
            clamped_scale = [scale_ratio, max_scale].min

            window.view = window.default_view

            POTION_TAB_BOX.sprite.position = InventoryWindow::InventoryWindowElements::INVENTORY_BOX.sprite.position - SF.vector2(65 * max_scale, -8 * max_scale)
            POTION_TAB_TEXT.text.position = POTION_TAB_BOX.sprite.position + SF.vector2(15 * max_scale, 4 * max_scale)

            TICKET_TAB_BOX.sprite.position = POTION_TAB_BOX.sprite.position + SF.vector2(0, 26 * max_scale)
            TICKET_TAB_TEXT.text.position = TICKET_TAB_BOX.sprite.position + SF.vector2(15 * max_scale, 4 * max_scale)

            MARBLE_TAB_BOX.sprite.position = TICKET_TAB_BOX.sprite.position + SF.vector2(0, 26 * max_scale)
            MARBLE_TAB_TEXT.text.position = MARBLE_TAB_BOX.sprite.position + SF.vector2(15 * max_scale, 4 * max_scale)
        end
    end
end