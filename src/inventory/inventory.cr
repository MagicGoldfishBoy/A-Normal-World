require "crsfml"
require "crsfml/audio"
require "../../src/textures.cr"
require "../../src/utility.cr"
require "../inventory/cosmetics_inventory.cr"

module Inventory
    class InventoryBase
        def initialize(name : String, id : String, max_page_count : Int32, page : Int32, tab : String, sort_type : String)
            @name = name
            @id = id
            @max_page_count = max_page_count
            @page = page
            @tab = tab
            @sort_type = sort_type
        end

        property name : String
        property id : String
        property max_page_count : Int32
        property page : Int32
        property tab : String
        property sort_type : String

        def change_tab(tab)
            self.tab = tab
        end

        def change_page(page)
            if page <= self.max_page_count && page >= 0
             self.page = page
            end
        end

    end
    class InventoryManager
        def initialize(is_open : Bool, current_category : String)
            @is_open = is_open
            @current_category = current_category
        end

        class_property is_open : Bool = false
        class_property current_category : String = "cosmetics"

        def self.draw_inventory(window)
            current_size = window.size
            original_width = 800 
            original_height = 600
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
    
            scale_ratio = [scale_x, scale_y].min
            max_scale = 1.5
            clamped_scale = [scale_ratio, max_scale].min

            window.view = window.default_view

          case current_category
           when "cosmetics"
            CosmeticsInventory::CosmeticsInventoryElements.draw_cosmetics_tabs(window)
          end
        end
    end
    class ItemBase
        def initialize(name : String, id : String, is_stackable : Bool, is_owned : Bool, description : String)
            @name = name
            @id = id
            @is_stackable = is_stackable
            @is_owned = is_owned
            @description = description
        end

        property name : String
        property id : String
        property is_stackable : Bool
        property is_owned : Bool
        property description : String

        def add_item(item, amount)
            if self.is_stackable
                item += amount
            end
        end
        
        def remove_item(item, amount)
            if item.is_stackable && item.amount_owned - amount >= 0
                item.amount -= amount
            elsif item.is_stackable
                item.amount == 0
            end
        end
    end
end