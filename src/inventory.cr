require "crsfml"
require "../src/textures.cr"
require "../src/clothing.cr"
module Inventory
    class InventoryManager
        def initialize(is_inventory_open : Bool)
            @@is_inventory_open = is_inventory_open
        end
        def InventoryManager.is_inventory_open
            @@is_inventory_open
        end
        def InventoryManager.is_inventory_open=(this)
            @@is_inventory_open = this
        end
        def InventoryManager.draw_inventory(window)
          if @@is_inventory_open == true
            if ClothingTab.is_open == true
                ClothingTab.draw_clothing_tab(window)
            elsif WeaponTab.is_open == true
            end
          end
        end
    end
    class ClothingTab #TODO: implement @@owned_clothing_array, draw inventory items
        @@owned_clothing_array = [] of Clothing::Shirt
        #@@owned_clothing_array.push(Clothing::Shirt.get_shirt("White_tank_top").not_nil!)
        #@@owned_clothing_array.push(Clothing::Shirt.get_shirt("Black_tank_top").not_nil!)
        @@clothing_tab_sprite_01 = SF::RectangleShape.new(SF.vector2(600, 400))
        @@clothing_tab_sprite_01.fill_color = SF.color( 137, 170, 208 )
       def initialize(is_open : Bool, page : Int32)
        @@is_open = is_open
        @@page = page
       end

       def ClothingTab.is_open
        @@is_open
       end

       def ClothingTab.page
        @@page
       end

       def ClothingTab.is_open=(this)
        @@is_open = this
       end

       def ClothingTab.page=(this)
        @@page = this
       end

       def ClothingTab.owned_clothing_array
        @@owned_clothing_array
       end

       def ClothingTab.owned_clothing_array=(this)
        @@owned_clothing_array = this
       end

       def ClothingTab.push_to_owned_clothing_array(this)
        @@owned_clothing_array.push(this)
       end

       def ClothingTab.organise_owned_clothing_array_by_type
       end

       def ClothingTab.initialize_clothing_tab(window)
        @@page == 1
        @@clothing_tab_sprite_01.position = SF.vector2(20, 40)
       end

       def ClothingTab.draw_clothing_tab(window)
            current_size = window.size
            original_width = 800 
            original_height = 600
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
    
            scale_ratio = [scale_x, scale_y].min
            max_scale = 1.5
            clamped_scale = [scale_ratio, max_scale].min

        window.view = window.default_view
        @@clothing_tab_sprite_01.position = SF.vector2(20 * max_scale, 40 * max_scale)
        @@clothing_tab_sprite_01.scale = SF.vector2(1, 1)
        window.draw(@@clothing_tab_sprite_01)
       end
    end

    class WeaponTab
        def initialize(is_open : Bool)
            @@is_open = is_open
        end

        def WeaponTab.is_open
            @@is_open
        end

        def WeaponTab.is_open=(this)
            @@is_open = this
        end
    end

    class ConsumableTab
        def initialize(is_open : Bool)
            @@is_open = is_open
        end

        def is_open
            @@is_open
        end

        def is_open=(this)
            @@is_open = this
        end 
    end

    class Ingredients
        def initialize(is_open : Bool)
            @@is_open = is_open
        end

        def is_open
            @@is_open
        end

        def is_open=(this)
            @@is_open = this
        end 
    end

    class MiscItems
        def initialize(is_open : Bool)
            @@is_open = is_open
        end

        def is_open
            @@is_open
        end

        def is_open=(this)
            @@is_open = this
        end 
    end

    class KeyItems
        def initialize(is_open : Bool)
            @@is_open = is_open
        end

        def is_open
            @@is_open
        end

        def is_open=(this)
            @@is_open = this
        end 
    end
end