require "crsfml"
require "crsfml/audio"
require "../../src/textures.cr"
require "../inventory/inventory.cr"

module EquippedItemsWindow
    class EquippedItemsWindowElements

        EQUIPPED_ITEMS_WINDOW_BOXES = [] of Ui_Elements::Ui_BoxBase
        EQUIPPED_ITEMS_WINDOW_TEXTS = [] of Ui_Elements::Ui_TextBase

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

            EQUIPPED_ITEMS_WINDOW_BOX.sprite.position = SF.vector2(80 * max_scale, 40 * max_scale)

            EQUIPMENT_TAB_BOX.sprite.position = EQUIPPED_ITEMS_WINDOW_BOX.sprite.position - SF.vector2(-2 * max_scale, 50)
            EQUIPMENT_TAB_TEXT.text.position = EQUIPMENT_TAB_BOX.sprite.position + SF.vector2(4 * max_scale, 7 * max_scale)

            COSMETICS_TAB_BOX.sprite.position = EQUIPPED_ITEMS_WINDOW_BOX.sprite.position - SF.vector2(-70 * max_scale, 50)
            COSMETICS_TAB_TEXT.text.position = COSMETICS_TAB_BOX.sprite.position + SF.vector2(4 * max_scale, 7 * max_scale)
        end
    end
    class EquippedItemsWindowDisplay
        def self.display(window)
            EquippedItemsWindowElements.position_elements(window)
            EquippedItemsWindowElements::EQUIPPED_ITEMS_WINDOW_BOXES.each { |box|
                window.draw(box.sprite)
            }
            EquippedItemsWindowElements::EQUIPPED_ITEMS_WINDOW_TEXTS.each { |text|
                window.draw(text.text)
            }
        end
    end
end