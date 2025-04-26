require "crsfml"
require "crsfml/audio"
require "../../src/textures.cr"
require "../../src/utility.cr"

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
    class ItemBase
        def initialize(name : String, id : String, is_stackable : Bool, is_owned : Bool, description : String)
            @name = name
            @id = id
            @is_stackable = is_stackable
            @is_owned = is_owned
            @desciption = description
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