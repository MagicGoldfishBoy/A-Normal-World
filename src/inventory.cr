require "crsfml"
require "../src/textures.cr"
require "../src/equipment.cr"
require "../src/utility.cr"
require "../src/consumables.cr"


INVENTORY_BOX = SF::RectangleShape.new(SF.vector2(610, 420))
INVENTORY_BOX.fill_color = SF.color( 137, 170, 208 )

INVENTORY_LEFT_ARROW_SPRITE = SF::RectangleShape.new(SF.vector2(50, 25))
INVENTORY_LEFT_ARROW_SPRITE.fill_color = SF.color(161, 183, 208)

INVENTORY_RIGHT_ARROW_SPRITE = SF::RectangleShape.new(SF.vector2(50, 25))
INVENTORY_RIGHT_ARROW_SPRITE.fill_color = SF.color(161, 183, 208)

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
    class InventoryManager

        @@tab = "Shirt"
        @@category = "Cosmetics"
     #----------------------------------objects------------------------------------------------

        @@cosmetics_category_tab = SF::RectangleShape.new(SF.vector2(100, 50))
        @@cosmetics_category_tab.fill_color = SF.color(161, 183, 208)

        @@cosmetics_category_tab_text = SF::Text.new
        @@cosmetics_category_tab_text.font = QUICKSAND
        @@cosmetics_category_tab_text.character_size = 20
        @@cosmetics_category_tab_text.color = SF::Color::Blue
        @@cosmetics_category_tab_text.string = "Cosmetics"

        @@equipment_category_tab = SF::RectangleShape.new(SF.vector2(100, 50))
        @@equipment_category_tab.fill_color = SF.color(161, 183, 208)

        @@equipment_category_tab_text = SF::Text.new
        @@equipment_category_tab_text.font = QUICKSAND
        @@equipment_category_tab_text.character_size = 20
        @@equipment_category_tab_text.color = SF::Color::Blue
        @@equipment_category_tab_text.string = "Equipment"

        @@consumables_category_tab = SF::RectangleShape.new(SF.vector2(128, 50))
        @@consumables_category_tab.fill_color = SF.color(161, 183, 208)

        @@consumables_category_tab_text = SF::Text.new
        @@consumables_category_tab_text.font = QUICKSAND
        @@consumables_category_tab_text.character_size = 20
        @@consumables_category_tab_text.color = SF::Color::Blue
        @@consumables_category_tab_text.string = "Consumables"


        @@clothing_sort_button_sprite = SF::RectangleShape.new(SF.vector2(75, 25))
        @@clothing_sort_button_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_shirt_category_box = SF::RectangleShape.new(SF.vector2(100, 25))
        @@clothing_shirt_category_box.fill_color = SF.color(161, 183, 208)

        @@clothing_sort_button_text = SF::Text.new
        @@clothing_sort_button_text.font = QUICKSAND
        @@clothing_sort_button_text.character_size = 20
        @@clothing_sort_button_text.color = SF::Color::Blue
        @@clothing_sort_button_text.string = "Sort"


        @@clothing_jacket_category_box = SF::RectangleShape.new(SF.vector2(100, 25))
        @@clothing_jacket_category_box.fill_color = SF.color(161, 183, 208)

        @@clothing_sort_button_text = SF::Text.new
        @@clothing_sort_button_text.font = QUICKSAND
        @@clothing_sort_button_text.character_size = 20
        @@clothing_sort_button_text.color = SF::Color::Blue
        @@clothing_sort_button_text.string = "Sort"

        @@weapon_tab = SF::RectangleShape.new(SF.vector2(100, 50))
        @@weapon_tab.fill_color = SF.color(141, 163, 188)

        @@weapon_tab_text = SF::Text.new
        @@weapon_tab_text.font = QUICKSAND
        @@weapon_tab_text.character_size = 20
        @@weapon_tab_text.color = SF::Color::Blue
        @@weapon_tab_text.string = "Weapons"

     #-----------------------------------------------------------------------------------------


        def InventoryManager.reset_clothing_pages(window)
            ClothingTabGloves.page=(1)
            ClothingTabShirt.page=(1)
            ClothingTabJacket.page=(1)
            ClothingTabPants.page=(1)
            ClothingTabEarrings.page=(1)
            ClothingTabHat.page=(1)
            ClothingTabGlasses.page=(1)
            ClothingTabMakeup.page=(1)
            ClothingTabNecklace.page=(1)
        end

        def InventoryManager.open_shirt_tab(window)
            InventoryManager.reset_clothing_pages(window)
            @@tab = "Shirt"
            ClothingTabShirt.assign_slot_textures(window)
        end

        def InventoryManager.open_pants_tab(window)
            InventoryManager.reset_clothing_pages(window)
            @@tab = "Pants"
            ClothingTabPants.assign_slot_textures(window)
        end

        def InventoryManager.open_shoes_tab(window)
            InventoryManager.reset_clothing_pages(window)
            @@tab = "Shoes"
            ClothingTabShoes.assign_slot_textures(window)
        end

        def InventoryManager.open_socks_tab(window)
            InventoryManager.reset_clothing_pages(window)
            @@tab = "Socks"
            ClothingTabSocks.assign_slot_textures(window)
        end

        def InventoryManager.open_gloves_tab(window)
            InventoryManager.reset_clothing_pages(window)
            @@tab = "Gloves"
            ClothingTabGloves.assign_slot_textures(window)
        end

        def InventoryManager.open_earrings_tab(window)
            InventoryManager.reset_clothing_pages(window)
            @@tab = "Earrings"
            ClothingTabEarrings.assign_slot_textures(window)
        end

        def InventoryManager.open_makeup_tab(window)
            InventoryManager.reset_clothing_pages(window)
            @@tab = "Makeup"
            ClothingTabMakeup.assign_slot_textures(window)
        end

        def InventoryManager.open_necklace_tab(window)
            InventoryManager.reset_clothing_pages(window)
            @@tab = "Necklace"
            ClothingTabNecklace.assign_slot_textures(window)
        end

        def InventoryManager.close_cosmetics_category(window)
            InventoryManager.reset_clothing_pages(window)
            ClothingTabShirt.is_open=(false)
            ClothingTabJacket.is_open=(false)
            ClothingTabGloves.is_open=(false)
            ClothingTabPants.is_open=(false)
            ClothingTabShoes.is_open=(false)
            ClothingTabSocks.is_open=(false)
            ClothingTabEarrings.is_open=(false)
            ClothingTabHat.is_open=(false)
            ClothingTabGlasses.is_open=(false)
            ClothingTabMakeup.is_open=(false)
            ClothingTabNecklace.is_open=(false)
            ClothingTabMakeup.assign_slot_textures(window)
        end

        def InventoryManager.open_cosmetics_category(window)
            InventoryManager.reset_clothing_pages(window)
            ClothingTabShirt.is_open=(true)
            ClothingTabJacket.is_open=(false)
            ClothingTabGloves.is_open=(false)
            ClothingTabPants.is_open=(false)
            ClothingTabShoes.is_open=(false)
            ClothingTabSocks.is_open=(false)
            ClothingTabEarrings.is_open=(false)
            ClothingTabHat.is_open=(false)
            ClothingTabGlasses.is_open=(false)
            ClothingTabMakeup.is_open=(false)
            ClothingTabNecklace.is_open=(false)
            ClothingTabMakeup.assign_slot_textures(window)
        end

        def InventoryManager.open_weapons_tab(window)
            InventoryManager.reset_clothing_pages(window)
            WeaponTab.is_open=(true)
            WeaponTab.assign_slot_textures(window)
        end

        def InventoryManager.universal_mouse_handling(tab, window)
            mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window))
            mouse_x = mouse_position.x
            mouse_y = mouse_position.y
            
        
            current_size = window.size
            original_width = 800 
            original_height = 600 
    
            scale_x = (current_size.x.to_f / original_width)
            scale_y = current_size.y.to_f / original_height
            
            arrow_left_x = INVENTORY_LEFT_ARROW_SPRITE.position.x
            arrow_left_y = INVENTORY_LEFT_ARROW_SPRITE.position.y
            arrow_left_width = INVENTORY_LEFT_ARROW_SPRITE.size.x
            arrow_left_height = INVENTORY_LEFT_ARROW_SPRITE.size.y

            arrow_right_x = INVENTORY_RIGHT_ARROW_SPRITE.position.x
            arrow_right_y = INVENTORY_RIGHT_ARROW_SPRITE.position.y
            arrow_right_width = INVENTORY_RIGHT_ARROW_SPRITE.size.x
            arrow_right_height = INVENTORY_RIGHT_ARROW_SPRITE.size.y


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
            
            jacket_tab_x = @@jacket_tab.position.x
            jacket_tab_y = @@jacket_tab.position.y
            jacket_tab_width = @@jacket_tab.size.x
            jacket_tab_height = @@jacket_tab.size.y
            
            shoes_tab_x = @@shoes_tab.position.x
            shoes_tab_y = @@shoes_tab.position.y
            shoes_tab_width = @@shoes_tab.size.x
            shoes_tab_height = @@shoes_tab.size.y
            
            socks_tab_x = @@socks_tab.position.x
            socks_tab_y = @@socks_tab.position.y
            socks_tab_width = @@socks_tab.size.x
            socks_tab_height = @@socks_tab.size.y
            
            gloves_tab_x = @@gloves_tab.position.x
            gloves_tab_y = @@gloves_tab.position.y
            gloves_tab_width = @@gloves_tab.size.x
            gloves_tab_height = @@gloves_tab.size.y
            
            earrings_tab_x = @@earrings_tab.position.x
            earrings_tab_y = @@earrings_tab.position.y
            earrings_tab_width = @@earrings_tab.size.x
            earrings_tab_height = @@earrings_tab.size.y
            
            hat_tab_x = @@hat_tab.position.x
            hat_tab_y = @@hat_tab.position.y
            hat_tab_width = @@hat_tab.size.x
            hat_tab_height = @@hat_tab.size.y
            
            glasses_tab_x = @@glasses_tab.position.x
            glasses_tab_y = @@glasses_tab.position.y
            glasses_tab_width = @@glasses_tab.size.x
            glasses_tab_height = @@glasses_tab.size.y
            
            makeup_tab_x = @@makeup_tab.position.x
            makeup_tab_y = @@makeup_tab.position.y
            makeup_tab_width = @@makeup_tab.size.x
            makeup_tab_height = @@makeup_tab.size.y
            
            necklace_tab_x = @@necklace_tab.position.x
            necklace_tab_y = @@necklace_tab.position.y
            necklace_tab_width = @@necklace_tab.size.x
            necklace_tab_height = @@necklace_tab.size.y

            cosmetics_tab_x = @@cosmetics_category_tab.position.x
            cosmetics_tab_y = @@cosmetics_category_tab.position.y
            cosmetics_tab_width = @@cosmetics_category_tab.size.x
            cosmetics_tab_height = @@cosmetics_category_tab.size.y
            
            equipment_tab_x = @@equipment_category_tab.position.x
            equipment_tab_y = @@equipment_category_tab.position.y
            equipment_tab_width = @@equipment_category_tab.size.x
            equipment_tab_height = @@equipment_category_tab.size.y
            
            consumables_tab_x = @@consumables_category_tab.position.x
            consumables_tab_y = @@consumables_category_tab.position.y
            consumables_tab_width = @@consumables_category_tab.size.x
            consumables_tab_height = @@consumables_category_tab.size.y

            if (mouse_x >= cosmetics_tab_x && mouse_x <= cosmetics_tab_x + cosmetics_tab_width) &&
                (mouse_y >= cosmetics_tab_y && mouse_y <= cosmetics_tab_y + cosmetics_tab_height)
                 InventoryManager.open_cosmetics_category(window)
                 @@tab = "Shirt"
                 @@category = "Cosmetics"
                 sleep 0.15.seconds
            end
            
            if (mouse_x >= equipment_tab_x && mouse_x <= equipment_tab_x + equipment_tab_width) &&
                (mouse_y >= equipment_tab_y && mouse_y <= equipment_tab_y + equipment_tab_height)
                 InventoryManager.close_cosmetics_category(window)
                 @@category = "Equipment"
                 InventoryManager.open_weapons_tab(window)
                 sleep 0.15.seconds
            end
            
            if (mouse_x >= consumables_tab_x && mouse_x <= consumables_tab_x + consumables_tab_width) &&
                (mouse_y >= consumables_tab_y && mouse_y <= consumables_tab_y + consumables_tab_height)
                 InventoryManager.close_cosmetics_category(window)
                 @@category = "Consumables"
                 @@tab = "consumables"
                 ConsumableTab.assign_slot_textures(window)
                 #InventoryManager.open_weapons_tab(window)
                 sleep 0.15.seconds
            end


            if (mouse_x >= pants_tab_x && mouse_x <= pants_tab_x + pants_tab_width) &&
                (mouse_y >= pants_tab_y && mouse_y <= pants_tab_y + pants_tab_height)

                InventoryManager.open_pants_tab(window)
                sleep 0.15.seconds
            end 

            if (mouse_x >= earrings_tab_x && mouse_x <= earrings_tab_x + earrings_tab_width) &&
                (mouse_y >= earrings_tab_y && mouse_y <= earrings_tab_y + earrings_tab_height)

                InventoryManager.open_earrings_tab(window)
                sleep 0.15.seconds
            end 

            if (mouse_x >= shirt_tab_x && mouse_x <= shirt_tab_x + shirt_tab_width) &&
                (mouse_y >= shirt_tab_y && mouse_y <= shirt_tab_y + shirt_tab_height)

                InventoryManager.open_shirt_tab(window)
                sleep 0.15.seconds
            end 

            if (mouse_x >= jacket_tab_x && mouse_x <= jacket_tab_x + jacket_tab_width) &&
                (mouse_y >= jacket_tab_y && mouse_y <= jacket_tab_y + jacket_tab_height)

                InventoryManager.open_jacket_tab(window)
                sleep 0.15.seconds
            end 

            if (mouse_x >= shoes_tab_x && mouse_x <= shoes_tab_x + shoes_tab_width) &&
                (mouse_y >= shoes_tab_y && mouse_y <= shoes_tab_y + shoes_tab_height)

                InventoryManager.open_shoes_tab(window)
                sleep 0.15.seconds
            end 

            if (mouse_x >= socks_tab_x && mouse_x <= socks_tab_x + socks_tab_width) &&
                (mouse_y >= socks_tab_y && mouse_y <= socks_tab_y + socks_tab_height)

                InventoryManager.open_socks_tab(window)
                sleep 0.15.seconds
            end 

            if (mouse_x >= glasses_tab_x && mouse_x <= glasses_tab_x + glasses_tab_width) &&
                (mouse_y >= glasses_tab_y && mouse_y <= glasses_tab_y + glasses_tab_height)

                InventoryManager.open_glasses_tab(window)
                sleep 0.15.seconds
            end 

            if (mouse_x >= makeup_tab_x && mouse_x <= makeup_tab_x + makeup_tab_width) &&
                (mouse_y >= makeup_tab_y && mouse_y <= makeup_tab_y + makeup_tab_height)

                InventoryManager.open_makeup_tab(window)
                sleep 0.15.seconds
            end 

            if (mouse_x >= necklace_tab_x && mouse_x <= necklace_tab_x + necklace_tab_width) &&
                (mouse_y >= necklace_tab_y && mouse_y <= necklace_tab_y + necklace_tab_height)

                InventoryManager.open_necklace_tab(window)
                sleep 0.15.seconds
            end 

            if (mouse_x >= hat_tab_x && mouse_x <= hat_tab_x + hat_tab_width) &&
                (mouse_y >= hat_tab_y && mouse_y <= hat_tab_y + hat_tab_height)

                InventoryManager.open_hat_tab(window)
                sleep 0.15.seconds
            end 

            if (mouse_x >= gloves_tab_x && mouse_x <= gloves_tab_x + gloves_tab_width) &&
                (mouse_y >= gloves_tab_y && mouse_y <= gloves_tab_y + gloves_tab_height)

                InventoryManager.open_gloves_tab(window)
                sleep 0.15.seconds
            end 

            case tab
            when "shirt"
                InventoryManager.shirt_tab_mouse_handling(window)
            when "jacket"
                InventoryManager.jacket_tab_mouse_handling(window)
            when "pants"
                InventoryManager.pants_tab_mouse_handling(window)
            when "shoes"
                InventoryManager.shoes_tab_mouse_handling(window)
            when "socks"
                InventoryManager.socks_tab_mouse_handling(window)
            when "gloves"
                InventoryManager.gloves_tab_mouse_handling(window)
            when "earrings"
                InventoryManager.earrings_tab_mouse_handling(window)
            when "hat"
                InventoryManager.hat_tab_mouse_handling(window)
            when "glasses"
                InventoryManager.glasses_tab_mouse_handling(window)
            when "makeup"
                InventoryManager.makeup_tab_mouse_handling(window)
            when "necklace"
                InventoryManager.necklace_tab_mouse_handling(window)
            when "weapon"
                InventoryManager.weapon_tab_mouse_handling(window)
            when "consumable"
                InventoryManager.consumable_tab_mouse_handling(window)
            end

        end

        def InventoryManager.weapon_tab_mouse_handling(window)
            mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window))
            mouse_x = mouse_position.x
            mouse_y = mouse_position.y
            
        
            current_size = window.size
            original_width = 800 
            original_height = 600 
    
            scale_x = (current_size.x.to_f / original_width)
            scale_y = current_size.y.to_f / original_height
    
            #------------------------------------objects-------------------------------------------------
                arrow_left_x = INVENTORY_LEFT_ARROW_SPRITE.position.x
                arrow_left_y = INVENTORY_LEFT_ARROW_SPRITE.position.y
                arrow_left_width = INVENTORY_LEFT_ARROW_SPRITE.size.x
                arrow_left_height = INVENTORY_LEFT_ARROW_SPRITE.size.y

                arrow_right_x = INVENTORY_RIGHT_ARROW_SPRITE.position.x
                arrow_right_y = INVENTORY_RIGHT_ARROW_SPRITE.position.y
                arrow_right_width = INVENTORY_RIGHT_ARROW_SPRITE.size.x
                arrow_right_height = INVENTORY_RIGHT_ARROW_SPRITE.size.y


                sort_button_x = @@clothing_sort_button_sprite.position.x
                sort_button_y = @@clothing_sort_button_sprite.position.y
                sort_button_width = @@clothing_sort_button_sprite.size.x
                sort_button_height = @@clothing_sort_button_sprite.size.y
    
                category_button_x = @@clothing_shirt_category_box.position.x
                category_button_y = @@clothing_shirt_category_box.position.y
                category_button_width = @@clothing_shirt_category_box.size.x
                category_button_height = @@clothing_shirt_category_box.size.y

            #---------------------------------------------------------------------------------------------
            if (mouse_x >= arrow_left_x && mouse_x <= arrow_left_x + arrow_left_width) &&
                (mouse_y >= arrow_left_y && mouse_y <= arrow_left_y + arrow_left_height)
                if WeaponTab.page == nil
                    WeaponTab.page = 1
                end
                 if WeaponTab.page.not_nil! > 1
                    WeaponTab.page=(WeaponTab.page.not_nil! - 1)
                 end
                 WeaponTab.assign_slot_textures(window)
                 sleep 0.15.seconds
            end
             
            if (mouse_x >= arrow_right_x && mouse_x <= arrow_right_x + arrow_right_width) &&
                (mouse_y >= arrow_right_y && mouse_y <= arrow_right_y + arrow_right_height)
                 if WeaponTab.page == nil
                    WeaponTab.page = 1
                 end
                 if WeaponTab.page.not_nil! <= 5
                    WeaponTab.page=(WeaponTab.page.not_nil! + 1)
                 end
                 WeaponTab.assign_slot_textures(window)
                 sleep 0.15.seconds
            end  
            
            if (mouse_x >= sort_button_x && mouse_x <= sort_button_x + sort_button_width) &&
                (mouse_y >= sort_button_y && mouse_y <= sort_button_y + sort_button_height)
                if WeaponTab.get_weapon_category == "Color"
                 WeaponTab.organise_owned_weapon_array_by_color(window)
                elsif "Type"
                 WeaponTab.organise_owned_weapon_array_by_type(window)
                end
                 sleep 0.15.seconds
             end        
     
             if (mouse_x >= category_button_x && mouse_x <= category_button_x + category_button_width) &&
                (mouse_y >= category_button_y && mouse_y <= category_button_y + category_button_height)
                 WeaponTab.change_weapon_sort_category
                 @@equipment_weapon_category_text.string = WeaponTab.get_weapon_category
                 Utility::StringUtilities.center_text(@@equipment_weapon_category_text)
                 sleep 0.15.seconds
             end  
        end

        def InventoryManager.consumable_tab_mouse_handling(window)
            mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window))
            mouse_x = mouse_position.x
            mouse_y = mouse_position.y
            
        
            current_size = window.size
            original_width = 800 
            original_height = 600 
    
            scale_x = (current_size.x.to_f / original_width)
            scale_y = current_size.y.to_f / original_height
    
            #------------------------------------objects-------------------------------------------------
                arrow_left_x = INVENTORY_LEFT_ARROW_SPRITE.position.x
                arrow_left_y = INVENTORY_LEFT_ARROW_SPRITE.position.y
                arrow_left_width = INVENTORY_LEFT_ARROW_SPRITE.size.x
                arrow_left_height = INVENTORY_LEFT_ARROW_SPRITE.size.y

                arrow_right_x = INVENTORY_RIGHT_ARROW_SPRITE.position.x
                arrow_right_y = INVENTORY_RIGHT_ARROW_SPRITE.position.y
                arrow_right_width = INVENTORY_RIGHT_ARROW_SPRITE.size.x
                arrow_right_height = INVENTORY_RIGHT_ARROW_SPRITE.size.y


                sort_button_x = @@clothing_sort_button_sprite.position.x
                sort_button_y = @@clothing_sort_button_sprite.position.y
                sort_button_width = @@clothing_sort_button_sprite.size.x
                sort_button_height = @@clothing_sort_button_sprite.size.y
    
                category_button_x = @@clothing_shirt_category_box.position.x
                category_button_y = @@clothing_shirt_category_box.position.y
                category_button_width = @@clothing_shirt_category_box.size.x
                category_button_height = @@clothing_shirt_category_box.size.y

            #---------------------------------------------------------------------------------------------
            if (mouse_x >= arrow_left_x && mouse_x <= arrow_left_x + arrow_left_width) &&
                (mouse_y >= arrow_left_y && mouse_y <= arrow_left_y + arrow_left_height)
                if ConsumableTab.page == nil
                    ConsumableTab.page = 1
                end
                 if ConsumableTab.page.not_nil! > 1
                    ConsumableTab.page=(ConsumableTab.page.not_nil! - 1)
                 end
                 ConsumableTab.assign_slot_textures(window)
                 sleep 0.15.seconds
            end
             
            if (mouse_x >= arrow_right_x && mouse_x <= arrow_right_x + arrow_right_width) &&
                (mouse_y >= arrow_right_y && mouse_y <= arrow_right_y + arrow_right_height)
                 if ConsumableTab.page == nil
                    ConsumableTab.page = 1
                 end
                 if ConsumableTab.page.not_nil! <= 5
                    ConsumableTab.page=(ConsumableTab.page.not_nil! + 1)
                 end
                 ConsumableTab.assign_slot_textures(window)
                 sleep 0.15.seconds
            end  
            
            if (mouse_x >= sort_button_x && mouse_x <= sort_button_x + sort_button_width) &&
                (mouse_y >= sort_button_y && mouse_y <= sort_button_y + sort_button_height)
                # if ConsumableTab.get_consumable_category == "Color"
                #  ConsumableTab.organise_owned_consumable_array_by_color(window)
                # elsif "Type"
                #  ConsumableTab.organise_owned_consumable_array_by_type(window)
                # end
                 sleep 0.15.seconds
             end        
     
             if (mouse_x >= category_button_x && mouse_x <= category_button_x + category_button_width) &&
                (mouse_y >= category_button_y && mouse_y <= category_button_y + category_button_height)
                 ConsumableTab.change_consumable_sort_category
                 @@consumables_consumable_category_text.string = ConsumableTab.get_consumable_category
                 Utility::StringUtilities.center_text(@@consumables_consumable_category_text)
                 sleep 0.15.seconds
             end  
        end
    end


    class WeaponTab
        @@owned_weapon_array = [] of Equipment::Weapon

        @@weapon_sorting_category = "Type"

        @@weapon_slot_01 : Equipment::Weapon? = nil
        @@weapon_slot_02 : Equipment::Weapon? = nil
        @@weapon_slot_03 : Equipment::Weapon? = nil
        @@weapon_slot_04 : Equipment::Weapon? = nil
        @@weapon_slot_05 : Equipment::Weapon? = nil
        @@weapon_slot_06 : Equipment::Weapon? = nil
        @@weapon_slot_07 : Equipment::Weapon? = nil
        @@weapon_slot_08 : Equipment::Weapon? = nil
        @@weapon_slot_09 : Equipment::Weapon? = nil
        @@weapon_slot_10 : Equipment::Weapon? = nil
        @@weapon_slot_11 : Equipment::Weapon? = nil
        @@weapon_slot_12 : Equipment::Weapon? = nil
        @@weapon_slot_13 : Equipment::Weapon? = nil
        @@weapon_slot_14 : Equipment::Weapon? = nil
        @@weapon_slot_15 : Equipment::Weapon? = nil

       #---------------------------------debug-------------------------------------------
            @@owned_weapon_array.push(Equipment::Weapon.get_weapon("No Weapon").not_nil!)
            @@owned_weapon_array.push(Equipment::Blunt.get_weapon("Stick").not_nil!)
            @@owned_weapon_array.push(Equipment::Sword.get_weapon("Wood Sword").not_nil!)
            @@owned_weapon_array.push(Equipment::Knife.get_weapon("Kitchen Knife").not_nil!)
            @@owned_weapon_array.push(Equipment::Knife.get_weapon("Broken Bottle").not_nil!)
            @@owned_weapon_array.push(Equipment::Rifle.get_weapon("BB Gun").not_nil!)
       #---------------------------------------------------------------------------------
       #--------------------------------objects------------------------------------------
              INVENTORY_BOX = SF::RectangleShape.new(SF.vector2(610, 420))
              INVENTORY_BOX.fill_color = SF.color( 137, 170, 208 )
      
              
              @@equipment_left_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
              @@equipment_left_arrow_sprite.fill_color = SF.color(161, 183, 208)
      
              @@equipment_right_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
              @@equipment_right_arrow_sprite.fill_color = SF.color(161, 183, 208)
      
      
              @@equipment_sort_button_sprite = SF::RectangleShape.new(SF.vector2(75, 25))
              @@equipment_sort_button_sprite.fill_color = SF.color(161, 183, 208)
      
              @@equipment_weapon_category_box = SF::RectangleShape.new(SF.vector2(100, 25))
              @@equipment_weapon_category_box.fill_color = SF.color(161, 183, 208)
      
              @@equipment_sort_button_text = SF::Text.new
              @@equipment_sort_button_text.font = QUICKSAND
              @@equipment_sort_button_text.character_size = 20
              @@equipment_sort_button_text.color = SF::Color::Blue
              @@equipment_sort_button_text.string = "Sort"
      
      
              @@equipment_right_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
              @@equipment_right_arrow_sprite.fill_color = SF.color(161, 183, 208)


              @@weapon_info_box = SF::RectangleShape.new(SF.vector2(200, 200))
              @@weapon_info_box.fill_color = SF.color(200, 212, 219)
              @@weapon_info_box.outline_thickness = 10
              @@weapon_info_box.outline_color = SF.color(151, 179, 194)

              @@weapon_info_box_name_text = SF::Text.new
              @@weapon_info_box_name_text.font = QUICKSAND
              @@weapon_info_box_name_text.character_size = 14
              @@weapon_info_box_name_text.color = SF::Color::Blue

              @@weapon_info_box_attack_type_text = SF::Text.new
              @@weapon_info_box_attack_type_text.font = QUICKSAND
              @@weapon_info_box_attack_type_text.character_size = 14
              @@weapon_info_box_attack_type_text.color = SF::Color::Blue

              @@weapon_info_box_attack_strength_text = SF::Text.new
              @@weapon_info_box_attack_strength_text.font = QUICKSAND
              @@weapon_info_box_attack_strength_text.character_size = 14
              @@weapon_info_box_attack_strength_text.color = SF::Color::Blue

              @@weapon_info_box_minimum_strength_text = SF::Text.new
              @@weapon_info_box_minimum_strength_text.font = QUICKSAND
              @@weapon_info_box_minimum_strength_text.character_size = 14
              @@weapon_info_box_minimum_strength_text.color = SF::Color::Blue

              @@weapon_info_box_minimum_dexterity_text = SF::Text.new
              @@weapon_info_box_minimum_dexterity_text.font = QUICKSAND
              @@weapon_info_box_minimum_dexterity_text.character_size = 14
              @@weapon_info_box_minimum_dexterity_text.color = SF::Color::Blue

              @@weapon_info_box_minimum_intelligence_text = SF::Text.new
              @@weapon_info_box_minimum_intelligence_text.font = QUICKSAND
              @@weapon_info_box_minimum_intelligence_text.character_size = 14
              @@weapon_info_box_minimum_intelligence_text.color = SF::Color::Blue

              @@weapon_info_box_minimum_luck_text = SF::Text.new
              @@weapon_info_box_minimum_luck_text.font = QUICKSAND
              @@weapon_info_box_minimum_luck_text.character_size = 14
              @@weapon_info_box_minimum_luck_text.color = SF::Color::Blue

              @@weapon_info_box_minimum_status_effects_text = SF::Text.new
              @@weapon_info_box_minimum_status_effects_text.font = QUICKSAND
              @@weapon_info_box_minimum_status_effects_text.character_size = 14
              @@weapon_info_box_minimum_status_effects_text.color = SF::Color::Blue
      

              @@weapon_tab = SF::RectangleShape.new(SF.vector2(100, 50))
              @@weapon_tab.fill_color = SF.color(141, 163, 188)
      
              @@weapon_tab_text = SF::Text.new
              @@weapon_tab_text.font = QUICKSAND
              @@weapon_tab_text.color = SF::Color::Blue
              @@weapon_tab = SF::RectangleShape.new(SF.vector2(100, 50))
              @@weapon_tab.fill_color = SF.color(161, 183, 208)
      
              @@weapon_tab_text = SF::Text.new
              @@weapon_tab_text.font = QUICKSAND
              @@weapon_tab_text.character_size = 20
              @@weapon_tab_text.color = SF::Color::Blue
              @@weapon_tab_text.string = "Weapon"
      
      
              @@weapon_slot_01_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@weapon_slot_01_sprite.fill_color = SF.color(161, 183, 208)
      
              @@weapon_slot_01_text = SF::Text.new
              @@weapon_slot_01_text.font = QUICKSAND
              @@weapon_slot_01_text.character_size = 12
              @@weapon_slot_01_text.color = SF::Color::Blue
      
              @@weapon_slot_01_image_sprite = SF::Sprite.new
      
      
              @@weapon_slot_02_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@weapon_slot_02_sprite.fill_color = SF.color(161, 183, 208)
      
              @@weapon_slot_02_text = SF::Text.new
              @@weapon_slot_02_text.font = QUICKSAND
              @@weapon_slot_02_text.character_size = 12
              @@weapon_slot_02_text.color = SF::Color::Blue
      
              @@weapon_slot_02_image_sprite = SF::Sprite.new
      
      
              @@weapon_slot_03_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@weapon_slot_03_sprite.fill_color = SF.color(161, 183, 208)
      
              @@weapon_slot_03_text = SF::Text.new
              @@weapon_slot_03_text.font = QUICKSAND
              @@weapon_slot_03_text.character_size = 12
              @@weapon_slot_03_text.color = SF::Color::Blue
      
              @@weapon_slot_03_image_sprite = SF::Sprite.new
      
      
              @@weapon_slot_04_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@weapon_slot_04_sprite.fill_color = SF.color(161, 183, 208)
      
              @@weapon_slot_04_text = SF::Text.new
              @@weapon_slot_04_text.font = QUICKSAND
              @@weapon_slot_04_text.character_size = 12
              @@weapon_slot_04_text.color = SF::Color::Blue
      
              @@weapon_slot_04_image_sprite = SF::Sprite.new
      
      
              @@weapon_slot_05_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@weapon_slot_05_sprite.fill_color = SF.color(161, 183, 208)
      
              @@weapon_slot_05_text = SF::Text.new
              @@weapon_slot_05_text.font = QUICKSAND
              @@weapon_slot_05_text.character_size = 12
              @@weapon_slot_05_text.color = SF::Color::Blue
      
              @@weapon_slot_05_image_sprite = SF::Sprite.new
      
      
              @@weapon_slot_06_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@weapon_slot_06_sprite.fill_color = SF.color(161, 183, 208)
      
              @@weapon_slot_06_text = SF::Text.new
              @@weapon_slot_06_text.font = QUICKSAND
              @@weapon_slot_06_text.character_size = 12
              @@weapon_slot_06_text.color = SF::Color::Blue
              
              @@weapon_slot_06_image_sprite = SF::Sprite.new
      
      
              @@weapon_slot_07_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@weapon_slot_07_sprite.fill_color = SF.color(161, 183, 208)
      
              @@weapon_slot_07_text = SF::Text.new
              @@weapon_slot_07_text.font = QUICKSAND
              @@weapon_slot_07_text.character_size = 12
              @@weapon_slot_07_text.color = SF::Color::Blue
      
              @@weapon_slot_07_image_sprite = SF::Sprite.new
      
      
              @@weapon_slot_08_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@weapon_slot_08_sprite.fill_color = SF.color(161, 183, 208)
      
              @@weapon_slot_08_text = SF::Text.new
              @@weapon_slot_08_text.font = QUICKSAND
              @@weapon_slot_08_text.character_size = 12
              @@weapon_slot_08_text.color = SF::Color::Blue
      
              @@weapon_slot_08_image_sprite = SF::Sprite.new
      
      
              @@weapon_slot_09_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@weapon_slot_09_sprite.fill_color = SF.color(161, 183, 208)
      
              @@weapon_slot_09_text = SF::Text.new
              @@weapon_slot_09_text.font = QUICKSAND
              @@weapon_slot_09_text.character_size = 12
              @@weapon_slot_09_text.color = SF::Color::Blue
      
              @@weapon_slot_09_image_sprite = SF::Sprite.new
      
      
              @@weapon_slot_10_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@weapon_slot_10_sprite.fill_color = SF.color(161, 183, 208)
      
              @@weapon_slot_10_text = SF::Text.new
              @@weapon_slot_10_text.font = QUICKSAND
              @@weapon_slot_10_text.character_size = 12
              @@weapon_slot_10_text.color = SF::Color::Blue
      
              @@weapon_slot_10_image_sprite = SF::Sprite.new
      
      
              @@weapon_slot_11_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@weapon_slot_11_sprite.fill_color = SF.color(161, 183, 208)
      
              @@weapon_slot_11_text = SF::Text.new
              @@weapon_slot_11_text.font = QUICKSAND
              @@weapon_slot_11_text.character_size = 12
              @@weapon_slot_11_text.color = SF::Color::Blue
      
              @@weapon_slot_11_image_sprite = SF::Sprite.new
      
      
              @@weapon_slot_12_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@weapon_slot_12_sprite.fill_color = SF.color(161, 183, 208)
      
              @@weapon_slot_12_text = SF::Text.new
              @@weapon_slot_12_text.font = QUICKSAND
              @@weapon_slot_12_text.character_size = 12
              @@weapon_slot_12_text.color = SF::Color::Blue
      
              @@weapon_slot_12_image_sprite = SF::Sprite.new
      
      
              @@weapon_slot_13_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@weapon_slot_13_sprite.fill_color = SF.color(161, 183, 208)
      
              @@weapon_slot_13_text = SF::Text.new
              @@weapon_slot_13_text.font = QUICKSAND
              @@weapon_slot_13_text.character_size = 12
              @@weapon_slot_13_text.color = SF::Color::Blue
      
              @@weapon_slot_13_image_sprite = SF::Sprite.new
      
      
              @@weapon_slot_14_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@weapon_slot_14_sprite.fill_color = SF.color(161, 183, 208)
      
              @@weapon_slot_14_text = SF::Text.new
              @@weapon_slot_14_text.font = QUICKSAND
              @@weapon_slot_14_text.character_size = 12
              @@weapon_slot_14_text.color = SF::Color::Blue
      
              @@weapon_slot_14_image_sprite = SF::Sprite.new
      
      
              @@weapon_slot_15_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@weapon_slot_15_sprite.fill_color = SF.color(161, 183, 208)
      
              @@weapon_slot_15_text = SF::Text.new
              @@weapon_slot_15_text.font = QUICKSAND
              @@weapon_slot_15_text.character_size = 12
              @@weapon_slot_15_text.color = SF::Color::Blue
      
              @@weapon_slot_15_image_sprite = SF::Sprite.new
      
       #---------------------------------------------------------------------------------

        def initialize(is_open : Bool, page : Int32)
            @@is_open = is_open
            @@page = page
        end

        def WeaponTab.is_open
            @@is_open
        end
        def WeaponTab.is_open=(this)
            @@is_open = this
        end

        def WeaponTab.page
            @@page
        end
        def WeaponTab.page=(this)
            @@page = this
        end

        def WeaponTab.owned_weapon_array
            @@owned_weapon_array
        end
        def WeaponTab.owned_weapon_array=(this)
            @@owned_weapon_array = this
        end
        def WeaponTab.push_to_owned_weapon_array(this)
            @@owned_weapon_array.push(this)
        end

        def WeaponTab.change_weapon_sort_category
           case @@weapon_sorting_category
            when "Type"
                @@weapon_sorting_category = "Strength"
            when "Strength"
                @@weapon_sorting_category = "Type"
           end
        end
    
        def WeaponTab.get_weapon_category
            return @@weapon_sorting_category
        end
    
        def WeaponTab.organise_owned_weapon_array_by_color(window)
            temp_equipment_array_01 = [] of Equipment::Weapon
            @@owned_weapon_array.each { |weapon| if weapon.id == 0
            temp_equipment_array_01.push(weapon)
            end}
            @@owned_weapon_array.each { |weapon| if weapon.attack_strength == 1
            temp_equipment_array_01.push(weapon)
            end}
    
            @@owned_weapon_array.each { |weapon| if weapon.attack_strength == 2
            temp_equipment_array_01.push(weapon)
            end}
    
            @@owned_weapon_array.each { |weapon| if weapon.attack_strength == 3
            temp_equipment_array_01.push(weapon)
            end}
    
            @@owned_weapon_array.each { |weapon| if weapon.attack_strength == 4
            temp_equipment_array_01.push(weapon)
            end}
    
            @@owned_weapon_array.each { |weapon| if weapon.attack_strength == 5
            temp_equipment_array_01.push(weapon)
            end}
    
            @@owned_weapon_array.each { |weapon| if weapon.attack_strength == 6
            temp_equipment_array_01.push(weapon)
            end}
    
            @@owned_weapon_array.each { |weapon| if weapon.attack_strength == 7
            temp_equipment_array_01.push(weapon)
            end}
    
            @@owned_weapon_array.each { |weapon| if weapon.attack_strength == 8
            temp_equipment_array_01.push(weapon)
            end}
    
            @@owned_weapon_array.each { |weapon| if weapon.attack_strength == 9
            temp_equipment_array_01.push(weapon)
            end}
    
            @@owned_weapon_array.each { |weapon| if weapon.attack_strength == 10
            temp_equipment_array_01.push(weapon)
            end}
    
            @@owned_weapon_array.clear
            @@owned_weapon_array = temp_equipment_array_01
            WeaponTab.assign_slot_textures(window)
        end
    
        def WeaponTab.organise_owned_weapon_array_by_type(window)
            temp_equipment_array_01 = [] of Equipment::Weapon
            @@owned_weapon_array.each { |weapon| if weapon.attack_type == "swing"
            temp_equipment_array_01.push(weapon)
            end}
    
            @@owned_weapon_array.each { |weapon| if weapon.attack_type == "punch"
            temp_equipment_array_01.push(weapon)
            end}
    
            @@owned_weapon_array.each { |weapon| if weapon.attack_type == "stab"
            temp_equipment_array_01.push(weapon)
            end}
    
            @@owned_weapon_array.each { |weapon| if weapon.attack_type == "shoot"
            temp_equipment_array_01.push(weapon)
            end}
    
            @@owned_weapon_array.clear
            @@owned_weapon_array = temp_equipment_array_01
            WeaponTab.assign_slot_textures(window)
        end
    
        def WeaponTab.initialize_equipment_tab(window)
            @@page = 1
            INVENTORY_BOX.position = SF.vector2(20, 40)  
        end
    
       def WeaponTab.assign_slot_textures(window)
        if @@page == nil
            @@page = 1
        end
            t = (@@page.not_nil! - 1) * 15
            if t < @@owned_weapon_array.size 
             @@weapon_slot_01_image_sprite.texture = @@owned_weapon_array[t].texture
             @@weapon_slot_01_text.string = @@owned_weapon_array[t].name
             @@weapon_slot_01 = @@owned_weapon_array[t]
            else 
                @@weapon_slot_01_image_sprite.texture = NIL_TEXTURE
                @@weapon_slot_01_text.string = ""
                @@weapon_slot_01 = nil
            end
            t = (@@page.not_nil! - 1) * 15 + 1
            if t < @@owned_weapon_array.size 
             @@weapon_slot_02_image_sprite.texture = @@owned_weapon_array[t].texture
             @@weapon_slot_02_text.string = @@owned_weapon_array[t].name
             @@weapon_slot_02 = @@owned_weapon_array[t]
            else
                @@weapon_slot_02_image_sprite.texture = NIL_TEXTURE
                @@weapon_slot_02_text.string = ""
                @@weapon_slot_02 = nil
            end
            t = 2 + (@@page.not_nil! * 15) - 15
            if t < @@owned_weapon_array.size 
             @@weapon_slot_03_image_sprite.texture = @@owned_weapon_array[t].texture
             @@weapon_slot_03_text.string = @@owned_weapon_array[t].name
             @@weapon_slot_03 = @@owned_weapon_array[t]
            else
             @@weapon_slot_03_image_sprite.texture = NIL_TEXTURE
             @@weapon_slot_03_text.string = ""
             @@weapon_slot_03 = nil
            end
            t = 3 + (@@page.not_nil! * 15) - 15
            if t < @@owned_weapon_array.size
             @@weapon_slot_04_image_sprite.texture = @@owned_weapon_array[t].texture
             @@weapon_slot_04_text.string = @@owned_weapon_array[t].name
             @@weapon_slot_04 = @@owned_weapon_array[t]
            else
             @@weapon_slot_04_image_sprite.texture = NIL_TEXTURE
             @@weapon_slot_04_text.string = ""
             @@weapon_slot_04 = nil
            end
            t = 4 + (@@page.not_nil! * 15) - 15
            if t < @@owned_weapon_array.size
             @@weapon_slot_05_image_sprite.texture = @@owned_weapon_array[t].texture
             @@weapon_slot_05_text.string = @@owned_weapon_array[t].name
             @@weapon_slot_05 = @@owned_weapon_array[t]
            else
             @@weapon_slot_05_image_sprite.texture = NIL_TEXTURE
             @@weapon_slot_05_text.string = ""
             @@weapon_slot_05 = nil
            end
            t = 5 + (@@page.not_nil! * 15) - 15
            if t < @@owned_weapon_array.size
             @@weapon_slot_06_image_sprite.texture = @@owned_weapon_array[t].texture
             @@weapon_slot_06_text.string = @@owned_weapon_array[t].name
             @@weapon_slot_06 = @@owned_weapon_array[t]
            else
             @@weapon_slot_06_image_sprite.texture = NIL_TEXTURE
             @@weapon_slot_06_text.string = ""
             @@weapon_slot_06 = nil
            end
            t = 6 + (@@page.not_nil! * 15) - 15
            if t < @@owned_weapon_array.size
             @@weapon_slot_07_image_sprite.texture = @@owned_weapon_array[t].texture
             @@weapon_slot_07_text.string = @@owned_weapon_array[t].name
             @@weapon_slot_07 = @@owned_weapon_array[t]
            else
             @@weapon_slot_07_image_sprite.texture = NIL_TEXTURE
             @@weapon_slot_07_text.string = ""
             @@weapon_slot_07 = nil
            end
            t = 7 + (@@page.not_nil! * 15) - 15
            if t < @@owned_weapon_array.size
             @@weapon_slot_08_image_sprite.texture = @@owned_weapon_array[t].texture
             @@weapon_slot_08_text.string = @@owned_weapon_array[t].name
             @@weapon_slot_08 = @@owned_weapon_array[t]
            else
             @@weapon_slot_08_image_sprite.texture = NIL_TEXTURE
             @@weapon_slot_08_text.string = ""
             @@weapon_slot_08 = nil
            end
            t = 8 + (@@page.not_nil! * 15) - 15
            if t < @@owned_weapon_array.size
             @@weapon_slot_09_image_sprite.texture = @@owned_weapon_array[t].texture
             @@weapon_slot_09_text.string = @@owned_weapon_array[t].name
             @@weapon_slot_09 = @@owned_weapon_array[t]
            else
             @@weapon_slot_09_image_sprite.texture = NIL_TEXTURE
             @@weapon_slot_09_text.string = ""
             @@weapon_slot_09 = nil
            end
            t = 9 + (@@page.not_nil! * 15) - 15
            if t < @@owned_weapon_array.size
             @@weapon_slot_10_image_sprite.texture = @@owned_weapon_array[t].texture
             @@weapon_slot_10_text.string = @@owned_weapon_array[t].name
             @@weapon_slot_10 = @@owned_weapon_array[t]
            else
             @@weapon_slot_10_image_sprite.texture = NIL_TEXTURE
             @@weapon_slot_10_text.string = ""
             @@weapon_slot_10 = nil
            end
            t = 10 + (@@page.not_nil! * 15) - 15
            if t < @@owned_weapon_array.size
             @@weapon_slot_11_image_sprite.texture = @@owned_weapon_array[t].texture
             @@weapon_slot_11_text.string = @@owned_weapon_array[t].name
             @@weapon_slot_11 = @@owned_weapon_array[t]
            else
             @@weapon_slot_11_image_sprite.texture = NIL_TEXTURE
             @@weapon_slot_11_text.string = ""
             @@weapon_slot_11 = nil
            end
            t = 11 + (@@page.not_nil! * 15) - 15
            if t < @@owned_weapon_array.size
             @@weapon_slot_12_image_sprite.texture = @@owned_weapon_array[t].texture
             @@weapon_slot_12_text.string = @@owned_weapon_array[t].name
             @@weapon_slot_12 = @@owned_weapon_array[t]
            else
             @@weapon_slot_12_image_sprite.texture = NIL_TEXTURE
             @@weapon_slot_12_text.string = ""
             @@weapon_slot_12 = nil
            end
            t = 12 + (@@page.not_nil! * 15) - 15
            if t < @@owned_weapon_array.size
             @@weapon_slot_13_image_sprite.texture = @@owned_weapon_array[t].texture
             @@weapon_slot_13_text.string = @@owned_weapon_array[t].name
             @@weapon_slot_13 = @@owned_weapon_array[t]
            else
             @@weapon_slot_13_image_sprite.texture = NIL_TEXTURE
             @@weapon_slot_13_text.string = ""
             @@weapon_slot_13 = nil
            end
            t = 13 + (@@page.not_nil! * 15) - 15
            if t < @@owned_weapon_array.size
             @@weapon_slot_14_image_sprite.texture = @@owned_weapon_array[t].texture
             @@weapon_slot_14_text.string = @@owned_weapon_array[t].name
             @@weapon_slot_14 = @@owned_weapon_array[t]
            else
             @@weapon_slot_14_image_sprite.texture = NIL_TEXTURE
             @@weapon_slot_14_text.string = ""
             @@weapon_slot_14 = nil
            end
            t = 14 + (@@page.not_nil! * 15) - 15
            if t < @@owned_weapon_array.size
             @@weapon_slot_15_image_sprite.texture = @@owned_weapon_array[t].texture
             @@weapon_slot_15_text.string = @@owned_weapon_array[t].name
             @@weapon_slot_15 = @@owned_weapon_array[t]
            else
             @@weapon_slot_15_image_sprite.texture = NIL_TEXTURE
             @@weapon_slot_15_text.string = ""
             @@weapon_slot_15 = nil
            end
       end
           
        def WeaponTab.draw_equipment_tab(window)
            mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window))
            mouse_x = mouse_position.x
            mouse_y = mouse_position.y

                current_size = window.size
                original_width = 800 
                original_height = 600
                scale_x = current_size.x.to_f / original_width
                scale_y = current_size.y.to_f / original_height
        
                scale_ratio = [scale_x, scale_y].min
                max_scale = 1.5
                clamped_scale = [scale_ratio, max_scale].min
    
            window.view = window.default_view
    
            INVENTORY_BOX.position = SF.vector2(80 * max_scale, 40 * max_scale)
            INVENTORY_BOX.scale = SF.vector2(1, 1)
    

            @@weapon_slot_01_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 40 * max_scale)
            @@weapon_slot_01_sprite.scale = SF.vector2(1, 1)
            
            @@weapon_slot_01_image_sprite.position = @@weapon_slot_01_sprite.position - SF.vector2(15 * max_scale, 45 * max_scale)
            @@weapon_slot_01_image_sprite.scale = SF.vector2(1.5, 1.5)
            @@weapon_slot_01_image_sprite.texture_rect = SF.int_rect(288, 640, 96, 128)
    
            @@weapon_slot_01_text.position = @@weapon_slot_01_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@weapon_slot_01_text)
            
    
            @@weapon_slot_02_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 40 * max_scale)
            @@weapon_slot_02_sprite.scale = SF.vector2(1, 1)
            
            @@weapon_slot_02_image_sprite.position = @@weapon_slot_02_sprite.position - SF.vector2(15 * max_scale, 45 * max_scale)
            @@weapon_slot_02_image_sprite.scale = SF.vector2(1.5, 1.5)
            @@weapon_slot_02_image_sprite.texture_rect = SF.int_rect(288, 640, 96, 128)
    
            @@weapon_slot_02_text.position = @@weapon_slot_02_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@weapon_slot_02_text)
            
    
            @@weapon_slot_03_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 40 * max_scale)
            @@weapon_slot_03_sprite.scale = SF.vector2(1, 1)
            
            @@weapon_slot_03_image_sprite.position = @@weapon_slot_03_sprite.position - SF.vector2(15 * max_scale, 45 * max_scale)
            @@weapon_slot_03_image_sprite.scale = SF.vector2(1.5, 1.5)
            @@weapon_slot_03_image_sprite.texture_rect = SF.int_rect(288, 640, 96, 128)
    
            @@weapon_slot_03_text.position = @@weapon_slot_03_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@weapon_slot_03_text)
            
    
            @@weapon_slot_04_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 40 * max_scale)
            @@weapon_slot_04_sprite.scale = SF.vector2(1, 1)
    
            @@weapon_slot_04_text.position = @@weapon_slot_04_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@weapon_slot_04_text)
            
            @@weapon_slot_04_image_sprite.position = @@weapon_slot_04_sprite.position - SF.vector2(15 * max_scale, 45 * max_scale)
            @@weapon_slot_04_image_sprite.scale = SF.vector2(1.5, 1.5)
            @@weapon_slot_04_image_sprite.texture_rect = SF.int_rect(288, 640, 96, 128)
    
    
            @@weapon_slot_05_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 40 * max_scale)
            @@weapon_slot_05_sprite.scale = SF.vector2(1, 1)
    
            @@weapon_slot_05_text.position = @@weapon_slot_05_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@weapon_slot_05_text)
            
            @@weapon_slot_05_image_sprite.position = @@weapon_slot_05_sprite.position - SF.vector2(15 * max_scale, 45 * max_scale)
            @@weapon_slot_05_image_sprite.scale = SF.vector2(1.5, 1.5)
            @@weapon_slot_05_image_sprite.texture_rect = SF.int_rect(288, 640, 96, 128)
            
    
            @@weapon_slot_06_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 120 * max_scale)
            @@weapon_slot_06_sprite.scale = SF.vector2(1, 1)
    
            @@weapon_slot_06_text.position = @@weapon_slot_06_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@weapon_slot_06_text)
            
            @@weapon_slot_06_image_sprite.position = @@weapon_slot_06_sprite.position - SF.vector2(15 * max_scale, 45 * max_scale)
            @@weapon_slot_06_image_sprite.scale = SF.vector2(1.5, 1.5)
            @@weapon_slot_06_image_sprite.texture_rect = SF.int_rect(288, 640, 96, 128)
            
    
            @@weapon_slot_07_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 120 * max_scale)
            @@weapon_slot_07_sprite.scale = SF.vector2(1, 1)
            
            @@weapon_slot_07_text.position = @@weapon_slot_07_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@weapon_slot_07_text)
            
            @@weapon_slot_07_image_sprite.position = @@weapon_slot_07_sprite.position - SF.vector2(15 * max_scale, 45 * max_scale)
            @@weapon_slot_07_image_sprite.scale = SF.vector2(1.5, 1.5)
            @@weapon_slot_07_image_sprite.texture_rect = SF.int_rect(288, 640, 96, 128)
            
    
            @@weapon_slot_08_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 120 * max_scale)
            @@weapon_slot_08_sprite.scale = SF.vector2(1, 1)
                    
            @@weapon_slot_08_text.position = @@weapon_slot_08_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@weapon_slot_08_text)
            
            @@weapon_slot_08_image_sprite.position = @@weapon_slot_08_sprite.position - SF.vector2(15 * max_scale, 45 * max_scale)
            @@weapon_slot_08_image_sprite.scale = SF.vector2(1.5, 1.5)
            @@weapon_slot_08_image_sprite.texture_rect = SF.int_rect(288, 640, 96, 128)
            
    
            @@weapon_slot_09_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 120 * max_scale)
            @@weapon_slot_09_sprite.scale = SF.vector2(1, 1)
                    
            @@weapon_slot_09_text.position = @@weapon_slot_09_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@weapon_slot_09_text)
            
            @@weapon_slot_09_image_sprite.position = @@weapon_slot_09_sprite.position - SF.vector2(15 * max_scale, 45 * max_scale)
            @@weapon_slot_09_image_sprite.scale = SF.vector2(1.5, 1.5)
            @@weapon_slot_09_image_sprite.texture_rect = SF.int_rect(288, 640, 96, 128)
            
    
            @@weapon_slot_10_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 120 * max_scale)
            @@weapon_slot_10_sprite.scale = SF.vector2(1, 1)
                            
            @@weapon_slot_10_text.position = @@weapon_slot_10_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@weapon_slot_10_text)
            
            @@weapon_slot_10_image_sprite.position = @@weapon_slot_10_sprite.position - SF.vector2(15 * max_scale, 45 * max_scale)
            @@weapon_slot_10_image_sprite.scale = SF.vector2(1.5, 1.5)
            @@weapon_slot_10_image_sprite.texture_rect = SF.int_rect(288, 640, 96, 128)
            
    
            @@weapon_slot_11_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 200 * max_scale)
            @@weapon_slot_11_sprite.scale = SF.vector2(1, 1)
                            
            @@weapon_slot_11_text.position = @@weapon_slot_11_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@weapon_slot_11_text)
            
            @@weapon_slot_11_image_sprite.position = @@weapon_slot_11_sprite.position - SF.vector2(15 * max_scale, 45 * max_scale)
            @@weapon_slot_11_image_sprite.scale = SF.vector2(1.5, 1.5)
            @@weapon_slot_11_image_sprite.texture_rect = SF.int_rect(288, 640, 96, 128)
            
    
            @@weapon_slot_12_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 200 * max_scale)
            @@weapon_slot_12_sprite.scale = SF.vector2(1, 1)
                            
            @@weapon_slot_12_text.position = @@weapon_slot_12_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@weapon_slot_12_text)
            
            @@weapon_slot_12_image_sprite.position = @@weapon_slot_12_sprite.position - SF.vector2(15 * max_scale, 45 * max_scale)
            @@weapon_slot_12_image_sprite.scale = SF.vector2(1.5, 1.5)
            @@weapon_slot_12_image_sprite.texture_rect = SF.int_rect(288, 640, 96, 128)
            
    
            @@weapon_slot_13_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 200 * max_scale)
            @@weapon_slot_13_sprite.scale = SF.vector2(1, 1)
            
            @@weapon_slot_13_text.position = @@weapon_slot_13_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@weapon_slot_13_text)
            
            @@weapon_slot_13_image_sprite.position = @@weapon_slot_13_sprite.position - SF.vector2(15 * max_scale, 45 * max_scale)
            @@weapon_slot_13_image_sprite.scale = SF.vector2(1.5, 1.5)
            @@weapon_slot_13_image_sprite.texture_rect = SF.int_rect(288, 640, 96, 128)
            
    
            @@weapon_slot_14_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 200 * max_scale)
            @@weapon_slot_14_sprite.scale = SF.vector2(1, 1)
                            
            @@weapon_slot_14_text.position = @@weapon_slot_14_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@weapon_slot_14_text)
            
            @@weapon_slot_14_image_sprite.position = @@weapon_slot_14_sprite.position - SF.vector2(15 * max_scale, 45 * max_scale)
            @@weapon_slot_14_image_sprite.scale = SF.vector2(1.5, 1.5)
            @@weapon_slot_14_image_sprite.texture_rect = SF.int_rect(288, 640, 96, 128)
            
    
            @@weapon_slot_15_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 200 * max_scale)
            @@weapon_slot_15_sprite.scale = SF.vector2(1, 1)
                            
            @@weapon_slot_15_text.position = @@weapon_slot_15_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@weapon_slot_15_text)
            
            @@weapon_slot_15_image_sprite.position = @@weapon_slot_15_sprite.position - SF.vector2(15 * max_scale, 45 * max_scale)
            @@weapon_slot_15_image_sprite.scale = SF.vector2(1.5, 1.5)
            @@weapon_slot_15_image_sprite.texture_rect = SF.int_rect(288, 640, 96, 128)

            window.draw(@@weapon_slot_01_sprite)
            window.draw(@@weapon_slot_01_image_sprite)
            window.draw(@@weapon_slot_01_text)
    
            window.draw(@@weapon_slot_02_sprite)
            window.draw(@@weapon_slot_02_image_sprite)
            window.draw(@@weapon_slot_02_text)
    
            window.draw(@@weapon_slot_03_sprite)
            window.draw(@@weapon_slot_03_image_sprite)
            window.draw(@@weapon_slot_03_text)
            
            window.draw(@@weapon_slot_04_sprite)
            window.draw(@@weapon_slot_04_image_sprite)
            window.draw(@@weapon_slot_04_text)
    
            window.draw(@@weapon_slot_05_sprite)
            window.draw(@@weapon_slot_05_image_sprite)
            window.draw(@@weapon_slot_05_text)
    
            window.draw(@@weapon_slot_06_sprite)
            window.draw(@@weapon_slot_06_image_sprite)
            window.draw(@@weapon_slot_06_text)
    
            window.draw(@@weapon_slot_07_sprite)
            window.draw(@@weapon_slot_07_image_sprite)
            window.draw(@@weapon_slot_07_text)
    
            window.draw(@@weapon_slot_08_sprite)
            window.draw(@@weapon_slot_08_image_sprite)
            window.draw(@@weapon_slot_08_text)
    
            window.draw(@@weapon_slot_09_sprite)
            window.draw(@@weapon_slot_09_image_sprite)
            window.draw(@@weapon_slot_09_text)
    
            window.draw(@@weapon_slot_10_sprite)
            window.draw(@@weapon_slot_10_image_sprite)
            window.draw(@@weapon_slot_10_text)
    
            window.draw(@@weapon_slot_11_sprite)
            window.draw(@@weapon_slot_11_image_sprite)
            window.draw(@@weapon_slot_11_text)
    
            window.draw(@@weapon_slot_12_sprite)
            window.draw(@@weapon_slot_12_image_sprite)
            window.draw(@@weapon_slot_12_text)
    
            window.draw(@@weapon_slot_13_sprite)
            window.draw(@@weapon_slot_13_image_sprite)
            window.draw(@@weapon_slot_13_text)
    
            window.draw(@@weapon_slot_14_sprite)
            window.draw(@@weapon_slot_14_image_sprite)
            window.draw(@@weapon_slot_14_text)
    
            window.draw(@@weapon_slot_15_sprite)
            window.draw(@@weapon_slot_15_image_sprite)
            window.draw(@@weapon_slot_15_text)

            WeaponTab.weapon_info_box_handling(window)
    
            if SF::Mouse.button_pressed?(SF::Mouse::Left)
                WeaponTab.mouse_handling(window)
            end
        end

           def WeaponTab.weapon_info_box_handling(window)
            mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window))
            mouse_x = mouse_position.x
            mouse_y = mouse_position.y
            
        
            current_size = window.size
            original_width = 800 
            original_height = 600 
    
            scale_x = (current_size.x.to_f / original_width)
            scale_y = current_size.y.to_f / original_height

            #------------------------------------objects-------------------------------------------------
                
                @@weapon_info_box.position = mouse_position + SF.vector2(15, 15)
                @@weapon_info_box.scale = SF.vector2(1, 1)

                @@weapon_info_box_name_text.position = @@weapon_info_box.position + SF.vector2(5, 5)

                @@weapon_info_box_attack_type_text.position = @@weapon_info_box.position + SF.vector2(5, 20)

                @@weapon_info_box_attack_strength_text.position = @@weapon_info_box.position + SF.vector2(5, 35)

                @@weapon_info_box_minimum_strength_text.position = @@weapon_info_box.position + SF.vector2(5, 50)

                @@weapon_info_box_minimum_dexterity_text.position = @@weapon_info_box.position + SF.vector2(5, 65)

                @@weapon_info_box_minimum_intelligence_text.position = @@weapon_info_box.position + SF.vector2(5, 80)

                @@weapon_info_box_minimum_luck_text.position = @@weapon_info_box.position + SF.vector2(5, 95)

                @@weapon_info_box_minimum_status_effects_text.position = @@weapon_info_box.position + SF.vector2(5, 110)

              #  .position = @@weapon_info_box.position + SF.vector2(5, 125)
    
                slot_01_x = @@weapon_slot_01_sprite.position.x
                slot_01_y = @@weapon_slot_01_sprite.position.y
                slot_01_width = @@weapon_slot_01_sprite.size.x
                slot_01_height = @@weapon_slot_01_sprite.size.y
    
                slot_02_x = @@weapon_slot_02_sprite.position.x
                slot_02_y = @@weapon_slot_02_sprite.position.y
                slot_02_width = @@weapon_slot_02_sprite.size.x
                slot_02_height = @@weapon_slot_02_sprite.size.y
    
                slot_03_x = @@weapon_slot_03_sprite.position.x
                slot_03_y = @@weapon_slot_03_sprite.position.y
                slot_03_width = @@weapon_slot_03_sprite.size.x
                slot_03_height = @@weapon_slot_03_sprite.size.y
    
                slot_04_x = @@weapon_slot_04_sprite.position.x
                slot_04_y = @@weapon_slot_04_sprite.position.y
                slot_04_width = @@weapon_slot_04_sprite.size.x
                slot_04_height = @@weapon_slot_04_sprite.size.y
    
                slot_05_x = @@weapon_slot_05_sprite.position.x
                slot_05_y = @@weapon_slot_05_sprite.position.y
                slot_05_width = @@weapon_slot_05_sprite.size.x
                slot_05_height = @@weapon_slot_05_sprite.size.y
    
                slot_06_x = @@weapon_slot_06_sprite.position.x
                slot_06_y = @@weapon_slot_06_sprite.position.y
                slot_06_width = @@weapon_slot_06_sprite.size.x
                slot_06_height = @@weapon_slot_06_sprite.size.y
    
                slot_07_x = @@weapon_slot_07_sprite.position.x
                slot_07_y = @@weapon_slot_07_sprite.position.y
                slot_07_width = @@weapon_slot_07_sprite.size.x
                slot_07_height = @@weapon_slot_07_sprite.size.y
    
                slot_08_x = @@weapon_slot_08_sprite.position.x
                slot_08_y = @@weapon_slot_08_sprite.position.y
                slot_08_width = @@weapon_slot_08_sprite.size.x
                slot_08_height = @@weapon_slot_08_sprite.size.y
    
                slot_09_x = @@weapon_slot_09_sprite.position.x
                slot_09_y = @@weapon_slot_09_sprite.position.y
                slot_09_width = @@weapon_slot_09_sprite.size.x
                slot_09_height = @@weapon_slot_09_sprite.size.y
    
                slot_10_x = @@weapon_slot_10_sprite.position.x
                slot_10_y = @@weapon_slot_10_sprite.position.y
                slot_10_width = @@weapon_slot_10_sprite.size.x
                slot_10_height = @@weapon_slot_10_sprite.size.y
    
                slot_11_x = @@weapon_slot_11_sprite.position.x
                slot_11_y = @@weapon_slot_11_sprite.position.y
                slot_11_width = @@weapon_slot_11_sprite.size.x
                slot_11_height = @@weapon_slot_11_sprite.size.y
    
                slot_12_x = @@weapon_slot_12_sprite.position.x
                slot_12_y = @@weapon_slot_12_sprite.position.y
                slot_12_width = @@weapon_slot_12_sprite.size.x
                slot_12_height = @@weapon_slot_12_sprite.size.y
    
                slot_13_x = @@weapon_slot_13_sprite.position.x
                slot_13_y = @@weapon_slot_13_sprite.position.y
                slot_13_width = @@weapon_slot_13_sprite.size.x
                slot_13_height = @@weapon_slot_13_sprite.size.y
    
                slot_14_x = @@weapon_slot_14_sprite.position.x
                slot_14_y = @@weapon_slot_14_sprite.position.y
                slot_14_width = @@weapon_slot_14_sprite.size.x
                slot_14_height = @@weapon_slot_14_sprite.size.y
    
                slot_15_x = @@weapon_slot_15_sprite.position.x
                slot_15_y = @@weapon_slot_15_sprite.position.y
                slot_15_width = @@weapon_slot_15_sprite.size.x
                slot_15_height = @@weapon_slot_15_sprite.size.y
            #---------------------------------------------------------------------------------------------

            if (mouse_x >= slot_01_x && mouse_x <= slot_01_x + slot_01_width) &&
                (mouse_y >= slot_01_y && mouse_y <= slot_01_y + slot_01_height)
                 if @@weapon_slot_01 != nil  
                    @@weapon_info_box_name_text.string = "Name: #{@@weapon_slot_01.not_nil!.name}"
                    @@weapon_info_box_attack_type_text.string = "Attack Type: #{@@weapon_slot_01.not_nil!.attack_type}"
                    @@weapon_info_box_attack_strength_text.string = "Attack Strength: #{@@weapon_slot_01.not_nil!.attack_strength}"
                    @@weapon_info_box_minimum_strength_text.string = "Minimum Strength: #{@@weapon_slot_01.not_nil!.minimum_strength}"
                    @@weapon_info_box_minimum_dexterity_text.string = "Minimum Dexterity: #{@@weapon_slot_01.not_nil!.minimum_dexterity}"
                    @@weapon_info_box_minimum_intelligence_text.string = "Minimum Intelligence: #{@@weapon_slot_01.not_nil!.minimum_intelligence}"
                    @@weapon_info_box_minimum_luck_text.string = "Minimum Luck: #{@@weapon_slot_01.not_nil!.minimum_luck}"
                    @@weapon_info_box_minimum_status_effects_text.string = "Status Effects: #{@@weapon_slot_01.not_nil!.status_effects}"

                     window.draw(@@weapon_info_box)
                     window.draw(@@weapon_info_box_name_text)
                     window.draw(@@weapon_info_box_attack_type_text)
                     window.draw(@@weapon_info_box_attack_strength_text)
                     window.draw(@@weapon_info_box_minimum_strength_text)
                     window.draw(@@weapon_info_box_minimum_dexterity_text)
                     window.draw(@@weapon_info_box_minimum_intelligence_text)
                     window.draw(@@weapon_info_box_minimum_luck_text)
                     window.draw(@@weapon_info_box_minimum_status_effects_text)
                     
                 end
             end
            if (mouse_x >= slot_02_x && mouse_x <= slot_02_x + slot_02_width) &&
                (mouse_y >= slot_02_y && mouse_y <= slot_02_y + slot_02_height)
                 if @@weapon_slot_02 != nil  
                    @@weapon_info_box_name_text.string = "Name: #{@@weapon_slot_02.not_nil!.name}"
                    @@weapon_info_box_attack_type_text.string = "Attack Type: #{@@weapon_slot_02.not_nil!.attack_type}"
                    @@weapon_info_box_attack_strength_text.string = "Attack Strength: #{@@weapon_slot_02.not_nil!.attack_strength}"
                    @@weapon_info_box_minimum_strength_text.string = "Minimum Strength: #{@@weapon_slot_02.not_nil!.minimum_strength}"
                    @@weapon_info_box_minimum_dexterity_text.string = "Minimum Dexterity: #{@@weapon_slot_02.not_nil!.minimum_dexterity}"
                    @@weapon_info_box_minimum_intelligence_text.string = "Minimum Intelligence: #{@@weapon_slot_02.not_nil!.minimum_intelligence}"
                    @@weapon_info_box_minimum_luck_text.string = "Minimum Luck: #{@@weapon_slot_02.not_nil!.minimum_luck}"
                    @@weapon_info_box_minimum_status_effects_text.string = "Status Effects: #{@@weapon_slot_02.not_nil!.status_effects}"

                     window.draw(@@weapon_info_box)
                     window.draw(@@weapon_info_box_name_text)
                     window.draw(@@weapon_info_box_attack_type_text)
                     window.draw(@@weapon_info_box_attack_strength_text)
                     window.draw(@@weapon_info_box_minimum_strength_text)
                     window.draw(@@weapon_info_box_minimum_dexterity_text)
                     window.draw(@@weapon_info_box_minimum_intelligence_text)
                     window.draw(@@weapon_info_box_minimum_luck_text)
                     window.draw(@@weapon_info_box_minimum_status_effects_text)
                     
                 end
             end
            if (mouse_x >= slot_03_x && mouse_x <= slot_03_x + slot_03_width) &&
                (mouse_y >= slot_03_y && mouse_y <= slot_03_y + slot_03_height)
                 if @@weapon_slot_03 != nil  
                    @@weapon_info_box_name_text.string = "Name: #{@@weapon_slot_03.not_nil!.name}"
                    @@weapon_info_box_attack_type_text.string = "Attack Type: #{@@weapon_slot_03.not_nil!.attack_type}"
                    @@weapon_info_box_attack_strength_text.string = "Attack Strength: #{@@weapon_slot_03.not_nil!.attack_strength}"
                    @@weapon_info_box_minimum_strength_text.string = "Minimum Strength: #{@@weapon_slot_03.not_nil!.minimum_strength}"
                    @@weapon_info_box_minimum_dexterity_text.string = "Minimum Dexterity: #{@@weapon_slot_03.not_nil!.minimum_dexterity}"
                    @@weapon_info_box_minimum_intelligence_text.string = "Minimum Intelligence: #{@@weapon_slot_03.not_nil!.minimum_intelligence}"
                    @@weapon_info_box_minimum_luck_text.string = "Minimum Luck: #{@@weapon_slot_03.not_nil!.minimum_luck}"
                    @@weapon_info_box_minimum_status_effects_text.string = "Status Effects: #{@@weapon_slot_03.not_nil!.status_effects}"

                     window.draw(@@weapon_info_box)
                     window.draw(@@weapon_info_box_name_text)
                     window.draw(@@weapon_info_box_attack_type_text)
                     window.draw(@@weapon_info_box_attack_strength_text)
                     window.draw(@@weapon_info_box_minimum_strength_text)
                     window.draw(@@weapon_info_box_minimum_dexterity_text)
                     window.draw(@@weapon_info_box_minimum_intelligence_text)
                     window.draw(@@weapon_info_box_minimum_luck_text)
                     window.draw(@@weapon_info_box_minimum_status_effects_text)
                     
                 end
             end
            if (mouse_x >= slot_04_x && mouse_x <= slot_04_x + slot_04_width) &&
                (mouse_y >= slot_04_y && mouse_y <= slot_04_y + slot_04_height)
                 if @@weapon_slot_04 != nil  
                    @@weapon_info_box_name_text.string = "Name: #{@@weapon_slot_04.not_nil!.name}"
                    @@weapon_info_box_attack_type_text.string = "Attack Type: #{@@weapon_slot_04.not_nil!.attack_type}"
                    @@weapon_info_box_attack_strength_text.string = "Attack Strength: #{@@weapon_slot_04.not_nil!.attack_strength}"
                    @@weapon_info_box_minimum_strength_text.string = "Minimum Strength: #{@@weapon_slot_04.not_nil!.minimum_strength}"
                    @@weapon_info_box_minimum_dexterity_text.string = "Minimum Dexterity: #{@@weapon_slot_04.not_nil!.minimum_dexterity}"
                    @@weapon_info_box_minimum_intelligence_text.string = "Minimum Intelligence: #{@@weapon_slot_04.not_nil!.minimum_intelligence}"
                    @@weapon_info_box_minimum_luck_text.string = "Minimum Luck: #{@@weapon_slot_04.not_nil!.minimum_luck}"
                    @@weapon_info_box_minimum_status_effects_text.string = "Status Effects: #{@@weapon_slot_04.not_nil!.status_effects}"

                     window.draw(@@weapon_info_box)
                     window.draw(@@weapon_info_box_name_text)
                     window.draw(@@weapon_info_box_attack_type_text)
                     window.draw(@@weapon_info_box_attack_strength_text)
                     window.draw(@@weapon_info_box_minimum_strength_text)
                     window.draw(@@weapon_info_box_minimum_dexterity_text)
                     window.draw(@@weapon_info_box_minimum_intelligence_text)
                     window.draw(@@weapon_info_box_minimum_luck_text)
                     window.draw(@@weapon_info_box_minimum_status_effects_text)
                     
                 end
             end
            if (mouse_x >= slot_05_x && mouse_x <= slot_05_x + slot_05_width) &&
                (mouse_y >= slot_05_y && mouse_y <= slot_05_y + slot_05_height)
                 if @@weapon_slot_05 != nil  
                    @@weapon_info_box_name_text.string = "Name: #{@@weapon_slot_05.not_nil!.name}"
                    @@weapon_info_box_attack_type_text.string = "Attack Type: #{@@weapon_slot_05.not_nil!.attack_type}"
                    @@weapon_info_box_attack_strength_text.string = "Attack Strength: #{@@weapon_slot_05.not_nil!.attack_strength}"
                    @@weapon_info_box_minimum_strength_text.string = "Minimum Strength: #{@@weapon_slot_05.not_nil!.minimum_strength}"
                    @@weapon_info_box_minimum_dexterity_text.string = "Minimum Dexterity: #{@@weapon_slot_05.not_nil!.minimum_dexterity}"
                    @@weapon_info_box_minimum_intelligence_text.string = "Minimum Intelligence: #{@@weapon_slot_05.not_nil!.minimum_intelligence}"
                    @@weapon_info_box_minimum_luck_text.string = "Minimum Luck: #{@@weapon_slot_05.not_nil!.minimum_luck}"
                    @@weapon_info_box_minimum_status_effects_text.string = "Status Effects: #{@@weapon_slot_05.not_nil!.status_effects}"

                     window.draw(@@weapon_info_box)
                     window.draw(@@weapon_info_box_name_text)
                     window.draw(@@weapon_info_box_attack_type_text)
                     window.draw(@@weapon_info_box_attack_strength_text)
                     window.draw(@@weapon_info_box_minimum_strength_text)
                     window.draw(@@weapon_info_box_minimum_dexterity_text)
                     window.draw(@@weapon_info_box_minimum_intelligence_text)
                     window.draw(@@weapon_info_box_minimum_luck_text)
                     window.draw(@@weapon_info_box_minimum_status_effects_text)
                     
                 end
             end
            if (mouse_x >= slot_06_x && mouse_x <= slot_06_x + slot_06_width) &&
                (mouse_y >= slot_06_y && mouse_y <= slot_06_y + slot_06_height)
                 if @@weapon_slot_06 != nil  
                    @@weapon_info_box_name_text.string = "Name: #{@@weapon_slot_06.not_nil!.name}"
                    @@weapon_info_box_attack_type_text.string = "Attack Type: #{@@weapon_slot_06.not_nil!.attack_type}"
                    @@weapon_info_box_attack_strength_text.string = "Attack Strength: #{@@weapon_slot_06.not_nil!.attack_strength}"
                    @@weapon_info_box_minimum_strength_text.string = "Minimum Strength: #{@@weapon_slot_06.not_nil!.minimum_strength}"
                    @@weapon_info_box_minimum_dexterity_text.string = "Minimum Dexterity: #{@@weapon_slot_06.not_nil!.minimum_dexterity}"
                    @@weapon_info_box_minimum_intelligence_text.string = "Minimum Intelligence: #{@@weapon_slot_06.not_nil!.minimum_intelligence}"
                    @@weapon_info_box_minimum_luck_text.string = "Minimum Luck: #{@@weapon_slot_06.not_nil!.minimum_luck}"
                    @@weapon_info_box_minimum_status_effects_text.string = "Status Effects: #{@@weapon_slot_06.not_nil!.status_effects}"

                     window.draw(@@weapon_info_box)
                     window.draw(@@weapon_info_box_name_text)
                     window.draw(@@weapon_info_box_attack_type_text)
                     window.draw(@@weapon_info_box_attack_strength_text)
                     window.draw(@@weapon_info_box_minimum_strength_text)
                     window.draw(@@weapon_info_box_minimum_dexterity_text)
                     window.draw(@@weapon_info_box_minimum_intelligence_text)
                     window.draw(@@weapon_info_box_minimum_luck_text)
                     window.draw(@@weapon_info_box_minimum_status_effects_text)
                     
                 end
             end
            if (mouse_x >= slot_07_x && mouse_x <= slot_07_x + slot_07_width) &&
                (mouse_y >= slot_07_y && mouse_y <= slot_07_y + slot_07_height)
                 if @@weapon_slot_07 != nil  
                    @@weapon_info_box_name_text.string = "Name: #{@@weapon_slot_07.not_nil!.name}"
                    @@weapon_info_box_attack_type_text.string = "Attack Type: #{@@weapon_slot_07.not_nil!.attack_type}"
                    @@weapon_info_box_attack_strength_text.string = "Attack Strength: #{@@weapon_slot_07.not_nil!.attack_strength}"
                    @@weapon_info_box_minimum_strength_text.string = "Minimum Strength: #{@@weapon_slot_07.not_nil!.minimum_strength}"
                    @@weapon_info_box_minimum_dexterity_text.string = "Minimum Dexterity: #{@@weapon_slot_07.not_nil!.minimum_dexterity}"
                    @@weapon_info_box_minimum_intelligence_text.string = "Minimum Intelligence: #{@@weapon_slot_07.not_nil!.minimum_intelligence}"
                    @@weapon_info_box_minimum_luck_text.string = "Minimum Luck: #{@@weapon_slot_07.not_nil!.minimum_luck}"
                    @@weapon_info_box_minimum_status_effects_text.string = "Status Effects: #{@@weapon_slot_07.not_nil!.status_effects}"

                     window.draw(@@weapon_info_box)
                     window.draw(@@weapon_info_box_name_text)
                     window.draw(@@weapon_info_box_attack_type_text)
                     window.draw(@@weapon_info_box_attack_strength_text)
                     window.draw(@@weapon_info_box_minimum_strength_text)
                     window.draw(@@weapon_info_box_minimum_dexterity_text)
                     window.draw(@@weapon_info_box_minimum_intelligence_text)
                     window.draw(@@weapon_info_box_minimum_luck_text)
                     window.draw(@@weapon_info_box_minimum_status_effects_text)
                     
                 end
             end
            if (mouse_x >= slot_08_x && mouse_x <= slot_08_x + slot_08_width) &&
                (mouse_y >= slot_08_y && mouse_y <= slot_08_y + slot_08_height)
                 if @@weapon_slot_08 != nil  
                    @@weapon_info_box_name_text.string = "Name: #{@@weapon_slot_08.not_nil!.name}"
                    @@weapon_info_box_attack_type_text.string = "Attack Type: #{@@weapon_slot_08.not_nil!.attack_type}"
                    @@weapon_info_box_attack_strength_text.string = "Attack Strength: #{@@weapon_slot_08.not_nil!.attack_strength}"
                    @@weapon_info_box_minimum_strength_text.string = "Minimum Strength: #{@@weapon_slot_08.not_nil!.minimum_strength}"
                    @@weapon_info_box_minimum_dexterity_text.string = "Minimum Dexterity: #{@@weapon_slot_08.not_nil!.minimum_dexterity}"
                    @@weapon_info_box_minimum_intelligence_text.string = "Minimum Intelligence: #{@@weapon_slot_08.not_nil!.minimum_intelligence}"
                    @@weapon_info_box_minimum_luck_text.string = "Minimum Luck: #{@@weapon_slot_08.not_nil!.minimum_luck}"
                    @@weapon_info_box_minimum_status_effects_text.string = "Status Effects: #{@@weapon_slot_08.not_nil!.status_effects}"

                     window.draw(@@weapon_info_box)
                     window.draw(@@weapon_info_box_name_text)
                     window.draw(@@weapon_info_box_attack_type_text)
                     window.draw(@@weapon_info_box_attack_strength_text)
                     window.draw(@@weapon_info_box_minimum_strength_text)
                     window.draw(@@weapon_info_box_minimum_dexterity_text)
                     window.draw(@@weapon_info_box_minimum_intelligence_text)
                     window.draw(@@weapon_info_box_minimum_luck_text)
                     window.draw(@@weapon_info_box_minimum_status_effects_text)
                     
                 end
             end
            if (mouse_x >= slot_09_x && mouse_x <= slot_09_x + slot_09_width) &&
                (mouse_y >= slot_09_y && mouse_y <= slot_09_y + slot_09_height)
                 if @@weapon_slot_09 != nil  
                    @@weapon_info_box_name_text.string = "Name: #{@@weapon_slot_09.not_nil!.name}"
                    @@weapon_info_box_attack_type_text.string = "Attack Type: #{@@weapon_slot_09.not_nil!.attack_type}"
                    @@weapon_info_box_attack_strength_text.string = "Attack Strength: #{@@weapon_slot_09.not_nil!.attack_strength}"
                    @@weapon_info_box_minimum_strength_text.string = "Minimum Strength: #{@@weapon_slot_09.not_nil!.minimum_strength}"
                    @@weapon_info_box_minimum_dexterity_text.string = "Minimum Dexterity: #{@@weapon_slot_09.not_nil!.minimum_dexterity}"
                    @@weapon_info_box_minimum_intelligence_text.string = "Minimum Intelligence: #{@@weapon_slot_09.not_nil!.minimum_intelligence}"
                    @@weapon_info_box_minimum_luck_text.string = "Minimum Luck: #{@@weapon_slot_09.not_nil!.minimum_luck}"
                    @@weapon_info_box_minimum_status_effects_text.string = "Status Effects: #{@@weapon_slot_09.not_nil!.status_effects}"

                     window.draw(@@weapon_info_box)
                     window.draw(@@weapon_info_box_name_text)
                     window.draw(@@weapon_info_box_attack_type_text)
                     window.draw(@@weapon_info_box_attack_strength_text)
                     window.draw(@@weapon_info_box_minimum_strength_text)
                     window.draw(@@weapon_info_box_minimum_dexterity_text)
                     window.draw(@@weapon_info_box_minimum_intelligence_text)
                     window.draw(@@weapon_info_box_minimum_luck_text)
                     window.draw(@@weapon_info_box_minimum_status_effects_text)
                     
                 end
             end
            if (mouse_x >= slot_10_x && mouse_x <= slot_10_x + slot_10_width) &&
                (mouse_y >= slot_10_y && mouse_y <= slot_10_y + slot_10_height)
                 if @@weapon_slot_10 != nil  
                    @@weapon_info_box_name_text.string = "Name: #{@@weapon_slot_10.not_nil!.name}"
                    @@weapon_info_box_attack_type_text.string = "Attack Type: #{@@weapon_slot_10.not_nil!.attack_type}"
                    @@weapon_info_box_attack_strength_text.string = "Attack Strength: #{@@weapon_slot_10.not_nil!.attack_strength}"
                    @@weapon_info_box_minimum_strength_text.string = "Minimum Strength: #{@@weapon_slot_10.not_nil!.minimum_strength}"
                    @@weapon_info_box_minimum_dexterity_text.string = "Minimum Dexterity: #{@@weapon_slot_10.not_nil!.minimum_dexterity}"
                    @@weapon_info_box_minimum_intelligence_text.string = "Minimum Intelligence: #{@@weapon_slot_10.not_nil!.minimum_intelligence}"
                    @@weapon_info_box_minimum_luck_text.string = "Minimum Luck: #{@@weapon_slot_10.not_nil!.minimum_luck}"
                    @@weapon_info_box_minimum_status_effects_text.string = "Status Effects: #{@@weapon_slot_10.not_nil!.status_effects}"

                     window.draw(@@weapon_info_box)
                     window.draw(@@weapon_info_box_name_text)
                     window.draw(@@weapon_info_box_attack_type_text)
                     window.draw(@@weapon_info_box_attack_strength_text)
                     window.draw(@@weapon_info_box_minimum_strength_text)
                     window.draw(@@weapon_info_box_minimum_dexterity_text)
                     window.draw(@@weapon_info_box_minimum_intelligence_text)
                     window.draw(@@weapon_info_box_minimum_luck_text)
                     window.draw(@@weapon_info_box_minimum_status_effects_text)
                     
                 end
             end
            if (mouse_x >= slot_11_x && mouse_x <= slot_11_x + slot_11_width) &&
                (mouse_y >= slot_11_y && mouse_y <= slot_11_y + slot_11_height)
                 if @@weapon_slot_11 != nil  
                    @@weapon_info_box_name_text.string = "Name: #{@@weapon_slot_11.not_nil!.name}"
                    @@weapon_info_box_attack_type_text.string = "Attack Type: #{@@weapon_slot_11.not_nil!.attack_type}"
                    @@weapon_info_box_attack_strength_text.string = "Attack Strength: #{@@weapon_slot_11.not_nil!.attack_strength}"
                    @@weapon_info_box_minimum_strength_text.string = "Minimum Strength: #{@@weapon_slot_11.not_nil!.minimum_strength}"
                    @@weapon_info_box_minimum_dexterity_text.string = "Minimum Dexterity: #{@@weapon_slot_11.not_nil!.minimum_dexterity}"
                    @@weapon_info_box_minimum_intelligence_text.string = "Minimum Intelligence: #{@@weapon_slot_11.not_nil!.minimum_intelligence}"
                    @@weapon_info_box_minimum_luck_text.string = "Minimum Luck: #{@@weapon_slot_11.not_nil!.minimum_luck}"
                    @@weapon_info_box_minimum_status_effects_text.string = "Status Effects: #{@@weapon_slot_11.not_nil!.status_effects}"

                     window.draw(@@weapon_info_box)
                     window.draw(@@weapon_info_box_name_text)
                     window.draw(@@weapon_info_box_attack_type_text)
                     window.draw(@@weapon_info_box_attack_strength_text)
                     window.draw(@@weapon_info_box_minimum_strength_text)
                     window.draw(@@weapon_info_box_minimum_dexterity_text)
                     window.draw(@@weapon_info_box_minimum_intelligence_text)
                     window.draw(@@weapon_info_box_minimum_luck_text)
                     window.draw(@@weapon_info_box_minimum_status_effects_text)
                     
                 end
             end
            if (mouse_x >= slot_12_x && mouse_x <= slot_12_x + slot_12_width) &&
                (mouse_y >= slot_12_y && mouse_y <= slot_12_y + slot_12_height)
                 if @@weapon_slot_12 != nil  
                    @@weapon_info_box_name_text.string = "Name: #{@@weapon_slot_12.not_nil!.name}"
                    @@weapon_info_box_attack_type_text.string = "Attack Type: #{@@weapon_slot_12.not_nil!.attack_type}"
                    @@weapon_info_box_attack_strength_text.string = "Attack Strength: #{@@weapon_slot_12.not_nil!.attack_strength}"
                    @@weapon_info_box_minimum_strength_text.string = "Minimum Strength: #{@@weapon_slot_12.not_nil!.minimum_strength}"
                    @@weapon_info_box_minimum_dexterity_text.string = "Minimum Dexterity: #{@@weapon_slot_12.not_nil!.minimum_dexterity}"
                    @@weapon_info_box_minimum_intelligence_text.string = "Minimum Intelligence: #{@@weapon_slot_12.not_nil!.minimum_intelligence}"
                    @@weapon_info_box_minimum_luck_text.string = "Minimum Luck: #{@@weapon_slot_12.not_nil!.minimum_luck}"
                    @@weapon_info_box_minimum_status_effects_text.string = "Status Effects: #{@@weapon_slot_12.not_nil!.status_effects}"

                     window.draw(@@weapon_info_box)
                     window.draw(@@weapon_info_box_name_text)
                     window.draw(@@weapon_info_box_attack_type_text)
                     window.draw(@@weapon_info_box_attack_strength_text)
                     window.draw(@@weapon_info_box_minimum_strength_text)
                     window.draw(@@weapon_info_box_minimum_dexterity_text)
                     window.draw(@@weapon_info_box_minimum_intelligence_text)
                     window.draw(@@weapon_info_box_minimum_luck_text)
                     window.draw(@@weapon_info_box_minimum_status_effects_text)
                     
                 end
             end
            if (mouse_x >= slot_13_x && mouse_x <= slot_13_x + slot_13_width) &&
                (mouse_y >= slot_13_y && mouse_y <= slot_13_y + slot_13_height)
                 if @@weapon_slot_13 != nil  
                    @@weapon_info_box_name_text.string = "Name: #{@@weapon_slot_13.not_nil!.name}"
                    @@weapon_info_box_attack_type_text.string = "Attack Type: #{@@weapon_slot_13.not_nil!.attack_type}"
                    @@weapon_info_box_attack_strength_text.string = "Attack Strength: #{@@weapon_slot_13.not_nil!.attack_strength}"
                    @@weapon_info_box_minimum_strength_text.string = "Minimum Strength: #{@@weapon_slot_13.not_nil!.minimum_strength}"
                    @@weapon_info_box_minimum_dexterity_text.string = "Minimum Dexterity: #{@@weapon_slot_13.not_nil!.minimum_dexterity}"
                    @@weapon_info_box_minimum_intelligence_text.string = "Minimum Intelligence: #{@@weapon_slot_13.not_nil!.minimum_intelligence}"
                    @@weapon_info_box_minimum_luck_text.string = "Minimum Luck: #{@@weapon_slot_13.not_nil!.minimum_luck}"
                    @@weapon_info_box_minimum_status_effects_text.string = "Status Effects: #{@@weapon_slot_13.not_nil!.status_effects}"

                     window.draw(@@weapon_info_box)
                     window.draw(@@weapon_info_box_name_text)
                     window.draw(@@weapon_info_box_attack_type_text)
                     window.draw(@@weapon_info_box_attack_strength_text)
                     window.draw(@@weapon_info_box_minimum_strength_text)
                     window.draw(@@weapon_info_box_minimum_dexterity_text)
                     window.draw(@@weapon_info_box_minimum_intelligence_text)
                     window.draw(@@weapon_info_box_minimum_luck_text)
                     window.draw(@@weapon_info_box_minimum_status_effects_text)
                     
                 end
             end
            if (mouse_x >= slot_14_x && mouse_x <= slot_14_x + slot_14_width) &&
                (mouse_y >= slot_14_y && mouse_y <= slot_14_y + slot_14_height)
                 if @@weapon_slot_14 != nil  
                    @@weapon_info_box_name_text.string = "Name: #{@@weapon_slot_14.not_nil!.name}"
                    @@weapon_info_box_attack_type_text.string = "Attack Type: #{@@weapon_slot_14.not_nil!.attack_type}"
                    @@weapon_info_box_attack_strength_text.string = "Attack Strength: #{@@weapon_slot_14.not_nil!.attack_strength}"
                    @@weapon_info_box_minimum_strength_text.string = "Minimum Strength: #{@@weapon_slot_14.not_nil!.minimum_strength}"
                    @@weapon_info_box_minimum_dexterity_text.string = "Minimum Dexterity: #{@@weapon_slot_14.not_nil!.minimum_dexterity}"
                    @@weapon_info_box_minimum_intelligence_text.string = "Minimum Intelligence: #{@@weapon_slot_14.not_nil!.minimum_intelligence}"
                    @@weapon_info_box_minimum_luck_text.string = "Minimum Luck: #{@@weapon_slot_14.not_nil!.minimum_luck}"
                    @@weapon_info_box_minimum_status_effects_text.string = "Status Effects: #{@@weapon_slot_14.not_nil!.status_effects}"

                     window.draw(@@weapon_info_box)
                     window.draw(@@weapon_info_box_name_text)
                     window.draw(@@weapon_info_box_attack_type_text)
                     window.draw(@@weapon_info_box_attack_strength_text)
                     window.draw(@@weapon_info_box_minimum_strength_text)
                     window.draw(@@weapon_info_box_minimum_dexterity_text)
                     window.draw(@@weapon_info_box_minimum_intelligence_text)
                     window.draw(@@weapon_info_box_minimum_luck_text)
                     window.draw(@@weapon_info_box_minimum_status_effects_text)
                     
                 end
             end
            if (mouse_x >= slot_15_x && mouse_x <= slot_15_x + slot_15_width) &&
                (mouse_y >= slot_15_y && mouse_y <= slot_15_y + slot_15_height)
                 if @@weapon_slot_15 != nil  
                    @@weapon_info_box_name_text.string = "Name: #{@@weapon_slot_15.not_nil!.name}"
                    @@weapon_info_box_attack_type_text.string = "Attack Type: #{@@weapon_slot_15.not_nil!.attack_type}"
                    @@weapon_info_box_attack_strength_text.string = "Attack Strength: #{@@weapon_slot_15.not_nil!.attack_strength}"
                    @@weapon_info_box_minimum_strength_text.string = "Minimum Strength: #{@@weapon_slot_15.not_nil!.minimum_strength}"
                    @@weapon_info_box_minimum_dexterity_text.string = "Minimum Dexterity: #{@@weapon_slot_15.not_nil!.minimum_dexterity}"
                    @@weapon_info_box_minimum_intelligence_text.string = "Minimum Intelligence: #{@@weapon_slot_15.not_nil!.minimum_intelligence}"
                    @@weapon_info_box_minimum_luck_text.string = "Minimum Luck: #{@@weapon_slot_15.not_nil!.minimum_luck}"
                    @@weapon_info_box_minimum_status_effects_text.string = "Status Effects: #{@@weapon_slot_15.not_nil!.status_effects}"

                     window.draw(@@weapon_info_box)
                     window.draw(@@weapon_info_box_name_text)
                     window.draw(@@weapon_info_box_attack_type_text)
                     window.draw(@@weapon_info_box_attack_strength_text)
                     window.draw(@@weapon_info_box_minimum_strength_text)
                     window.draw(@@weapon_info_box_minimum_dexterity_text)
                     window.draw(@@weapon_info_box_minimum_intelligence_text)
                     window.draw(@@weapon_info_box_minimum_luck_text)
                     window.draw(@@weapon_info_box_minimum_status_effects_text)
                     
                 end
             end
           end
    
        def WeaponTab.mouse_handling(window)
            mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window))
            mouse_x = mouse_position.x
            mouse_y = mouse_position.y
            
        
            current_size = window.size
            original_width = 800 
            original_height = 600 
    
            scale_x = (current_size.x.to_f / original_width)
            scale_y = current_size.y.to_f / original_height
            
    
            #------------------------------------objects-------------------------------------------------
    
                slot_01_x = @@weapon_slot_01_sprite.position.x
                slot_01_y = @@weapon_slot_01_sprite.position.y
                slot_01_width = @@weapon_slot_01_sprite.size.x
                slot_01_height = @@weapon_slot_01_sprite.size.y
    
                slot_02_x = @@weapon_slot_02_sprite.position.x
                slot_02_y = @@weapon_slot_02_sprite.position.y
                slot_02_width = @@weapon_slot_02_sprite.size.x
                slot_02_height = @@weapon_slot_02_sprite.size.y
    
                slot_03_x = @@weapon_slot_03_sprite.position.x
                slot_03_y = @@weapon_slot_03_sprite.position.y
                slot_03_width = @@weapon_slot_03_sprite.size.x
                slot_03_height = @@weapon_slot_03_sprite.size.y
    
                slot_04_x = @@weapon_slot_04_sprite.position.x
                slot_04_y = @@weapon_slot_04_sprite.position.y
                slot_04_width = @@weapon_slot_04_sprite.size.x
                slot_04_height = @@weapon_slot_04_sprite.size.y
    
                slot_05_x = @@weapon_slot_05_sprite.position.x
                slot_05_y = @@weapon_slot_05_sprite.position.y
                slot_05_width = @@weapon_slot_05_sprite.size.x
                slot_05_height = @@weapon_slot_05_sprite.size.y
    
                slot_06_x = @@weapon_slot_06_sprite.position.x
                slot_06_y = @@weapon_slot_06_sprite.position.y
                slot_06_width = @@weapon_slot_06_sprite.size.x
                slot_06_height = @@weapon_slot_06_sprite.size.y
    
                slot_07_x = @@weapon_slot_07_sprite.position.x
                slot_07_y = @@weapon_slot_07_sprite.position.y
                slot_07_width = @@weapon_slot_07_sprite.size.x
                slot_07_height = @@weapon_slot_07_sprite.size.y
    
                slot_08_x = @@weapon_slot_08_sprite.position.x
                slot_08_y = @@weapon_slot_08_sprite.position.y
                slot_08_width = @@weapon_slot_08_sprite.size.x
                slot_08_height = @@weapon_slot_08_sprite.size.y
    
                slot_09_x = @@weapon_slot_09_sprite.position.x
                slot_09_y = @@weapon_slot_09_sprite.position.y
                slot_09_width = @@weapon_slot_09_sprite.size.x
                slot_09_height = @@weapon_slot_09_sprite.size.y
    
                slot_10_x = @@weapon_slot_10_sprite.position.x
                slot_10_y = @@weapon_slot_10_sprite.position.y
                slot_10_width = @@weapon_slot_10_sprite.size.x
                slot_10_height = @@weapon_slot_10_sprite.size.y
    
                slot_11_x = @@weapon_slot_11_sprite.position.x
                slot_11_y = @@weapon_slot_11_sprite.position.y
                slot_11_width = @@weapon_slot_11_sprite.size.x
                slot_11_height = @@weapon_slot_11_sprite.size.y
    
                slot_12_x = @@weapon_slot_12_sprite.position.x
                slot_12_y = @@weapon_slot_12_sprite.position.y
                slot_12_width = @@weapon_slot_12_sprite.size.x
                slot_12_height = @@weapon_slot_12_sprite.size.y
    
                slot_13_x = @@weapon_slot_13_sprite.position.x
                slot_13_y = @@weapon_slot_13_sprite.position.y
                slot_13_width = @@weapon_slot_13_sprite.size.x
                slot_13_height = @@weapon_slot_13_sprite.size.y
    
                slot_14_x = @@weapon_slot_14_sprite.position.x
                slot_14_y = @@weapon_slot_14_sprite.position.y
                slot_14_width = @@weapon_slot_14_sprite.size.x
                slot_14_height = @@weapon_slot_14_sprite.size.y
    
                slot_15_x = @@weapon_slot_15_sprite.position.x
                slot_15_y = @@weapon_slot_15_sprite.position.y
                slot_15_width = @@weapon_slot_15_sprite.size.x
                slot_15_height = @@weapon_slot_15_sprite.size.y
            #---------------------------------------------------------------------------------------------
            if @@page == nil
                @@page = 1
            end
            if (mouse_x >= slot_01_x && mouse_x <= slot_01_x + slot_01_width) &&
               (mouse_y >= slot_01_y && mouse_y <= slot_01_y + slot_01_height)
                if @@weapon_slot_01 != nil   
                    t = 0 + (@@page.not_nil! * 15) - 15
                    
                    @@owned_weapon_array[t] = (Equipment::Weapon.get_weapon(Player::Appearance.get_clothing("weapon").not_nil!).not_nil!)
                    Player::Appearance.change_weapon(@@weapon_slot_01.not_nil!.name)
                    Sprites::Player.refresh_player_sprite(window)
                    
                end
                WeaponTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_02_x && mouse_x <= slot_02_x + slot_02_width) &&
               (mouse_y >= slot_02_y && mouse_y <= slot_02_y + slot_02_height)
               
                if @@weapon_slot_02 != nil
                    t = 1 + (@@page.not_nil! * 15) - 15
                    
                    @@owned_weapon_array[t] = (Equipment::Weapon.get_weapon(Player::Appearance.get_clothing("weapon").not_nil!).not_nil!)
                    Player::Appearance.change_weapon(@@weapon_slot_02.not_nil!.name)
                    Sprites::Player.refresh_player_sprite(window)
                end
                WeaponTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_03_x && mouse_x <= slot_03_x + slot_03_width) &&
               (mouse_y >= slot_03_y && mouse_y <= slot_03_y + slot_03_height)
               
                if @@weapon_slot_03 != nil
                    t = 2 + (@@page.not_nil! * 15) - 15
                    
                    @@owned_weapon_array[t] = (Equipment::Weapon.get_weapon(Player::Appearance.get_clothing("weapon").not_nil!).not_nil!)
                    Player::Appearance.change_weapon(@@weapon_slot_03.not_nil!.name)
                    Sprites::Player.refresh_player_sprite(window)
                end
                WeaponTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_04_x && mouse_x <= slot_04_x + slot_04_width) &&
               (mouse_y >= slot_04_y && mouse_y <= slot_04_y + slot_04_height)
               
                if @@weapon_slot_04 != nil
                    t = 3 + (@@page.not_nil! * 15) - 15
                    
                    @@owned_weapon_array[t] = (Equipment::Weapon.get_weapon(Player::Appearance.get_clothing("weapon").not_nil!).not_nil!)
                    Player::Appearance.change_weapon(@@weapon_slot_04.not_nil!.name)
                    Sprites::Player.refresh_player_sprite(window)
                end
                WeaponTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_05_x && mouse_x <= slot_05_x + slot_05_width) &&
               (mouse_y >= slot_05_y && mouse_y <= slot_05_y + slot_05_height)
               
                if @@weapon_slot_05 != nil
                    t = 4 + (@@page.not_nil! * 15) - 15
                    
                    @@owned_weapon_array[t] = (Equipment::Weapon.get_weapon(Player::Appearance.get_clothing("weapon").not_nil!).not_nil!)
                    Player::Appearance.change_weapon(@@weapon_slot_05.not_nil!.name)
                    Sprites::Player.refresh_player_sprite(window)
                end
                WeaponTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_06_x && mouse_x <= slot_06_x + slot_06_width) &&
               (mouse_y >= slot_06_y && mouse_y <= slot_06_y + slot_06_height)
               
                if @@weapon_slot_06 != nil
                    t = 5 + (@@page.not_nil! * 15) - 15
                    
                    @@owned_weapon_array[t] = (Equipment::Weapon.get_weapon(Player::Appearance.get_clothing("weapon").not_nil!).not_nil!)
                    Player::Appearance.change_weapon(@@weapon_slot_06.not_nil!.name)
                    Sprites::Player.refresh_player_sprite(window)
                end
                WeaponTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_07_x && mouse_x <= slot_07_x + slot_07_width) &&
               (mouse_y >= slot_07_y && mouse_y <= slot_07_y + slot_07_height)
               
                if @@weapon_slot_07 != nil
                    t = 6 + (@@page.not_nil! * 15) - 15
                    
                    @@owned_weapon_array[t] = (Equipment::Weapon.get_weapon(Player::Appearance.get_clothing("weapon").not_nil!).not_nil!)
                    Player::Appearance.change_weapon(@@weapon_slot_07.not_nil!.name)
                    Sprites::Player.refresh_player_sprite(window)
                end
                WeaponTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_08_x && mouse_x <= slot_08_x + slot_08_width) &&
               (mouse_y >= slot_08_y && mouse_y <= slot_08_y + slot_08_height)
               
                if @@weapon_slot_08 != nil
                    t = 7 + (@@page.not_nil! * 15) - 15
                    
                    @@owned_weapon_array[t] = (Equipment::Weapon.get_weapon(Player::Appearance.get_clothing("weapon").not_nil!).not_nil!)
                    Player::Appearance.change_weapon(@@weapon_slot_08.not_nil!.name)
                    Sprites::Player.refresh_player_sprite(window)
                end
                WeaponTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_09_x && mouse_x <= slot_09_x + slot_09_width) &&
               (mouse_y >= slot_09_y && mouse_y <= slot_09_y + slot_09_height)
               
                if @@weapon_slot_09 != nil
                    t = 8 + (@@page.not_nil! * 15) - 15
                    
                    @@owned_weapon_array[t] = (Equipment::Weapon.get_weapon(Player::Appearance.get_clothing("weapon").not_nil!).not_nil!)
                    Player::Appearance.change_weapon(@@weapon_slot_09.not_nil!.name)
                    Sprites::Player.refresh_player_sprite(window)
                end
                WeaponTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_10_x && mouse_x <= slot_10_x + slot_10_width) &&
               (mouse_y >= slot_10_y && mouse_y <= slot_10_y + slot_10_height)
               
                if @@weapon_slot_10 != nil
                    t = 9 + (@@page.not_nil! * 15) - 15
                    
                    @@owned_weapon_array[t] = (Equipment::Weapon.get_weapon(Player::Appearance.get_clothing("weapon").not_nil!).not_nil!)
                    Player::Appearance.change_weapon(@@weapon_slot_10.not_nil!.name)
                    Sprites::Player.refresh_player_sprite(window)
                end
                WeaponTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_11_x && mouse_x <= slot_11_x + slot_11_width) &&
               (mouse_y >= slot_11_y && mouse_y <= slot_11_y + slot_11_height)
               
                if @@weapon_slot_11 != nil
                    t = 10 + (@@page.not_nil! * 15) - 15
                    
                    @@owned_weapon_array[t] = (Equipment::Weapon.get_weapon(Player::Appearance.get_clothing("weapon").not_nil!).not_nil!)
                    Player::Appearance.change_weapon(@@weapon_slot_11.not_nil!.name)
                    Sprites::Player.refresh_player_sprite(window)
                end
                WeaponTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_12_x && mouse_x <= slot_12_x + slot_12_width) &&
               (mouse_y >= slot_12_y && mouse_y <= slot_12_y + slot_12_height)
               
                if @@weapon_slot_12 != nil
                    t = 11 + (@@page.not_nil! * 15) - 15
                    
                    @@owned_weapon_array[t] = (Equipment::Weapon.get_weapon(Player::Appearance.get_clothing("weapon").not_nil!).not_nil!)
                    Player::Appearance.change_weapon(@@weapon_slot_12.not_nil!.name)
                    Sprites::Player.refresh_player_sprite(window)
                end
                WeaponTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_13_x && mouse_x <= slot_13_x + slot_13_width) &&
               (mouse_y >= slot_13_y && mouse_y <= slot_13_y + slot_13_height)
               
                if @@weapon_slot_13 != nil
                    t = 12 + (@@page.not_nil! * 15) - 15
                    
                    @@owned_weapon_array[t] = (Equipment::Weapon.get_weapon(Player::Appearance.get_clothing("weapon").not_nil!).not_nil!)
                    Player::Appearance.change_weapon(@@weapon_slot_13.not_nil!.name)
                    Sprites::Player.refresh_player_sprite(window)
                end
                WeaponTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_14_x && mouse_x <= slot_14_x + slot_14_width) &&
               (mouse_y >= slot_14_y && mouse_y <= slot_14_y + slot_14_height)
               
                if @@weapon_slot_14 != nil
                    t = 13 + (@@page.not_nil! * 15) - 15
                    
                    @@owned_weapon_array[t] = (Equipment::Weapon.get_weapon(Player::Appearance.get_clothing("weapon").not_nil!).not_nil!)
                    Player::Appearance.change_weapon(@@weapon_slot_14.not_nil!.name)
                    Sprites::Player.refresh_player_sprite(window)
                end
                WeaponTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_15_x && mouse_x <= slot_15_x + slot_15_width) &&
               (mouse_y >= slot_15_y && mouse_y <= slot_15_y + slot_15_height)
               
                if @@weapon_slot_15 != nil
                    t = 14 + (@@page.not_nil! * 15) - 15
                    
                    @@owned_weapon_array[t] = (Equipment::Weapon.get_weapon(Player::Appearance.get_clothing("weapon").not_nil!).not_nil!)
                    Player::Appearance.change_weapon(@@weapon_slot_15.not_nil!.name)
                    Sprites::Player.refresh_player_sprite(window)
                end
                WeaponTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
    
        end
    end


    class ConsumableTab
        @@owned_consumable_array = [] of Consumables::Consumables_base

        @@consumable_sorting_category = "Type"

        @@consumable_slot_01 : Consumables::Consumables_base? = nil
        @@consumable_slot_02 : Consumables::Consumables_base? = nil
        @@consumable_slot_03 : Consumables::Consumables_base? = nil
        @@consumable_slot_04 : Consumables::Consumables_base? = nil
        @@consumable_slot_05 : Consumables::Consumables_base? = nil
        @@consumable_slot_06 : Consumables::Consumables_base? = nil
        @@consumable_slot_07 : Consumables::Consumables_base? = nil
        @@consumable_slot_08 : Consumables::Consumables_base? = nil
        @@consumable_slot_09 : Consumables::Consumables_base? = nil
        @@consumable_slot_10 : Consumables::Consumables_base? = nil
        @@consumable_slot_11 : Consumables::Consumables_base? = nil
        @@consumable_slot_12 : Consumables::Consumables_base? = nil
        @@consumable_slot_13 : Consumables::Consumables_base? = nil
        @@consumable_slot_14 : Consumables::Consumables_base? = nil
        @@consumable_slot_15 : Consumables::Consumables_base? = nil
       #---------------------------------debug-------------------------------------------
            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Small HP Potion").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Small HP Potion").not_nil!, 1)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("HP Potion").not_nil!)
            Consumables::Consumables_base.get_consumable("HP Potion").not_nil!.amount_owned = 1

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Small MP Potion").not_nil!)
            Consumables::Consumables_base.get_consumable("Small MP Potion").not_nil!.amount_owned = 1

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("MP Potion").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("MP Potion").not_nil!, 1)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Large HP Potion").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Large HP Potion").not_nil!, 1)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Large MP Potion").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Large MP Potion").not_nil!, 1)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Extra Large HP Potion").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Extra Large HP Potion").not_nil!, 1)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Extra Large MP Potion").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Extra Large MP Potion").not_nil!, 1)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Small Advanced HP Potion").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Small Advanced HP Potion").not_nil!, 1)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Small Advanced MP Potion").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Small Advanced MP Potion").not_nil!, 1)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Advanced HP Potion").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Advanced HP Potion").not_nil!, 1)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Advanced MP Potion").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Advanced MP Potion").not_nil!, 1)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Large Advanced HP Potion").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Large Advanced HP Potion").not_nil!, 1)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Large Advanced MP Potion").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Large Advanced MP Potion").not_nil!, 1)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Extra Large Advanced HP Potion").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Extra Large Advanced HP Potion").not_nil!, 1)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Extra Large Advanced MP Potion").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Extra Large Advanced MP Potion").not_nil!, 1)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Small Elixir").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Small Elixir").not_nil!, 1)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Elixir").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Elixir").not_nil!, 1)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Large Elixir").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Large Elixir").not_nil!, 1)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Extra Large Elixir").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Extra Large Elixir").not_nil!, 1)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Small Advanced Elixir").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Small Advanced Elixir").not_nil!, 1)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Advanced Elixir").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Advanced Elixir").not_nil!, 1)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Large Advanced Elixir").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Large Advanced Elixir").not_nil!, 1)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Extra Large Advanced Elixir").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Extra Large Advanced Elixir").not_nil!, 1)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Failed Small HP Potion").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Failed Small HP Potion").not_nil!, 2)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Failed HP Potion").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Failed HP Potion").not_nil!, 2)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Failed Large HP Potion").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Failed Large HP Potion").not_nil!, 2)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Failed Extra Large HP Potion").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Failed Extra Large HP Potion").not_nil!, 2)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Failed Small MP Potion").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Failed Small MP Potion").not_nil!, 2)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Failed MP Potion").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Failed MP Potion").not_nil!, 2)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Failed Large MP Potion").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Failed Large MP Potion").not_nil!, 2)

            @@owned_consumable_array.push(Consumables::Consumables_base.get_consumable("Failed Extra Large MP Potion").not_nil!)
            ConsumableTab.add_item(Consumables::Consumables_base.get_consumable("Failed Extra Large MP Potion").not_nil!, 2)
       #---------------------------------------------------------------------------------
       #--------------------------------objects------------------------------------------
              INVENTORY_BOX = SF::RectangleShape.new(SF.vector2(610, 420))
              INVENTORY_BOX.fill_color = SF.color( 137, 170, 208 )
      
              
              @@consumables_left_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
              @@consumables_left_arrow_sprite.fill_color = SF.color(161, 183, 208)
      
              @@consumables_right_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
              @@consumables_right_arrow_sprite.fill_color = SF.color(161, 183, 208)
      
      
              @@consumables_sort_button_sprite = SF::RectangleShape.new(SF.vector2(75, 25))
              @@consumables_sort_button_sprite.fill_color = SF.color(161, 183, 208)
      
              @@consumables_weapon_category_box = SF::RectangleShape.new(SF.vector2(100, 25))
              @@consumables_weapon_category_box.fill_color = SF.color(161, 183, 208)
      
              @@consumables_sort_button_text = SF::Text.new
              @@consumables_sort_button_text.font = QUICKSAND
              @@consumables_sort_button_text.character_size = 20
              @@consumables_sort_button_text.color = SF::Color::Blue
              @@consumables_sort_button_text.string = "Sort"
      
      
              @@consumables_right_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
              @@consumables_right_arrow_sprite.fill_color = SF.color(161, 183, 208)
              
              @@consumable_tab = SF::RectangleShape.new(SF.vector2(100, 50))
              @@consumable_tab.fill_color = SF.color(141, 163, 188)
      
              @@consumable_tab_text = SF::Text.new
              @@consumable_tab_text.font = QUICKSAND
              @@consumable_tab_text.color = SF::Color::Blue
              @@consumable_tab = SF::RectangleShape.new(SF.vector2(100, 50))
              @@consumable_tab.fill_color = SF.color(161, 183, 208)
      
              @@consumable_tab_text = SF::Text.new
              @@consumable_tab_text.font = QUICKSAND
              @@consumable_tab_text.character_size = 20
              @@consumable_tab_text.color = SF::Color::Blue
              @@consumable_tab_text.string = "Consumable"
      
      
              @@consumable_slot_01_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@consumable_slot_01_sprite.fill_color = SF.color(161, 183, 208)
      
              @@consumable_slot_01_text = SF::Text.new
              @@consumable_slot_01_text.font = QUICKSAND
              @@consumable_slot_01_text.character_size = 12
              @@consumable_slot_01_text.color = SF::Color::Blue
      
              @@consumable_slot_01_image_sprite = SF::Sprite.new
      
      
              @@consumable_slot_02_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@consumable_slot_02_sprite.fill_color = SF.color(161, 183, 208)
      
              @@consumable_slot_02_text = SF::Text.new
              @@consumable_slot_02_text.font = QUICKSAND
              @@consumable_slot_02_text.character_size = 12
              @@consumable_slot_02_text.color = SF::Color::Blue
      
              @@consumable_slot_02_image_sprite = SF::Sprite.new
      
      
              @@consumable_slot_03_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@consumable_slot_03_sprite.fill_color = SF.color(161, 183, 208)
      
              @@consumable_slot_03_text = SF::Text.new
              @@consumable_slot_03_text.font = QUICKSAND
              @@consumable_slot_03_text.character_size = 12
              @@consumable_slot_03_text.color = SF::Color::Blue
      
              @@consumable_slot_03_image_sprite = SF::Sprite.new
      
      
              @@consumable_slot_04_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@consumable_slot_04_sprite.fill_color = SF.color(161, 183, 208)
      
              @@consumable_slot_04_text = SF::Text.new
              @@consumable_slot_04_text.font = QUICKSAND
              @@consumable_slot_04_text.character_size = 12
              @@consumable_slot_04_text.color = SF::Color::Blue
      
              @@consumable_slot_04_image_sprite = SF::Sprite.new
      
      
              @@consumable_slot_05_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@consumable_slot_05_sprite.fill_color = SF.color(161, 183, 208)
      
              @@consumable_slot_05_text = SF::Text.new
              @@consumable_slot_05_text.font = QUICKSAND
              @@consumable_slot_05_text.character_size = 12
              @@consumable_slot_05_text.color = SF::Color::Blue
      
              @@consumable_slot_05_image_sprite = SF::Sprite.new
      
      
              @@consumable_slot_06_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@consumable_slot_06_sprite.fill_color = SF.color(161, 183, 208)
      
              @@consumable_slot_06_text = SF::Text.new
              @@consumable_slot_06_text.font = QUICKSAND
              @@consumable_slot_06_text.character_size = 12
              @@consumable_slot_06_text.color = SF::Color::Blue
              
              @@consumable_slot_06_image_sprite = SF::Sprite.new
      
      
              @@consumable_slot_07_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@consumable_slot_07_sprite.fill_color = SF.color(161, 183, 208)
      
              @@consumable_slot_07_text = SF::Text.new
              @@consumable_slot_07_text.font = QUICKSAND
              @@consumable_slot_07_text.character_size = 12
              @@consumable_slot_07_text.color = SF::Color::Blue
      
              @@consumable_slot_07_image_sprite = SF::Sprite.new
      
      
              @@consumable_slot_08_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@consumable_slot_08_sprite.fill_color = SF.color(161, 183, 208)
      
              @@consumable_slot_08_text = SF::Text.new
              @@consumable_slot_08_text.font = QUICKSAND
              @@consumable_slot_08_text.character_size = 12
              @@consumable_slot_08_text.color = SF::Color::Blue
      
              @@consumable_slot_08_image_sprite = SF::Sprite.new
      
      
              @@consumable_slot_09_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@consumable_slot_09_sprite.fill_color = SF.color(161, 183, 208)
      
              @@consumable_slot_09_text = SF::Text.new
              @@consumable_slot_09_text.font = QUICKSAND
              @@consumable_slot_09_text.character_size = 12
              @@consumable_slot_09_text.color = SF::Color::Blue
      
              @@consumable_slot_09_image_sprite = SF::Sprite.new
      
      
              @@consumable_slot_10_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@consumable_slot_10_sprite.fill_color = SF.color(161, 183, 208)
      
              @@consumable_slot_10_text = SF::Text.new
              @@consumable_slot_10_text.font = QUICKSAND
              @@consumable_slot_10_text.character_size = 12
              @@consumable_slot_10_text.color = SF::Color::Blue
      
              @@consumable_slot_10_image_sprite = SF::Sprite.new
      
      
              @@consumable_slot_11_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@consumable_slot_11_sprite.fill_color = SF.color(161, 183, 208)
      
              @@consumable_slot_11_text = SF::Text.new
              @@consumable_slot_11_text.font = QUICKSAND
              @@consumable_slot_11_text.character_size = 12
              @@consumable_slot_11_text.color = SF::Color::Blue
      
              @@consumable_slot_11_image_sprite = SF::Sprite.new
      
      
              @@consumable_slot_12_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@consumable_slot_12_sprite.fill_color = SF.color(161, 183, 208)
      
              @@consumable_slot_12_text = SF::Text.new
              @@consumable_slot_12_text.font = QUICKSAND
              @@consumable_slot_12_text.character_size = 12
              @@consumable_slot_12_text.color = SF::Color::Blue
      
              @@consumable_slot_12_image_sprite = SF::Sprite.new
      
      
              @@consumable_slot_13_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@consumable_slot_13_sprite.fill_color = SF.color(161, 183, 208)
      
              @@consumable_slot_13_text = SF::Text.new
              @@consumable_slot_13_text.font = QUICKSAND
              @@consumable_slot_13_text.character_size = 12
              @@consumable_slot_13_text.color = SF::Color::Blue
      
              @@consumable_slot_13_image_sprite = SF::Sprite.new
      
      
              @@consumable_slot_14_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@consumable_slot_14_sprite.fill_color = SF.color(161, 183, 208)
      
              @@consumable_slot_14_text = SF::Text.new
              @@consumable_slot_14_text.font = QUICKSAND
              @@consumable_slot_14_text.character_size = 12
              @@consumable_slot_14_text.color = SF::Color::Blue
      
              @@consumable_slot_14_image_sprite = SF::Sprite.new
      
      
              @@consumable_slot_15_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
              @@consumable_slot_15_sprite.fill_color = SF.color(161, 183, 208)
      
              @@consumable_slot_15_text = SF::Text.new
              @@consumable_slot_15_text.font = QUICKSAND
              @@consumable_slot_15_text.character_size = 12
              @@consumable_slot_15_text.color = SF::Color::Blue
      
              @@consumable_slot_15_image_sprite = SF::Sprite.new
      
       #---------------------------------------------------------------------------------

        def initialize(is_open : Bool, page : Int32)
            @is_open = is_open
            @page = page
        end

        class_property is_open : Bool = false
        class_property page : Int32 = 1
          
        def ConsumableTab.owned_consumable_array
            @@owned_consumable_array
        end
        def ConsumableTab.owned_consumable_array=(this)
            @@owned_consumable_array = this
        end
        def ConsumableTab.push_to_owned_consumable_array(this)
            @@owned_consumable_array.push(this)
        end

        def ConsumableTab.change_consumable_sort_category
           case @@consumable_sorting_category
            when "Type"
                @@consumable_sorting_category = "Strength"
            when "Strength"
                @@consumable_sorting_category = "Type"
           end
        end
    
        def ConsumableTab.get_consumable_category
            return @@consumable_sorting_category
        end

        def ConsumableTab.initialize_consumables_tab(window)
            @@page = 1
            INVENTORY_BOX.position = SF.vector2(20, 40)  
        end

        def ConsumableTab.assign_slot_textures(window)
            if @@page == nil
                @@page = 1
            end
                t = (@@page.not_nil! - 1) * 15
                if t < @@owned_consumable_array.size 
                 @@consumable_slot_01_image_sprite.texture = @@owned_consumable_array[t].texture
                 @@consumable_slot_01_image_sprite.texture_rect = @@owned_consumable_array[t].texture_rectangle
                 @@consumable_slot_01_text.string = "#{@@owned_consumable_array[t].short_name + " " + @@owned_consumable_array[t].amount_owned.to_s + "x"}"
                 @@consumable_slot_01 = @@owned_consumable_array[t]
                else 
                    @@consumable_slot_01_image_sprite.texture = NIL_TEXTURE
                    @@consumable_slot_01_text.string = ""
                    @@consumable_slot_01 = nil
                end
                t = (@@page.not_nil! - 1) * 15 + 1
                if t < @@owned_consumable_array.size 
                 @@consumable_slot_02_image_sprite.texture = @@owned_consumable_array[t].texture
                 @@consumable_slot_02_image_sprite.texture_rect = @@owned_consumable_array[t].texture_rectangle
                 @@consumable_slot_02_text.string = "#{@@owned_consumable_array[t].short_name + " " + @@owned_consumable_array[t].amount_owned.to_s + "x"}"
                 @@consumable_slot_02 = @@owned_consumable_array[t]
                else
                    @@consumable_slot_02_image_sprite.texture = NIL_TEXTURE
                    @@consumable_slot_02_text.string = ""
                    @@consumable_slot_02 = nil
                end
                t = 2 + (@@page.not_nil! * 15) - 15
                if t < @@owned_consumable_array.size 
                 @@consumable_slot_03_image_sprite.texture = @@owned_consumable_array[t].texture
                 @@consumable_slot_03_image_sprite.texture_rect = @@owned_consumable_array[t].texture_rectangle
                 @@consumable_slot_03_text.string = "#{@@owned_consumable_array[t].short_name + " " + @@owned_consumable_array[t].amount_owned.to_s + "x"}"
                 @@consumable_slot_03 = @@owned_consumable_array[t]
                else
                 @@consumable_slot_03_image_sprite.texture = NIL_TEXTURE
                 @@consumable_slot_03_text.string = ""
                 @@consumable_slot_03 = nil
                end
                t = 3 + (@@page.not_nil! * 15) - 15
                if t < @@owned_consumable_array.size
                 @@consumable_slot_04_image_sprite.texture = @@owned_consumable_array[t].texture
                 @@consumable_slot_04_image_sprite.texture_rect = @@owned_consumable_array[t].texture_rectangle
                 @@consumable_slot_04_text.string = "#{@@owned_consumable_array[t].short_name + " " + @@owned_consumable_array[t].amount_owned.to_s + "x"}"
                 @@consumable_slot_04 = @@owned_consumable_array[t]
                else
                 @@consumable_slot_04_image_sprite.texture = NIL_TEXTURE
                 @@consumable_slot_04_text.string = ""
                 @@consumable_slot_04 = nil
                end
                t = 4 + (@@page.not_nil! * 15) - 15
                if t < @@owned_consumable_array.size
                 @@consumable_slot_05_image_sprite.texture = @@owned_consumable_array[t].texture
                 @@consumable_slot_05_image_sprite.texture_rect = @@owned_consumable_array[t].texture_rectangle
                 @@consumable_slot_05_text.string = "#{@@owned_consumable_array[t].short_name + " " + @@owned_consumable_array[t].amount_owned.to_s + "x"}"
                 @@consumable_slot_05 = @@owned_consumable_array[t]
                else
                 @@consumable_slot_05_image_sprite.texture = NIL_TEXTURE
                 @@consumable_slot_05_text.string = ""
                 @@consumable_slot_05 = nil
                end
                t = 5 + (@@page.not_nil! * 15) - 15
                if t < @@owned_consumable_array.size
                 @@consumable_slot_06_image_sprite.texture = @@owned_consumable_array[t].texture
                 @@consumable_slot_06_image_sprite.texture_rect = @@owned_consumable_array[t].texture_rectangle
                 @@consumable_slot_06_text.string = "#{@@owned_consumable_array[t].short_name + " " + @@owned_consumable_array[t].amount_owned.to_s + "x"}"
                 @@consumable_slot_06 = @@owned_consumable_array[t]
                else
                 @@consumable_slot_06_image_sprite.texture = NIL_TEXTURE
                 @@consumable_slot_06_text.string = ""
                 @@consumable_slot_06 = nil
                end
                t = 6 + (@@page.not_nil! * 15) - 15
                if t < @@owned_consumable_array.size
                 @@consumable_slot_07_image_sprite.texture = @@owned_consumable_array[t].texture
                 @@consumable_slot_07_image_sprite.texture_rect = @@owned_consumable_array[t].texture_rectangle
                 @@consumable_slot_07_text.string = "#{@@owned_consumable_array[t].short_name + " " + @@owned_consumable_array[t].amount_owned.to_s + "x"}"
                 @@consumable_slot_07 = @@owned_consumable_array[t]
                else
                 @@consumable_slot_07_image_sprite.texture = NIL_TEXTURE
                 @@consumable_slot_07_text.string = ""
                 @@consumable_slot_07 = nil
                end
                t = 7 + (@@page.not_nil! * 15) - 15
                if t < @@owned_consumable_array.size
                 @@consumable_slot_08_image_sprite.texture = @@owned_consumable_array[t].texture
                 @@consumable_slot_08_image_sprite.texture_rect = @@owned_consumable_array[t].texture_rectangle
                 @@consumable_slot_08_text.string = "#{@@owned_consumable_array[t].short_name + " " + @@owned_consumable_array[t].amount_owned.to_s + "x"}"
                 @@consumable_slot_08 = @@owned_consumable_array[t]
                else
                 @@consumable_slot_08_image_sprite.texture = NIL_TEXTURE
                 @@consumable_slot_08_text.string = ""
                 @@consumable_slot_08 = nil
                end
                t = 8 + (@@page.not_nil! * 15) - 15
                if t < @@owned_consumable_array.size
                 @@consumable_slot_09_image_sprite.texture = @@owned_consumable_array[t].texture
                 @@consumable_slot_09_image_sprite.texture_rect = @@owned_consumable_array[t].texture_rectangle
                 @@consumable_slot_09_text.string = "#{@@owned_consumable_array[t].short_name + " " + @@owned_consumable_array[t].amount_owned.to_s + "x"}"
                 @@consumable_slot_09 = @@owned_consumable_array[t]
                else
                 @@consumable_slot_09_image_sprite.texture = NIL_TEXTURE
                 @@consumable_slot_09_text.string = ""
                 @@consumable_slot_09 = nil
                end
                t = 9 + (@@page.not_nil! * 15) - 15
                if t < @@owned_consumable_array.size
                 @@consumable_slot_10_image_sprite.texture = @@owned_consumable_array[t].texture
                 @@consumable_slot_10_image_sprite.texture_rect = @@owned_consumable_array[t].texture_rectangle
                 @@consumable_slot_10_text.string = "#{@@owned_consumable_array[t].short_name + " " + @@owned_consumable_array[t].amount_owned.to_s + "x"}"
                 @@consumable_slot_10 = @@owned_consumable_array[t]
                else
                 @@consumable_slot_10_image_sprite.texture = NIL_TEXTURE
                 @@consumable_slot_10_text.string = ""
                 @@consumable_slot_10 = nil
                end
                t = 10 + (@@page.not_nil! * 15) - 15
                if t < @@owned_consumable_array.size
                 @@consumable_slot_11_image_sprite.texture = @@owned_consumable_array[t].texture
                 @@consumable_slot_11_image_sprite.texture_rect = @@owned_consumable_array[t].texture_rectangle
                 @@consumable_slot_11_text.string = "#{@@owned_consumable_array[t].short_name + " " + @@owned_consumable_array[t].amount_owned.to_s + "x"}"
                 @@consumable_slot_11 = @@owned_consumable_array[t]
                else
                 @@consumable_slot_11_image_sprite.texture = NIL_TEXTURE
                 @@consumable_slot_11_text.string = ""
                 @@consumable_slot_11 = nil
                end
                t = 11 + (@@page.not_nil! * 15) - 15
                if t < @@owned_consumable_array.size
                 @@consumable_slot_12_image_sprite.texture = @@owned_consumable_array[t].texture
                 @@consumable_slot_12_image_sprite.texture_rect = @@owned_consumable_array[t].texture_rectangle
                 @@consumable_slot_12_text.string = "#{@@owned_consumable_array[t].short_name + " " + @@owned_consumable_array[t].amount_owned.to_s + "x"}"
                 @@consumable_slot_12 = @@owned_consumable_array[t]
                else
                 @@consumable_slot_12_image_sprite.texture = NIL_TEXTURE
                 @@consumable_slot_12_text.string = ""
                 @@consumable_slot_12 = nil
                end
                t = 12 + (@@page.not_nil! * 15) - 15
                if t < @@owned_consumable_array.size
                 @@consumable_slot_13_image_sprite.texture = @@owned_consumable_array[t].texture
                 @@consumable_slot_13_image_sprite.texture_rect = @@owned_consumable_array[t].texture_rectangle
                 @@consumable_slot_13_text.string = "#{@@owned_consumable_array[t].short_name + " " + @@owned_consumable_array[t].amount_owned.to_s + "x"}"
                 @@consumable_slot_13 = @@owned_consumable_array[t]
                else
                 @@consumable_slot_13_image_sprite.texture = NIL_TEXTURE
                 @@consumable_slot_13_text.string = ""
                 @@consumable_slot_13 = nil
                end
                t = 13 + (@@page.not_nil! * 15) - 15
                if t < @@owned_consumable_array.size
                 @@consumable_slot_14_image_sprite.texture = @@owned_consumable_array[t].texture
                 @@consumable_slot_14_image_sprite.texture_rect = @@owned_consumable_array[t].texture_rectangle
                 @@consumable_slot_14_text.string = "#{@@owned_consumable_array[t].short_name + " " + @@owned_consumable_array[t].amount_owned.to_s + "x"}"
                 @@consumable_slot_14 = @@owned_consumable_array[t]
                else
                 @@consumable_slot_14_image_sprite.texture = NIL_TEXTURE
                 @@consumable_slot_14_text.string = ""
                 @@consumable_slot_14 = nil
                end
                t = 14 + (@@page.not_nil! * 15) - 15
                if t < @@owned_consumable_array.size
                 @@consumable_slot_15_image_sprite.texture = @@owned_consumable_array[t].texture
                 @@consumable_slot_15_image_sprite.texture_rect = @@owned_consumable_array[t].texture_rectangle
                 @@consumable_slot_15_text.string = "#{@@owned_consumable_array[t].short_name + " " + @@owned_consumable_array[t].amount_owned.to_s + "x"}"
                 @@consumable_slot_15 = @@owned_consumable_array[t]
                else
                 @@consumable_slot_15_image_sprite.texture = NIL_TEXTURE
                 @@consumable_slot_15_text.string = ""
                 @@consumable_slot_15 = nil
                end
        end

        def ConsumableTab.draw_consumables_tab(window)
            mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window))
            mouse_x = mouse_position.x
            mouse_y = mouse_position.y

                current_size = window.size
                original_width = 800 
                original_height = 600
                scale_x = current_size.x.to_f / original_width
                scale_y = current_size.y.to_f / original_height
        
                scale_ratio = [scale_x, scale_y].min
                max_scale = 1.5
                clamped_scale = [scale_ratio, max_scale].min
    
            window.view = window.default_view
    
            INVENTORY_BOX.position = SF.vector2(80 * max_scale, 40 * max_scale)
            INVENTORY_BOX.scale = SF.vector2(1, 1)
    

            @@consumable_slot_01_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 40 * max_scale)
            @@consumable_slot_01_sprite.scale = SF.vector2(1, 1)
            
            @@consumable_slot_01_image_sprite.position = @@consumable_slot_01_sprite.position - SF.vector2(18 * max_scale, 25 * max_scale)
            @@consumable_slot_01_image_sprite.scale = SF.vector2(1.5, 1.5)
    
            @@consumable_slot_01_text.position = @@consumable_slot_01_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@consumable_slot_01_text)
            
    
            @@consumable_slot_02_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 40 * max_scale)
            @@consumable_slot_02_sprite.scale = SF.vector2(1, 1)
            
            @@consumable_slot_02_image_sprite.position = @@consumable_slot_02_sprite.position - SF.vector2(18 * max_scale, 25 * max_scale)
            @@consumable_slot_02_image_sprite.scale = SF.vector2(1.5, 1.5)
    
            @@consumable_slot_02_text.position = @@consumable_slot_02_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@consumable_slot_02_text)
            
    
            @@consumable_slot_03_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 40 * max_scale)
            @@consumable_slot_03_sprite.scale = SF.vector2(1, 1)
            
            @@consumable_slot_03_image_sprite.position = @@consumable_slot_03_sprite.position - SF.vector2(18 * max_scale, 25 * max_scale)
            @@consumable_slot_03_image_sprite.scale = SF.vector2(1.5, 1.5)
    
            @@consumable_slot_03_text.position = @@consumable_slot_03_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@consumable_slot_03_text)
            
    
            @@consumable_slot_04_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 40 * max_scale)
            @@consumable_slot_04_sprite.scale = SF.vector2(1, 1)
    
            @@consumable_slot_04_text.position = @@consumable_slot_04_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@consumable_slot_04_text)
            
            @@consumable_slot_04_image_sprite.position = @@consumable_slot_04_sprite.position - SF.vector2(18 * max_scale, 25 * max_scale)
            @@consumable_slot_04_image_sprite.scale = SF.vector2(1.5, 1.5)
    
    
            @@consumable_slot_05_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 40 * max_scale)
            @@consumable_slot_05_sprite.scale = SF.vector2(1, 1)
    
            @@consumable_slot_05_text.position = @@consumable_slot_05_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@consumable_slot_05_text)
            
            @@consumable_slot_05_image_sprite.position = @@consumable_slot_05_sprite.position - SF.vector2(18 * max_scale, 25 * max_scale)
            @@consumable_slot_05_image_sprite.scale = SF.vector2(1.5, 1.5)
            
    
            @@consumable_slot_06_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 120 * max_scale)
            @@consumable_slot_06_sprite.scale = SF.vector2(1, 1)
    
            @@consumable_slot_06_text.position = @@consumable_slot_06_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@consumable_slot_06_text)
            
            @@consumable_slot_06_image_sprite.position = @@consumable_slot_06_sprite.position - SF.vector2(18 * max_scale, 25 * max_scale)
            @@consumable_slot_06_image_sprite.scale = SF.vector2(1.5, 1.5)
            
    
            @@consumable_slot_07_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 120 * max_scale)
            @@consumable_slot_07_sprite.scale = SF.vector2(1, 1)
            
            @@consumable_slot_07_text.position = @@consumable_slot_07_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@consumable_slot_07_text)
            
            @@consumable_slot_07_image_sprite.position = @@consumable_slot_07_sprite.position - SF.vector2(18 * max_scale, 25 * max_scale)
            @@consumable_slot_07_image_sprite.scale = SF.vector2(1.5, 1.5)
            
    
            @@consumable_slot_08_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 120 * max_scale)
            @@consumable_slot_08_sprite.scale = SF.vector2(1, 1)
                    
            @@consumable_slot_08_text.position = @@consumable_slot_08_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@consumable_slot_08_text)
            
            @@consumable_slot_08_image_sprite.position = @@consumable_slot_08_sprite.position - SF.vector2(18 * max_scale, 25 * max_scale)
            @@consumable_slot_08_image_sprite.scale = SF.vector2(1.5, 1.5)
            
    
            @@consumable_slot_09_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 120 * max_scale)
            @@consumable_slot_09_sprite.scale = SF.vector2(1, 1)
                    
            @@consumable_slot_09_text.position = @@consumable_slot_09_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@consumable_slot_09_text)
            
            @@consumable_slot_09_image_sprite.position = @@consumable_slot_09_sprite.position - SF.vector2(18 * max_scale, 25 * max_scale)
            @@consumable_slot_09_image_sprite.scale = SF.vector2(1.5, 1.5)
            
    
            @@consumable_slot_10_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 120 * max_scale)
            @@consumable_slot_10_sprite.scale = SF.vector2(1, 1)
                            
            @@consumable_slot_10_text.position = @@consumable_slot_10_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@consumable_slot_10_text)
            
            @@consumable_slot_10_image_sprite.position = @@consumable_slot_10_sprite.position - SF.vector2(18 * max_scale, 25 * max_scale)
            @@consumable_slot_10_image_sprite.scale = SF.vector2(1.5, 1.5)
            
    
            @@consumable_slot_11_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 200 * max_scale)
            @@consumable_slot_11_sprite.scale = SF.vector2(1, 1)
                            
            @@consumable_slot_11_text.position = @@consumable_slot_11_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@consumable_slot_11_text)
            
            @@consumable_slot_11_image_sprite.position = @@consumable_slot_11_sprite.position - SF.vector2(18 * max_scale, 25 * max_scale)
            @@consumable_slot_11_image_sprite.scale = SF.vector2(1.5, 1.5)
            
    
            @@consumable_slot_12_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 200 * max_scale)
            @@consumable_slot_12_sprite.scale = SF.vector2(1, 1)
                            
            @@consumable_slot_12_text.position = @@consumable_slot_12_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@consumable_slot_12_text)
            
            @@consumable_slot_12_image_sprite.position = @@consumable_slot_12_sprite.position - SF.vector2(18 * max_scale, 25 * max_scale)
            @@consumable_slot_12_image_sprite.scale = SF.vector2(1.5, 1.5)
            
    
            @@consumable_slot_13_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 200 * max_scale)
            @@consumable_slot_13_sprite.scale = SF.vector2(1, 1)
            
            @@consumable_slot_13_text.position = @@consumable_slot_13_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@consumable_slot_13_text)
            
            @@consumable_slot_13_image_sprite.position = @@consumable_slot_13_sprite.position - SF.vector2(18 * max_scale, 25 * max_scale)
            @@consumable_slot_13_image_sprite.scale = SF.vector2(1.5, 1.5)
            
    
            @@consumable_slot_14_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 200 * max_scale)
            @@consumable_slot_14_sprite.scale = SF.vector2(1, 1)
                            
            @@consumable_slot_14_text.position = @@consumable_slot_14_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@consumable_slot_14_text)
            
            @@consumable_slot_14_image_sprite.position = @@consumable_slot_14_sprite.position - SF.vector2(18 * max_scale, 25 * max_scale)
            @@consumable_slot_14_image_sprite.scale = SF.vector2(1.5, 1.5)
            
    
            @@consumable_slot_15_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 200 * max_scale)
            @@consumable_slot_15_sprite.scale = SF.vector2(1, 1)
                            
            @@consumable_slot_15_text.position = @@consumable_slot_15_sprite.position + SF.vector2(45, 55 * max_scale)
            Utility::StringUtilities.center_text(@@consumable_slot_15_text)
            
            @@consumable_slot_15_image_sprite.position = @@consumable_slot_15_sprite.position - SF.vector2(18 * max_scale, 25 * max_scale)
            @@consumable_slot_15_image_sprite.scale = SF.vector2(1.5, 1.5)

            window.draw(@@consumable_slot_01_sprite)
            window.draw(@@consumable_slot_01_image_sprite)
            window.draw(@@consumable_slot_01_text)
    
            window.draw(@@consumable_slot_02_sprite)
            window.draw(@@consumable_slot_02_image_sprite)
            window.draw(@@consumable_slot_02_text)
    
            window.draw(@@consumable_slot_03_sprite)
            window.draw(@@consumable_slot_03_image_sprite)
            window.draw(@@consumable_slot_03_text)
            
            window.draw(@@consumable_slot_04_sprite)
            window.draw(@@consumable_slot_04_image_sprite)
            window.draw(@@consumable_slot_04_text)
    
            window.draw(@@consumable_slot_05_sprite)
            window.draw(@@consumable_slot_05_image_sprite)
            window.draw(@@consumable_slot_05_text)
    
            window.draw(@@consumable_slot_06_sprite)
            window.draw(@@consumable_slot_06_image_sprite)
            window.draw(@@consumable_slot_06_text)
    
            window.draw(@@consumable_slot_07_sprite)
            window.draw(@@consumable_slot_07_image_sprite)
            window.draw(@@consumable_slot_07_text)
    
            window.draw(@@consumable_slot_08_sprite)
            window.draw(@@consumable_slot_08_image_sprite)
            window.draw(@@consumable_slot_08_text)
    
            window.draw(@@consumable_slot_09_sprite)
            window.draw(@@consumable_slot_09_image_sprite)
            window.draw(@@consumable_slot_09_text)
    
            window.draw(@@consumable_slot_10_sprite)
            window.draw(@@consumable_slot_10_image_sprite)
            window.draw(@@consumable_slot_10_text)
    
            window.draw(@@consumable_slot_11_sprite)
            window.draw(@@consumable_slot_11_image_sprite)
            window.draw(@@consumable_slot_11_text)
    
            window.draw(@@consumable_slot_12_sprite)
            window.draw(@@consumable_slot_12_image_sprite)
            window.draw(@@consumable_slot_12_text)
    
            window.draw(@@consumable_slot_13_sprite)
            window.draw(@@consumable_slot_13_image_sprite)
            window.draw(@@consumable_slot_13_text)
    
            window.draw(@@consumable_slot_14_sprite)
            window.draw(@@consumable_slot_14_image_sprite)
            window.draw(@@consumable_slot_14_text)
    
            window.draw(@@consumable_slot_15_sprite)
            window.draw(@@consumable_slot_15_image_sprite)
            window.draw(@@consumable_slot_15_text)

            #ConsumableTab.consumable_info_box_handling(window)
    
            if SF::Mouse.button_pressed?(SF::Mouse::Left)
                ConsumableTab.mouse_handling(window)
            end
        end

        def ConsumableTab.use_item(window, t)
            if @@owned_consumable_array[t].amount_owned > 0
            @@owned_consumable_array[t].effect.apply
            @@owned_consumable_array[t].amount_owned -= 1
            end
            if @@owned_consumable_array[t].amount_owned <= 0
                @@owned_consumable_array.delete_at(t)
            end
            ConsumableTab.assign_slot_textures(window)
        end

        def ConsumableTab.add_item(item, amount)
            found = false
            @@owned_consumable_array.each do |i|
                if item.name == i.name
                    remaining_space = i.stack_limit - i.amount_owned
                    if remaining_space > 0
                        to_add = Math.min(amount, remaining_space)
                        i.amount_owned += to_add
                        amount -= to_add
                    end
                    found = true if amount == 0
                end
            end
        
            unless found
                new_item = Consumables::Consumables_base.new(item.name, item.short_name, item.stack_limit, amount, item.texture, item.texture_rectangle, item.effect, item.base_value)
                new_item.amount_owned = amount
                @@owned_consumable_array.push(new_item)
            end
        end

        def ConsumableTab.mouse_handling(window)
            mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window))
            mouse_x = mouse_position.x
            mouse_y = mouse_position.y
            
        
            current_size = window.size
            original_width = 800 
            original_height = 600 
    
            scale_x = (current_size.x.to_f / original_width)
            scale_y = current_size.y.to_f / original_height
            
    
            #------------------------------------objects-------------------------------------------------
    
                slot_01_x = @@consumable_slot_01_sprite.position.x
                slot_01_y = @@consumable_slot_01_sprite.position.y
                slot_01_width = @@consumable_slot_01_sprite.size.x
                slot_01_height = @@consumable_slot_01_sprite.size.y
    
                slot_02_x = @@consumable_slot_02_sprite.position.x
                slot_02_y = @@consumable_slot_02_sprite.position.y
                slot_02_width = @@consumable_slot_02_sprite.size.x
                slot_02_height = @@consumable_slot_02_sprite.size.y
    
                slot_03_x = @@consumable_slot_03_sprite.position.x
                slot_03_y = @@consumable_slot_03_sprite.position.y
                slot_03_width = @@consumable_slot_03_sprite.size.x
                slot_03_height = @@consumable_slot_03_sprite.size.y
    
                slot_04_x = @@consumable_slot_04_sprite.position.x
                slot_04_y = @@consumable_slot_04_sprite.position.y
                slot_04_width = @@consumable_slot_04_sprite.size.x
                slot_04_height = @@consumable_slot_04_sprite.size.y
    
                slot_05_x = @@consumable_slot_05_sprite.position.x
                slot_05_y = @@consumable_slot_05_sprite.position.y
                slot_05_width = @@consumable_slot_05_sprite.size.x
                slot_05_height = @@consumable_slot_05_sprite.size.y
    
                slot_06_x = @@consumable_slot_06_sprite.position.x
                slot_06_y = @@consumable_slot_06_sprite.position.y
                slot_06_width = @@consumable_slot_06_sprite.size.x
                slot_06_height = @@consumable_slot_06_sprite.size.y
    
                slot_07_x = @@consumable_slot_07_sprite.position.x
                slot_07_y = @@consumable_slot_07_sprite.position.y
                slot_07_width = @@consumable_slot_07_sprite.size.x
                slot_07_height = @@consumable_slot_07_sprite.size.y
    
                slot_08_x = @@consumable_slot_08_sprite.position.x
                slot_08_y = @@consumable_slot_08_sprite.position.y
                slot_08_width = @@consumable_slot_08_sprite.size.x
                slot_08_height = @@consumable_slot_08_sprite.size.y
    
                slot_09_x = @@consumable_slot_09_sprite.position.x
                slot_09_y = @@consumable_slot_09_sprite.position.y
                slot_09_width = @@consumable_slot_09_sprite.size.x
                slot_09_height = @@consumable_slot_09_sprite.size.y
    
                slot_10_x = @@consumable_slot_10_sprite.position.x
                slot_10_y = @@consumable_slot_10_sprite.position.y
                slot_10_width = @@consumable_slot_10_sprite.size.x
                slot_10_height = @@consumable_slot_10_sprite.size.y
    
                slot_11_x = @@consumable_slot_11_sprite.position.x
                slot_11_y = @@consumable_slot_11_sprite.position.y
                slot_11_width = @@consumable_slot_11_sprite.size.x
                slot_11_height = @@consumable_slot_11_sprite.size.y
    
                slot_12_x = @@consumable_slot_12_sprite.position.x
                slot_12_y = @@consumable_slot_12_sprite.position.y
                slot_12_width = @@consumable_slot_12_sprite.size.x
                slot_12_height = @@consumable_slot_12_sprite.size.y
    
                slot_13_x = @@consumable_slot_13_sprite.position.x
                slot_13_y = @@consumable_slot_13_sprite.position.y
                slot_13_width = @@consumable_slot_13_sprite.size.x
                slot_13_height = @@consumable_slot_13_sprite.size.y
    
                slot_14_x = @@consumable_slot_14_sprite.position.x
                slot_14_y = @@consumable_slot_14_sprite.position.y
                slot_14_width = @@consumable_slot_14_sprite.size.x
                slot_14_height = @@consumable_slot_14_sprite.size.y
    
                slot_15_x = @@consumable_slot_15_sprite.position.x
                slot_15_y = @@consumable_slot_15_sprite.position.y
                slot_15_width = @@consumable_slot_15_sprite.size.x
                slot_15_height = @@consumable_slot_15_sprite.size.y
            #---------------------------------------------------------------------------------------------
            if @@page == nil
                @@page = 1
            end
            if (mouse_x >= slot_01_x && mouse_x <= slot_01_x + slot_01_width) &&
               (mouse_y >= slot_01_y && mouse_y <= slot_01_y + slot_01_height)
                if @@consumable_slot_01 != nil
                    t = 0 + (@@page.not_nil! * 15) - 15
                    ConsumableTab.use_item(window, t)
                end
                ConsumableTab.assign_slot_textures(window)
                Utility::ClickUtilities.handle_click(window)
                #sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_02_x && mouse_x <= slot_02_x + slot_02_width) &&
               (mouse_y >= slot_02_y && mouse_y <= slot_02_y + slot_02_height)
               
                if @@consumable_slot_02 != nil
                    t = 1 + (@@page.not_nil! * 15) - 15
                    ConsumableTab.use_item(window, t)
                end
                ConsumableTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_03_x && mouse_x <= slot_03_x + slot_03_width) &&
               (mouse_y >= slot_03_y && mouse_y <= slot_03_y + slot_03_height)
               
                if @@consumable_slot_03 != nil
                    t = 2 + (@@page.not_nil! * 15) - 15
                    ConsumableTab.use_item(window, t)
                end
                ConsumableTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_04_x && mouse_x <= slot_04_x + slot_04_width) &&
               (mouse_y >= slot_04_y && mouse_y <= slot_04_y + slot_04_height)
               
                if @@consumable_slot_04 != nil
                    t = 3 + (@@page.not_nil! * 15) - 15
                    ConsumableTab.use_item(window, t)
                end
                ConsumableTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_05_x && mouse_x <= slot_05_x + slot_05_width) &&
               (mouse_y >= slot_05_y && mouse_y <= slot_05_y + slot_05_height)
               
                if @@consumable_slot_05 != nil
                    t = 4 + (@@page.not_nil! * 15) - 15
                    ConsumableTab.use_item(window, t)
                end
                ConsumableTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_06_x && mouse_x <= slot_06_x + slot_06_width) &&
               (mouse_y >= slot_06_y && mouse_y <= slot_06_y + slot_06_height)
               
                if @@consumable_slot_06 != nil
                    t = 5 + (@@page.not_nil! * 15) - 15
                    ConsumableTab.use_item(window, t)
                end
                ConsumableTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_07_x && mouse_x <= slot_07_x + slot_07_width) &&
               (mouse_y >= slot_07_y && mouse_y <= slot_07_y + slot_07_height)
               
                if @@consumable_slot_07 != nil
                    t = 6 + (@@page.not_nil! * 15) - 15
                    ConsumableTab.use_item(window, t)
                end
                ConsumableTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_08_x && mouse_x <= slot_08_x + slot_08_width) &&
               (mouse_y >= slot_08_y && mouse_y <= slot_08_y + slot_08_height)
               
                if @@consumable_slot_08 != nil
                    t = 7 + (@@page.not_nil! * 15) - 15
                    ConsumableTab.use_item(window, t)
                end
                ConsumableTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_09_x && mouse_x <= slot_09_x + slot_09_width) &&
               (mouse_y >= slot_09_y && mouse_y <= slot_09_y + slot_09_height)
               
                if @@consumable_slot_09 != nil
                    t = 8 + (@@page.not_nil! * 15) - 15
                    ConsumableTab.use_item(window, t)
                end
                ConsumableTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_10_x && mouse_x <= slot_10_x + slot_10_width) &&
               (mouse_y >= slot_10_y && mouse_y <= slot_10_y + slot_10_height)
               
                if @@consumable_slot_10 != nil
                    t = 9 + (@@page.not_nil! * 15) - 15
                    ConsumableTab.use_item(window, t)
                end
                ConsumableTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_11_x && mouse_x <= slot_11_x + slot_11_width) &&
               (mouse_y >= slot_11_y && mouse_y <= slot_11_y + slot_11_height)
               
                if @@consumable_slot_11 != nil
                    t = 10 + (@@page.not_nil! * 15) - 15
                    ConsumableTab.use_item(window, t)
                end
                ConsumableTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_12_x && mouse_x <= slot_12_x + slot_12_width) &&
               (mouse_y >= slot_12_y && mouse_y <= slot_12_y + slot_12_height)
               
                if @@consumable_slot_12 != nil
                    t = 11 + (@@page.not_nil! * 15) - 15
                    ConsumableTab.use_item(window, t)
                end
                ConsumableTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_13_x && mouse_x <= slot_13_x + slot_13_width) &&
               (mouse_y >= slot_13_y && mouse_y <= slot_13_y + slot_13_height)
               
                if @@consumable_slot_13 != nil
                    t = 12 + (@@page.not_nil! * 15) - 15
                    ConsumableTab.use_item(window, t)
                end
                ConsumableTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_14_x && mouse_x <= slot_14_x + slot_14_width) &&
               (mouse_y >= slot_14_y && mouse_y <= slot_14_y + slot_14_height)
               
                if @@consumable_slot_14 != nil
                    t = 13 + (@@page.not_nil! * 15) - 15
                    ConsumableTab.use_item(window, t)
                end
                ConsumableTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
            
            if (mouse_x >= slot_15_x && mouse_x <= slot_15_x + slot_15_width) &&
               (mouse_y >= slot_15_y && mouse_y <= slot_15_y + slot_15_height)
               
                if @@consumable_slot_15 != nil
                    t = 14 + (@@page.not_nil! * 15) - 15
                    ConsumableTab.use_item(window, t)
                end
                ConsumableTab.assign_slot_textures(window)
                sleep 0.15.seconds
            end
    
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