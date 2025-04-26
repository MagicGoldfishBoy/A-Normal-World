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
            INVENTORY_BOX.sprite.scale = SF.vector2(1.35, 1)
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