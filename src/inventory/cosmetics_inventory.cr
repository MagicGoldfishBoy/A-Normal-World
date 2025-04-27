require "crsfml"
require "crsfml/audio"
require "../../src/textures.cr"
require "../../src/utility.cr"
require "../../src/inventory/equipment/clothing.cr"
require "../../src/window/inventory_window.cr"
require "../inventory/inventory.cr"
require "../inventory/equipment/hat.cr"

module CosmeticsInventory
    class CosmeticsInventoryManager
        class_property current_tab : String = "hat"
    end
    class CosmeticsInventoryElements

        COSMETIC_INVENTORY_BOX_ARRAY = [] of Ui_Elements::Ui_BoxBase
        COSMETIC_INVENTORY_TEXT_ARRAY = [] of Ui_Elements::Ui_TextBase


        HAT_TAB_BOX = Ui_Elements::Ui_BoxBase.new("Hats", "CosBox01", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1001, 800, 100, 34)), 100.0, 34.0, 3)
        COSMETIC_INVENTORY_BOX_ARRAY << HAT_TAB_BOX

        HAT_TAB_TEXT = Ui_Elements::Ui_TextBase.new("Hat Tab Text", "CosText01", SF::Text.new(HAT_TAB_BOX.name, QUICKSAND, 18))
        COSMETIC_INVENTORY_TEXT_ARRAY << HAT_TAB_TEXT


        GLASSES_TAB_BOX = Ui_Elements::Ui_BoxBase.new("Glasses", "CosBox02", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1001, 800, 100, 34)), 100.0, 34.0, 3)
        COSMETIC_INVENTORY_BOX_ARRAY << GLASSES_TAB_BOX

        GLASSES_TAB_TEXT = Ui_Elements::Ui_TextBase.new("Glasses Tab Text", "CosText02", SF::Text.new(GLASSES_TAB_BOX.name, QUICKSAND, 18))
        COSMETIC_INVENTORY_TEXT_ARRAY << GLASSES_TAB_TEXT


        MAKEUP_TAB_BOX = Ui_Elements::Ui_BoxBase.new("Makeup", "CosBox3", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1001, 800, 100, 34)), 100.0, 34.0, 3)
        COSMETIC_INVENTORY_BOX_ARRAY << MAKEUP_TAB_BOX

        MAKEUP_TAB_TEXT = Ui_Elements::Ui_TextBase.new("Makeup Tab Text", "CosText03", SF::Text.new(MAKEUP_TAB_BOX.name, QUICKSAND, 18))
        COSMETIC_INVENTORY_TEXT_ARRAY << MAKEUP_TAB_TEXT


        EARRING_TAB_BOX = Ui_Elements::Ui_BoxBase.new("Earrings", "CosBox4", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1001, 800, 100, 34)), 100.0, 34.0, 3)
        COSMETIC_INVENTORY_BOX_ARRAY << EARRING_TAB_BOX

        EARRING_TAB_TEXT = Ui_Elements::Ui_TextBase.new("Earring Tab Text", "CosText4", SF::Text.new(EARRING_TAB_BOX.name, QUICKSAND, 18))
        COSMETIC_INVENTORY_TEXT_ARRAY << EARRING_TAB_TEXT


        NECKLACE_TAB_BOX = Ui_Elements::Ui_BoxBase.new("Necklaces", "CosBox5", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1001, 800, 100, 34)), 100.0, 34.0, 3)
        COSMETIC_INVENTORY_BOX_ARRAY << NECKLACE_TAB_BOX

        NECKLACE_TAB_TEXT = Ui_Elements::Ui_TextBase.new("Necklace Tab Text", "CosText5", SF::Text.new(NECKLACE_TAB_BOX.name, QUICKSAND, 18))
        COSMETIC_INVENTORY_TEXT_ARRAY << NECKLACE_TAB_TEXT


        SHIRT_TAB_BOX = Ui_Elements::Ui_BoxBase.new("Shirts", "CosBox6", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1001, 800, 100, 34)), 100.0, 34.0, 3)
        COSMETIC_INVENTORY_BOX_ARRAY << SHIRT_TAB_BOX

        SHIRT_TAB_TEXT = Ui_Elements::Ui_TextBase.new("Shirt Tab Text", "CosText6", SF::Text.new(SHIRT_TAB_BOX.name, QUICKSAND, 18))
        COSMETIC_INVENTORY_TEXT_ARRAY << SHIRT_TAB_TEXT


        JACKET_TAB_BOX = Ui_Elements::Ui_BoxBase.new("Jackets", "CosBox7", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1001, 800, 100, 34)), 100.0, 34.0, 3)
        COSMETIC_INVENTORY_BOX_ARRAY << JACKET_TAB_BOX

        JACKET_TAB_TEXT = Ui_Elements::Ui_TextBase.new("Jacket Tab Text", "CosText7", SF::Text.new(JACKET_TAB_BOX.name, QUICKSAND, 18))
        COSMETIC_INVENTORY_TEXT_ARRAY << JACKET_TAB_TEXT


        GLOVE_TAB_BOX = Ui_Elements::Ui_BoxBase.new("Gloves", "CosBox8", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1001, 800, 100, 34)), 100.0, 34.0, 3)
        COSMETIC_INVENTORY_BOX_ARRAY << GLOVE_TAB_BOX

        GLOVE_TAB_TEXT = Ui_Elements::Ui_TextBase.new("Glove Tab Text", "CosBox8", SF::Text.new(GLOVE_TAB_BOX.name, QUICKSAND, 18))
        COSMETIC_INVENTORY_TEXT_ARRAY << GLOVE_TAB_TEXT


        PANTS_TAB_BOX = Ui_Elements::Ui_BoxBase.new("Pants", "CosBox9", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1001, 800, 100, 34)), 100.0, 34.0, 3)
        COSMETIC_INVENTORY_BOX_ARRAY << PANTS_TAB_BOX

        PANTS_TAB_TEXT = Ui_Elements::Ui_TextBase.new("Pants Tab Text", "CoxText9", SF::Text.new(PANTS_TAB_BOX.name, QUICKSAND, 18))
        COSMETIC_INVENTORY_TEXT_ARRAY << PANTS_TAB_TEXT


        SOCKS_TAB_BOX = Ui_Elements::Ui_BoxBase.new("Socks", "CosBox10", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1001, 800, 100, 34)), 100.0, 34.0, 3)
        COSMETIC_INVENTORY_BOX_ARRAY << SOCKS_TAB_BOX

        SOCKS_TAB_TEXT = Ui_Elements::Ui_TextBase.new("Socks Tab Text", "CosText10", SF::Text.new(SOCKS_TAB_BOX.name, QUICKSAND, 18))
        COSMETIC_INVENTORY_TEXT_ARRAY << SOCKS_TAB_TEXT


        SHOES_TAB_BOX = Ui_Elements::Ui_BoxBase.new("Shoes", "CosBox11", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1001, 800, 100, 34)), 100.0, 34.0, 3)
        COSMETIC_INVENTORY_BOX_ARRAY << SHOES_TAB_BOX

        SHOES_TAB_TEXT = Ui_Elements::Ui_TextBase.new("Shoes Tab Text", "CosText11", SF::Text.new(SHOES_TAB_BOX.name, QUICKSAND, 18))
        COSMETIC_INVENTORY_TEXT_ARRAY << SHOES_TAB_TEXT

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

         HAT_TAB_BOX.sprite.position = InventoryWindow::InventoryWindowElements::INVENTORY_BOX.sprite.position - SF.vector2(65 * max_scale, -8 * max_scale)
         HAT_TAB_TEXT.text.position = HAT_TAB_BOX.sprite.position + SF.vector2(17 * max_scale, 4 * max_scale)

         GLASSES_TAB_BOX.sprite.position = HAT_TAB_BOX.sprite.position + SF.vector2(0, 26 * max_scale)
         GLASSES_TAB_TEXT.text.position = GLASSES_TAB_BOX.sprite.position + SF.vector2(12 * max_scale, 4 * max_scale)

         MAKEUP_TAB_BOX.sprite.position = GLASSES_TAB_BOX.sprite.position + SF.vector2(0, 26 * max_scale)
         MAKEUP_TAB_TEXT.text.position = MAKEUP_TAB_BOX.sprite.position + SF.vector2(10 * max_scale, 4 * max_scale)

         EARRING_TAB_BOX.sprite.position = MAKEUP_TAB_BOX.sprite.position + SF.vector2(0, 26 * max_scale)
         EARRING_TAB_TEXT.text.position = EARRING_TAB_BOX.sprite.position + SF.vector2(10 * max_scale, 4 * max_scale)

         NECKLACE_TAB_BOX.sprite.position = EARRING_TAB_BOX.sprite.position + SF.vector2(0, 26 * max_scale)
         NECKLACE_TAB_TEXT.text.position = NECKLACE_TAB_BOX.sprite.position + SF.vector2(4 * max_scale, 4 * max_scale)

         SHIRT_TAB_BOX.sprite.position = NECKLACE_TAB_BOX.sprite.position + SF.vector2(0, 26 * max_scale)
         SHIRT_TAB_TEXT.text.position = SHIRT_TAB_BOX.sprite.position + SF.vector2(16 * max_scale, 4 * max_scale)

         JACKET_TAB_BOX.sprite.position = SHIRT_TAB_BOX.sprite.position + SF.vector2(0, 26 * max_scale)
         JACKET_TAB_TEXT.text.position = JACKET_TAB_BOX.sprite.position + SF.vector2(12 * max_scale, 4 * max_scale)

         GLOVE_TAB_BOX.sprite.position = JACKET_TAB_BOX.sprite.position + SF.vector2(0, 26 * max_scale)
         GLOVE_TAB_TEXT.text.position = GLOVE_TAB_BOX.sprite.position + SF.vector2(14 * max_scale, 4 * max_scale)

         PANTS_TAB_BOX.sprite.position = GLOVE_TAB_BOX.sprite.position + SF.vector2(0, 26 * max_scale)
         PANTS_TAB_TEXT.text.position = PANTS_TAB_BOX.sprite.position + SF.vector2(16 * max_scale, 4 * max_scale)

         SOCKS_TAB_BOX.sprite.position = PANTS_TAB_BOX.sprite.position + SF.vector2(0, 26 * max_scale)
         SOCKS_TAB_TEXT.text.position = SOCKS_TAB_BOX.sprite.position + SF.vector2(16 * max_scale, 4 * max_scale)

         SHOES_TAB_BOX.sprite.position = SOCKS_TAB_BOX.sprite.position + SF.vector2(0, 26 * max_scale)
         SHOES_TAB_TEXT.text.position = SHOES_TAB_BOX.sprite.position + SF.vector2(16 * max_scale, 4 * max_scale)
        end

        def self.draw_cosmetics_tabs(window)
            CosmeticsInventoryElements.position_cosmetics_category_elements(window)
            COSMETIC_INVENTORY_BOX_ARRAY.each{ |tab| window.draw(tab.sprite)}
            COSMETIC_INVENTORY_TEXT_ARRAY.each{ |text| window.draw(text.text)}

            CosmeticsInventoryBase.draw_clothing_items(window, CosmeticsInventoryManager.current_tab)

            if SF::Mouse.button_pressed?(SF::Mouse::Left)
             self.cosmetics_elements_mouse_handling(window)
            end
        end

        def self.cosmetics_elements_mouse_handling(window)
            mouse_position = SF::Mouse.get_position(window)
            mouse_x = mouse_position.x
            mouse_y = mouse_position.y
    
            current_size = window.size
            original_width = 800
            original_height = 600
        
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
        
            scaled_mouse_x = mouse_x / scale_x
            scaled_mouse_y = mouse_y / scale_y
    
            scale_ratio = [scale_x, scale_y].min
            max_scale = 1.5
            clamped_scale = [scale_ratio, max_scale].min

            window.view = window.default_view
            if MouseHandling::ClickHandling.button_clicked?(HAT_TAB_BOX.sprite, scaled_mouse_x, scaled_mouse_y)
                CosmeticsInventoryManager.current_tab = "hat"
                sleep 0.15.seconds
            elsif MouseHandling::ClickHandling.button_clicked?(GLASSES_TAB_BOX.sprite, scaled_mouse_x, scaled_mouse_y)
                CosmeticsInventoryManager.current_tab = "glasses"
                sleep 0.15.seconds
            elsif MouseHandling::ClickHandling.button_clicked?(InventoryWindow::InventoryWindowElements::LEFT_ARROW.sprite, scaled_mouse_x, scaled_mouse_y)
                CosmeticsInventoryBase::COSMETIC_INVENTORY_ARRAY.each{ |inventory| 
                if inventory.tab == CosmeticsInventoryManager.current_tab && inventory.page - 1 >= 0
                    inventory.page -= 1
                elsif inventory.tab == CosmeticsInventoryManager.current_tab 
                    inventory.page = inventory.max_page_count - 1
                end}
                sleep 0.15.seconds
            elsif MouseHandling::ClickHandling.button_clicked?(InventoryWindow::InventoryWindowElements::RIGHT_ARROW.sprite, scaled_mouse_x, scaled_mouse_y)
                CosmeticsInventoryBase::COSMETIC_INVENTORY_ARRAY.each{ |inventory| 
                if inventory.tab == CosmeticsInventoryManager.current_tab && inventory.page + 1 < inventory.array.size
                    inventory.page += 1
                elsif inventory.tab == CosmeticsInventoryManager.current_tab 
                    inventory.page = 0
                end}
                sleep 0.15.seconds
            end
        end
    end
    class CosmeticsInventoryBase < Inventory::InventoryBase
        OWNED_SHIRT_ARRAY = [] of Clothing::ClothingBase
        COSMETIC_INVENTORY_ARRAY = [] of CosmeticsInventoryBase
        def initialize(name : String, id : String, max_page_count : Int32, page : Int32, tab : String, sort_type : String, array : Array(Clothing::ClothingBase))
            @name = name
            @id = id
            @max_page_count = max_page_count
            @page = page
            @tab = tab
            @sort_type = sort_type
            @array = array
            COSMETIC_INVENTORY_ARRAY << self
        end

        property name : String
        property id : String
        property max_page_count : Int32
        property page : Int32
        property tab : String
        property sort_type : String
        property array : Array(Clothing::ClothingBase)

        def draw(window)
            current_size = window.size
            original_width = 800 
            original_height = 600
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
        
            scale_ratio = [scale_x, scale_y].min
            max_scale = 1.5
            clamped_scale = [scale_ratio, max_scale].min
        
            window.view = window.default_view
        
            items_per_page = 15
            start_index = @page * items_per_page
            end_index = start_index + items_per_page - 1
        
            # Gotta clamp this sucker so it doesn't wander out of bounds
            start_index = [start_index, 0].max
            end_index = [end_index, self.array.size - 1].min
        
            # If the start_index exceeds the array size, run for the hills! :O
            return if start_index >= self.array.size
        
            items_per_row = 5
            spacing_x = 13 * max_scale
            spacing_y = 17 * max_scale
        
            base_position = InventoryWindow::InventoryWindowElements::INVENTORY_SLOT_01.sprite.position + SF.vector2(spacing_x, spacing_y)
        
            current_pos = SF.vector2(base_position.x, base_position.y)
        
            self.array[start_index..end_index].each_with_index do |item, index|
                item.sprite.scale = SF.vector2(2, 2)
                item.sprite.position = current_pos
        
                if self.id == "inv_hat"
                    item.sprite.texture_rect = SF::Rect.new(34, 14, 36, 33)
                end
        
                window.draw(item.sprite)
        
                # Next column
                current_pos.x += spacing_x * 5.85
        
                # Next Row
                if (index + 1) % items_per_row == 0
                    current_pos.x = base_position.x
                    current_pos.y += spacing_y * 4.5
                end
            end
        end
        
        
        # def draw(window)
        #     current_size = window.size
        #     original_width = 800 
        #     original_height = 600
        #     scale_x = current_size.x.to_f / original_width
        #     scale_y = current_size.y.to_f / original_height
          
        #     scale_ratio = [scale_x, scale_y].min
        #     max_scale = 1.5
        #     clamped_scale = [scale_ratio, max_scale].min
          
        #     window.view = window.default_view
          
        #     items_per_page = 15
        #     start_index = @page * items_per_page
        #     end_index = start_index + items_per_page - 1
          
        #     items_per_row = 5
        #     spacing_x = 13 * max_scale
        #     spacing_y = 17 * max_scale
          
        #     base_position = InventoryWindow::InventoryWindowElements::INVENTORY_SLOT_01.sprite.position + SF.vector2(spacing_x, spacing_y)
          
        #     current_pos = SF.vector2(base_position.x, base_position.y)
          
        #     self.array[start_index..end_index].each_with_index do |item, index|
        #       item.sprite.scale = SF.vector2(2, 2)
        #       item.sprite.position = current_pos
          
        #       if self.id == "inv_hat"
        #         item.sprite.texture_rect = SF::Rect.new(34, 14, 36, 33)
        #       end
          
        #       window.draw(item.sprite)
          
        #       # Next column
        #       current_pos.x += spacing_x * 5.85
          
        #       # Next Row
        #       if (index + 1) % items_per_row == 0
        #         current_pos.x = base_position.x
        #         current_pos.y += spacing_y * 4.5
        #       end
        #     end
        #   end
          
        def self.draw_clothing_items(window, tab)
            case tab
            when "hat"
                @@hat_inventory.draw(window)
            end
        end
          
        @@hat_inventory = CosmeticsInventoryBase.new("Hat Inventory", "inv_hat", 5, 0, "hat", "color", Hat::HatBase::OWNED_HAT_ARRAY)
        # def draw(window)
        #     self.array.each{ |item|
        #     window.draw(item)}
        # end
    end
end