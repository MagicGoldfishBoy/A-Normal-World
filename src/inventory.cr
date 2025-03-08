require "crsfml"
require "../src/textures.cr"
require "../src/clothing.cr"
module Inventory
    class InventoryManager

        def initialize(is_inventory_open : Bool)
            @@is_inventory_open = is_inventory_open
        end
     #----------------------------------objects------------------------------------------------
        @@inventory_box = SF::RectangleShape.new(SF.vector2(610, 420))
        @@inventory_box.fill_color = SF.color( 137, 170, 208 )


        @@inventory_left_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@inventory_left_arrow_sprite.fill_color = SF.color(161, 183, 208)

        @@inventory_right_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@inventory_right_arrow_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_sort_button_sprite = SF::RectangleShape.new(SF.vector2(75, 25))
        @@clothing_sort_button_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_shirt_category_box = SF::RectangleShape.new(SF.vector2(100, 25))
        @@clothing_shirt_category_box.fill_color = SF.color(161, 183, 208)

        @@clothing_sort_button_text = SF::Text.new
        @@clothing_sort_button_text.font = QUICKSAND
        @@clothing_sort_button_text.character_size = 20
        @@clothing_sort_button_text.color = SF::Color::Blue
        @@clothing_sort_button_text.string = "Sort"

        @@clothing_shirt_category_text = SF::Text.new
        @@clothing_shirt_category_text.font = QUICKSAND
        @@clothing_shirt_category_text.character_size = 20
        @@clothing_shirt_category_text.color = SF::Color::Blue
        @@clothing_shirt_category_text.string = ClothingTabShirt.get_shirt_category
        ClothingTabShirt.center_clothing_text(@@clothing_shirt_category_text)


        @@shirt_tab = SF::RectangleShape.new(SF.vector2(100, 50))
        @@shirt_tab.fill_color = SF.color(141, 163, 188)

        @@shirt_tab_text = SF::Text.new
        @@shirt_tab_text.font = QUICKSAND
        @@shirt_tab_text.character_size = 20
        @@shirt_tab_text.color = SF::Color::Blue
        @@shirt_tab_text.string = "Shirts"

        @@pants_tab = SF::RectangleShape.new(SF.vector2(100, 50))
        @@pants_tab.fill_color = SF.color(161, 183, 208)

        @@pants_tab_text = SF::Text.new
        @@pants_tab_text.font = QUICKSAND
        @@pants_tab_text.character_size = 20
        @@pants_tab_text.color = SF::Color::Blue
        @@pants_tab_text.string = "Pants"

        @@clothing_pants_category_text = SF::Text.new
        @@clothing_pants_category_text.font = QUICKSAND
        @@clothing_pants_category_text.character_size = 20
        @@clothing_pants_category_text.color = SF::Color::Blue
        @@clothing_pants_category_text.string = ClothingTabPants.get_pants_category
        ClothingTabShirt.center_clothing_text(@@clothing_pants_category_text)

        @@shoes_tab = SF::RectangleShape.new(SF.vector2(100, 50))
        @@shoes_tab.fill_color = SF.color(161, 183, 208)

        @@shoes_tab_text = SF::Text.new
        @@shoes_tab_text.font = QUICKSAND
        @@shoes_tab_text.character_size = 20
        @@shoes_tab_text.color = SF::Color::Blue
        @@shoes_tab_text.string = "Shoes"

        @@clothing_shoes_category_text = SF::Text.new
        @@clothing_shoes_category_text.font = QUICKSAND
        @@clothing_shoes_category_text.character_size = 20
        @@clothing_shoes_category_text.color = SF::Color::Blue
        @@clothing_shoes_category_text.string = ClothingTabShoes.get_shoes_category
        ClothingTabShirt.center_clothing_text(@@clothing_shoes_category_text)
     #-----------------------------------------------------------------------------------------

        def InventoryManager.is_inventory_open
            @@is_inventory_open
        end
        def InventoryManager.is_inventory_open=(this)
            @@is_inventory_open = this
        end
        def InventoryManager.draw_inventory(window)
          if @@is_inventory_open == true
            if ClothingTabShirt.is_open == true
                InventoryManager.draw_universal_elements(window)
                ClothingTabShirt.draw_clothing_tab(window)
                if SF::Mouse.button_pressed?(SF::Mouse::Left)
                    InventoryManager.universal_mouse_handling("shirt", window)
                end
            elsif ClothingTabPants.is_open == true
                InventoryManager.draw_universal_elements(window)
                ClothingTabPants.draw_clothing_tab(window)
                if SF::Mouse.button_pressed?(SF::Mouse::Left)
                    InventoryManager.universal_mouse_handling("pants", window)
                end
            elsif ClothingTabShoes.is_open == true
                InventoryManager.draw_universal_elements(window)
                ClothingTabShoes.draw_clothing_tab(window)
                if SF::Mouse.button_pressed?(SF::Mouse::Left)
                    InventoryManager.universal_mouse_handling("shoes", window)
                end
            end
          end
        end

        def InventoryManager.draw_universal_elements(window)
            current_size = window.size
            original_width = 800 
            original_height = 600
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
    
            scale_ratio = [scale_x, scale_y].min
            max_scale = 1.5
            clamped_scale = [scale_ratio, max_scale].min

            window.view = window.default_view

            @@inventory_box.position = SF.vector2(80 * max_scale, 40 * max_scale)
            @@inventory_box.scale = SF.vector2(1, 1)
        

            @@inventory_left_arrow_sprite.position = @@inventory_box.position + SF.vector2(200 * max_scale, 15 * max_scale)
            @@inventory_left_arrow_sprite.scale = SF.vector2(1, 1)

            @@inventory_right_arrow_sprite.position = @@inventory_left_arrow_sprite.position + SF.vector2(50 * max_scale, 1 * max_scale)
            @@inventory_right_arrow_sprite.scale = SF.vector2(1, 1)


            @@shirt_tab.position = @@inventory_box.position - SF.vector2(65 * max_scale, 0)
            @@shirt_tab_text.position = @@shirt_tab.position + SF.vector2(15 * max_scale, 7 * max_scale)

            @@pants_tab.position = @@inventory_box.position - SF.vector2(65 * max_scale, -(45 * max_scale))
            @@pants_tab_text.position = @@pants_tab.position + SF.vector2(15 * max_scale, 7 * max_scale)

            @@shoes_tab.position = @@inventory_box.position - SF.vector2(65 * max_scale, -(90 * max_scale))
            @@shoes_tab_text.position = @@shoes_tab.position + SF.vector2(15 * max_scale, 7 * max_scale)


            @@clothing_sort_button_sprite.position = @@inventory_box.position + SF.vector2(50 * max_scale, 15 * max_scale)
            @@clothing_shirt_category_box.position = @@clothing_sort_button_sprite.position + SF.vector2(60 * max_scale, 0)
    
            @@clothing_sort_button_text.position = @@clothing_sort_button_sprite.position + SF.vector2(10 * max_scale, 1 * max_scale)
            @@clothing_shirt_category_text.position = @@clothing_shirt_category_box.position + SF.vector2(15 * max_scale, 1 * max_scale)

            @@clothing_pants_category_text.position = @@clothing_shirt_category_box.position + SF.vector2(15 * max_scale, 1 * max_scale)

            @@clothing_shoes_category_text.position = @@clothing_shirt_category_box.position + SF.vector2(15 * max_scale, 1 * max_scale)

            window.draw(@@inventory_box)

            window.draw(@@inventory_left_arrow_sprite)
            window.draw(@@inventory_right_arrow_sprite)
            window.draw(@@shirt_tab)
            window.draw(@@shirt_tab_text)
            window.draw(@@pants_tab)
            window.draw(@@pants_tab_text)
            window.draw(@@shoes_tab)
            window.draw(@@shoes_tab_text)

            window.draw(@@clothing_sort_button_sprite)
            window.draw(@@clothing_shirt_category_box)
            window.draw(@@clothing_sort_button_text)
            
            if ClothingTabShirt.is_open == true
             window.draw(@@clothing_shirt_category_text)
            elsif ClothingTabPants.is_open == true
             window.draw(@@clothing_pants_category_text)
            elsif ClothingTabShoes.is_open == true
             window.draw(@@clothing_shoes_category_text)
            end
        end

        def InventoryManager.universal_mouse_handling(tab, window)
            case tab
            when "shirt"
                ClothingTabShirt.clothes_mouse_handling(window)
                InventoryManager.shirt_tab_mouse_handling(window)
            when "pants"
                InventoryManager.pants_tab_mouse_handling(window)
                ClothingTabPants.clothes_mouse_handling(window)
            when "shoes"
                InventoryManager.shoes_tab_mouse_handling(window)
                ClothingTabShoes.clothes_mouse_handling(window)
            end
        end

        def InventoryManager.shirt_tab_mouse_handling(window)
            mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window))
            mouse_x = mouse_position.x
            mouse_y = mouse_position.y
            
        
            current_size = window.size
            original_width = 800 
            original_height = 600 
    
            scale_x = (current_size.x.to_f / original_width)
            scale_y = current_size.y.to_f / original_height
    
            #------------------------------------objects-------------------------------------------------
                arrow_left_x = @@inventory_left_arrow_sprite.position.x
                arrow_left_y = @@inventory_left_arrow_sprite.position.y
                arrow_left_width = @@inventory_left_arrow_sprite.size.x
                arrow_left_height = @@inventory_left_arrow_sprite.size.y

                arrow_right_x = @@inventory_right_arrow_sprite.position.x
                arrow_right_y = @@inventory_right_arrow_sprite.position.y
                arrow_right_width = @@inventory_right_arrow_sprite.size.x
                arrow_right_height = @@inventory_right_arrow_sprite.size.y


                sort_button_x = @@clothing_sort_button_sprite.position.x
                sort_button_y = @@clothing_sort_button_sprite.position.y
                sort_button_width = @@clothing_sort_button_sprite.size.x
                sort_button_height = @@clothing_sort_button_sprite.size.y
    
                category_button_x = @@clothing_shirt_category_box.position.x
                category_button_y = @@clothing_shirt_category_box.position.y
                category_button_width = @@clothing_shirt_category_box.size.x
                category_button_height = @@clothing_shirt_category_box.size.y
                

                pants_tab_x = @@pants_tab.position.x
                pants_tab_y = @@pants_tab.position.y
                pants_tab_width = @@pants_tab.size.x
                pants_tab_height = @@pants_tab.size.y

                shoes_tab_x = @@shoes_tab.position.x
                shoes_tab_y = @@shoes_tab.position.y
                shoes_tab_width = @@shoes_tab.size.x
                shoes_tab_height = @@shoes_tab.size.y
            #---------------------------------------------------------------------------------------------

            
            if (mouse_x >= arrow_left_x && mouse_x <= arrow_left_x + arrow_left_width) &&
                (mouse_y >= arrow_left_y && mouse_y <= arrow_left_y + arrow_left_height)
                
                 if ClothingTabShirt.page.not_nil! > 1
                    ClothingTabShirt.page=(ClothingTabShirt.page.not_nil! - 1)
                 end
                 ClothingTabShirt.assign_slot_textures(window)
                 sleep 0.15.seconds
             end
             
             if (mouse_x >= arrow_right_x && mouse_x <= arrow_right_x + arrow_right_width) &&
                (mouse_y >= arrow_right_y && mouse_y <= arrow_right_y + arrow_right_height)
                
                 if ClothingTabShirt.page.not_nil! <= 5
                    ClothingTabShirt.page=(ClothingTabShirt.page.not_nil! + 1)
                 end
                 ClothingTabShirt.assign_slot_textures(window)
                 sleep 0.15.seconds
             end  
            if (mouse_x >= pants_tab_x && mouse_x <= pants_tab_x + pants_tab_width) &&
                (mouse_y >= pants_tab_y && mouse_y <= pants_tab_y + pants_tab_height)
                ClothingTabPants.page=(1)
                ClothingTabShirt.page=(1)
                ClothingTabShoes.page=(1)
                ClothingTabPants.is_open=(true)
                ClothingTabShirt.is_open=(false)
                ClothingTabShoes.is_open=(false)
                ClothingTabPants.assign_slot_textures(window)
            end    
            if (mouse_x >= shoes_tab_x && mouse_x <= shoes_tab_x + shoes_tab_width) &&
                (mouse_y >= shoes_tab_y && mouse_y <= shoes_tab_y + shoes_tab_height)
                ClothingTabShoes.page=(1)
                ClothingTabShirt.page=(1)
                ClothingTabPants.page=(1)
                ClothingTabShoes.is_open=(true)
                ClothingTabShirt.is_open=(false)
                ClothingTabPants.is_open=(false)
                ClothingTabShoes.assign_slot_textures(window)
            end    

            if (mouse_x >= sort_button_x && mouse_x <= sort_button_x + sort_button_width) &&
                (mouse_y >= sort_button_y && mouse_y <= sort_button_y + sort_button_height)
                if ClothingTabShirt.get_shirt_category == "Color"
                 ClothingTabShirt.organise_owned_shirt_array_by_color(window)
                elsif "Sleeve_Length"
                 ClothingTabShirt.organise_owned_shirt_array_by_sleeve_length_short_to_long(window)
                end
                 sleep 0.15.seconds
             end        
     
             if (mouse_x >= category_button_x && mouse_x <= category_button_x + category_button_width) &&
                (mouse_y >= category_button_y && mouse_y <= category_button_y + category_button_height)
                
                 ClothingTabShirt.change_shirt_sort_category
                 @@clothing_shirt_category_text.string = ClothingTabShirt.get_shirt_category
                 ClothingTabShirt.center_clothing_text(@@clothing_shirt_category_text)
                 sleep 0.15.seconds
             end
        end

        def InventoryManager.pants_tab_mouse_handling(window)
            mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window))
            mouse_x = mouse_position.x
            mouse_y = mouse_position.y
            
        
            current_size = window.size
            original_width = 800 
            original_height = 600 
    
            scale_x = (current_size.x.to_f / original_width)
            scale_y = current_size.y.to_f / original_height
    
            #------------------------------------objects-------------------------------------------------
                arrow_left_x = @@inventory_left_arrow_sprite.position.x
                arrow_left_y = @@inventory_left_arrow_sprite.position.y
                arrow_left_width = @@inventory_left_arrow_sprite.size.x
                arrow_left_height = @@inventory_left_arrow_sprite.size.y

                arrow_right_x = @@inventory_right_arrow_sprite.position.x
                arrow_right_y = @@inventory_right_arrow_sprite.position.y
                arrow_right_width = @@inventory_right_arrow_sprite.size.x
                arrow_right_height = @@inventory_right_arrow_sprite.size.y


                sort_button_x = @@clothing_sort_button_sprite.position.x
                sort_button_y = @@clothing_sort_button_sprite.position.y
                sort_button_width = @@clothing_sort_button_sprite.size.x
                sort_button_height = @@clothing_sort_button_sprite.size.y
    
                category_button_x = @@clothing_shirt_category_box.position.x
                category_button_y = @@clothing_shirt_category_box.position.y
                category_button_width = @@clothing_shirt_category_box.size.x
                category_button_height = @@clothing_shirt_category_box.size.y
                
                shirt_tab_x = @@shirt_tab.position.x
                shirt_tab_y = @@shirt_tab.position.y
                shirt_tab_width = @@shirt_tab.size.x
                shirt_tab_height = @@shirt_tab.size.y
                
                shoes_tab_x = @@shoes_tab.position.x
                shoes_tab_y = @@shoes_tab.position.y
                shoes_tab_width = @@shoes_tab.size.x
                shoes_tab_height = @@shoes_tab.size.y
            #---------------------------------------------------------------------------------------------
             if (mouse_x >= arrow_left_x && mouse_x <= arrow_left_x + arrow_left_width) &&
                (mouse_y >= arrow_left_y && mouse_y <= arrow_left_y + arrow_left_height)
                
                 if ClothingTabPants.page.not_nil! > 1
                    ClothingTabPants.page=(ClothingTabPants.page.not_nil! - 1)
                 end
                 ClothingTabPants.assign_slot_textures(window)
                 sleep 0.15.seconds
             end
             
             if (mouse_x >= arrow_right_x && mouse_x <= arrow_right_x + arrow_right_width) &&
                (mouse_y >= arrow_right_y && mouse_y <= arrow_right_y + arrow_right_height)
                
                 if ClothingTabPants.page.not_nil! <= 5
                    ClothingTabPants.page=(ClothingTabPants.page.not_nil! + 1)
                 end
                 ClothingTabPants.assign_slot_textures(window)
                 sleep 0.15.seconds
             end  

            if (mouse_x >= shirt_tab_x && mouse_x <= shirt_tab_x + shirt_tab_width) &&
                (mouse_y >= shirt_tab_y && mouse_y <= shirt_tab_y + shirt_tab_height)
                ClothingTabPants.page=(1)
                ClothingTabShirt.page=(1)
                ClothingTabShirt.is_open=(true)
                ClothingTabPants.is_open=(false)
                ClothingTabShirt.assign_slot_textures(window)
            end 

            if (mouse_x >= shoes_tab_x && mouse_x <= shoes_tab_x + shoes_tab_width) &&
                (mouse_y >= shoes_tab_y && mouse_y <= shoes_tab_y + shoes_tab_height)
                ClothingTabPants.page=(1)
                ClothingTabShoes.page=(1)
                ClothingTabShoes.is_open=(true)
                ClothingTabPants.is_open=(false)
                ClothingTabShoes.assign_slot_textures(window)
            end 
            
            if (mouse_x >= sort_button_x && mouse_x <= sort_button_x + sort_button_width) &&
                (mouse_y >= sort_button_y && mouse_y <= sort_button_y + sort_button_height)
                if ClothingTabPants.get_pants_category == "Color"
                 ClothingTabPants.organise_owned_pants_array_by_color(window)
                elsif "Length"
                 ClothingTabPants.organise_owned_pants_array_by_sleeve_length_short_to_long(window)
                end
                 sleep 0.15.seconds
             end        
     
             if (mouse_x >= category_button_x && mouse_x <= category_button_x + category_button_width) &&
                (mouse_y >= category_button_y && mouse_y <= category_button_y + category_button_height)
                 ClothingTabPants.change_pants_sort_category
                 @@clothing_pants_category_text.string = ClothingTabPants.get_pants_category
                 ClothingTabPants.center_clothing_text(@@clothing_pants_category_text)
                 sleep 0.15.seconds
             end   
        end

        def InventoryManager.shoes_tab_mouse_handling(window)
            mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window))
            mouse_x = mouse_position.x
            mouse_y = mouse_position.y
            
        
            current_size = window.size
            original_width = 800 
            original_height = 600 
    
            scale_x = (current_size.x.to_f / original_width)
            scale_y = current_size.y.to_f / original_height
    
            #------------------------------------objects-------------------------------------------------
                arrow_left_x = @@inventory_left_arrow_sprite.position.x
                arrow_left_y = @@inventory_left_arrow_sprite.position.y
                arrow_left_width = @@inventory_left_arrow_sprite.size.x
                arrow_left_height = @@inventory_left_arrow_sprite.size.y

                arrow_right_x = @@inventory_right_arrow_sprite.position.x
                arrow_right_y = @@inventory_right_arrow_sprite.position.y
                arrow_right_width = @@inventory_right_arrow_sprite.size.x
                arrow_right_height = @@inventory_right_arrow_sprite.size.y


                sort_button_x = @@clothing_sort_button_sprite.position.x
                sort_button_y = @@clothing_sort_button_sprite.position.y
                sort_button_width = @@clothing_sort_button_sprite.size.x
                sort_button_height = @@clothing_sort_button_sprite.size.y
    
                category_button_x = @@clothing_shirt_category_box.position.x
                category_button_y = @@clothing_shirt_category_box.position.y
                category_button_width = @@clothing_shirt_category_box.size.x
                category_button_height = @@clothing_shirt_category_box.size.y
                
                shirt_tab_x = @@shirt_tab.position.x
                shirt_tab_y = @@shirt_tab.position.y
                shirt_tab_width = @@shirt_tab.size.x
                shirt_tab_height = @@shirt_tab.size.y
                
                pants_tab_x = @@pants_tab.position.x
                pants_tab_y = @@pants_tab.position.y
                pants_tab_width = @@pants_tab.size.x
                pants_tab_height = @@pants_tab.size.y
                
                shoes_tab_x = @@shoes_tab.position.x
                shoes_tab_y = @@shoes_tab.position.y
                shoes_tab_width = @@shoes_tab.size.x
                shoes_tab_height = @@shoes_tab.size.y
            #---------------------------------------------------------------------------------------------
             if (mouse_x >= arrow_left_x && mouse_x <= arrow_left_x + arrow_left_width) &&
                (mouse_y >= arrow_left_y && mouse_y <= arrow_left_y + arrow_left_height)
                
                 if ClothingTabShoes.page.not_nil! > 1
                    ClothingTabShoes.page=(ClothingTabShoes.page.not_nil! - 1)
                 end
                 ClothingTabShoes.assign_slot_textures(window)
                 sleep 0.15.seconds
             end
             
             if (mouse_x >= arrow_right_x && mouse_x <= arrow_right_x + arrow_right_width) &&
                (mouse_y >= arrow_right_y && mouse_y <= arrow_right_y + arrow_right_height)
                
                 if ClothingTabShoes.page.not_nil! <= 5
                    ClothingTabShoes.page=(ClothingTabShoes.page.not_nil! + 1)
                 end
                 ClothingTabShoes.assign_slot_textures(window)
                 sleep 0.15.seconds
             end  

            if (mouse_x >= shirt_tab_x && mouse_x <= shirt_tab_x + shirt_tab_width) &&
                (mouse_y >= shirt_tab_y && mouse_y <= shirt_tab_y + shirt_tab_height)
                ClothingTabShoes.page=(1)
                ClothingTabShirt.page=(1)
                ClothingTabShirt.is_open=(true)
                ClothingTabShoes.is_open=(false)
                ClothingTabShirt.assign_slot_textures(window)
            end 

            if (mouse_x >= pants_tab_x && mouse_x <= pants_tab_x + pants_tab_width) &&
                (mouse_y >= pants_tab_y && mouse_y <= pants_tab_y + pants_tab_height)
                ClothingTabShoes.page=(1)
                ClothingTabPants.page=(1)
                ClothingTabPants.is_open=(true)
                ClothingTabShoes.is_open=(false)
                ClothingTabPants.assign_slot_textures(window)
            end 
            
            if (mouse_x >= sort_button_x && mouse_x <= sort_button_x + sort_button_width) &&
                (mouse_y >= sort_button_y && mouse_y <= sort_button_y + sort_button_height)
                if ClothingTabShoes.get_shoes_category == "Color"
                 ClothingTabShoes.organise_owned_shoes_array_by_color(window)
                elsif "Length"
                 ClothingTabShoes.organise_owned_shoes_array_by_sleeve_length_short_to_long(window)
                end
                 sleep 0.15.seconds
             end        
     
             if (mouse_x >= category_button_x && mouse_x <= category_button_x + category_button_width) &&
                (mouse_y >= category_button_y && mouse_y <= category_button_y + category_button_height)
                 ClothingTabShoes.change_shoes_sort_category
                 @@clothing_shoes_category_text.string = ClothingTabShoes.get_shoes_category
                 ClothingTabShoes.center_clothing_text(@@clothing_shoes_category_text)
                 sleep 0.15.seconds
             end  
        end
    end
    class ClothingTabShirt 

        @@owned_shirt_array = [] of Clothing::Shirt

        @@shirt_sorting_category = "Length"

        @@shirt_slot_01 : Clothing::Shirt? = nil
        @@shirt_slot_02 : Clothing::Shirt? = nil
        @@shirt_slot_03 : Clothing::Shirt? = nil
        @@shirt_slot_04 : Clothing::Shirt? = nil
        @@shirt_slot_05 : Clothing::Shirt? = nil
        @@shirt_slot_06 : Clothing::Shirt? = nil
        @@shirt_slot_07 : Clothing::Shirt? = nil
        @@shirt_slot_08 : Clothing::Shirt? = nil
        @@shirt_slot_09 : Clothing::Shirt? = nil
        @@shirt_slot_10 : Clothing::Shirt? = nil
        @@shirt_slot_11 : Clothing::Shirt? = nil
        @@shirt_slot_12 : Clothing::Shirt? = nil
        @@shirt_slot_13 : Clothing::Shirt? = nil
        @@shirt_slot_14 : Clothing::Shirt? = nil
        @@shirt_slot_15 : Clothing::Shirt? = nil

      #---------------------------------debug-------------------------------------------
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("White Tank Top").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Black Tank Top").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Red Tank Top").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Orange Tank Top").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Yellow Tank Top").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Green Tank Top").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Blue Tank Top").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Purple Tank Top").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Pink Tank Top").not_nil!)

        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("White_T-Shirt").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Black_T-Shirt").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Red_T-Shirt").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Orange_T-Shirt").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Yellow_T-Shirt").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Green_T-Shirt").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Blue_T-Shirt").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Purple T-Shirt").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Pink T-Shirt").not_nil!)

        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("White Tube-Top").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Black Tube-Top").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Red Tube-Top").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Orange Tube-Top").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Yellow Tube-Top").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Green Tube-Top").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Blue Tube-Top").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Purple Tube-Top").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Pink Tube-Top").not_nil!)

        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("White Layered Shirt").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Black Layered Shirt").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Red Layered Shirt").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Orange Layered Shirt").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Yellow Layered Shirt").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Green Layered Shirt").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Blue Layered Shirt").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Purple Layered Shirt").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Pink Layered Shirt").not_nil!)
      #---------------------------------------------------------------------------------
        
      #--------------------------------objects------------------------------------------
        @@clothing_box_sprite = SF::RectangleShape.new(SF.vector2(610, 420))
        @@clothing_box_sprite.fill_color = SF.color( 137, 170, 208 )

        @@clothing_right_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_right_arrow_sprite.fill_color = SF.color(161, 183, 208)


        @@shirt_slot_01_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shirt_slot_01_sprite.fill_color = SF.color(161, 183, 208)

        @@shirt_slot_01_text = SF::Text.new
        @@shirt_slot_01_text.font = QUICKSAND
        @@shirt_slot_01_text.character_size = 12
        @@shirt_slot_01_text.color = SF::Color::Blue

        @@shirt_slot_01_image_sprite = SF::Sprite.new


        @@shirt_slot_02_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shirt_slot_02_sprite.fill_color = SF.color(161, 183, 208)

        @@shirt_slot_02_text = SF::Text.new
        @@shirt_slot_02_text.font = QUICKSAND
        @@shirt_slot_02_text.character_size = 12
        @@shirt_slot_02_text.color = SF::Color::Blue

        @@shirt_slot_02_image_sprite = SF::Sprite.new


        @@shirt_slot_03_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shirt_slot_03_sprite.fill_color = SF.color(161, 183, 208)

        @@shirt_slot_03_text = SF::Text.new
        @@shirt_slot_03_text.font = QUICKSAND
        @@shirt_slot_03_text.character_size = 12
        @@shirt_slot_03_text.color = SF::Color::Blue

        @@shirt_slot_03_image_sprite = SF::Sprite.new


        @@shirt_slot_04_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shirt_slot_04_sprite.fill_color = SF.color(161, 183, 208)

        @@shirt_slot_04_text = SF::Text.new
        @@shirt_slot_04_text.font = QUICKSAND
        @@shirt_slot_04_text.character_size = 12
        @@shirt_slot_04_text.color = SF::Color::Blue

        @@shirt_slot_04_image_sprite = SF::Sprite.new


        @@shirt_slot_05_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shirt_slot_05_sprite.fill_color = SF.color(161, 183, 208)

        @@shirt_slot_05_text = SF::Text.new
        @@shirt_slot_05_text.font = QUICKSAND
        @@shirt_slot_05_text.character_size = 12
        @@shirt_slot_05_text.color = SF::Color::Blue

        @@shirt_slot_05_image_sprite = SF::Sprite.new


        @@shirt_slot_06_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shirt_slot_06_sprite.fill_color = SF.color(161, 183, 208)

        @@shirt_slot_06_text = SF::Text.new
        @@shirt_slot_06_text.font = QUICKSAND
        @@shirt_slot_06_text.character_size = 12
        @@shirt_slot_06_text.color = SF::Color::Blue
        
        @@shirt_slot_06_image_sprite = SF::Sprite.new


        @@shirt_slot_07_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shirt_slot_07_sprite.fill_color = SF.color(161, 183, 208)

        @@shirt_slot_07_text = SF::Text.new
        @@shirt_slot_07_text.font = QUICKSAND
        @@shirt_slot_07_text.character_size = 12
        @@shirt_slot_07_text.color = SF::Color::Blue

        @@shirt_slot_07_image_sprite = SF::Sprite.new


        @@shirt_slot_08_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shirt_slot_08_sprite.fill_color = SF.color(161, 183, 208)

        @@shirt_slot_08_text = SF::Text.new
        @@shirt_slot_08_text.font = QUICKSAND
        @@shirt_slot_08_text.character_size = 12
        @@shirt_slot_08_text.color = SF::Color::Blue

        @@shirt_slot_08_image_sprite = SF::Sprite.new


        @@shirt_slot_09_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shirt_slot_09_sprite.fill_color = SF.color(161, 183, 208)

        @@shirt_slot_09_text = SF::Text.new
        @@shirt_slot_09_text.font = QUICKSAND
        @@shirt_slot_09_text.character_size = 12
        @@shirt_slot_09_text.color = SF::Color::Blue

        @@shirt_slot_09_image_sprite = SF::Sprite.new


        @@shirt_slot_10_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shirt_slot_10_sprite.fill_color = SF.color(161, 183, 208)

        @@shirt_slot_10_text = SF::Text.new
        @@shirt_slot_10_text.font = QUICKSAND
        @@shirt_slot_10_text.character_size = 12
        @@shirt_slot_10_text.color = SF::Color::Blue

        @@shirt_slot_10_image_sprite = SF::Sprite.new


        @@shirt_slot_11_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shirt_slot_11_sprite.fill_color = SF.color(161, 183, 208)

        @@shirt_slot_11_text = SF::Text.new
        @@shirt_slot_11_text.font = QUICKSAND
        @@shirt_slot_11_text.character_size = 12
        @@shirt_slot_11_text.color = SF::Color::Blue

        @@shirt_slot_11_image_sprite = SF::Sprite.new


        @@shirt_slot_12_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shirt_slot_12_sprite.fill_color = SF.color(161, 183, 208)

        @@shirt_slot_12_text = SF::Text.new
        @@shirt_slot_12_text.font = QUICKSAND
        @@shirt_slot_12_text.character_size = 12
        @@shirt_slot_12_text.color = SF::Color::Blue

        @@shirt_slot_12_image_sprite = SF::Sprite.new


        @@shirt_slot_13_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shirt_slot_13_sprite.fill_color = SF.color(161, 183, 208)

        @@shirt_slot_13_text = SF::Text.new
        @@shirt_slot_13_text.font = QUICKSAND
        @@shirt_slot_13_text.character_size = 12
        @@shirt_slot_13_text.color = SF::Color::Blue

        @@shirt_slot_13_image_sprite = SF::Sprite.new


        @@shirt_slot_14_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shirt_slot_14_sprite.fill_color = SF.color(161, 183, 208)

        @@shirt_slot_14_text = SF::Text.new
        @@shirt_slot_14_text.font = QUICKSAND
        @@shirt_slot_14_text.character_size = 12
        @@shirt_slot_14_text.color = SF::Color::Blue

        @@shirt_slot_14_image_sprite = SF::Sprite.new


        @@shirt_slot_15_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shirt_slot_15_sprite.fill_color = SF.color(161, 183, 208)

        @@shirt_slot_15_text = SF::Text.new
        @@shirt_slot_15_text.font = QUICKSAND
        @@shirt_slot_15_text.character_size = 12
        @@shirt_slot_15_text.color = SF::Color::Blue

        @@shirt_slot_15_image_sprite = SF::Sprite.new
      #---------------------------------------------------------------------------------


       def initialize(is_open : Bool, page : Int32)
        @@is_open = is_open
        @@page = page
       end

       def ClothingTabShirt.is_open
        @@is_open
       end

       def ClothingTabShirt.page
        @@page
       end

       def ClothingTabShirt.is_open=(this)
        @@is_open = this
       end

       def ClothingTabShirt.page=(this)
        @@page = this
       end

       def ClothingTabShirt.owned_shirt_array
        @@owned_shirt_array
       end

       def ClothingTabShirt.owned_shirt_array=(this)
        @@owned_shirt_array = this
       end

       def ClothingTabShirt.push_to_owned_shirt_array(this)
        @@owned_shirt_array.push(this)
       end

       def ClothingTabShirt.change_shirt_sort_category
        case @@shirt_sorting_category
        when "Length"
            @@shirt_sorting_category = "Color"
        when "Color"
            @@shirt_sorting_category = "Length"
        end
       end

       def ClothingTabShirt.get_shirt_category
        return @@shirt_sorting_category
       end

       def ClothingTabShirt.organise_owned_shirt_array_by_color(window)
        temp_clothing_array_01 = [] of Clothing::Shirt
        @@owned_shirt_array.each { |shirt| if shirt.color == "white"
        temp_clothing_array_01.push(shirt)
        end}

        @@owned_shirt_array.each { |shirt| if shirt.color == "black"
        temp_clothing_array_01.push(shirt)
        end}

        @@owned_shirt_array.each { |shirt| if shirt.color == "red"
        temp_clothing_array_01.push(shirt)
        end}

        @@owned_shirt_array.each { |shirt| if shirt.color == "orange"
        temp_clothing_array_01.push(shirt)
        end}

        @@owned_shirt_array.each { |shirt| if shirt.color == "yellow"
        temp_clothing_array_01.push(shirt)
        end}

        @@owned_shirt_array.each { |shirt| if shirt.color == "green"
        temp_clothing_array_01.push(shirt)
        end}

        @@owned_shirt_array.each { |shirt| if shirt.color == "blue"
        temp_clothing_array_01.push(shirt)
        end}

        @@owned_shirt_array.each { |shirt| if shirt.color == "purple"
        temp_clothing_array_01.push(shirt)
        end}

        @@owned_shirt_array.each { |shirt| if shirt.color == "pink"
        temp_clothing_array_01.push(shirt)
        end}

        @@owned_shirt_array.clear
        @@owned_shirt_array = temp_clothing_array_01
        @@owned_shirt_array.uniq!
        ClothingTabShirt.assign_slot_textures(window)
       end

       def ClothingTabShirt.organise_owned_shirt_array_by_sleeve_length_short_to_long(window)
        temp_clothing_array_01 = [] of Clothing::Shirt
        @@owned_shirt_array.each { |shirt| if shirt.sleeve_length.includes?("none") == true
        temp_clothing_array_01.push(shirt)
        end}

        @@owned_shirt_array.each { |shirt| if shirt.sleeve_length.includes?("very_short") == true
        temp_clothing_array_01.push(shirt)
        end}

        @@owned_shirt_array.each { |shirt| if shirt.sleeve_length.includes?("short") == true
        temp_clothing_array_01.push(shirt)
        end}

        @@owned_shirt_array.each { |shirt| if shirt.sleeve_length.includes?("long") == true
        temp_clothing_array_01.push(shirt)
        end}

        @@owned_shirt_array.clear
        @@owned_shirt_array = temp_clothing_array_01
        @@owned_shirt_array.uniq!
        ClothingTabShirt.assign_slot_textures(window)
       end

       def ClothingTabShirt.center_clothing_text(this)
        if this.string.size <= 5
            this.character_size = 20

            x = this.position.x - (this.string.size + 6)
            this.position = SF.vector2(x, this.position.y)

        elsif this.string.size > 5 && this.string.size < 10
            this.character_size = 15

            x = this.position.x - (this.string.size + 5)
            this.position = SF.vector2(x, this.position.y)

        elsif this.string.size >= 10 && this.string.size < 15
            this.character_size = 11

            x = this.position.x - (this.string.size - 12)
            y = this.position.y + 2
            this.position = SF.vector2(x, y)

        elsif this.string.size >= 15
            this.character_size = 11

            x = this.position.x - (this.string.size - 12)
            this.position = SF.vector2(x, this.position.y)
        end
     end

       def ClothingTabShirt.initialize_clothing_tab(window)
        @@page = 1
        @@clothing_box_sprite.position = SF.vector2(20, 40)  
       end

       def ClothingTabShirt.assign_slot_textures(window)
        if @@page == nil
            @@page = 1
        end
        if @@owned_shirt_array.size > 0
            t = 0 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shirt_array.size - 1
             @@shirt_slot_01_image_sprite.texture = @@owned_shirt_array[t].texture
             @@shirt_slot_01_text.string = @@owned_shirt_array[t].name
             @@shirt_slot_01 = @@owned_shirt_array[t]
            else
                @@shirt_slot_01_image_sprite.texture = NIL_TEXTURE
                @@shirt_slot_01_text.string = ""
                @@shirt_slot_01 = nil
            end
        end
        if @@owned_shirt_array.size > 1
            t = 1 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shirt_array.size - 1
             @@shirt_slot_02_image_sprite.texture = @@owned_shirt_array[t].texture
             @@shirt_slot_02_text.string = @@owned_shirt_array[t].name
             @@shirt_slot_02 = @@owned_shirt_array[t]
            else
                @@shirt_slot_02_image_sprite.texture = NIL_TEXTURE
                @@shirt_slot_02_text.string = ""
                @@shirt_slot_02 = nil
            end
        end
        if @@owned_shirt_array.size > 2
            t = 2 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shirt_array.size - 1
             @@shirt_slot_03_image_sprite.texture = @@owned_shirt_array[t].texture
             @@shirt_slot_03_text.string = @@owned_shirt_array[t].name
             @@shirt_slot_03 = @@owned_shirt_array[t]
            else
                @@shirt_slot_03_image_sprite.texture = NIL_TEXTURE
                @@shirt_slot_03_text.string = ""
                @@shirt_slot_03 = nil
            end
        end
        if @@owned_shirt_array.size > 3
            t = 3 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shirt_array.size - 1
             @@shirt_slot_04_image_sprite.texture = @@owned_shirt_array[t].texture
             @@shirt_slot_04_text.string = @@owned_shirt_array[t].name
             @@shirt_slot_04 = @@owned_shirt_array[t]
            else
                @@shirt_slot_04_image_sprite.texture = NIL_TEXTURE
                @@shirt_slot_04_text.string = ""
                @@shirt_slot_04 = nil
            end
        end
        if @@owned_shirt_array.size > 4
            t = 4 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shirt_array.size - 1
             @@shirt_slot_05_image_sprite.texture = @@owned_shirt_array[t].texture
             @@shirt_slot_05_text.string = @@owned_shirt_array[t].name
             @@shirt_slot_05 = @@owned_shirt_array[t]
            else
                @@shirt_slot_05_image_sprite.texture = NIL_TEXTURE
                @@shirt_slot_05_text.string = ""
                @@shirt_slot_05 = nil
            end
        end
        if @@owned_shirt_array.size > 5
            t = 5 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shirt_array.size - 1
             @@shirt_slot_06_image_sprite.texture = @@owned_shirt_array[t].texture
             @@shirt_slot_06_text.string = @@owned_shirt_array[t].name
             @@shirt_slot_06 = @@owned_shirt_array[t]
            else
                @@shirt_slot_06_image_sprite.texture = NIL_TEXTURE
                @@shirt_slot_06_text.string = ""
                @@shirt_slot_06 = nil
            end
        end
        if @@owned_shirt_array.size > 6
            t = 6 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shirt_array.size - 1
             @@shirt_slot_07_image_sprite.texture = @@owned_shirt_array[t].texture
             @@shirt_slot_07_text.string = @@owned_shirt_array[t].name
             @@shirt_slot_07 = @@owned_shirt_array[t]
            else
                @@shirt_slot_07_image_sprite.texture = NIL_TEXTURE
                @@shirt_slot_07_text.string = ""
                @@shirt_slot_07 = nil
            end
        end
        if @@owned_shirt_array.size > 7
            t = 7 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shirt_array.size - 1
             @@shirt_slot_08_image_sprite.texture = @@owned_shirt_array[t].texture
             @@shirt_slot_08_text.string = @@owned_shirt_array[t].name
             @@shirt_slot_08 = @@owned_shirt_array[t]
            else
                @@shirt_slot_08_image_sprite.texture = NIL_TEXTURE
                @@shirt_slot_08_text.string = ""
                @@shirt_slot_08 = nil
            end
        end
        if @@owned_shirt_array.size > 8
            t = 8 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shirt_array.size - 1
             @@shirt_slot_09_image_sprite.texture = @@owned_shirt_array[t].texture
             @@shirt_slot_09_text.string = @@owned_shirt_array[t].name
             @@shirt_slot_09 = @@owned_shirt_array[t]
            else
                @@shirt_slot_09_image_sprite.texture = NIL_TEXTURE
                @@shirt_slot_09_text.string = ""
                @@shirt_slot_09 = nil
            end
        end
        if @@owned_shirt_array.size > 9
            t = 9 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shirt_array.size - 1
             @@shirt_slot_10_image_sprite.texture = @@owned_shirt_array[t].texture
             @@shirt_slot_10_text.string = @@owned_shirt_array[t].name
             @@shirt_slot_10 = @@owned_shirt_array[t]
            else
                @@shirt_slot_10_image_sprite.texture = NIL_TEXTURE
                @@shirt_slot_10_text.string = ""
                @@shirt_slot_10 = nil
            end
        end
        if @@owned_shirt_array.size > 10
            t = 10 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shirt_array.size - 1
             @@shirt_slot_11_image_sprite.texture = @@owned_shirt_array[t].texture
             @@shirt_slot_11_text.string = @@owned_shirt_array[t].name
             @@shirt_slot_11 = @@owned_shirt_array[t]
            else
                @@shirt_slot_11_image_sprite.texture = NIL_TEXTURE
                @@shirt_slot_11_text.string = ""
                @@shirt_slot_11 = nil
            end
        end
        if @@owned_shirt_array.size > 11
            t = 11 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shirt_array.size - 1
             @@shirt_slot_12_image_sprite.texture = @@owned_shirt_array[t].texture
             @@shirt_slot_12_text.string = @@owned_shirt_array[t].name
             @@shirt_slot_12 = @@owned_shirt_array[t]
            else
                @@shirt_slot_12_image_sprite.texture = NIL_TEXTURE
                @@shirt_slot_12_text.string = ""
                @@shirt_slot_12 = nil
            end
        end
        if @@owned_shirt_array.size > 12
            t = 12 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shirt_array.size - 1
             @@shirt_slot_13_image_sprite.texture = @@owned_shirt_array[t].texture
             @@shirt_slot_13_text.string = @@owned_shirt_array[t].name
             @@shirt_slot_13 = @@owned_shirt_array[t]
            else
                @@shirt_slot_13_image_sprite.texture = NIL_TEXTURE
                @@shirt_slot_13_text.string = ""
                @@shirt_slot_13 = nil
            end
        end
        if @@owned_shirt_array.size > 13
            t = 13 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shirt_array.size - 1
             @@shirt_slot_14_image_sprite.texture = @@owned_shirt_array[t].texture
             @@shirt_slot_14_text.string = @@owned_shirt_array[t].name
             @@shirt_slot_14 = @@owned_shirt_array[t]
            else
                @@shirt_slot_14_image_sprite.texture = NIL_TEXTURE
                @@shirt_slot_14_text.string = ""
                @@shirt_slot_14 = nil
            end
        end
        if @@owned_shirt_array.size > 14
            t = 14 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shirt_array.size - 1
             @@shirt_slot_15_image_sprite.texture = @@owned_shirt_array[t].texture
             @@shirt_slot_15_text.string = @@owned_shirt_array[t].name
             @@shirt_slot_15 = @@owned_shirt_array[t]
            else
                @@shirt_slot_15_image_sprite.texture = NIL_TEXTURE
                @@shirt_slot_15_text.string = ""
                @@shirt_slot_15 = nil
            end
        end
       end
       

       def ClothingTabShirt.draw_clothing_tab(window)
            current_size = window.size
            original_width = 800 
            original_height = 600
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
    
            scale_ratio = [scale_x, scale_y].min
            max_scale = 1.5
            clamped_scale = [scale_ratio, max_scale].min

        window.view = window.default_view #the second frame of the walk cycle should be used for display

        @@clothing_box_sprite.position = SF.vector2(80 * max_scale, 40 * max_scale)
        @@clothing_box_sprite.scale = SF.vector2(1, 1)


        @@shirt_slot_01_sprite.position = @@clothing_box_sprite.position + SF.vector2(10 * max_scale, 40 * max_scale)
        @@shirt_slot_01_sprite.scale = SF.vector2(1, 1)
        
        @@shirt_slot_01_image_sprite.position = @@shirt_slot_01_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_01_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_01_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 

        @@shirt_slot_01_text.position = @@shirt_slot_01_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShirt.center_clothing_text(@@shirt_slot_01_text)
        

        @@shirt_slot_02_sprite.position = @@clothing_box_sprite.position + SF.vector2(90 * max_scale, 40 * max_scale)
        @@shirt_slot_02_sprite.scale = SF.vector2(1, 1)
        
        @@shirt_slot_02_image_sprite.position = @@shirt_slot_02_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_02_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_02_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 

        @@shirt_slot_02_text.position = @@shirt_slot_02_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShirt.center_clothing_text(@@shirt_slot_02_text)
        

        @@shirt_slot_03_sprite.position = @@clothing_box_sprite.position + SF.vector2(170 * max_scale, 40 * max_scale)
        @@shirt_slot_03_sprite.scale = SF.vector2(1, 1)
        
        @@shirt_slot_03_image_sprite.position = @@shirt_slot_03_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_03_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_03_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 

        @@shirt_slot_03_text.position = @@shirt_slot_03_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShirt.center_clothing_text(@@shirt_slot_03_text)
        

        @@shirt_slot_04_sprite.position = @@clothing_box_sprite.position + SF.vector2(250 * max_scale, 40 * max_scale)
        @@shirt_slot_04_sprite.scale = SF.vector2(1, 1)

        @@shirt_slot_04_text.position = @@shirt_slot_04_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShirt.center_clothing_text(@@shirt_slot_04_text)
        
        @@shirt_slot_04_image_sprite.position = @@shirt_slot_04_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_04_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_04_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 


        @@shirt_slot_05_sprite.position = @@clothing_box_sprite.position + SF.vector2(330 * max_scale, 40 * max_scale)
        @@shirt_slot_05_sprite.scale = SF.vector2(1, 1)

        @@shirt_slot_05_text.position = @@shirt_slot_05_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShirt.center_clothing_text(@@shirt_slot_05_text)
        
        @@shirt_slot_05_image_sprite.position = @@shirt_slot_05_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_05_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_05_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@shirt_slot_06_sprite.position = @@clothing_box_sprite.position + SF.vector2(10 * max_scale, 120 * max_scale)
        @@shirt_slot_06_sprite.scale = SF.vector2(1, 1)

        @@shirt_slot_06_text.position = @@shirt_slot_06_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShirt.center_clothing_text(@@shirt_slot_06_text)
        
        @@shirt_slot_06_image_sprite.position = @@shirt_slot_06_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_06_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_06_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@shirt_slot_07_sprite.position = @@clothing_box_sprite.position + SF.vector2(90 * max_scale, 120 * max_scale)
        @@shirt_slot_07_sprite.scale = SF.vector2(1, 1)
        
        @@shirt_slot_07_text.position = @@shirt_slot_07_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShirt.center_clothing_text(@@shirt_slot_07_text)
        
        @@shirt_slot_07_image_sprite.position = @@shirt_slot_07_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_07_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_07_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@shirt_slot_08_sprite.position = @@clothing_box_sprite.position + SF.vector2(170 * max_scale, 120 * max_scale)
        @@shirt_slot_08_sprite.scale = SF.vector2(1, 1)
                
        @@shirt_slot_08_text.position = @@shirt_slot_08_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShirt.center_clothing_text(@@shirt_slot_08_text)
        
        @@shirt_slot_08_image_sprite.position = @@shirt_slot_08_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_08_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_08_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@shirt_slot_09_sprite.position = @@clothing_box_sprite.position + SF.vector2(250 * max_scale, 120 * max_scale)
        @@shirt_slot_09_sprite.scale = SF.vector2(1, 1)
                
        @@shirt_slot_09_text.position = @@shirt_slot_09_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShirt.center_clothing_text(@@shirt_slot_09_text)
        
        @@shirt_slot_09_image_sprite.position = @@shirt_slot_09_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_09_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_09_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@shirt_slot_10_sprite.position = @@clothing_box_sprite.position + SF.vector2(330 * max_scale, 120 * max_scale)
        @@shirt_slot_10_sprite.scale = SF.vector2(1, 1)
                        
        @@shirt_slot_10_text.position = @@shirt_slot_10_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShirt.center_clothing_text(@@shirt_slot_10_text)
        
        @@shirt_slot_10_image_sprite.position = @@shirt_slot_10_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_10_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_10_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@shirt_slot_11_sprite.position = @@clothing_box_sprite.position + SF.vector2(10 * max_scale, 200 * max_scale)
        @@shirt_slot_11_sprite.scale = SF.vector2(1, 1)
                        
        @@shirt_slot_11_text.position = @@shirt_slot_11_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShirt.center_clothing_text(@@shirt_slot_11_text)
        
        @@shirt_slot_11_image_sprite.position = @@shirt_slot_11_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_11_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_11_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@shirt_slot_12_sprite.position = @@clothing_box_sprite.position + SF.vector2(90 * max_scale, 200 * max_scale)
        @@shirt_slot_12_sprite.scale = SF.vector2(1, 1)
                        
        @@shirt_slot_12_text.position = @@shirt_slot_12_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShirt.center_clothing_text(@@shirt_slot_12_text)
        
        @@shirt_slot_12_image_sprite.position = @@shirt_slot_12_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_12_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_12_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@shirt_slot_13_sprite.position = @@clothing_box_sprite.position + SF.vector2(170 * max_scale, 200 * max_scale)
        @@shirt_slot_13_sprite.scale = SF.vector2(1, 1)
        
        @@shirt_slot_13_text.position = @@shirt_slot_13_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShirt.center_clothing_text(@@shirt_slot_13_text)
        
        @@shirt_slot_13_image_sprite.position = @@shirt_slot_13_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_13_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_13_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@shirt_slot_14_sprite.position = @@clothing_box_sprite.position + SF.vector2(250 * max_scale, 200 * max_scale)
        @@shirt_slot_14_sprite.scale = SF.vector2(1, 1)
                        
        @@shirt_slot_14_text.position = @@shirt_slot_14_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShirt.center_clothing_text(@@shirt_slot_14_text)
        
        @@shirt_slot_14_image_sprite.position = @@shirt_slot_14_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_14_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_14_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@shirt_slot_15_sprite.position = @@clothing_box_sprite.position + SF.vector2(330 * max_scale, 200 * max_scale)
        @@shirt_slot_15_sprite.scale = SF.vector2(1, 1)
                        
        @@shirt_slot_15_text.position = @@shirt_slot_15_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShirt.center_clothing_text(@@shirt_slot_15_text)
        
        @@shirt_slot_15_image_sprite.position = @@shirt_slot_15_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_15_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_15_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 


        window.draw(@@shirt_slot_01_sprite)
        window.draw(@@shirt_slot_01_image_sprite)
        window.draw(@@shirt_slot_01_text)

        window.draw(@@shirt_slot_02_sprite)
        window.draw(@@shirt_slot_02_image_sprite)
        window.draw(@@shirt_slot_02_text)

        window.draw(@@shirt_slot_03_sprite)
        window.draw(@@shirt_slot_03_image_sprite)
        window.draw(@@shirt_slot_03_text)
        
        window.draw(@@shirt_slot_04_sprite)
        window.draw(@@shirt_slot_04_image_sprite)
        window.draw(@@shirt_slot_04_text)

        window.draw(@@shirt_slot_05_sprite)
        window.draw(@@shirt_slot_05_image_sprite)
        window.draw(@@shirt_slot_05_text)

        window.draw(@@shirt_slot_06_sprite)
        window.draw(@@shirt_slot_06_image_sprite)
        window.draw(@@shirt_slot_06_text)

        window.draw(@@shirt_slot_07_sprite)
        window.draw(@@shirt_slot_07_image_sprite)
        window.draw(@@shirt_slot_07_text)

        window.draw(@@shirt_slot_08_sprite)
        window.draw(@@shirt_slot_08_image_sprite)
        window.draw(@@shirt_slot_08_text)

        window.draw(@@shirt_slot_09_sprite)
        window.draw(@@shirt_slot_09_image_sprite)
        window.draw(@@shirt_slot_09_text)

        window.draw(@@shirt_slot_10_sprite)
        window.draw(@@shirt_slot_10_image_sprite)
        window.draw(@@shirt_slot_10_text)

        window.draw(@@shirt_slot_11_sprite)
        window.draw(@@shirt_slot_11_image_sprite)
        window.draw(@@shirt_slot_11_text)

        window.draw(@@shirt_slot_12_sprite)
        window.draw(@@shirt_slot_12_image_sprite)
        window.draw(@@shirt_slot_12_text)

        window.draw(@@shirt_slot_13_sprite)
        window.draw(@@shirt_slot_13_image_sprite)
        window.draw(@@shirt_slot_13_text)

        window.draw(@@shirt_slot_14_sprite)
        window.draw(@@shirt_slot_14_image_sprite)
        window.draw(@@shirt_slot_14_text)

        window.draw(@@shirt_slot_15_sprite)
        window.draw(@@shirt_slot_15_image_sprite)
        window.draw(@@shirt_slot_15_text)

        if SF::Mouse.button_pressed?(SF::Mouse::Left)
            ClothingTabShirt.clothes_mouse_handling(window)
        end
       end

       def ClothingTabShirt.clothes_mouse_handling(window)
        mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window))
        mouse_x = mouse_position.x
        mouse_y = mouse_position.y
        
    
        current_size = window.size
        original_width = 800 
        original_height = 600 

        scale_x = (current_size.x.to_f / original_width)
        scale_y = current_size.y.to_f / original_height

        #------------------------------------objects-------------------------------------------------

            slot_01_x = @@shirt_slot_01_sprite.position.x
            slot_01_y = @@shirt_slot_01_sprite.position.y
            slot_01_width = @@shirt_slot_01_sprite.size.x
            slot_01_height = @@shirt_slot_01_sprite.size.y

            slot_02_x = @@shirt_slot_02_sprite.position.x
            slot_02_y = @@shirt_slot_02_sprite.position.y
            slot_02_width = @@shirt_slot_02_sprite.size.x
            slot_02_height = @@shirt_slot_02_sprite.size.y

            slot_03_x = @@shirt_slot_03_sprite.position.x
            slot_03_y = @@shirt_slot_03_sprite.position.y
            slot_03_width = @@shirt_slot_03_sprite.size.x
            slot_03_height = @@shirt_slot_03_sprite.size.y

            slot_04_x = @@shirt_slot_04_sprite.position.x
            slot_04_y = @@shirt_slot_04_sprite.position.y
            slot_04_width = @@shirt_slot_04_sprite.size.x
            slot_04_height = @@shirt_slot_04_sprite.size.y

            slot_05_x = @@shirt_slot_05_sprite.position.x
            slot_05_y = @@shirt_slot_05_sprite.position.y
            slot_05_width = @@shirt_slot_05_sprite.size.x
            slot_05_height = @@shirt_slot_05_sprite.size.y

            slot_06_x = @@shirt_slot_06_sprite.position.x
            slot_06_y = @@shirt_slot_06_sprite.position.y
            slot_06_width = @@shirt_slot_06_sprite.size.x
            slot_06_height = @@shirt_slot_06_sprite.size.y

            slot_07_x = @@shirt_slot_07_sprite.position.x
            slot_07_y = @@shirt_slot_07_sprite.position.y
            slot_07_width = @@shirt_slot_07_sprite.size.x
            slot_07_height = @@shirt_slot_07_sprite.size.y

            slot_08_x = @@shirt_slot_08_sprite.position.x
            slot_08_y = @@shirt_slot_08_sprite.position.y
            slot_08_width = @@shirt_slot_08_sprite.size.x
            slot_08_height = @@shirt_slot_08_sprite.size.y

            slot_09_x = @@shirt_slot_09_sprite.position.x
            slot_09_y = @@shirt_slot_09_sprite.position.y
            slot_09_width = @@shirt_slot_09_sprite.size.x
            slot_09_height = @@shirt_slot_09_sprite.size.y

            slot_10_x = @@shirt_slot_10_sprite.position.x
            slot_10_y = @@shirt_slot_10_sprite.position.y
            slot_10_width = @@shirt_slot_10_sprite.size.x
            slot_10_height = @@shirt_slot_10_sprite.size.y

            slot_11_x = @@shirt_slot_11_sprite.position.x
            slot_11_y = @@shirt_slot_11_sprite.position.y
            slot_11_width = @@shirt_slot_11_sprite.size.x
            slot_11_height = @@shirt_slot_11_sprite.size.y

            slot_12_x = @@shirt_slot_12_sprite.position.x
            slot_12_y = @@shirt_slot_12_sprite.position.y
            slot_12_width = @@shirt_slot_12_sprite.size.x
            slot_12_height = @@shirt_slot_12_sprite.size.y

            slot_13_x = @@shirt_slot_13_sprite.position.x
            slot_13_y = @@shirt_slot_13_sprite.position.y
            slot_13_width = @@shirt_slot_13_sprite.size.x
            slot_13_height = @@shirt_slot_13_sprite.size.y

            slot_14_x = @@shirt_slot_14_sprite.position.x
            slot_14_y = @@shirt_slot_14_sprite.position.y
            slot_14_width = @@shirt_slot_14_sprite.size.x
            slot_14_height = @@shirt_slot_14_sprite.size.y

            slot_15_x = @@shirt_slot_15_sprite.position.x
            slot_15_y = @@shirt_slot_15_sprite.position.y
            slot_15_width = @@shirt_slot_15_sprite.size.x
            slot_15_height = @@shirt_slot_15_sprite.size.y
        #---------------------------------------------------------------------------------------------
        
        if (mouse_x >= slot_01_x && mouse_x <= slot_01_x + slot_01_width) &&
           (mouse_y >= slot_01_y && mouse_y <= slot_01_y + slot_01_height)
           
            if @@shirt_slot_01 != nil   
                t = 0 + (@@page.not_nil! * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@shirt_slot_01.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_02_x && mouse_x <= slot_02_x + slot_02_width) &&
           (mouse_y >= slot_02_y && mouse_y <= slot_02_y + slot_02_height)
           
            if @@shirt_slot_02 != nil
                t = 1 + (@@page.not_nil! * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@shirt_slot_02.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_03_x && mouse_x <= slot_03_x + slot_03_width) &&
           (mouse_y >= slot_03_y && mouse_y <= slot_03_y + slot_03_height)
           
            if @@shirt_slot_03 != nil
                t = 2 + (@@page.not_nil! * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@shirt_slot_03.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_04_x && mouse_x <= slot_04_x + slot_04_width) &&
           (mouse_y >= slot_04_y && mouse_y <= slot_04_y + slot_04_height)
           
            if @@shirt_slot_04 != nil
                t = 3 + (@@page.not_nil! * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@shirt_slot_04.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_05_x && mouse_x <= slot_05_x + slot_05_width) &&
           (mouse_y >= slot_05_y && mouse_y <= slot_05_y + slot_05_height)
           
            if @@shirt_slot_05 != nil
                t = 4 + (@@page.not_nil! * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@shirt_slot_05.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_06_x && mouse_x <= slot_06_x + slot_06_width) &&
           (mouse_y >= slot_06_y && mouse_y <= slot_06_y + slot_06_height)
           
            if @@shirt_slot_06 != nil
                t = 5 + (@@page.not_nil! * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@shirt_slot_06.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_07_x && mouse_x <= slot_07_x + slot_07_width) &&
           (mouse_y >= slot_07_y && mouse_y <= slot_07_y + slot_07_height)
           
            if @@shirt_slot_07 != nil
                t = 6 + (@@page.not_nil! * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@shirt_slot_07.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_08_x && mouse_x <= slot_08_x + slot_08_width) &&
           (mouse_y >= slot_08_y && mouse_y <= slot_08_y + slot_08_height)
           
            if @@shirt_slot_08 != nil
                t = 7 + (@@page.not_nil! * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@shirt_slot_08.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_09_x && mouse_x <= slot_09_x + slot_09_width) &&
           (mouse_y >= slot_09_y && mouse_y <= slot_09_y + slot_09_height)
           
            if @@shirt_slot_09 != nil
                t = 8 + (@@page.not_nil! * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@shirt_slot_09.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_10_x && mouse_x <= slot_10_x + slot_10_width) &&
           (mouse_y >= slot_10_y && mouse_y <= slot_10_y + slot_10_height)
           
            if @@shirt_slot_10 != nil
                t = 9 + (@@page.not_nil! * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@shirt_slot_10.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_11_x && mouse_x <= slot_11_x + slot_11_width) &&
           (mouse_y >= slot_11_y && mouse_y <= slot_11_y + slot_11_height)
           
            if @@shirt_slot_11 != nil
                t = 10 + (@@page.not_nil! * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@shirt_slot_11.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_12_x && mouse_x <= slot_12_x + slot_12_width) &&
           (mouse_y >= slot_12_y && mouse_y <= slot_12_y + slot_12_height)
           
            if @@shirt_slot_12 != nil
                t = 11 + (@@page.not_nil! * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@shirt_slot_12.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_13_x && mouse_x <= slot_13_x + slot_13_width) &&
           (mouse_y >= slot_13_y && mouse_y <= slot_13_y + slot_13_height)
           
            if @@shirt_slot_13 != nil
                t = 12 + (@@page.not_nil! * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@shirt_slot_13.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_14_x && mouse_x <= slot_14_x + slot_14_width) &&
           (mouse_y >= slot_14_y && mouse_y <= slot_14_y + slot_14_height)
           
            if @@shirt_slot_14 != nil
                t = 13 + (@@page.not_nil! * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@shirt_slot_14.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_15_x && mouse_x <= slot_15_x + slot_15_width) &&
           (mouse_y >= slot_15_y && mouse_y <= slot_15_y + slot_15_height)
           
            if @@shirt_slot_15 != nil
                t = 14 + (@@page.not_nil! * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@shirt_slot_15.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end

       end
    end

    class ClothingTabPants
        @@owned_pants_array = [] of Clothing::Pants

        @@pants_sorting_category = "Length"

        @@pants_slot_01 : Clothing::Pants? = nil
        @@pants_slot_02 : Clothing::Pants? = nil
        @@pants_slot_03 : Clothing::Pants? = nil
        @@pants_slot_04 : Clothing::Pants? = nil
        @@pants_slot_05 : Clothing::Pants? = nil
        @@pants_slot_06 : Clothing::Pants? = nil
        @@pants_slot_07 : Clothing::Pants? = nil
        @@pants_slot_08 : Clothing::Pants? = nil
        @@pants_slot_09 : Clothing::Pants? = nil
        @@pants_slot_10 : Clothing::Pants? = nil
        @@pants_slot_11 : Clothing::Pants? = nil
        @@pants_slot_12 : Clothing::Pants? = nil
        @@pants_slot_13 : Clothing::Pants? = nil
        @@pants_slot_14 : Clothing::Pants? = nil
        @@pants_slot_15 : Clothing::Pants? = nil

       #---------------------------------debug-------------------------------------------
        @@owned_pants_array.push(Clothing::Pants.get_pants("White Jeans").not_nil!)
        @@owned_pants_array.push(Clothing::Pants.get_pants("Black Jeans").not_nil!)
        @@owned_pants_array.push(Clothing::Pants.get_pants("Red Jeans").not_nil!)
        @@owned_pants_array.push(Clothing::Pants.get_pants("Orange Jeans").not_nil!)
        @@owned_pants_array.push(Clothing::Pants.get_pants("Yellow Jeans").not_nil!)
        @@owned_pants_array.push(Clothing::Pants.get_pants("Green Jeans").not_nil!)
        @@owned_pants_array.push(Clothing::Pants.get_pants("Blue Jeans").not_nil!)
        @@owned_pants_array.push(Clothing::Pants.get_pants("Purple Jeans").not_nil!)
        @@owned_pants_array.push(Clothing::Pants.get_pants("Pink Jeans").not_nil!)

        @@owned_pants_array.push(Clothing::Pants.get_pants("White Booty Shorts").not_nil!)
        @@owned_pants_array.push(Clothing::Pants.get_pants("Black Booty Shorts").not_nil!)
        @@owned_pants_array.push(Clothing::Pants.get_pants("Red Booty Shorts").not_nil!)
        @@owned_pants_array.push(Clothing::Pants.get_pants("Orange Booty Shorts").not_nil!)
        @@owned_pants_array.push(Clothing::Pants.get_pants("Yellow Booty Shorts").not_nil!)
        @@owned_pants_array.push(Clothing::Pants.get_pants("Green Booty Shorts").not_nil!)
        @@owned_pants_array.push(Clothing::Pants.get_pants("Blue Booty Shorts").not_nil!)
        @@owned_pants_array.push(Clothing::Pants.get_pants("Purple Booty Shorts").not_nil!)
        @@owned_pants_array.push(Clothing::Pants.get_pants("Pink Booty Shorts").not_nil!)

        @@owned_pants_array.push(Clothing::Pants.get_pants("White Shorts").not_nil!)
        @@owned_pants_array.push(Clothing::Pants.get_pants("Black Shorts").not_nil!)
        @@owned_pants_array.push(Clothing::Pants.get_pants("Red Shorts").not_nil!)
        @@owned_pants_array.push(Clothing::Pants.get_pants("Orange Shorts").not_nil!)
        @@owned_pants_array.push(Clothing::Pants.get_pants("Yellow Shorts").not_nil!)
        @@owned_pants_array.push(Clothing::Pants.get_pants("Green Shorts").not_nil!)
        @@owned_pants_array.push(Clothing::Pants.get_pants("Blue Shorts").not_nil!)
        @@owned_pants_array.push(Clothing::Pants.get_pants("Purple Shorts").not_nil!)
        @@owned_pants_array.push(Clothing::Pants.get_pants("Pink Shorts").not_nil!)
       #---------------------------------------------------------------------------------

       #--------------------------------objects------------------------------------------
        @@clothing_box_sprite = SF::RectangleShape.new(SF.vector2(610, 420))
        @@clothing_box_sprite.fill_color = SF.color( 137, 170, 208 )

        
        @@clothing_left_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_left_arrow_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_right_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_right_arrow_sprite.fill_color = SF.color(161, 183, 208)


        @@clothing_sort_button_sprite = SF::RectangleShape.new(SF.vector2(75, 25))
        @@clothing_sort_button_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_pants_category_box = SF::RectangleShape.new(SF.vector2(100, 25))
        @@clothing_pants_category_box.fill_color = SF.color(161, 183, 208)

        @@clothing_sort_button_text = SF::Text.new
        @@clothing_sort_button_text.font = QUICKSAND
        @@clothing_sort_button_text.character_size = 20
        @@clothing_sort_button_text.color = SF::Color::Blue
        @@clothing_sort_button_text.string = "Sort"


        @@clothing_right_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_right_arrow_sprite.fill_color = SF.color(161, 183, 208)

        @@pants_tab = SF::RectangleShape.new(SF.vector2(100, 50))
        @@pants_tab.fill_color = SF.color(141, 163, 188)

        @@pants_tab_text = SF::Text.new
        @@pants_tab_text.font = QUICKSAND
        @@pants_tab_text.character_size = 20
        @@pants_tab_text.color = SF::Color::Blue
        @@pants_tab_text.string = "Pantss"

        @@pants_tab = SF::RectangleShape.new(SF.vector2(100, 50))
        @@pants_tab.fill_color = SF.color(161, 183, 208)

        @@pants_tab_text = SF::Text.new
        @@pants_tab_text.font = QUICKSAND
        @@pants_tab_text.character_size = 20
        @@pants_tab_text.color = SF::Color::Blue
        @@pants_tab_text.string = "Pants"


        @@pants_slot_01_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@pants_slot_01_sprite.fill_color = SF.color(161, 183, 208)

        @@pants_slot_01_text = SF::Text.new
        @@pants_slot_01_text.font = QUICKSAND
        @@pants_slot_01_text.character_size = 12
        @@pants_slot_01_text.color = SF::Color::Blue

        @@pants_slot_01_image_sprite = SF::Sprite.new


        @@pants_slot_02_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@pants_slot_02_sprite.fill_color = SF.color(161, 183, 208)

        @@pants_slot_02_text = SF::Text.new
        @@pants_slot_02_text.font = QUICKSAND
        @@pants_slot_02_text.character_size = 12
        @@pants_slot_02_text.color = SF::Color::Blue

        @@pants_slot_02_image_sprite = SF::Sprite.new


        @@pants_slot_03_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@pants_slot_03_sprite.fill_color = SF.color(161, 183, 208)

        @@pants_slot_03_text = SF::Text.new
        @@pants_slot_03_text.font = QUICKSAND
        @@pants_slot_03_text.character_size = 12
        @@pants_slot_03_text.color = SF::Color::Blue

        @@pants_slot_03_image_sprite = SF::Sprite.new


        @@pants_slot_04_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@pants_slot_04_sprite.fill_color = SF.color(161, 183, 208)

        @@pants_slot_04_text = SF::Text.new
        @@pants_slot_04_text.font = QUICKSAND
        @@pants_slot_04_text.character_size = 12
        @@pants_slot_04_text.color = SF::Color::Blue

        @@pants_slot_04_image_sprite = SF::Sprite.new


        @@pants_slot_05_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@pants_slot_05_sprite.fill_color = SF.color(161, 183, 208)

        @@pants_slot_05_text = SF::Text.new
        @@pants_slot_05_text.font = QUICKSAND
        @@pants_slot_05_text.character_size = 12
        @@pants_slot_05_text.color = SF::Color::Blue

        @@pants_slot_05_image_sprite = SF::Sprite.new


        @@pants_slot_06_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@pants_slot_06_sprite.fill_color = SF.color(161, 183, 208)

        @@pants_slot_06_text = SF::Text.new
        @@pants_slot_06_text.font = QUICKSAND
        @@pants_slot_06_text.character_size = 12
        @@pants_slot_06_text.color = SF::Color::Blue
        
        @@pants_slot_06_image_sprite = SF::Sprite.new


        @@pants_slot_07_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@pants_slot_07_sprite.fill_color = SF.color(161, 183, 208)

        @@pants_slot_07_text = SF::Text.new
        @@pants_slot_07_text.font = QUICKSAND
        @@pants_slot_07_text.character_size = 12
        @@pants_slot_07_text.color = SF::Color::Blue

        @@pants_slot_07_image_sprite = SF::Sprite.new


        @@pants_slot_08_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@pants_slot_08_sprite.fill_color = SF.color(161, 183, 208)

        @@pants_slot_08_text = SF::Text.new
        @@pants_slot_08_text.font = QUICKSAND
        @@pants_slot_08_text.character_size = 12
        @@pants_slot_08_text.color = SF::Color::Blue

        @@pants_slot_08_image_sprite = SF::Sprite.new


        @@pants_slot_09_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@pants_slot_09_sprite.fill_color = SF.color(161, 183, 208)

        @@pants_slot_09_text = SF::Text.new
        @@pants_slot_09_text.font = QUICKSAND
        @@pants_slot_09_text.character_size = 12
        @@pants_slot_09_text.color = SF::Color::Blue

        @@pants_slot_09_image_sprite = SF::Sprite.new


        @@pants_slot_10_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@pants_slot_10_sprite.fill_color = SF.color(161, 183, 208)

        @@pants_slot_10_text = SF::Text.new
        @@pants_slot_10_text.font = QUICKSAND
        @@pants_slot_10_text.character_size = 12
        @@pants_slot_10_text.color = SF::Color::Blue

        @@pants_slot_10_image_sprite = SF::Sprite.new


        @@pants_slot_11_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@pants_slot_11_sprite.fill_color = SF.color(161, 183, 208)

        @@pants_slot_11_text = SF::Text.new
        @@pants_slot_11_text.font = QUICKSAND
        @@pants_slot_11_text.character_size = 12
        @@pants_slot_11_text.color = SF::Color::Blue

        @@pants_slot_11_image_sprite = SF::Sprite.new


        @@pants_slot_12_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@pants_slot_12_sprite.fill_color = SF.color(161, 183, 208)

        @@pants_slot_12_text = SF::Text.new
        @@pants_slot_12_text.font = QUICKSAND
        @@pants_slot_12_text.character_size = 12
        @@pants_slot_12_text.color = SF::Color::Blue

        @@pants_slot_12_image_sprite = SF::Sprite.new


        @@pants_slot_13_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@pants_slot_13_sprite.fill_color = SF.color(161, 183, 208)

        @@pants_slot_13_text = SF::Text.new
        @@pants_slot_13_text.font = QUICKSAND
        @@pants_slot_13_text.character_size = 12
        @@pants_slot_13_text.color = SF::Color::Blue

        @@pants_slot_13_image_sprite = SF::Sprite.new


        @@pants_slot_14_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@pants_slot_14_sprite.fill_color = SF.color(161, 183, 208)

        @@pants_slot_14_text = SF::Text.new
        @@pants_slot_14_text.font = QUICKSAND
        @@pants_slot_14_text.character_size = 12
        @@pants_slot_14_text.color = SF::Color::Blue

        @@pants_slot_14_image_sprite = SF::Sprite.new


        @@pants_slot_15_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@pants_slot_15_sprite.fill_color = SF.color(161, 183, 208)

        @@pants_slot_15_text = SF::Text.new
        @@pants_slot_15_text.font = QUICKSAND
        @@pants_slot_15_text.character_size = 12
        @@pants_slot_15_text.color = SF::Color::Blue

        @@pants_slot_15_image_sprite = SF::Sprite.new

       #---------------------------------------------------------------------------------

       def initialize(is_open : Bool, page : Int32)
        @@is_open = is_open
        @@page = page
       end

       def ClothingTabPants.is_open
        @@is_open
       end

       def ClothingTabPants.page
        @@page
       end

       def ClothingTabPants.is_open=(this)
        @@is_open = this
       end

       def ClothingTabPants.page=(this)
        @@page = this
       end

       def ClothingTabPants.owned_pants_array
        @@owned_pants_array
       end

       def ClothingTabPants.owned_pants_array=(this)
        @@owned_pants_array = this
       end

       def ClothingTabPants.push_to_owned_pants_array(this)
        @@owned_pants_array.push(this)
       end

       def ClothingTabPants.change_pants_sort_category
        case @@pants_sorting_category
        when "Length"
            @@pants_sorting_category = "Color"
        when "Color"
            @@pants_sorting_category = "Length"
        end
       end

       def ClothingTabPants.get_pants_category
        return @@pants_sorting_category
       end

       def ClothingTabPants.organise_owned_pants_array_by_color(window)
        temp_clothing_array_01 = [] of Clothing::Pants
        @@owned_pants_array.each { |pants| if pants.color == "white"
        temp_clothing_array_01.push(pants)
        end}

        @@owned_pants_array.each { |pants| if pants.color == "black"
        temp_clothing_array_01.push(pants)
        end}

        @@owned_pants_array.each { |pants| if pants.color == "red"
        temp_clothing_array_01.push(pants)
        end}

        @@owned_pants_array.each { |pants| if pants.color == "orange"
        temp_clothing_array_01.push(pants)
        end}

        @@owned_pants_array.each { |pants| if pants.color == "yellow"
        temp_clothing_array_01.push(pants)
        end}

        @@owned_pants_array.each { |pants| if pants.color == "green"
        temp_clothing_array_01.push(pants)
        end}

        @@owned_pants_array.each { |pants| if pants.color == "blue"
        temp_clothing_array_01.push(pants)
        end}

        @@owned_pants_array.each { |pants| if pants.color == "purple"
        temp_clothing_array_01.push(pants)
        end}

        @@owned_pants_array.each { |pants| if pants.color == "pink"
        temp_clothing_array_01.push(pants)
        end}

        @@owned_pants_array.clear
        @@owned_pants_array = temp_clothing_array_01
        @@owned_pants_array.uniq!
        ClothingTabPants.assign_slot_textures(window)
       end

       def ClothingTabPants.organise_owned_pants_array_by_sleeve_length_short_to_long(window)
        temp_clothing_array_01 = [] of Clothing::Pants
        @@owned_pants_array.each { |pants| if pants.length.includes?("none") == true
        temp_clothing_array_01.push(pants)
        end}

        @@owned_pants_array.each { |pants| if pants.length.includes?("very_short") == true
        temp_clothing_array_01.push(pants)
        end}

        @@owned_pants_array.each { |pants| if pants.length.includes?("short") == true
        temp_clothing_array_01.push(pants)
        end}

        @@owned_pants_array.each { |pants| if pants.length.includes?("long") == true
        temp_clothing_array_01.push(pants)
        end}

        @@owned_pants_array.clear
        @@owned_pants_array = temp_clothing_array_01
        @@owned_pants_array.uniq!
        ClothingTabPants.assign_slot_textures(window)
       end

       def ClothingTabPants.center_clothing_text(this)
        if this.string.size <= 5
            this.character_size = 20

            x = this.position.x - (this.string.size + 6)
            this.position = SF.vector2(x, this.position.y)

        elsif this.string.size > 5 && this.string.size < 10
            this.character_size = 15

            x = this.position.x - (this.string.size + 5)
            this.position = SF.vector2(x, this.position.y)

        elsif this.string.size >= 10 && this.string.size < 15
            this.character_size = 11

            x = this.position.x - (this.string.size - 12)
            y = this.position.y + 2
            this.position = SF.vector2(x, y)

        elsif this.string.size >= 15
            this.character_size = 11

            x = this.position.x - (this.string.size - 12)
            this.position = SF.vector2(x, this.position.y)
        end
       end

       def ClothingTabPants.initialize_clothing_tab(window)
        @@page = 1
        @@clothing_box_sprite.position = SF.vector2(20, 40)  
       end

       def ClothingTabPants.assign_slot_textures(window)
        if @@page == nil
            @@page = 1
        end
        if @@owned_pants_array.size > 0
            t = 0 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_pants_array.size - 1
             @@pants_slot_01_image_sprite.texture = @@owned_pants_array[t].texture
             @@pants_slot_01_text.string = @@owned_pants_array[t].name
             @@pants_slot_01 = @@owned_pants_array[t]
            else
                @@pants_slot_01_image_sprite.texture = NIL_TEXTURE
                @@pants_slot_01_text.string = ""
                @@pants_slot_01 = nil
            end
        end
        if @@owned_pants_array.size > 1
            t = 1 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_pants_array.size - 1
             @@pants_slot_02_image_sprite.texture = @@owned_pants_array[t].texture
             @@pants_slot_02_text.string = @@owned_pants_array[t].name
             @@pants_slot_02 = @@owned_pants_array[t]
            else
                @@pants_slot_02_image_sprite.texture = NIL_TEXTURE
                @@pants_slot_02_text.string = ""
                @@pants_slot_02 = nil
            end
        end
        if @@owned_pants_array.size > 2
            t = 2 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_pants_array.size - 1
             @@pants_slot_03_image_sprite.texture = @@owned_pants_array[t].texture
             @@pants_slot_03_text.string = @@owned_pants_array[t].name
             @@pants_slot_03 = @@owned_pants_array[t]
            else
                @@pants_slot_03_image_sprite.texture = NIL_TEXTURE
                @@pants_slot_03_text.string = ""
                @@pants_slot_03 = nil
            end
        end
        if @@owned_pants_array.size > 3
            t = 3 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_pants_array.size - 1
             @@pants_slot_04_image_sprite.texture = @@owned_pants_array[t].texture
             @@pants_slot_04_text.string = @@owned_pants_array[t].name
             @@pants_slot_04 = @@owned_pants_array[t]
            else
                @@pants_slot_04_image_sprite.texture = NIL_TEXTURE
                @@pants_slot_04_text.string = ""
                @@pants_slot_04 = nil
            end
        end
        if @@owned_pants_array.size > 4
            t = 4 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_pants_array.size - 1
             @@pants_slot_05_image_sprite.texture = @@owned_pants_array[t].texture
             @@pants_slot_05_text.string = @@owned_pants_array[t].name
             @@pants_slot_05 = @@owned_pants_array[t]
            else
                @@pants_slot_05_image_sprite.texture = NIL_TEXTURE
                @@pants_slot_05_text.string = ""
                @@pants_slot_05 = nil
            end
        end
        if @@owned_pants_array.size > 5
            t = 5 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_pants_array.size - 1
             @@pants_slot_06_image_sprite.texture = @@owned_pants_array[t].texture
             @@pants_slot_06_text.string = @@owned_pants_array[t].name
             @@pants_slot_06 = @@owned_pants_array[t]
            else
                @@pants_slot_06_image_sprite.texture = NIL_TEXTURE
                @@pants_slot_06_text.string = ""
                @@pants_slot_06 = nil
            end
        end
        if @@owned_pants_array.size > 6
            t = 6 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_pants_array.size - 1
             @@pants_slot_07_image_sprite.texture = @@owned_pants_array[t].texture
             @@pants_slot_07_text.string = @@owned_pants_array[t].name
             @@pants_slot_07 = @@owned_pants_array[t]
            else
                @@pants_slot_07_image_sprite.texture = NIL_TEXTURE
                @@pants_slot_07_text.string = ""
                @@pants_slot_07 = nil
            end
        end
        if @@owned_pants_array.size > 7
            t = 7 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_pants_array.size - 1
             @@pants_slot_08_image_sprite.texture = @@owned_pants_array[t].texture
             @@pants_slot_08_text.string = @@owned_pants_array[t].name
             @@pants_slot_08 = @@owned_pants_array[t]
            else
                @@pants_slot_08_image_sprite.texture = NIL_TEXTURE
                @@pants_slot_08_text.string = ""
                @@pants_slot_08 = nil
            end
        end
        if @@owned_pants_array.size > 8
            t = 8 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_pants_array.size - 1
             @@pants_slot_09_image_sprite.texture = @@owned_pants_array[t].texture
             @@pants_slot_09_text.string = @@owned_pants_array[t].name
             @@pants_slot_09 = @@owned_pants_array[t]
            else
                @@pants_slot_09_image_sprite.texture = NIL_TEXTURE
                @@pants_slot_09_text.string = ""
                @@pants_slot_09 = nil
            end
        end
        if @@owned_pants_array.size > 9
            t = 9 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_pants_array.size - 1
             @@pants_slot_10_image_sprite.texture = @@owned_pants_array[t].texture
             @@pants_slot_10_text.string = @@owned_pants_array[t].name
             @@pants_slot_10 = @@owned_pants_array[t]
            else
                @@pants_slot_10_image_sprite.texture = NIL_TEXTURE
                @@pants_slot_10_text.string = ""
                @@pants_slot_10 = nil
            end
        end
        if @@owned_pants_array.size > 10
            t = 10 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_pants_array.size - 1
             @@pants_slot_11_image_sprite.texture = @@owned_pants_array[t].texture
             @@pants_slot_11_text.string = @@owned_pants_array[t].name
             @@pants_slot_11 = @@owned_pants_array[t]
            else
                @@pants_slot_11_image_sprite.texture = NIL_TEXTURE
                @@pants_slot_11_text.string = ""
                @@pants_slot_11 = nil
            end
        end
        if @@owned_pants_array.size > 11
            t = 11 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_pants_array.size - 1
             @@pants_slot_12_image_sprite.texture = @@owned_pants_array[t].texture
             @@pants_slot_12_text.string = @@owned_pants_array[t].name
             @@pants_slot_12 = @@owned_pants_array[t]
            else
                @@pants_slot_12_image_sprite.texture = NIL_TEXTURE
                @@pants_slot_12_text.string = ""
                @@pants_slot_12 = nil
            end
        end
        if @@owned_pants_array.size > 12
            t = 12 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_pants_array.size - 1
             @@pants_slot_13_image_sprite.texture = @@owned_pants_array[t].texture
             @@pants_slot_13_text.string = @@owned_pants_array[t].name
             @@pants_slot_13 = @@owned_pants_array[t]
            else
                @@pants_slot_13_image_sprite.texture = NIL_TEXTURE
                @@pants_slot_13_text.string = ""
                @@pants_slot_13 = nil
            end
        end
        if @@owned_pants_array.size > 13
            t = 13 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_pants_array.size - 1
             @@pants_slot_14_image_sprite.texture = @@owned_pants_array[t].texture
             @@pants_slot_14_text.string = @@owned_pants_array[t].name
             @@pants_slot_14 = @@owned_pants_array[t]
            else
                @@pants_slot_14_image_sprite.texture = NIL_TEXTURE
                @@pants_slot_14_text.string = ""
                @@pants_slot_14 = nil
            end
        end
        if @@owned_pants_array.size > 14
            t = 14 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_pants_array.size - 1
             @@pants_slot_15_image_sprite.texture = @@owned_pants_array[t].texture
             @@pants_slot_15_text.string = @@owned_pants_array[t].name
             @@pants_slot_15 = @@owned_pants_array[t]
            else
                @@pants_slot_15_image_sprite.texture = NIL_TEXTURE
                @@pants_slot_15_text.string = ""
                @@pants_slot_15 = nil
            end
        end
       end
       

       def ClothingTabPants.draw_clothing_tab(window)
            current_size = window.size
            original_width = 800 
            original_height = 600
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
    
            scale_ratio = [scale_x, scale_y].min
            max_scale = 1.5
            clamped_scale = [scale_ratio, max_scale].min

        window.view = window.default_view #the second frame of the walk cycle should be used for display

        @@clothing_box_sprite.position = SF.vector2(80 * max_scale, 40 * max_scale)
        @@clothing_box_sprite.scale = SF.vector2(1, 1)


        @@pants_slot_01_sprite.position = @@clothing_box_sprite.position + SF.vector2(10 * max_scale, 40 * max_scale)
        @@pants_slot_01_sprite.scale = SF.vector2(1, 1)
        
        @@pants_slot_01_image_sprite.position = @@pants_slot_01_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_01_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_01_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)

        @@pants_slot_01_text.position = @@pants_slot_01_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabPants.center_clothing_text(@@pants_slot_01_text)
        

        @@pants_slot_02_sprite.position = @@clothing_box_sprite.position + SF.vector2(90 * max_scale, 40 * max_scale)
        @@pants_slot_02_sprite.scale = SF.vector2(1, 1)
        
        @@pants_slot_02_image_sprite.position = @@pants_slot_02_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_02_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_02_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)

        @@pants_slot_02_text.position = @@pants_slot_02_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabPants.center_clothing_text(@@pants_slot_02_text)
        

        @@pants_slot_03_sprite.position = @@clothing_box_sprite.position + SF.vector2(170 * max_scale, 40 * max_scale)
        @@pants_slot_03_sprite.scale = SF.vector2(1, 1)
        
        @@pants_slot_03_image_sprite.position = @@pants_slot_03_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_03_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_03_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)

        @@pants_slot_03_text.position = @@pants_slot_03_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabPants.center_clothing_text(@@pants_slot_03_text)
        

        @@pants_slot_04_sprite.position = @@clothing_box_sprite.position + SF.vector2(250 * max_scale, 40 * max_scale)
        @@pants_slot_04_sprite.scale = SF.vector2(1, 1)

        @@pants_slot_04_text.position = @@pants_slot_04_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabPants.center_clothing_text(@@pants_slot_04_text)
        
        @@pants_slot_04_image_sprite.position = @@pants_slot_04_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_04_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_04_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)


        @@pants_slot_05_sprite.position = @@clothing_box_sprite.position + SF.vector2(330 * max_scale, 40 * max_scale)
        @@pants_slot_05_sprite.scale = SF.vector2(1, 1)

        @@pants_slot_05_text.position = @@pants_slot_05_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabPants.center_clothing_text(@@pants_slot_05_text)
        
        @@pants_slot_05_image_sprite.position = @@pants_slot_05_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_05_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_05_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)
        

        @@pants_slot_06_sprite.position = @@clothing_box_sprite.position + SF.vector2(10 * max_scale, 120 * max_scale)
        @@pants_slot_06_sprite.scale = SF.vector2(1, 1)

        @@pants_slot_06_text.position = @@pants_slot_06_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabPants.center_clothing_text(@@pants_slot_06_text)
        
        @@pants_slot_06_image_sprite.position = @@pants_slot_06_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_06_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_06_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)
        

        @@pants_slot_07_sprite.position = @@clothing_box_sprite.position + SF.vector2(90 * max_scale, 120 * max_scale)
        @@pants_slot_07_sprite.scale = SF.vector2(1, 1)
        
        @@pants_slot_07_text.position = @@pants_slot_07_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabPants.center_clothing_text(@@pants_slot_07_text)
        
        @@pants_slot_07_image_sprite.position = @@pants_slot_07_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_07_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_07_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)
        

        @@pants_slot_08_sprite.position = @@clothing_box_sprite.position + SF.vector2(170 * max_scale, 120 * max_scale)
        @@pants_slot_08_sprite.scale = SF.vector2(1, 1)
                
        @@pants_slot_08_text.position = @@pants_slot_08_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabPants.center_clothing_text(@@pants_slot_08_text)
        
        @@pants_slot_08_image_sprite.position = @@pants_slot_08_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_08_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_08_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)
        

        @@pants_slot_09_sprite.position = @@clothing_box_sprite.position + SF.vector2(250 * max_scale, 120 * max_scale)
        @@pants_slot_09_sprite.scale = SF.vector2(1, 1)
                
        @@pants_slot_09_text.position = @@pants_slot_09_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabPants.center_clothing_text(@@pants_slot_09_text)
        
        @@pants_slot_09_image_sprite.position = @@pants_slot_09_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_09_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_09_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)
        

        @@pants_slot_10_sprite.position = @@clothing_box_sprite.position + SF.vector2(330 * max_scale, 120 * max_scale)
        @@pants_slot_10_sprite.scale = SF.vector2(1, 1)
                        
        @@pants_slot_10_text.position = @@pants_slot_10_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabPants.center_clothing_text(@@pants_slot_10_text)
        
        @@pants_slot_10_image_sprite.position = @@pants_slot_10_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_10_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_10_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)
        

        @@pants_slot_11_sprite.position = @@clothing_box_sprite.position + SF.vector2(10 * max_scale, 200 * max_scale)
        @@pants_slot_11_sprite.scale = SF.vector2(1, 1)
                        
        @@pants_slot_11_text.position = @@pants_slot_11_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabPants.center_clothing_text(@@pants_slot_11_text)
        
        @@pants_slot_11_image_sprite.position = @@pants_slot_11_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_11_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_11_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)
        

        @@pants_slot_12_sprite.position = @@clothing_box_sprite.position + SF.vector2(90 * max_scale, 200 * max_scale)
        @@pants_slot_12_sprite.scale = SF.vector2(1, 1)
                        
        @@pants_slot_12_text.position = @@pants_slot_12_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabPants.center_clothing_text(@@pants_slot_12_text)
        
        @@pants_slot_12_image_sprite.position = @@pants_slot_12_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_12_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_12_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)
        

        @@pants_slot_13_sprite.position = @@clothing_box_sprite.position + SF.vector2(170 * max_scale, 200 * max_scale)
        @@pants_slot_13_sprite.scale = SF.vector2(1, 1)
        
        @@pants_slot_13_text.position = @@pants_slot_13_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabPants.center_clothing_text(@@pants_slot_13_text)
        
        @@pants_slot_13_image_sprite.position = @@pants_slot_13_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_13_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_13_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)
        

        @@pants_slot_14_sprite.position = @@clothing_box_sprite.position + SF.vector2(250 * max_scale, 200 * max_scale)
        @@pants_slot_14_sprite.scale = SF.vector2(1, 1)
                        
        @@pants_slot_14_text.position = @@pants_slot_14_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabPants.center_clothing_text(@@pants_slot_14_text)
        
        @@pants_slot_14_image_sprite.position = @@pants_slot_14_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_14_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_14_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)
        

        @@pants_slot_15_sprite.position = @@clothing_box_sprite.position + SF.vector2(330 * max_scale, 200 * max_scale)
        @@pants_slot_15_sprite.scale = SF.vector2(1, 1)
                        
        @@pants_slot_15_text.position = @@pants_slot_15_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabPants.center_clothing_text(@@pants_slot_15_text)
        
        @@pants_slot_15_image_sprite.position = @@pants_slot_15_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_15_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_15_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)


        window.draw(@@pants_slot_01_sprite)
        window.draw(@@pants_slot_01_image_sprite)
        window.draw(@@pants_slot_01_text)

        window.draw(@@pants_slot_02_sprite)
        window.draw(@@pants_slot_02_image_sprite)
        window.draw(@@pants_slot_02_text)

        window.draw(@@pants_slot_03_sprite)
        window.draw(@@pants_slot_03_image_sprite)
        window.draw(@@pants_slot_03_text)
        
        window.draw(@@pants_slot_04_sprite)
        window.draw(@@pants_slot_04_image_sprite)
        window.draw(@@pants_slot_04_text)

        window.draw(@@pants_slot_05_sprite)
        window.draw(@@pants_slot_05_image_sprite)
        window.draw(@@pants_slot_05_text)

        window.draw(@@pants_slot_06_sprite)
        window.draw(@@pants_slot_06_image_sprite)
        window.draw(@@pants_slot_06_text)

        window.draw(@@pants_slot_07_sprite)
        window.draw(@@pants_slot_07_image_sprite)
        window.draw(@@pants_slot_07_text)

        window.draw(@@pants_slot_08_sprite)
        window.draw(@@pants_slot_08_image_sprite)
        window.draw(@@pants_slot_08_text)

        window.draw(@@pants_slot_09_sprite)
        window.draw(@@pants_slot_09_image_sprite)
        window.draw(@@pants_slot_09_text)

        window.draw(@@pants_slot_10_sprite)
        window.draw(@@pants_slot_10_image_sprite)
        window.draw(@@pants_slot_10_text)

        window.draw(@@pants_slot_11_sprite)
        window.draw(@@pants_slot_11_image_sprite)
        window.draw(@@pants_slot_11_text)

        window.draw(@@pants_slot_12_sprite)
        window.draw(@@pants_slot_12_image_sprite)
        window.draw(@@pants_slot_12_text)

        window.draw(@@pants_slot_13_sprite)
        window.draw(@@pants_slot_13_image_sprite)
        window.draw(@@pants_slot_13_text)

        window.draw(@@pants_slot_14_sprite)
        window.draw(@@pants_slot_14_image_sprite)
        window.draw(@@pants_slot_14_text)

        window.draw(@@pants_slot_15_sprite)
        window.draw(@@pants_slot_15_image_sprite)
        window.draw(@@pants_slot_15_text)

        if SF::Mouse.button_pressed?(SF::Mouse::Left)
            ClothingTabPants.clothes_mouse_handling(window)
        end
       end

       def ClothingTabPants.clothes_mouse_handling(window)
        mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window))
        mouse_x = mouse_position.x
        mouse_y = mouse_position.y
        
    
        current_size = window.size
        original_width = 800 
        original_height = 600 

        scale_x = (current_size.x.to_f / original_width)
        scale_y = current_size.y.to_f / original_height
        

        #------------------------------------objects-------------------------------------------------

            slot_01_x = @@pants_slot_01_sprite.position.x
            slot_01_y = @@pants_slot_01_sprite.position.y
            slot_01_width = @@pants_slot_01_sprite.size.x
            slot_01_height = @@pants_slot_01_sprite.size.y

            slot_02_x = @@pants_slot_02_sprite.position.x
            slot_02_y = @@pants_slot_02_sprite.position.y
            slot_02_width = @@pants_slot_02_sprite.size.x
            slot_02_height = @@pants_slot_02_sprite.size.y

            slot_03_x = @@pants_slot_03_sprite.position.x
            slot_03_y = @@pants_slot_03_sprite.position.y
            slot_03_width = @@pants_slot_03_sprite.size.x
            slot_03_height = @@pants_slot_03_sprite.size.y

            slot_04_x = @@pants_slot_04_sprite.position.x
            slot_04_y = @@pants_slot_04_sprite.position.y
            slot_04_width = @@pants_slot_04_sprite.size.x
            slot_04_height = @@pants_slot_04_sprite.size.y

            slot_05_x = @@pants_slot_05_sprite.position.x
            slot_05_y = @@pants_slot_05_sprite.position.y
            slot_05_width = @@pants_slot_05_sprite.size.x
            slot_05_height = @@pants_slot_05_sprite.size.y

            slot_06_x = @@pants_slot_06_sprite.position.x
            slot_06_y = @@pants_slot_06_sprite.position.y
            slot_06_width = @@pants_slot_06_sprite.size.x
            slot_06_height = @@pants_slot_06_sprite.size.y

            slot_07_x = @@pants_slot_07_sprite.position.x
            slot_07_y = @@pants_slot_07_sprite.position.y
            slot_07_width = @@pants_slot_07_sprite.size.x
            slot_07_height = @@pants_slot_07_sprite.size.y

            slot_08_x = @@pants_slot_08_sprite.position.x
            slot_08_y = @@pants_slot_08_sprite.position.y
            slot_08_width = @@pants_slot_08_sprite.size.x
            slot_08_height = @@pants_slot_08_sprite.size.y

            slot_09_x = @@pants_slot_09_sprite.position.x
            slot_09_y = @@pants_slot_09_sprite.position.y
            slot_09_width = @@pants_slot_09_sprite.size.x
            slot_09_height = @@pants_slot_09_sprite.size.y

            slot_10_x = @@pants_slot_10_sprite.position.x
            slot_10_y = @@pants_slot_10_sprite.position.y
            slot_10_width = @@pants_slot_10_sprite.size.x
            slot_10_height = @@pants_slot_10_sprite.size.y

            slot_11_x = @@pants_slot_11_sprite.position.x
            slot_11_y = @@pants_slot_11_sprite.position.y
            slot_11_width = @@pants_slot_11_sprite.size.x
            slot_11_height = @@pants_slot_11_sprite.size.y

            slot_12_x = @@pants_slot_12_sprite.position.x
            slot_12_y = @@pants_slot_12_sprite.position.y
            slot_12_width = @@pants_slot_12_sprite.size.x
            slot_12_height = @@pants_slot_12_sprite.size.y

            slot_13_x = @@pants_slot_13_sprite.position.x
            slot_13_y = @@pants_slot_13_sprite.position.y
            slot_13_width = @@pants_slot_13_sprite.size.x
            slot_13_height = @@pants_slot_13_sprite.size.y

            slot_14_x = @@pants_slot_14_sprite.position.x
            slot_14_y = @@pants_slot_14_sprite.position.y
            slot_14_width = @@pants_slot_14_sprite.size.x
            slot_14_height = @@pants_slot_14_sprite.size.y

            slot_15_x = @@pants_slot_15_sprite.position.x
            slot_15_y = @@pants_slot_15_sprite.position.y
            slot_15_width = @@pants_slot_15_sprite.size.x
            slot_15_height = @@pants_slot_15_sprite.size.y
        #---------------------------------------------------------------------------------------------
        
        if (mouse_x >= slot_01_x && mouse_x <= slot_01_x + slot_01_width) &&
           (mouse_y >= slot_01_y && mouse_y <= slot_01_y + slot_01_height)
            if @@pants_slot_01 != nil   
                t = 0 + (@@page.not_nil! * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(Player::Appearance.get_clothing("pants").not_nil!).not_nil!)
                Player::Appearance.change_pants(@@pants_slot_01.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_02_x && mouse_x <= slot_02_x + slot_02_width) &&
           (mouse_y >= slot_02_y && mouse_y <= slot_02_y + slot_02_height)
           
            if @@pants_slot_02 != nil
                t = 1 + (@@page.not_nil! * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(Player::Appearance.get_clothing("pants").not_nil!).not_nil!)
                Player::Appearance.change_pants(@@pants_slot_02.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_03_x && mouse_x <= slot_03_x + slot_03_width) &&
           (mouse_y >= slot_03_y && mouse_y <= slot_03_y + slot_03_height)
           
            if @@pants_slot_03 != nil
                t = 2 + (@@page.not_nil! * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(Player::Appearance.get_clothing("pants").not_nil!).not_nil!)
                Player::Appearance.change_pants(@@pants_slot_03.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_04_x && mouse_x <= slot_04_x + slot_04_width) &&
           (mouse_y >= slot_04_y && mouse_y <= slot_04_y + slot_04_height)
           
            if @@pants_slot_04 != nil
                t = 3 + (@@page.not_nil! * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(Player::Appearance.get_clothing("pants").not_nil!).not_nil!)
                Player::Appearance.change_pants(@@pants_slot_04.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_05_x && mouse_x <= slot_05_x + slot_05_width) &&
           (mouse_y >= slot_05_y && mouse_y <= slot_05_y + slot_05_height)
           
            if @@pants_slot_05 != nil
                t = 4 + (@@page.not_nil! * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(Player::Appearance.get_clothing("pants").not_nil!).not_nil!)
                Player::Appearance.change_pants(@@pants_slot_05.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_06_x && mouse_x <= slot_06_x + slot_06_width) &&
           (mouse_y >= slot_06_y && mouse_y <= slot_06_y + slot_06_height)
           
            if @@pants_slot_06 != nil
                t = 5 + (@@page.not_nil! * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(Player::Appearance.get_clothing("pants").not_nil!).not_nil!)
                Player::Appearance.change_pants(@@pants_slot_06.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_07_x && mouse_x <= slot_07_x + slot_07_width) &&
           (mouse_y >= slot_07_y && mouse_y <= slot_07_y + slot_07_height)
           
            if @@pants_slot_07 != nil
                t = 6 + (@@page.not_nil! * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(Player::Appearance.get_clothing("pants").not_nil!).not_nil!)
                Player::Appearance.change_pants(@@pants_slot_07.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_08_x && mouse_x <= slot_08_x + slot_08_width) &&
           (mouse_y >= slot_08_y && mouse_y <= slot_08_y + slot_08_height)
           
            if @@pants_slot_08 != nil
                t = 7 + (@@page.not_nil! * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(Player::Appearance.get_clothing("pants").not_nil!).not_nil!)
                Player::Appearance.change_pants(@@pants_slot_08.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_09_x && mouse_x <= slot_09_x + slot_09_width) &&
           (mouse_y >= slot_09_y && mouse_y <= slot_09_y + slot_09_height)
           
            if @@pants_slot_09 != nil
                t = 8 + (@@page.not_nil! * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(Player::Appearance.get_clothing("pants").not_nil!).not_nil!)
                Player::Appearance.change_pants(@@pants_slot_09.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_10_x && mouse_x <= slot_10_x + slot_10_width) &&
           (mouse_y >= slot_10_y && mouse_y <= slot_10_y + slot_10_height)
           
            if @@pants_slot_10 != nil
                t = 9 + (@@page.not_nil! * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(Player::Appearance.get_clothing("pants").not_nil!).not_nil!)
                Player::Appearance.change_pants(@@pants_slot_10.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_11_x && mouse_x <= slot_11_x + slot_11_width) &&
           (mouse_y >= slot_11_y && mouse_y <= slot_11_y + slot_11_height)
           
            if @@pants_slot_11 != nil
                t = 10 + (@@page.not_nil! * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(Player::Appearance.get_clothing("pants").not_nil!).not_nil!)
                Player::Appearance.change_pants(@@pants_slot_11.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_12_x && mouse_x <= slot_12_x + slot_12_width) &&
           (mouse_y >= slot_12_y && mouse_y <= slot_12_y + slot_12_height)
           
            if @@pants_slot_12 != nil
                t = 11 + (@@page.not_nil! * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(Player::Appearance.get_clothing("pants").not_nil!).not_nil!)
                Player::Appearance.change_pants(@@pants_slot_12.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_13_x && mouse_x <= slot_13_x + slot_13_width) &&
           (mouse_y >= slot_13_y && mouse_y <= slot_13_y + slot_13_height)
           
            if @@pants_slot_13 != nil
                t = 12 + (@@page.not_nil! * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(Player::Appearance.get_clothing("pants").not_nil!).not_nil!)
                Player::Appearance.change_pants(@@pants_slot_13.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_14_x && mouse_x <= slot_14_x + slot_14_width) &&
           (mouse_y >= slot_14_y && mouse_y <= slot_14_y + slot_14_height)
           
            if @@pants_slot_14 != nil
                t = 13 + (@@page.not_nil! * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(Player::Appearance.get_clothing("pants").not_nil!).not_nil!)
                Player::Appearance.change_pants(@@pants_slot_14.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_15_x && mouse_x <= slot_15_x + slot_15_width) &&
           (mouse_y >= slot_15_y && mouse_y <= slot_15_y + slot_15_height)
           
            if @@pants_slot_15 != nil
                t = 14 + (@@page.not_nil! * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(Player::Appearance.get_clothing("pants").not_nil!).not_nil!)
                Player::Appearance.change_pants(@@pants_slot_15.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end

       end

    end

    class ClothingTabShoes
        @@owned_shoes_array = [] of Clothing::Shoes

        @@shoes_sorting_category = "Length"

        @@shoes_slot_01 : Clothing::Shoes? = nil
        @@shoes_slot_02 : Clothing::Shoes? = nil
        @@shoes_slot_03 : Clothing::Shoes? = nil
        @@shoes_slot_04 : Clothing::Shoes? = nil
        @@shoes_slot_05 : Clothing::Shoes? = nil
        @@shoes_slot_06 : Clothing::Shoes? = nil
        @@shoes_slot_07 : Clothing::Shoes? = nil
        @@shoes_slot_08 : Clothing::Shoes? = nil
        @@shoes_slot_09 : Clothing::Shoes? = nil
        @@shoes_slot_10 : Clothing::Shoes? = nil
        @@shoes_slot_11 : Clothing::Shoes? = nil
        @@shoes_slot_12 : Clothing::Shoes? = nil
        @@shoes_slot_13 : Clothing::Shoes? = nil
        @@shoes_slot_14 : Clothing::Shoes? = nil
        @@shoes_slot_15 : Clothing::Shoes? = nil

       #---------------------------------debug-------------------------------------------
        @@owned_shoes_array.push(Clothing::Shoes.get_shoes("White Rain Boots").not_nil!)
        @@owned_shoes_array.push(Clothing::Shoes.get_shoes("Black Rain Boots").not_nil!)
        @@owned_shoes_array.push(Clothing::Shoes.get_shoes("Red Rain Boots").not_nil!)
        @@owned_shoes_array.push(Clothing::Shoes.get_shoes("Orange Rain Boots").not_nil!)
        @@owned_shoes_array.push(Clothing::Shoes.get_shoes("Yellow Rain Boots").not_nil!)
        @@owned_shoes_array.push(Clothing::Shoes.get_shoes("Green Rain Boots").not_nil!)
        @@owned_shoes_array.push(Clothing::Shoes.get_shoes("Blue Rain Boots").not_nil!)
        @@owned_shoes_array.push(Clothing::Shoes.get_shoes("Purple Rain Boots").not_nil!)
        @@owned_shoes_array.push(Clothing::Shoes.get_shoes("Pink Rain Boots").not_nil!)
       #---------------------------------------------------------------------------------

       #--------------------------------objects------------------------------------------
        @@clothing_box_sprite = SF::RectangleShape.new(SF.vector2(610, 420))
        @@clothing_box_sprite.fill_color = SF.color( 137, 170, 208 )

        
        @@clothing_left_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_left_arrow_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_right_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_right_arrow_sprite.fill_color = SF.color(161, 183, 208)


        @@clothing_sort_button_sprite = SF::RectangleShape.new(SF.vector2(75, 25))
        @@clothing_sort_button_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_shoes_category_box = SF::RectangleShape.new(SF.vector2(100, 25))
        @@clothing_shoes_category_box.fill_color = SF.color(161, 183, 208)

        @@clothing_sort_button_text = SF::Text.new
        @@clothing_sort_button_text.font = QUICKSAND
        @@clothing_sort_button_text.character_size = 20
        @@clothing_sort_button_text.color = SF::Color::Blue
        @@clothing_sort_button_text.string = "Sort"


        @@clothing_right_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_right_arrow_sprite.fill_color = SF.color(161, 183, 208)

        @@shoes_tab = SF::RectangleShape.new(SF.vector2(100, 50))
        @@shoes_tab.fill_color = SF.color(141, 163, 188)

        @@shoes_tab_text = SF::Text.new
        @@shoes_tab_text.font = QUICKSAND
        @@shoes_tab_text.character_size = 20
        @@shoes_tab_text.color = SF::Color::Blue
        @@shoes_tab_text.string = "Shoess"

        @@shoes_tab = SF::RectangleShape.new(SF.vector2(100, 50))
        @@shoes_tab.fill_color = SF.color(161, 183, 208)

        @@shoes_tab_text = SF::Text.new
        @@shoes_tab_text.font = QUICKSAND
        @@shoes_tab_text.character_size = 20
        @@shoes_tab_text.color = SF::Color::Blue
        @@shoes_tab_text.string = "Shoes"


        @@shoes_slot_01_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shoes_slot_01_sprite.fill_color = SF.color(161, 183, 208)

        @@shoes_slot_01_text = SF::Text.new
        @@shoes_slot_01_text.font = QUICKSAND
        @@shoes_slot_01_text.character_size = 12
        @@shoes_slot_01_text.color = SF::Color::Blue

        @@shoes_slot_01_image_sprite = SF::Sprite.new


        @@shoes_slot_02_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shoes_slot_02_sprite.fill_color = SF.color(161, 183, 208)

        @@shoes_slot_02_text = SF::Text.new
        @@shoes_slot_02_text.font = QUICKSAND
        @@shoes_slot_02_text.character_size = 12
        @@shoes_slot_02_text.color = SF::Color::Blue

        @@shoes_slot_02_image_sprite = SF::Sprite.new


        @@shoes_slot_03_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shoes_slot_03_sprite.fill_color = SF.color(161, 183, 208)

        @@shoes_slot_03_text = SF::Text.new
        @@shoes_slot_03_text.font = QUICKSAND
        @@shoes_slot_03_text.character_size = 12
        @@shoes_slot_03_text.color = SF::Color::Blue

        @@shoes_slot_03_image_sprite = SF::Sprite.new


        @@shoes_slot_04_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shoes_slot_04_sprite.fill_color = SF.color(161, 183, 208)

        @@shoes_slot_04_text = SF::Text.new
        @@shoes_slot_04_text.font = QUICKSAND
        @@shoes_slot_04_text.character_size = 12
        @@shoes_slot_04_text.color = SF::Color::Blue

        @@shoes_slot_04_image_sprite = SF::Sprite.new


        @@shoes_slot_05_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shoes_slot_05_sprite.fill_color = SF.color(161, 183, 208)

        @@shoes_slot_05_text = SF::Text.new
        @@shoes_slot_05_text.font = QUICKSAND
        @@shoes_slot_05_text.character_size = 12
        @@shoes_slot_05_text.color = SF::Color::Blue

        @@shoes_slot_05_image_sprite = SF::Sprite.new


        @@shoes_slot_06_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shoes_slot_06_sprite.fill_color = SF.color(161, 183, 208)

        @@shoes_slot_06_text = SF::Text.new
        @@shoes_slot_06_text.font = QUICKSAND
        @@shoes_slot_06_text.character_size = 12
        @@shoes_slot_06_text.color = SF::Color::Blue
        
        @@shoes_slot_06_image_sprite = SF::Sprite.new


        @@shoes_slot_07_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shoes_slot_07_sprite.fill_color = SF.color(161, 183, 208)

        @@shoes_slot_07_text = SF::Text.new
        @@shoes_slot_07_text.font = QUICKSAND
        @@shoes_slot_07_text.character_size = 12
        @@shoes_slot_07_text.color = SF::Color::Blue

        @@shoes_slot_07_image_sprite = SF::Sprite.new


        @@shoes_slot_08_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shoes_slot_08_sprite.fill_color = SF.color(161, 183, 208)

        @@shoes_slot_08_text = SF::Text.new
        @@shoes_slot_08_text.font = QUICKSAND
        @@shoes_slot_08_text.character_size = 12
        @@shoes_slot_08_text.color = SF::Color::Blue

        @@shoes_slot_08_image_sprite = SF::Sprite.new


        @@shoes_slot_09_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shoes_slot_09_sprite.fill_color = SF.color(161, 183, 208)

        @@shoes_slot_09_text = SF::Text.new
        @@shoes_slot_09_text.font = QUICKSAND
        @@shoes_slot_09_text.character_size = 12
        @@shoes_slot_09_text.color = SF::Color::Blue

        @@shoes_slot_09_image_sprite = SF::Sprite.new


        @@shoes_slot_10_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shoes_slot_10_sprite.fill_color = SF.color(161, 183, 208)

        @@shoes_slot_10_text = SF::Text.new
        @@shoes_slot_10_text.font = QUICKSAND
        @@shoes_slot_10_text.character_size = 12
        @@shoes_slot_10_text.color = SF::Color::Blue

        @@shoes_slot_10_image_sprite = SF::Sprite.new


        @@shoes_slot_11_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shoes_slot_11_sprite.fill_color = SF.color(161, 183, 208)

        @@shoes_slot_11_text = SF::Text.new
        @@shoes_slot_11_text.font = QUICKSAND
        @@shoes_slot_11_text.character_size = 12
        @@shoes_slot_11_text.color = SF::Color::Blue

        @@shoes_slot_11_image_sprite = SF::Sprite.new


        @@shoes_slot_12_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shoes_slot_12_sprite.fill_color = SF.color(161, 183, 208)

        @@shoes_slot_12_text = SF::Text.new
        @@shoes_slot_12_text.font = QUICKSAND
        @@shoes_slot_12_text.character_size = 12
        @@shoes_slot_12_text.color = SF::Color::Blue

        @@shoes_slot_12_image_sprite = SF::Sprite.new


        @@shoes_slot_13_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shoes_slot_13_sprite.fill_color = SF.color(161, 183, 208)

        @@shoes_slot_13_text = SF::Text.new
        @@shoes_slot_13_text.font = QUICKSAND
        @@shoes_slot_13_text.character_size = 12
        @@shoes_slot_13_text.color = SF::Color::Blue

        @@shoes_slot_13_image_sprite = SF::Sprite.new


        @@shoes_slot_14_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shoes_slot_14_sprite.fill_color = SF.color(161, 183, 208)

        @@shoes_slot_14_text = SF::Text.new
        @@shoes_slot_14_text.font = QUICKSAND
        @@shoes_slot_14_text.character_size = 12
        @@shoes_slot_14_text.color = SF::Color::Blue

        @@shoes_slot_14_image_sprite = SF::Sprite.new


        @@shoes_slot_15_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@shoes_slot_15_sprite.fill_color = SF.color(161, 183, 208)

        @@shoes_slot_15_text = SF::Text.new
        @@shoes_slot_15_text.font = QUICKSAND
        @@shoes_slot_15_text.character_size = 12
        @@shoes_slot_15_text.color = SF::Color::Blue

        @@shoes_slot_15_image_sprite = SF::Sprite.new

       #---------------------------------------------------------------------------------

       def initialize(is_open : Bool, page : Int32)
        @@is_open = is_open
        @@page = page
       end

       def ClothingTabShoes.is_open
        @@is_open
       end

       def ClothingTabShoes.page
        @@page
       end

       def ClothingTabShoes.is_open=(this)
        @@is_open = this
       end

       def ClothingTabShoes.page=(this)
        @@page = this
       end

       def ClothingTabShoes.owned_shoes_array
        @@owned_shoes_array
       end

       def ClothingTabShoes.owned_shoes_array=(this)
        @@owned_shoes_array = this
       end

       def ClothingTabShoes.push_to_owned_shoes_array(this)
        @@owned_shoes_array.push(this)
       end

       def ClothingTabShoes.change_shoes_sort_category
        case @@shoes_sorting_category
        when "Length"
            @@shoes_sorting_category = "Color"
        when "Color"
            @@shoes_sorting_category = "Length"
        end
       end

       def ClothingTabShoes.get_shoes_category
        return @@shoes_sorting_category
       end

       def ClothingTabShoes.organise_owned_shoes_array_by_color(window)
        temp_clothing_array_01 = [] of Clothing::Shoes
        @@owned_shoes_array.each { |shoes| if shoes.color == "white"
        temp_clothing_array_01.push(shoes)
        end}

        @@owned_shoes_array.each { |shoes| if shoes.color == "black"
        temp_clothing_array_01.push(shoes)
        end}

        @@owned_shoes_array.each { |shoes| if shoes.color == "red"
        temp_clothing_array_01.push(shoes)
        end}

        @@owned_shoes_array.each { |shoes| if shoes.color == "orange"
        temp_clothing_array_01.push(shoes)
        end}

        @@owned_shoes_array.each { |shoes| if shoes.color == "yellow"
        temp_clothing_array_01.push(shoes)
        end}

        @@owned_shoes_array.each { |shoes| if shoes.color == "green"
        temp_clothing_array_01.push(shoes)
        end}

        @@owned_shoes_array.each { |shoes| if shoes.color == "blue"
        temp_clothing_array_01.push(shoes)
        end}

        @@owned_shoes_array.each { |shoes| if shoes.color == "purple"
        temp_clothing_array_01.push(shoes)
        end}

        @@owned_shoes_array.each { |shoes| if shoes.color == "pink"
        temp_clothing_array_01.push(shoes)
        end}

        @@owned_shoes_array.clear
        @@owned_shoes_array = temp_clothing_array_01
        @@owned_shoes_array.uniq!
        ClothingTabShoes.assign_slot_textures(window)
       end

       def ClothingTabShoes.organise_owned_shoes_array_by_sleeve_length_short_to_long(window)
        temp_clothing_array_01 = [] of Clothing::Shoes
        @@owned_shoes_array.each { |shoes| if shoes.length.includes?("none") == true
        temp_clothing_array_01.push(shoes)
        end}

        @@owned_shoes_array.each { |shoes| if shoes.length.includes?("very_short") == true
        temp_clothing_array_01.push(shoes)
        end}

        @@owned_shoes_array.each { |shoes| if shoes.length.includes?("short") == true
        temp_clothing_array_01.push(shoes)
        end}

        @@owned_shoes_array.each { |shoes| if shoes.length.includes?("long") == true
        temp_clothing_array_01.push(shoes)
        end}

        @@owned_shoes_array.clear
        @@owned_shoes_array = temp_clothing_array_01
        @@owned_shoes_array.uniq!
        ClothingTabShoes.assign_slot_textures(window)
       end

       def ClothingTabShoes.center_clothing_text(this)
        if this.string.size <= 5
            this.character_size = 20

            x = this.position.x - (this.string.size + 6)
            this.position = SF.vector2(x, this.position.y)

        elsif this.string.size > 5 && this.string.size < 10
            this.character_size = 15

            x = this.position.x - (this.string.size + 5)
            this.position = SF.vector2(x, this.position.y)

        elsif this.string.size >= 10 && this.string.size < 15
            this.character_size = 11

            x = this.position.x - (this.string.size - 12)
            y = this.position.y + 2
            this.position = SF.vector2(x, y)

        elsif this.string.size >= 15
            this.character_size = 11

            x = this.position.x - (this.string.size - 12)
            this.position = SF.vector2(x, this.position.y)
        end
       end

       def ClothingTabShoes.initialize_clothing_tab(window)
        @@page = 1
        @@clothing_box_sprite.position = SF.vector2(20, 40)  
       end

       def ClothingTabShoes.assign_slot_textures(window)
        if @@page == nil
            @@page = 1
        end
        if @@owned_shoes_array.size > 0
            t = 0 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shoes_array.size - 1
             @@shoes_slot_01_image_sprite.texture = @@owned_shoes_array[t].texture
             @@shoes_slot_01_text.string = @@owned_shoes_array[t].name
             @@shoes_slot_01 = @@owned_shoes_array[t]
            else
                @@shoes_slot_01_image_sprite.texture = NIL_TEXTURE
                @@shoes_slot_01_text.string = ""
                @@shoes_slot_01 = nil
            end
        end
        if @@owned_shoes_array.size > 1
            t = 1 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shoes_array.size - 1
             @@shoes_slot_02_image_sprite.texture = @@owned_shoes_array[t].texture
             @@shoes_slot_02_text.string = @@owned_shoes_array[t].name
             @@shoes_slot_02 = @@owned_shoes_array[t]
            else
                @@shoes_slot_02_image_sprite.texture = NIL_TEXTURE
                @@shoes_slot_02_text.string = ""
                @@shoes_slot_02 = nil
            end
        end
        if @@owned_shoes_array.size > 2
            t = 2 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shoes_array.size - 1
             @@shoes_slot_03_image_sprite.texture = @@owned_shoes_array[t].texture
             @@shoes_slot_03_text.string = @@owned_shoes_array[t].name
             @@shoes_slot_03 = @@owned_shoes_array[t]
            else
                @@shoes_slot_03_image_sprite.texture = NIL_TEXTURE
                @@shoes_slot_03_text.string = ""
                @@shoes_slot_03 = nil
            end
        end
        if @@owned_shoes_array.size > 3
            t = 3 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shoes_array.size - 1
             @@shoes_slot_04_image_sprite.texture = @@owned_shoes_array[t].texture
             @@shoes_slot_04_text.string = @@owned_shoes_array[t].name
             @@shoes_slot_04 = @@owned_shoes_array[t]
            else
                @@shoes_slot_04_image_sprite.texture = NIL_TEXTURE
                @@shoes_slot_04_text.string = ""
                @@shoes_slot_04 = nil
            end
        end
        if @@owned_shoes_array.size > 4
            t = 4 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shoes_array.size - 1
             @@shoes_slot_05_image_sprite.texture = @@owned_shoes_array[t].texture
             @@shoes_slot_05_text.string = @@owned_shoes_array[t].name
             @@shoes_slot_05 = @@owned_shoes_array[t]
            else
                @@shoes_slot_05_image_sprite.texture = NIL_TEXTURE
                @@shoes_slot_05_text.string = ""
                @@shoes_slot_05 = nil
            end
        end
        if @@owned_shoes_array.size > 5
            t = 5 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shoes_array.size - 1
             @@shoes_slot_06_image_sprite.texture = @@owned_shoes_array[t].texture
             @@shoes_slot_06_text.string = @@owned_shoes_array[t].name
             @@shoes_slot_06 = @@owned_shoes_array[t]
            else
                @@shoes_slot_06_image_sprite.texture = NIL_TEXTURE
                @@shoes_slot_06_text.string = ""
                @@shoes_slot_06 = nil
            end
        end
        if @@owned_shoes_array.size > 6
            t = 6 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shoes_array.size - 1
             @@shoes_slot_07_image_sprite.texture = @@owned_shoes_array[t].texture
             @@shoes_slot_07_text.string = @@owned_shoes_array[t].name
             @@shoes_slot_07 = @@owned_shoes_array[t]
            else
                @@shoes_slot_07_image_sprite.texture = NIL_TEXTURE
                @@shoes_slot_07_text.string = ""
                @@shoes_slot_07 = nil
            end
        end
        if @@owned_shoes_array.size > 7
            t = 7 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shoes_array.size - 1
             @@shoes_slot_08_image_sprite.texture = @@owned_shoes_array[t].texture
             @@shoes_slot_08_text.string = @@owned_shoes_array[t].name
             @@shoes_slot_08 = @@owned_shoes_array[t]
            else
                @@shoes_slot_08_image_sprite.texture = NIL_TEXTURE
                @@shoes_slot_08_text.string = ""
                @@shoes_slot_08 = nil
            end
        end
        if @@owned_shoes_array.size > 8
            t = 8 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shoes_array.size - 1
             @@shoes_slot_09_image_sprite.texture = @@owned_shoes_array[t].texture
             @@shoes_slot_09_text.string = @@owned_shoes_array[t].name
             @@shoes_slot_09 = @@owned_shoes_array[t]
            else
                @@shoes_slot_09_image_sprite.texture = NIL_TEXTURE
                @@shoes_slot_09_text.string = ""
                @@shoes_slot_09 = nil
            end
        end
        if @@owned_shoes_array.size > 9
            t = 9 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shoes_array.size - 1
             @@shoes_slot_10_image_sprite.texture = @@owned_shoes_array[t].texture
             @@shoes_slot_10_text.string = @@owned_shoes_array[t].name
             @@shoes_slot_10 = @@owned_shoes_array[t]
            else
                @@shoes_slot_10_image_sprite.texture = NIL_TEXTURE
                @@shoes_slot_10_text.string = ""
                @@shoes_slot_10 = nil
            end
        end
        if @@owned_shoes_array.size > 10
            t = 10 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shoes_array.size - 1
             @@shoes_slot_11_image_sprite.texture = @@owned_shoes_array[t].texture
             @@shoes_slot_11_text.string = @@owned_shoes_array[t].name
             @@shoes_slot_11 = @@owned_shoes_array[t]
            else
                @@shoes_slot_11_image_sprite.texture = NIL_TEXTURE
                @@shoes_slot_11_text.string = ""
                @@shoes_slot_11 = nil
            end
        end
        if @@owned_shoes_array.size > 11
            t = 11 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shoes_array.size - 1
             @@shoes_slot_12_image_sprite.texture = @@owned_shoes_array[t].texture
             @@shoes_slot_12_text.string = @@owned_shoes_array[t].name
             @@shoes_slot_12 = @@owned_shoes_array[t]
            else
                @@shoes_slot_12_image_sprite.texture = NIL_TEXTURE
                @@shoes_slot_12_text.string = ""
                @@shoes_slot_12 = nil
            end
        end
        if @@owned_shoes_array.size > 12
            t = 12 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shoes_array.size - 1
             @@shoes_slot_13_image_sprite.texture = @@owned_shoes_array[t].texture
             @@shoes_slot_13_text.string = @@owned_shoes_array[t].name
             @@shoes_slot_13 = @@owned_shoes_array[t]
            else
                @@shoes_slot_13_image_sprite.texture = NIL_TEXTURE
                @@shoes_slot_13_text.string = ""
                @@shoes_slot_13 = nil
            end
        end
        if @@owned_shoes_array.size > 13
            t = 13 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shoes_array.size - 1
             @@shoes_slot_14_image_sprite.texture = @@owned_shoes_array[t].texture
             @@shoes_slot_14_text.string = @@owned_shoes_array[t].name
             @@shoes_slot_14 = @@owned_shoes_array[t]
            else
                @@shoes_slot_14_image_sprite.texture = NIL_TEXTURE
                @@shoes_slot_14_text.string = ""
                @@shoes_slot_14 = nil
            end
        end
        if @@owned_shoes_array.size > 14
            t = 14 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_shoes_array.size - 1
             @@shoes_slot_15_image_sprite.texture = @@owned_shoes_array[t].texture
             @@shoes_slot_15_text.string = @@owned_shoes_array[t].name
             @@shoes_slot_15 = @@owned_shoes_array[t]
            else
                @@shoes_slot_15_image_sprite.texture = NIL_TEXTURE
                @@shoes_slot_15_text.string = ""
                @@shoes_slot_15 = nil
            end
        end
       end
       

       def ClothingTabShoes.draw_clothing_tab(window)
            current_size = window.size
            original_width = 800 
            original_height = 600
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
    
            scale_ratio = [scale_x, scale_y].min
            max_scale = 1.5
            clamped_scale = [scale_ratio, max_scale].min

        window.view = window.default_view

        @@clothing_box_sprite.position = SF.vector2(80 * max_scale, 40 * max_scale)
        @@clothing_box_sprite.scale = SF.vector2(1, 1)


        @@shoes_slot_01_sprite.position = @@clothing_box_sprite.position + SF.vector2(10 * max_scale, 40 * max_scale)
        @@shoes_slot_01_sprite.scale = SF.vector2(1, 1)
        
        @@shoes_slot_01_image_sprite.position = @@shoes_slot_01_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_01_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_01_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        @@shoes_slot_01_text.position = @@shoes_slot_01_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShoes.center_clothing_text(@@shoes_slot_01_text)
        

        @@shoes_slot_02_sprite.position = @@clothing_box_sprite.position + SF.vector2(90 * max_scale, 40 * max_scale)
        @@shoes_slot_02_sprite.scale = SF.vector2(1, 1)
        
        @@shoes_slot_02_image_sprite.position = @@shoes_slot_02_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_02_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_02_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        @@shoes_slot_02_text.position = @@shoes_slot_02_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShoes.center_clothing_text(@@shoes_slot_02_text)
        

        @@shoes_slot_03_sprite.position = @@clothing_box_sprite.position + SF.vector2(170 * max_scale, 40 * max_scale)
        @@shoes_slot_03_sprite.scale = SF.vector2(1, 1)
        
        @@shoes_slot_03_image_sprite.position = @@shoes_slot_03_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_03_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_03_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        @@shoes_slot_03_text.position = @@shoes_slot_03_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShoes.center_clothing_text(@@shoes_slot_03_text)
        

        @@shoes_slot_04_sprite.position = @@clothing_box_sprite.position + SF.vector2(250 * max_scale, 40 * max_scale)
        @@shoes_slot_04_sprite.scale = SF.vector2(1, 1)

        @@shoes_slot_04_text.position = @@shoes_slot_04_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShoes.center_clothing_text(@@shoes_slot_04_text)
        
        @@shoes_slot_04_image_sprite.position = @@shoes_slot_04_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_04_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_04_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)


        @@shoes_slot_05_sprite.position = @@clothing_box_sprite.position + SF.vector2(330 * max_scale, 40 * max_scale)
        @@shoes_slot_05_sprite.scale = SF.vector2(1, 1)

        @@shoes_slot_05_text.position = @@shoes_slot_05_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShoes.center_clothing_text(@@shoes_slot_05_text)
        
        @@shoes_slot_05_image_sprite.position = @@shoes_slot_05_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_05_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_05_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@shoes_slot_06_sprite.position = @@clothing_box_sprite.position + SF.vector2(10 * max_scale, 120 * max_scale)
        @@shoes_slot_06_sprite.scale = SF.vector2(1, 1)

        @@shoes_slot_06_text.position = @@shoes_slot_06_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShoes.center_clothing_text(@@shoes_slot_06_text)
        
        @@shoes_slot_06_image_sprite.position = @@shoes_slot_06_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_06_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_06_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@shoes_slot_07_sprite.position = @@clothing_box_sprite.position + SF.vector2(90 * max_scale, 120 * max_scale)
        @@shoes_slot_07_sprite.scale = SF.vector2(1, 1)
        
        @@shoes_slot_07_text.position = @@shoes_slot_07_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShoes.center_clothing_text(@@shoes_slot_07_text)
        
        @@shoes_slot_07_image_sprite.position = @@shoes_slot_07_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_07_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_07_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@shoes_slot_08_sprite.position = @@clothing_box_sprite.position + SF.vector2(170 * max_scale, 120 * max_scale)
        @@shoes_slot_08_sprite.scale = SF.vector2(1, 1)
                
        @@shoes_slot_08_text.position = @@shoes_slot_08_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShoes.center_clothing_text(@@shoes_slot_08_text)
        
        @@shoes_slot_08_image_sprite.position = @@shoes_slot_08_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_08_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_08_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@shoes_slot_09_sprite.position = @@clothing_box_sprite.position + SF.vector2(250 * max_scale, 120 * max_scale)
        @@shoes_slot_09_sprite.scale = SF.vector2(1, 1)
                
        @@shoes_slot_09_text.position = @@shoes_slot_09_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShoes.center_clothing_text(@@shoes_slot_09_text)
        
        @@shoes_slot_09_image_sprite.position = @@shoes_slot_09_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_09_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_09_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@shoes_slot_10_sprite.position = @@clothing_box_sprite.position + SF.vector2(330 * max_scale, 120 * max_scale)
        @@shoes_slot_10_sprite.scale = SF.vector2(1, 1)
                        
        @@shoes_slot_10_text.position = @@shoes_slot_10_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShoes.center_clothing_text(@@shoes_slot_10_text)
        
        @@shoes_slot_10_image_sprite.position = @@shoes_slot_10_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_10_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_10_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@shoes_slot_11_sprite.position = @@clothing_box_sprite.position + SF.vector2(10 * max_scale, 200 * max_scale)
        @@shoes_slot_11_sprite.scale = SF.vector2(1, 1)
                        
        @@shoes_slot_11_text.position = @@shoes_slot_11_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShoes.center_clothing_text(@@shoes_slot_11_text)
        
        @@shoes_slot_11_image_sprite.position = @@shoes_slot_11_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_11_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_11_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@shoes_slot_12_sprite.position = @@clothing_box_sprite.position + SF.vector2(90 * max_scale, 200 * max_scale)
        @@shoes_slot_12_sprite.scale = SF.vector2(1, 1)
                        
        @@shoes_slot_12_text.position = @@shoes_slot_12_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShoes.center_clothing_text(@@shoes_slot_12_text)
        
        @@shoes_slot_12_image_sprite.position = @@shoes_slot_12_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_12_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_12_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@shoes_slot_13_sprite.position = @@clothing_box_sprite.position + SF.vector2(170 * max_scale, 200 * max_scale)
        @@shoes_slot_13_sprite.scale = SF.vector2(1, 1)
        
        @@shoes_slot_13_text.position = @@shoes_slot_13_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShoes.center_clothing_text(@@shoes_slot_13_text)
        
        @@shoes_slot_13_image_sprite.position = @@shoes_slot_13_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_13_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_13_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@shoes_slot_14_sprite.position = @@clothing_box_sprite.position + SF.vector2(250 * max_scale, 200 * max_scale)
        @@shoes_slot_14_sprite.scale = SF.vector2(1, 1)
                        
        @@shoes_slot_14_text.position = @@shoes_slot_14_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShoes.center_clothing_text(@@shoes_slot_14_text)
        
        @@shoes_slot_14_image_sprite.position = @@shoes_slot_14_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_14_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_14_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@shoes_slot_15_sprite.position = @@clothing_box_sprite.position + SF.vector2(330 * max_scale, 200 * max_scale)
        @@shoes_slot_15_sprite.scale = SF.vector2(1, 1)
                        
        @@shoes_slot_15_text.position = @@shoes_slot_15_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTabShoes.center_clothing_text(@@shoes_slot_15_text)
        
        @@shoes_slot_15_image_sprite.position = @@shoes_slot_15_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_15_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_15_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)


        window.draw(@@shoes_slot_01_sprite)
        window.draw(@@shoes_slot_01_image_sprite)
        window.draw(@@shoes_slot_01_text)

        window.draw(@@shoes_slot_02_sprite)
        window.draw(@@shoes_slot_02_image_sprite)
        window.draw(@@shoes_slot_02_text)

        window.draw(@@shoes_slot_03_sprite)
        window.draw(@@shoes_slot_03_image_sprite)
        window.draw(@@shoes_slot_03_text)
        
        window.draw(@@shoes_slot_04_sprite)
        window.draw(@@shoes_slot_04_image_sprite)
        window.draw(@@shoes_slot_04_text)

        window.draw(@@shoes_slot_05_sprite)
        window.draw(@@shoes_slot_05_image_sprite)
        window.draw(@@shoes_slot_05_text)

        window.draw(@@shoes_slot_06_sprite)
        window.draw(@@shoes_slot_06_image_sprite)
        window.draw(@@shoes_slot_06_text)

        window.draw(@@shoes_slot_07_sprite)
        window.draw(@@shoes_slot_07_image_sprite)
        window.draw(@@shoes_slot_07_text)

        window.draw(@@shoes_slot_08_sprite)
        window.draw(@@shoes_slot_08_image_sprite)
        window.draw(@@shoes_slot_08_text)

        window.draw(@@shoes_slot_09_sprite)
        window.draw(@@shoes_slot_09_image_sprite)
        window.draw(@@shoes_slot_09_text)

        window.draw(@@shoes_slot_10_sprite)
        window.draw(@@shoes_slot_10_image_sprite)
        window.draw(@@shoes_slot_10_text)

        window.draw(@@shoes_slot_11_sprite)
        window.draw(@@shoes_slot_11_image_sprite)
        window.draw(@@shoes_slot_11_text)

        window.draw(@@shoes_slot_12_sprite)
        window.draw(@@shoes_slot_12_image_sprite)
        window.draw(@@shoes_slot_12_text)

        window.draw(@@shoes_slot_13_sprite)
        window.draw(@@shoes_slot_13_image_sprite)
        window.draw(@@shoes_slot_13_text)

        window.draw(@@shoes_slot_14_sprite)
        window.draw(@@shoes_slot_14_image_sprite)
        window.draw(@@shoes_slot_14_text)

        window.draw(@@shoes_slot_15_sprite)
        window.draw(@@shoes_slot_15_image_sprite)
        window.draw(@@shoes_slot_15_text)

        if SF::Mouse.button_pressed?(SF::Mouse::Left)
            ClothingTabShoes.clothes_mouse_handling(window)
        end
       end

       def ClothingTabShoes.clothes_mouse_handling(window)
        mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window))
        mouse_x = mouse_position.x
        mouse_y = mouse_position.y
        
    
        current_size = window.size
        original_width = 800 
        original_height = 600 

        scale_x = (current_size.x.to_f / original_width)
        scale_y = current_size.y.to_f / original_height
        

        #------------------------------------objects-------------------------------------------------

            slot_01_x = @@shoes_slot_01_sprite.position.x
            slot_01_y = @@shoes_slot_01_sprite.position.y
            slot_01_width = @@shoes_slot_01_sprite.size.x
            slot_01_height = @@shoes_slot_01_sprite.size.y

            slot_02_x = @@shoes_slot_02_sprite.position.x
            slot_02_y = @@shoes_slot_02_sprite.position.y
            slot_02_width = @@shoes_slot_02_sprite.size.x
            slot_02_height = @@shoes_slot_02_sprite.size.y

            slot_03_x = @@shoes_slot_03_sprite.position.x
            slot_03_y = @@shoes_slot_03_sprite.position.y
            slot_03_width = @@shoes_slot_03_sprite.size.x
            slot_03_height = @@shoes_slot_03_sprite.size.y

            slot_04_x = @@shoes_slot_04_sprite.position.x
            slot_04_y = @@shoes_slot_04_sprite.position.y
            slot_04_width = @@shoes_slot_04_sprite.size.x
            slot_04_height = @@shoes_slot_04_sprite.size.y

            slot_05_x = @@shoes_slot_05_sprite.position.x
            slot_05_y = @@shoes_slot_05_sprite.position.y
            slot_05_width = @@shoes_slot_05_sprite.size.x
            slot_05_height = @@shoes_slot_05_sprite.size.y

            slot_06_x = @@shoes_slot_06_sprite.position.x
            slot_06_y = @@shoes_slot_06_sprite.position.y
            slot_06_width = @@shoes_slot_06_sprite.size.x
            slot_06_height = @@shoes_slot_06_sprite.size.y

            slot_07_x = @@shoes_slot_07_sprite.position.x
            slot_07_y = @@shoes_slot_07_sprite.position.y
            slot_07_width = @@shoes_slot_07_sprite.size.x
            slot_07_height = @@shoes_slot_07_sprite.size.y

            slot_08_x = @@shoes_slot_08_sprite.position.x
            slot_08_y = @@shoes_slot_08_sprite.position.y
            slot_08_width = @@shoes_slot_08_sprite.size.x
            slot_08_height = @@shoes_slot_08_sprite.size.y

            slot_09_x = @@shoes_slot_09_sprite.position.x
            slot_09_y = @@shoes_slot_09_sprite.position.y
            slot_09_width = @@shoes_slot_09_sprite.size.x
            slot_09_height = @@shoes_slot_09_sprite.size.y

            slot_10_x = @@shoes_slot_10_sprite.position.x
            slot_10_y = @@shoes_slot_10_sprite.position.y
            slot_10_width = @@shoes_slot_10_sprite.size.x
            slot_10_height = @@shoes_slot_10_sprite.size.y

            slot_11_x = @@shoes_slot_11_sprite.position.x
            slot_11_y = @@shoes_slot_11_sprite.position.y
            slot_11_width = @@shoes_slot_11_sprite.size.x
            slot_11_height = @@shoes_slot_11_sprite.size.y

            slot_12_x = @@shoes_slot_12_sprite.position.x
            slot_12_y = @@shoes_slot_12_sprite.position.y
            slot_12_width = @@shoes_slot_12_sprite.size.x
            slot_12_height = @@shoes_slot_12_sprite.size.y

            slot_13_x = @@shoes_slot_13_sprite.position.x
            slot_13_y = @@shoes_slot_13_sprite.position.y
            slot_13_width = @@shoes_slot_13_sprite.size.x
            slot_13_height = @@shoes_slot_13_sprite.size.y

            slot_14_x = @@shoes_slot_14_sprite.position.x
            slot_14_y = @@shoes_slot_14_sprite.position.y
            slot_14_width = @@shoes_slot_14_sprite.size.x
            slot_14_height = @@shoes_slot_14_sprite.size.y

            slot_15_x = @@shoes_slot_15_sprite.position.x
            slot_15_y = @@shoes_slot_15_sprite.position.y
            slot_15_width = @@shoes_slot_15_sprite.size.x
            slot_15_height = @@shoes_slot_15_sprite.size.y
        #---------------------------------------------------------------------------------------------
        
        if (mouse_x >= slot_01_x && mouse_x <= slot_01_x + slot_01_width) &&
           (mouse_y >= slot_01_y && mouse_y <= slot_01_y + slot_01_height)
            if @@shoes_slot_01 != nil   
                t = 0 + (@@page.not_nil! * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(Player::Appearance.get_clothing("shoes").not_nil!).not_nil!)
                Player::Appearance.change_shoes(@@shoes_slot_01.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_02_x && mouse_x <= slot_02_x + slot_02_width) &&
           (mouse_y >= slot_02_y && mouse_y <= slot_02_y + slot_02_height)
           
            if @@shoes_slot_02 != nil
                t = 1 + (@@page.not_nil! * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(Player::Appearance.get_clothing("shoes").not_nil!).not_nil!)
                Player::Appearance.change_shoes(@@shoes_slot_02.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_03_x && mouse_x <= slot_03_x + slot_03_width) &&
           (mouse_y >= slot_03_y && mouse_y <= slot_03_y + slot_03_height)
           
            if @@shoes_slot_03 != nil
                t = 2 + (@@page.not_nil! * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(Player::Appearance.get_clothing("shoes").not_nil!).not_nil!)
                Player::Appearance.change_shoes(@@shoes_slot_03.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_04_x && mouse_x <= slot_04_x + slot_04_width) &&
           (mouse_y >= slot_04_y && mouse_y <= slot_04_y + slot_04_height)
           
            if @@shoes_slot_04 != nil
                t = 3 + (@@page.not_nil! * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(Player::Appearance.get_clothing("shoes").not_nil!).not_nil!)
                Player::Appearance.change_shoes(@@shoes_slot_04.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_05_x && mouse_x <= slot_05_x + slot_05_width) &&
           (mouse_y >= slot_05_y && mouse_y <= slot_05_y + slot_05_height)
           
            if @@shoes_slot_05 != nil
                t = 4 + (@@page.not_nil! * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(Player::Appearance.get_clothing("shoes").not_nil!).not_nil!)
                Player::Appearance.change_shoes(@@shoes_slot_05.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_06_x && mouse_x <= slot_06_x + slot_06_width) &&
           (mouse_y >= slot_06_y && mouse_y <= slot_06_y + slot_06_height)
           
            if @@shoes_slot_06 != nil
                t = 5 + (@@page.not_nil! * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(Player::Appearance.get_clothing("shoes").not_nil!).not_nil!)
                Player::Appearance.change_shoes(@@shoes_slot_06.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_07_x && mouse_x <= slot_07_x + slot_07_width) &&
           (mouse_y >= slot_07_y && mouse_y <= slot_07_y + slot_07_height)
           
            if @@shoes_slot_07 != nil
                t = 6 + (@@page.not_nil! * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(Player::Appearance.get_clothing("shoes").not_nil!).not_nil!)
                Player::Appearance.change_shoes(@@shoes_slot_07.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_08_x && mouse_x <= slot_08_x + slot_08_width) &&
           (mouse_y >= slot_08_y && mouse_y <= slot_08_y + slot_08_height)
           
            if @@shoes_slot_08 != nil
                t = 7 + (@@page.not_nil! * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(Player::Appearance.get_clothing("shoes").not_nil!).not_nil!)
                Player::Appearance.change_shoes(@@shoes_slot_08.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_09_x && mouse_x <= slot_09_x + slot_09_width) &&
           (mouse_y >= slot_09_y && mouse_y <= slot_09_y + slot_09_height)
           
            if @@shoes_slot_09 != nil
                t = 8 + (@@page.not_nil! * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(Player::Appearance.get_clothing("shoes").not_nil!).not_nil!)
                Player::Appearance.change_shoes(@@shoes_slot_09.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_10_x && mouse_x <= slot_10_x + slot_10_width) &&
           (mouse_y >= slot_10_y && mouse_y <= slot_10_y + slot_10_height)
           
            if @@shoes_slot_10 != nil
                t = 9 + (@@page.not_nil! * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(Player::Appearance.get_clothing("shoes").not_nil!).not_nil!)
                Player::Appearance.change_shoes(@@shoes_slot_10.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_11_x && mouse_x <= slot_11_x + slot_11_width) &&
           (mouse_y >= slot_11_y && mouse_y <= slot_11_y + slot_11_height)
           
            if @@shoes_slot_11 != nil
                t = 10 + (@@page.not_nil! * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(Player::Appearance.get_clothing("shoes").not_nil!).not_nil!)
                Player::Appearance.change_shoes(@@shoes_slot_11.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_12_x && mouse_x <= slot_12_x + slot_12_width) &&
           (mouse_y >= slot_12_y && mouse_y <= slot_12_y + slot_12_height)
           
            if @@shoes_slot_12 != nil
                t = 11 + (@@page.not_nil! * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(Player::Appearance.get_clothing("shoes").not_nil!).not_nil!)
                Player::Appearance.change_shoes(@@shoes_slot_12.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_13_x && mouse_x <= slot_13_x + slot_13_width) &&
           (mouse_y >= slot_13_y && mouse_y <= slot_13_y + slot_13_height)
           
            if @@shoes_slot_13 != nil
                t = 12 + (@@page.not_nil! * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(Player::Appearance.get_clothing("shoes").not_nil!).not_nil!)
                Player::Appearance.change_shoes(@@shoes_slot_13.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_14_x && mouse_x <= slot_14_x + slot_14_width) &&
           (mouse_y >= slot_14_y && mouse_y <= slot_14_y + slot_14_height)
           
            if @@shoes_slot_14 != nil
                t = 13 + (@@page.not_nil! * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(Player::Appearance.get_clothing("shoes").not_nil!).not_nil!)
                Player::Appearance.change_shoes(@@shoes_slot_14.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_15_x && mouse_x <= slot_15_x + slot_15_width) &&
           (mouse_y >= slot_15_y && mouse_y <= slot_15_y + slot_15_height)
           
            if @@shoes_slot_15 != nil
                t = 14 + (@@page.not_nil! * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(Player::Appearance.get_clothing("shoes").not_nil!).not_nil!)
                Player::Appearance.change_shoes(@@shoes_slot_15.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end

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