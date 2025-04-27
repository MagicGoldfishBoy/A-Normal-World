require "crsfml"
require "crsfml/audio"
require "../../src/textures.cr"
require "../../src/utility.cr"
require "../../src/inventory/equipment/clothing.cr"
require "../../src/window/inventory_window.cr"
require "../inventory/inventory.cr"

module CosmeticsInventory
    class CosmeticsInventoryElements
        COSMETIC_INVENTORY_BOX_ARRAY = [] of Ui_Elements::Ui_BoxBase

        HAT_TAB_BOX = Ui_Elements::Ui_BoxBase.new("Hat Tab Box", "CosBox01", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1001, 800, 100, 34)), 100.0, 34.0, 3)
        COSMETIC_INVENTORY_BOX_ARRAY << HAT_TAB_BOX

        def self.position_cosmetics_category_elements(window)
            current_size = window.size
            original_width = 800 
            original_height = 600
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
    
            scale_ratio = [scale_x, scale_y].min
            max_scale = 1.5
            clamped_scale = [scale_ratio, max_scale].min

            window.view = window.default_view

         HAT_TAB_BOX.sprite.position = InventoryWindow::InventoryWindowElements::INVENTORY_BOX.sprite.position - SF.vector2(65 * max_scale, 0)
        end

        def self.draw_cosmetics_tabs(window)
            CosmeticsInventoryElements.position_cosmetics_category_elements(window)
            COSMETIC_INVENTORY_BOX_ARRAY.each{ |tab| window.draw(tab.sprite)}
        end
    end
    class CosmeticsInventoryBase < Inventory::InventoryBase
        OWNED_SHIRT_ARRAY = [] of Clothing::ClothingBase
        def initialize(name : String, id : String, max_page_count : Int32, page : Int32, tab : String, sort_type : String, array : Array(Clothing::ClothingBase))
            @name = name
            @id = id
            @max_page_count = max_page_count
            @page = page
            @tab = tab
            @sort_type = sort_type
            @array = array
        end

        property name : String
        property id : String
        property max_page_count : Int32
        property page : Int32
        property tab : String
        property sort_type : String
        property array : Array(Clothing::ClothingBase)

        def draw(window)
            items_per_page = 15
            start_index = @page * items_per_page
            end_index = start_index + items_per_page - 1
          
            self.array[start_index..end_index].each do |item|
              window.draw(item)
            end
        end
          
        # def draw(window)
        #     self.array.each{ |item|
        #     window.draw(item)}
        # end
    end
end