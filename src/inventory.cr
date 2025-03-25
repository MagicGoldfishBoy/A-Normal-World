require "crsfml"
require "../src/textures.cr"
require "../src/clothing.cr"
require "../src/equipment.cr"
require "../src/utility.cr"
require "../src/consumables.cr"

#puts Consumables::Consumables_base::CONSUMABLE_ARRAY
INVENTORY_BOX = SF::RectangleShape.new(SF.vector2(610, 420))
INVENTORY_BOX.fill_color = SF.color( 137, 170, 208 )

INVENTORY_LEFT_ARROW_SPRITE = SF::RectangleShape.new(SF.vector2(50, 25))
INVENTORY_LEFT_ARROW_SPRITE.fill_color = SF.color(161, 183, 208)

INVENTORY_RIGHT_ARROW_SPRITE = SF::RectangleShape.new(SF.vector2(50, 25))
INVENTORY_RIGHT_ARROW_SPRITE.fill_color = SF.color(161, 183, 208)

module Inventory
    class InventoryManager

        def initialize(is_inventory_open : Bool, category : String, tab : String)
            @@is_inventory_open = is_inventory_open
            @@category = category
            @@tab = tab
        end

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

        @@clothing_shirt_category_text = SF::Text.new
        @@clothing_shirt_category_text.font = QUICKSAND
        @@clothing_shirt_category_text.character_size = 20
        @@clothing_shirt_category_text.color = SF::Color::Blue
        @@clothing_shirt_category_text.string = ClothingTabShirt.get_shirt_category
        Utility::StringUtilities.center_text(@@clothing_shirt_category_text)


        @@shirt_tab = SF::RectangleShape.new(SF.vector2(100, 30))
        @@shirt_tab.fill_color = SF.color(141, 163, 188)

        @@shirt_tab_text = SF::Text.new
        @@shirt_tab_text.font = QUICKSAND
        @@shirt_tab_text.character_size = 20
        @@shirt_tab_text.color = SF::Color::Blue
        @@shirt_tab_text.string = "Shirts"


        @@clothing_jacket_category_box = SF::RectangleShape.new(SF.vector2(100, 25))
        @@clothing_jacket_category_box.fill_color = SF.color(161, 183, 208)

        @@clothing_sort_button_text = SF::Text.new
        @@clothing_sort_button_text.font = QUICKSAND
        @@clothing_sort_button_text.character_size = 20
        @@clothing_sort_button_text.color = SF::Color::Blue
        @@clothing_sort_button_text.string = "Sort"

        @@clothing_jacket_category_text = SF::Text.new
        @@clothing_jacket_category_text.font = QUICKSAND
        @@clothing_jacket_category_text.character_size = 20
        @@clothing_jacket_category_text.color = SF::Color::Blue
        @@clothing_jacket_category_text.string = ClothingTabJacket.get_jacket_category
        Utility::StringUtilities.center_text(@@clothing_jacket_category_text)


        @@jacket_tab = SF::RectangleShape.new(SF.vector2(100, 30))
        @@jacket_tab.fill_color = SF.color(141, 163, 188)

        @@jacket_tab_text = SF::Text.new
        @@jacket_tab_text.font = QUICKSAND
        @@jacket_tab_text.character_size = 20
        @@jacket_tab_text.color = SF::Color::Blue
        @@jacket_tab_text.string = "Jackets"


        @@pants_tab = SF::RectangleShape.new(SF.vector2(100, 30))
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
        Utility::StringUtilities.center_text(@@clothing_pants_category_text)

        @@shoes_tab = SF::RectangleShape.new(SF.vector2(100, 30))
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
        Utility::StringUtilities.center_text(@@clothing_shoes_category_text)

        @@socks_tab = SF::RectangleShape.new(SF.vector2(100, 30))
        @@socks_tab.fill_color = SF.color(161, 183, 208)

        @@socks_tab_text = SF::Text.new
        @@socks_tab_text.font = QUICKSAND
        @@socks_tab_text.character_size = 20
        @@socks_tab_text.color = SF::Color::Blue
        @@socks_tab_text.string = "Socks"

        @@clothing_socks_category_text = SF::Text.new
        @@clothing_socks_category_text.font = QUICKSAND
        @@clothing_socks_category_text.character_size = 20
        @@clothing_socks_category_text.color = SF::Color::Blue
        @@clothing_socks_category_text.string = ClothingTabSocks.get_socks_category
        Utility::StringUtilities.center_text(@@clothing_socks_category_text)

        @@gloves_tab = SF::RectangleShape.new(SF.vector2(100, 30))
        @@gloves_tab.fill_color = SF.color(161, 183, 208)

        @@gloves_tab_text = SF::Text.new
        @@gloves_tab_text.font = QUICKSAND
        @@gloves_tab_text.character_size = 20
        @@gloves_tab_text.color = SF::Color::Blue
        @@gloves_tab_text.string = "Gloves"

        @@clothing_gloves_category_text = SF::Text.new
        @@clothing_gloves_category_text.font = QUICKSAND
        @@clothing_gloves_category_text.character_size = 20
        @@clothing_gloves_category_text.color = SF::Color::Blue
        @@clothing_gloves_category_text.string = ClothingTabGloves.get_gloves_category
        Utility::StringUtilities.center_text(@@clothing_gloves_category_text)

        @@earrings_tab = SF::RectangleShape.new(SF.vector2(100, 30))
        @@earrings_tab.fill_color = SF.color(161, 183, 208)

        @@earrings_tab_text = SF::Text.new
        @@earrings_tab_text.font = QUICKSAND
        @@earrings_tab_text.character_size = 20
        @@earrings_tab_text.color = SF::Color::Blue
        @@earrings_tab_text.string = "Earrings"

        @@clothing_earrings_category_text = SF::Text.new
        @@clothing_earrings_category_text.font = QUICKSAND
        @@clothing_earrings_category_text.character_size = 20
        @@clothing_earrings_category_text.color = SF::Color::Blue
        @@clothing_earrings_category_text.string = ClothingTabEarrings.get_earrings_category
        Utility::StringUtilities.center_text(@@clothing_earrings_category_text)

        @@hat_tab = SF::RectangleShape.new(SF.vector2(100, 30))
        @@hat_tab.fill_color = SF.color(161, 183, 208)

        @@hat_tab_text = SF::Text.new
        @@hat_tab_text.font = QUICKSAND
        @@hat_tab_text.character_size = 20
        @@hat_tab_text.color = SF::Color::Blue
        @@hat_tab_text.string = "Hat"

        @@clothing_hat_category_text = SF::Text.new
        @@clothing_hat_category_text.font = QUICKSAND
        @@clothing_hat_category_text.character_size = 20
        @@clothing_hat_category_text.color = SF::Color::Blue
        @@clothing_hat_category_text.string = ClothingTabHat.get_hat_category
        Utility::StringUtilities.center_text(@@clothing_hat_category_text)

        @@glasses_tab = SF::RectangleShape.new(SF.vector2(100, 30))
        @@glasses_tab.fill_color = SF.color(161, 183, 208)

        @@glasses_tab_text = SF::Text.new
        @@glasses_tab_text.font = QUICKSAND
        @@glasses_tab_text.character_size = 20
        @@glasses_tab_text.color = SF::Color::Blue
        @@glasses_tab_text.string = "Glasses"

        @@clothing_glasses_category_text = SF::Text.new
        @@clothing_glasses_category_text.font = QUICKSAND
        @@clothing_glasses_category_text.character_size = 20
        @@clothing_glasses_category_text.color = SF::Color::Blue
        @@clothing_glasses_category_text.string = ClothingTabGlasses.get_glasses_category
        Utility::StringUtilities.center_text(@@clothing_glasses_category_text)

        @@makeup_tab = SF::RectangleShape.new(SF.vector2(100, 30))
        @@makeup_tab.fill_color = SF.color(161, 183, 208)

        @@makeup_tab_text = SF::Text.new
        @@makeup_tab_text.font = QUICKSAND
        @@makeup_tab_text.character_size = 20
        @@makeup_tab_text.color = SF::Color::Blue
        @@makeup_tab_text.string = "Makeup"

        @@clothing_makeup_category_text = SF::Text.new
        @@clothing_makeup_category_text.font = QUICKSAND
        @@clothing_makeup_category_text.character_size = 20
        @@clothing_makeup_category_text.color = SF::Color::Blue
        @@clothing_makeup_category_text.string = ClothingTabMakeup.get_makeup_category
        Utility::StringUtilities.center_text(@@clothing_makeup_category_text)

        @@necklace_tab = SF::RectangleShape.new(SF.vector2(100, 30))
        @@necklace_tab.fill_color = SF.color(161, 183, 208)

        @@necklace_tab_text = SF::Text.new
        @@necklace_tab_text.font = QUICKSAND
        @@necklace_tab_text.character_size = 20
        @@necklace_tab_text.color = SF::Color::Blue
        @@necklace_tab_text.string = "Necklace"

        @@clothing_necklace_category_text = SF::Text.new
        @@clothing_necklace_category_text.font = QUICKSAND
        @@clothing_necklace_category_text.character_size = 20
        @@clothing_necklace_category_text.color = SF::Color::Blue
        @@clothing_necklace_category_text.string = ClothingTabNecklace.get_necklace_category
        Utility::StringUtilities.center_text(@@clothing_necklace_category_text)

        @@weapon_tab = SF::RectangleShape.new(SF.vector2(100, 50))
        @@weapon_tab.fill_color = SF.color(141, 163, 188)

        @@weapon_tab_text = SF::Text.new
        @@weapon_tab_text.font = QUICKSAND
        @@weapon_tab_text.character_size = 20
        @@weapon_tab_text.color = SF::Color::Blue
        @@weapon_tab_text.string = "Weapons"

        @@equipment_weapon_category_text = SF::Text.new
        @@equipment_weapon_category_text.font = QUICKSAND
        @@equipment_weapon_category_text.character_size = 20
        @@equipment_weapon_category_text.color = SF::Color::Blue
        @@equipment_weapon_category_text.string = ClothingTabMakeup.get_makeup_category
        Utility::StringUtilities.center_text(@@equipment_weapon_category_text)

        @@consumables_consumable_category_text = SF::Text.new
        @@consumables_consumable_category_text.font = QUICKSAND
        @@consumables_consumable_category_text.character_size = 20
        @@consumables_consumable_category_text.color = SF::Color::Blue
        @@consumables_consumable_category_text.string = ClothingTabMakeup.get_makeup_category
        Utility::StringUtilities.center_text(@@consumables_consumable_category_text)

     #-----------------------------------------------------------------------------------------

        def InventoryManager.is_inventory_open
            @@is_inventory_open
        end
        def InventoryManager.is_inventory_open=(this)
            @@is_inventory_open = this
        end

        def InventoryManager.tab
            @@tab
        end
        def InventoryManager.tab=(this)
            @@tab = tab
        end

        def InventoryManager.draw_inventory(window)
          if @@is_inventory_open == true && @@category == "Cosmetics"
            case @@tab
             when "Shirt"
                InventoryManager.draw_universal_elements(window)
                ClothingTabShirt.draw_clothing_tab(window)
                if SF::Mouse.button_pressed?(SF::Mouse::Left)
                    InventoryManager.universal_mouse_handling("shirt", window)
                end
             when "Pants"
                InventoryManager.draw_universal_elements(window)
                ClothingTabPants.draw_clothing_tab(window)
                if SF::Mouse.button_pressed?(SF::Mouse::Left)
                    InventoryManager.universal_mouse_handling("pants", window)
                end
             when "Shoes"
                InventoryManager.draw_universal_elements(window)
                ClothingTabShoes.draw_clothing_tab(window)
                if SF::Mouse.button_pressed?(SF::Mouse::Left)
                    InventoryManager.universal_mouse_handling("shoes", window)
                end
             when "Gloves"
                InventoryManager.draw_universal_elements(window)
                ClothingTabGloves.draw_clothing_tab(window)
                if SF::Mouse.button_pressed?(SF::Mouse::Left)
                    InventoryManager.universal_mouse_handling("gloves", window)
                end
             when "Earrings"
                InventoryManager.draw_universal_elements(window)
                ClothingTabEarrings.draw_clothing_tab(window)
                if SF::Mouse.button_pressed?(SF::Mouse::Left)
                    InventoryManager.universal_mouse_handling("earrings", window)
                end
             when "Hat"
                InventoryManager.draw_universal_elements(window)
                ClothingTabHat.draw_clothing_tab(window)
                if SF::Mouse.button_pressed?(SF::Mouse::Left)
                    InventoryManager.universal_mouse_handling("hat", window)
                end
             when "Glasses"
                InventoryManager.draw_universal_elements(window)
                ClothingTabGlasses.draw_clothing_tab(window)
                if SF::Mouse.button_pressed?(SF::Mouse::Left)
                    InventoryManager.universal_mouse_handling("glasses", window)
                end
             when "Makeup"
                InventoryManager.draw_universal_elements(window)
                ClothingTabMakeup.draw_clothing_tab(window)
                if SF::Mouse.button_pressed?(SF::Mouse::Left)
                    InventoryManager.universal_mouse_handling("makeup", window)
                end
             when "Jacket"
                InventoryManager.draw_universal_elements(window)
                ClothingTabJacket.draw_clothing_tab(window)
                if SF::Mouse.button_pressed?(SF::Mouse::Left)
                    InventoryManager.universal_mouse_handling("jacket", window)
                end
             when "Socks"
                InventoryManager.draw_universal_elements(window)
                ClothingTabSocks.draw_clothing_tab(window)
                if SF::Mouse.button_pressed?(SF::Mouse::Left)
                    InventoryManager.universal_mouse_handling("socks", window)
                end
             when "Necklace"
                InventoryManager.draw_universal_elements(window)
                ClothingTabNecklace.draw_clothing_tab(window)
                if SF::Mouse.button_pressed?(SF::Mouse::Left)
                    InventoryManager.universal_mouse_handling("necklace", window)
                end
            end
          end
          if @@is_inventory_open == true && @@category == "Equipment"
                InventoryManager.draw_universal_elements(window)
                WeaponTab.draw_equipment_tab(window)
                if SF::Mouse.button_pressed?(SF::Mouse::Left)
                    InventoryManager.universal_mouse_handling("weapon", window)
                end
          end
          if @@is_inventory_open == true && @@category == "Consumables"
                InventoryManager.draw_universal_elements(window)
                ConsumableTab.draw_consumables_tab(window)
                if SF::Mouse.button_pressed?(SF::Mouse::Left)
                    InventoryManager.universal_mouse_handling("consumable", window)
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

            INVENTORY_BOX.position = SF.vector2(80 * max_scale, 40 * max_scale)
            INVENTORY_BOX.scale = SF.vector2(1, 1)
        

            INVENTORY_LEFT_ARROW_SPRITE.position = INVENTORY_BOX.position + SF.vector2(200 * max_scale, 15 * max_scale)
            INVENTORY_LEFT_ARROW_SPRITE.scale = SF.vector2(1, 1)

            INVENTORY_RIGHT_ARROW_SPRITE.position = INVENTORY_LEFT_ARROW_SPRITE.position + SF.vector2(50 * max_scale, 1 * max_scale)
            INVENTORY_RIGHT_ARROW_SPRITE.scale = SF.vector2(1, 1)

            @@cosmetics_category_tab.position = INVENTORY_BOX.position - SF.vector2(-2 * max_scale, 50)
            @@cosmetics_category_tab_text.position = @@cosmetics_category_tab.position + SF.vector2(2 * max_scale, 7 * max_scale)

            @@equipment_category_tab.position = INVENTORY_BOX.position - SF.vector2(-70 * max_scale, 50)
            @@equipment_category_tab_text.position = @@equipment_category_tab.position + SF.vector2(0.5 * max_scale, 7 * max_scale)

            @@consumables_category_tab.position = INVENTORY_BOX.position - SF.vector2(-138 * max_scale, 50)
            @@consumables_category_tab_text.position = @@consumables_category_tab.position + SF.vector2(0.5 * max_scale, 7 * max_scale)


            @@shirt_tab.position = INVENTORY_BOX.position - SF.vector2(65 * max_scale, 0)
            @@shirt_tab_text.position = @@shirt_tab.position + SF.vector2(15 * max_scale, 2 * max_scale)

            @@jacket_tab.position = INVENTORY_BOX.position - SF.vector2(65 * max_scale, -(170.5 * max_scale))
            @@jacket_tab_text.position = @@jacket_tab.position + SF.vector2(15 * max_scale, 2 * max_scale)

            @@pants_tab.position = INVENTORY_BOX.position - SF.vector2(65 * max_scale, -(21 * max_scale))
            @@pants_tab_text.position = @@pants_tab.position + SF.vector2(15 * max_scale, 2 * max_scale)

            @@shoes_tab.position = INVENTORY_BOX.position - SF.vector2(65 * max_scale, -(42.5 * max_scale))
            @@shoes_tab_text.position = @@shoes_tab.position + SF.vector2(15 * max_scale, 2 * max_scale)

            @@socks_tab.position = INVENTORY_BOX.position - SF.vector2(65 * max_scale, -(192 * max_scale))
            @@socks_tab_text.position = @@socks_tab.position + SF.vector2(15 * max_scale, 2 * max_scale)

            @@gloves_tab.position = INVENTORY_BOX.position - SF.vector2(65 * max_scale, -(64 * max_scale))
            @@gloves_tab_text.position = @@gloves_tab.position + SF.vector2(13 * max_scale, 2 * max_scale)

            @@earrings_tab.position = INVENTORY_BOX.position - SF.vector2(65 * max_scale, -(85 * max_scale))
            @@earrings_tab_text.position = @@earrings_tab.position + SF.vector2(10 * max_scale, 2 * max_scale)

            @@hat_tab.position = INVENTORY_BOX.position - SF.vector2(65 * max_scale, -(106.5 * max_scale))
            @@hat_tab_text.position = @@hat_tab.position + SF.vector2(20 * max_scale, 2 * max_scale)

            @@glasses_tab.position = INVENTORY_BOX.position - SF.vector2(65 * max_scale, -(128 * max_scale))
            @@glasses_tab_text.position = @@glasses_tab.position + SF.vector2(10 * max_scale, 2 * max_scale)

            @@makeup_tab.position = INVENTORY_BOX.position - SF.vector2(65 * max_scale, -(149 * max_scale))
            @@makeup_tab_text.position = @@makeup_tab.position + SF.vector2(10 * max_scale, 2 * max_scale)

            @@necklace_tab.position = INVENTORY_BOX.position - SF.vector2(65 * max_scale, -(213.5 * max_scale))
            @@necklace_tab_text.position = @@necklace_tab.position + SF.vector2(4 * max_scale, 2 * max_scale)


            @@weapon_tab.position = INVENTORY_BOX.position - SF.vector2(65 * max_scale, 0)
            @@weapon_tab_text.position = @@weapon_tab.position + SF.vector2(5 * max_scale, 7 * max_scale)


            @@clothing_sort_button_sprite.position = INVENTORY_BOX.position + SF.vector2(50 * max_scale, 15 * max_scale)
            @@clothing_shirt_category_box.position = @@clothing_sort_button_sprite.position + SF.vector2(60 * max_scale, 0)
    
            @@clothing_sort_button_text.position = @@clothing_sort_button_sprite.position + SF.vector2(10 * max_scale, 1 * max_scale)
            @@clothing_shirt_category_text.position = @@clothing_shirt_category_box.position + SF.vector2(15 * max_scale, 1 * max_scale)

            @@clothing_jacket_category_text.position = @@clothing_shirt_category_box.position + SF.vector2(15 * max_scale, 1 * max_scale)

            @@clothing_pants_category_text.position = @@clothing_shirt_category_box.position + SF.vector2(15 * max_scale, 1 * max_scale)

            @@clothing_shoes_category_text.position = @@clothing_shirt_category_box.position + SF.vector2(15 * max_scale, 1 * max_scale)

            @@clothing_socks_category_text.position = @@clothing_shirt_category_box.position + SF.vector2(15 * max_scale, 1 * max_scale)

            @@clothing_gloves_category_text.position = @@clothing_shirt_category_box.position + SF.vector2(15 * max_scale, 1 * max_scale)

            @@clothing_earrings_category_text.position = @@clothing_shirt_category_box.position + SF.vector2(15 * max_scale, 1 * max_scale)

            @@clothing_hat_category_text.position = @@clothing_shirt_category_box.position + SF.vector2(15 * max_scale, 1 * max_scale)

            @@clothing_glasses_category_text.position = @@clothing_shirt_category_box.position + SF.vector2(15 * max_scale, 1 * max_scale)

            @@clothing_makeup_category_text.position = @@clothing_shirt_category_box.position + SF.vector2(15 * max_scale, 1 * max_scale)

            @@clothing_necklace_category_text.position = @@clothing_shirt_category_box.position + SF.vector2(15 * max_scale, 1 * max_scale)

            @@equipment_weapon_category_text.position = @@clothing_shirt_category_box.position + SF.vector2(15 * max_scale, 1 * max_scale)

            @@consumables_consumable_category_text.position = @@clothing_shirt_category_box.position + SF.vector2(15 * max_scale, 1 * max_scale)

            window.draw(INVENTORY_BOX)

            window.draw(INVENTORY_LEFT_ARROW_SPRITE)
            window.draw(INVENTORY_RIGHT_ARROW_SPRITE)
            window.draw(@@cosmetics_category_tab)
            window.draw(@@cosmetics_category_tab_text)
            window.draw(@@equipment_category_tab)
            window.draw(@@equipment_category_tab_text)
            window.draw(@@consumables_category_tab)
            window.draw(@@consumables_category_tab_text)
            if @@category == "Cosmetics"
            window.draw(@@shirt_tab)
            window.draw(@@shirt_tab_text)
            window.draw(@@jacket_tab)
            window.draw(@@jacket_tab_text)
            window.draw(@@pants_tab)
            window.draw(@@pants_tab_text)
            window.draw(@@shoes_tab)
            window.draw(@@shoes_tab_text)
            window.draw(@@socks_tab)
            window.draw(@@socks_tab_text)
            window.draw(@@gloves_tab)
            window.draw(@@gloves_tab_text)
            window.draw(@@earrings_tab)
            window.draw(@@earrings_tab_text)
            window.draw(@@hat_tab)
            window.draw(@@hat_tab_text)
            window.draw(@@glasses_tab)
            window.draw(@@glasses_tab_text)
            window.draw(@@makeup_tab)
            window.draw(@@makeup_tab_text)
            window.draw(@@necklace_tab)
            window.draw(@@necklace_tab_text)
            end
            if @@category == "Equipment"
            window.draw(@@weapon_tab)
            window.draw(@@weapon_tab_text)
            end

            window.draw(@@clothing_sort_button_sprite)
            window.draw(@@clothing_shirt_category_box)
            window.draw(@@clothing_sort_button_text)
            
                case @@tab
                when  "Shirt"
                 window.draw(@@clothing_shirt_category_text)
                when  "Jacket"
                 window.draw(@@clothing_jacket_category_text)
                when  "Pants"
                 window.draw(@@clothing_pants_category_text)
                when  "Shoes"
                 window.draw(@@clothing_shoes_category_text)
                when  "Socks"
                 window.draw(@@clothing_socks_category_text)
                when  "Gloves"
                 window.draw(@@clothing_gloves_category_text)
                when  "Earrings"
                 window.draw(@@clothing_earrings_category_text)
                when  "Hat"
                 window.draw(@@clothing_hat_category_text)
                when  "Glasses"
                 window.draw(@@clothing_glasses_category_text)
                when  "Makeup"
                 window.draw(@@clothing_makeup_category_text)
                when  "Necklace"
                 window.draw(@@clothing_necklace_category_text)
                when  "Weapon"
                 window.draw(@@equipment_weapon_category_text)
                when  "Consumable"
                 window.draw(@@consumables_consumable_category_text)
                end
        end

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

        def InventoryManager.open_jacket_tab(window)
            InventoryManager.reset_clothing_pages(window)
            @@tab = "Jacket"
            ClothingTabJacket.assign_slot_textures(window)
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

        def InventoryManager.open_hat_tab(window)
            InventoryManager.reset_clothing_pages(window)
            @@tab = "Hat"
            ClothingTabHat.assign_slot_textures(window)
        end

        def InventoryManager.open_glasses_tab(window)
            InventoryManager.reset_clothing_pages(window)
            @@tab = "Glasses"
            ClothingTabGlasses.assign_slot_textures(window)
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

            if (mouse_x >= sort_button_x && mouse_x <= sort_button_x + sort_button_width) &&
                (mouse_y >= sort_button_y && mouse_y <= sort_button_y + sort_button_height)
                if ClothingTabShirt.get_shirt_category == "Color"
                 Utility::ArrayUtilities.organise_array_by_color(window, ClothingTabShirt.owned_shirt_array, ClothingTabShirt)
                elsif "Length"
                 Utility::ArrayUtilities.organise_array_by_length_short_to_long(window, ClothingTabShirt.owned_shirt_array, ClothingTabShirt)
                end
                 sleep 0.15.seconds
            end        
     
            if (mouse_x >= category_button_x && mouse_x <= category_button_x + category_button_width) &&
                (mouse_y >= category_button_y && mouse_y <= category_button_y + category_button_height)
                
                 ClothingTabShirt.change_shirt_sort_category
                 @@clothing_shirt_category_text.string = ClothingTabShirt.get_shirt_category
                 Utility::StringUtilities.center_text(@@clothing_shirt_category_text)
                 sleep 0.15.seconds
            end
        end

        def InventoryManager.jacket_tab_mouse_handling(window)
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
                
                 if ClothingTabJacket.page.not_nil! > 1
                    ClothingTabJacket.page=(ClothingTabJacket.page.not_nil! - 1)
                 end
                 ClothingTabJacket.assign_slot_textures(window)
                 sleep 0.15.seconds
            end
             
            if (mouse_x >= arrow_right_x && mouse_x <= arrow_right_x + arrow_right_width) &&
                (mouse_y >= arrow_right_y && mouse_y <= arrow_right_y + arrow_right_height)
                
                 if ClothingTabJacket.page.not_nil! <= 5
                    ClothingTabJacket.page=(ClothingTabJacket.page.not_nil! + 1)
                 end
                 ClothingTabJacket.assign_slot_textures(window)
                 sleep 0.15.seconds
            end  

            if (mouse_x >= sort_button_x && mouse_x <= sort_button_x + sort_button_width) &&
                (mouse_y >= sort_button_y && mouse_y <= sort_button_y + sort_button_height)
                if ClothingTabJacket.get_jacket_category == "Color"
                 Utility::ArrayUtilities.organise_array_by_color(window, ClothingTabJacket.owned_jacket_array, ClothingTabJacket)
                elsif "Length"
                 Utility::ArrayUtilities.organise_array_by_length_short_to_long(window, ClothingTabJacket.owned_jacket_array, ClothingTabJacket)
                end
                 sleep 0.15.seconds
            end        
     
            if (mouse_x >= category_button_x && mouse_x <= category_button_x + category_button_width) &&
                (mouse_y >= category_button_y && mouse_y <= category_button_y + category_button_height)
                puts "jacket"
                 ClothingTabJacket.change_jacket_sort_category
                 @@clothing_jacket_category_text.string = ClothingTabJacket.get_jacket_category
                 Utility::StringUtilities.center_text(@@clothing_jacket_category_text)
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
            
            if (mouse_x >= sort_button_x && mouse_x <= sort_button_x + sort_button_width) &&
                (mouse_y >= sort_button_y && mouse_y <= sort_button_y + sort_button_height)
                if ClothingTabPants.get_pants_category == "Color"
                 Utility::ArrayUtilities.organise_array_by_color(window, ClothingTabPants.owned_pants_array, ClothingTabPants)
                elsif "Length"
                 Utility::ArrayUtilities.organise_array_by_length_short_to_long(window, ClothingTabPants.owned_pants_array, ClothingTabPants)
                end
                 sleep 0.15.seconds
            end        
     
            if (mouse_x >= category_button_x && mouse_x <= category_button_x + category_button_width) &&
                (mouse_y >= category_button_y && mouse_y <= category_button_y + category_button_height)
                 ClothingTabPants.change_pants_sort_category
                 @@clothing_pants_category_text.string = ClothingTabPants.get_pants_category
                 Utility::StringUtilities.center_text(@@clothing_pants_category_text)
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
            
            if (mouse_x >= sort_button_x && mouse_x <= sort_button_x + sort_button_width) &&
                (mouse_y >= sort_button_y && mouse_y <= sort_button_y + sort_button_height)
                if ClothingTabShoes.get_shoes_category == "Color"
                 Utility::ArrayUtilities.organise_array_by_color(window, ClothingTabShoes.owned_shoes_array, ClothingTabShoes)
                elsif "Length"
                 Utility::ArrayUtilities.organise_array_by_length_short_to_long(window, ClothingTabShoes.owned_shoes_array, ClothingTabShoes)
                end
                 sleep 0.15.seconds
            end        
     
            if (mouse_x >= category_button_x && mouse_x <= category_button_x + category_button_width) &&
                (mouse_y >= category_button_y && mouse_y <= category_button_y + category_button_height)
                 ClothingTabShoes.change_shoes_sort_category
                 @@clothing_shoes_category_text.string = ClothingTabShoes.get_shoes_category
                 Utility::StringUtilities.center_text(@@clothing_shoes_category_text)
                 sleep 0.15.seconds
            end  
        end

        def InventoryManager.socks_tab_mouse_handling(window)
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
                
                 if ClothingTabSocks.page.not_nil! > 1
                    ClothingTabSocks.page=(ClothingTabSocks.page.not_nil! - 1)
                 end
                 ClothingTabSocks.assign_slot_textures(window)
                 sleep 0.15.seconds
            end
             
            if (mouse_x >= arrow_right_x && mouse_x <= arrow_right_x + arrow_right_width) &&
                (mouse_y >= arrow_right_y && mouse_y <= arrow_right_y + arrow_right_height)
                
                 if ClothingTabSocks.page.not_nil! <= 5
                    ClothingTabSocks.page=(ClothingTabSocks.page.not_nil! + 1)
                 end
                 ClothingTabSocks.assign_slot_textures(window)
                 sleep 0.15.seconds
            end  
            
            if (mouse_x >= sort_button_x && mouse_x <= sort_button_x + sort_button_width) &&
                (mouse_y >= sort_button_y && mouse_y <= sort_button_y + sort_button_height)
                if ClothingTabSocks.get_socks_category == "Color"
                 Utility::ArrayUtilities.organise_array_by_color(window, ClothingTabSocks.owned_socks_array, ClothingTabSocks)
                elsif "Length"
                 Utility::ArrayUtilities.organise_array_by_length_short_to_long(window, ClothingTabSocks.owned_socks_array, ClothingTabSocks)
                end
                 sleep 0.15.seconds
            end        
     
            if (mouse_x >= category_button_x && mouse_x <= category_button_x + category_button_width) &&
                (mouse_y >= category_button_y && mouse_y <= category_button_y + category_button_height)
                 ClothingTabSocks.change_socks_sort_category
                 @@clothing_socks_category_text.string = ClothingTabSocks.get_socks_category
                 Utility::StringUtilities.center_text(@@clothing_socks_category_text)
                 sleep 0.15.seconds
            end  
        end

        def InventoryManager.gloves_tab_mouse_handling(window)
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
                
                 if ClothingTabGloves.page.not_nil! > 1
                    ClothingTabGloves.page=(ClothingTabGloves.page.not_nil! - 1)
                 end
                 ClothingTabGloves.assign_slot_textures(window)
                 sleep 0.15.seconds
            end
             
            if (mouse_x >= arrow_right_x && mouse_x <= arrow_right_x + arrow_right_width) &&
                (mouse_y >= arrow_right_y && mouse_y <= arrow_right_y + arrow_right_height)
                
                 if ClothingTabGloves.page.not_nil! <= 5
                    ClothingTabGloves.page=(ClothingTabGloves.page.not_nil! + 1)
                 end
                 ClothingTabGloves.assign_slot_textures(window)
                 sleep 0.15.seconds
            end  

            if (mouse_x >= sort_button_x && mouse_x <= sort_button_x + sort_button_width) &&
                (mouse_y >= sort_button_y && mouse_y <= sort_button_y + sort_button_height)
                if ClothingTabGloves.get_gloves_category == "Color"
                 Utility::ArrayUtilities.organise_array_by_color(window, ClothingTabGloves.owned_gloves_array, ClothingTabGloves)
                elsif "Length"
                 Utility::ArrayUtilities.organise_array_by_length_short_to_long(window, ClothingTabGloves.owned_gloves_array, ClothingTabGloves)
                end
                 sleep 0.15.seconds
             end        
     
             if (mouse_x >= category_button_x && mouse_x <= category_button_x + category_button_width) &&
                (mouse_y >= category_button_y && mouse_y <= category_button_y + category_button_height)
                 ClothingTabGloves.change_gloves_sort_category
                 @@clothing_gloves_category_text.string = ClothingTabGloves.get_gloves_category
                 Utility::StringUtilities.center_text(@@clothing_gloves_category_text)
                 sleep 0.15.seconds
             end  
        end

        def InventoryManager.earrings_tab_mouse_handling(window)
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
                
                 if ClothingTabEarrings.page.not_nil! > 1
                    ClothingTabEarrings.page=(ClothingTabEarrings.page.not_nil! - 1)
                 end
                 ClothingTabEarrings.assign_slot_textures(window)
                 sleep 0.15.seconds
            end
             
            if (mouse_x >= arrow_right_x && mouse_x <= arrow_right_x + arrow_right_width) &&
                (mouse_y >= arrow_right_y && mouse_y <= arrow_right_y + arrow_right_height)
                
                 if ClothingTabEarrings.page.not_nil! <= 5
                    ClothingTabEarrings.page=(ClothingTabEarrings.page.not_nil! + 1)
                 end
                 ClothingTabEarrings.assign_slot_textures(window)
                 sleep 0.15.seconds
            end  
            
            if (mouse_x >= sort_button_x && mouse_x <= sort_button_x + sort_button_width) &&
                (mouse_y >= sort_button_y && mouse_y <= sort_button_y + sort_button_height)
                if ClothingTabEarrings.get_earrings_category == "Color"
                 Utility::ArrayUtilities.organise_array_by_color(window, ClothingTabEarrings.owned_earrings_array, ClothingTabEarrings)
                elsif "Length"
                 Utility::ArrayUtilities.organise_array_by_length_short_to_long(window, ClothingTabEarrings.owned_earrings_array, ClothingTabEarrings)
                end
                 sleep 0.15.seconds
             end        
     
             if (mouse_x >= category_button_x && mouse_x <= category_button_x + category_button_width) &&
                (mouse_y >= category_button_y && mouse_y <= category_button_y + category_button_height)
                 ClothingTabEarrings.change_earrings_sort_category
                 @@clothing_earrings_category_text.string = ClothingTabEarrings.get_earrings_category
                 Utility::StringUtilities.center_text(@@clothing_earrings_category_text)
                 sleep 0.15.seconds
             end  
        end

        def InventoryManager.hat_tab_mouse_handling(window)
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
                
                 if ClothingTabHat.page.not_nil! > 1
                    ClothingTabHat.page=(ClothingTabHat.page.not_nil! - 1)
                 end
                 ClothingTabHat.assign_slot_textures(window)
                 sleep 0.15.seconds
            end
             
            if (mouse_x >= arrow_right_x && mouse_x <= arrow_right_x + arrow_right_width) &&
                (mouse_y >= arrow_right_y && mouse_y <= arrow_right_y + arrow_right_height)
                
                 if ClothingTabHat.page.not_nil! <= 5
                    ClothingTabHat.page=(ClothingTabHat.page.not_nil! + 1)
                 end
                 ClothingTabHat.assign_slot_textures(window)
                 sleep 0.15.seconds
            end  
            
            if (mouse_x >= sort_button_x && mouse_x <= sort_button_x + sort_button_width) &&
                (mouse_y >= sort_button_y && mouse_y <= sort_button_y + sort_button_height)
                if ClothingTabHat.get_hat_category == "Color"
                 Utility::ArrayUtilities.organise_array_by_color(window, ClothingTabHat.owned_hat_array, ClothingTabHat)
                elsif "Length"
                 ClothingTabHat.organise_owned_hat_array_by_type(window)
                end
                 sleep 0.15.seconds
             end        
     
             if (mouse_x >= category_button_x && mouse_x <= category_button_x + category_button_width) &&
                (mouse_y >= category_button_y && mouse_y <= category_button_y + category_button_height)
                 ClothingTabHat.change_hat_sort_category
                 @@clothing_hat_category_text.string = ClothingTabHat.get_hat_category
                 Utility::StringUtilities.center_text(@@clothing_hat_category_text)
                 sleep 0.15.seconds
             end  
        end

        def InventoryManager.glasses_tab_mouse_handling(window)
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
                if ClothingTabGlasses.page == nil
                    ClothingTabGlasses.page = 1
                end
                 if ClothingTabGlasses.page.not_nil! > 1
                    ClothingTabGlasses.page=(ClothingTabGlasses.page.not_nil! - 1)
                 end
                 ClothingTabGlasses.assign_slot_textures(window)
                 sleep 0.15.seconds
            end
             
            if (mouse_x >= arrow_right_x && mouse_x <= arrow_right_x + arrow_right_width) &&
                (mouse_y >= arrow_right_y && mouse_y <= arrow_right_y + arrow_right_height)
                 if ClothingTabGlasses.page == nil
                    ClothingTabGlasses.page = 1
                 end
                 if ClothingTabGlasses.page.not_nil! <= 5
                    ClothingTabGlasses.page=(ClothingTabGlasses.page.not_nil! + 1)
                 end
                 ClothingTabGlasses.assign_slot_textures(window)
                 sleep 0.15.seconds
            end  
            
            if (mouse_x >= sort_button_x && mouse_x <= sort_button_x + sort_button_width) &&
                (mouse_y >= sort_button_y && mouse_y <= sort_button_y + sort_button_height)
                if ClothingTabGlasses.get_glasses_category == "Color"
                 Utility::ArrayUtilities.organise_array_by_color(window, ClothingTabGlasses.owned_glasses_array, ClothingTabGlasses)
                elsif "Type"
                 ClothingTabGlasses.organise_owned_glasses_array_by_type(window)
                end
                 sleep 0.15.seconds
             end        
     
             if (mouse_x >= category_button_x && mouse_x <= category_button_x + category_button_width) &&
                (mouse_y >= category_button_y && mouse_y <= category_button_y + category_button_height)
                 ClothingTabGlasses.change_glasses_sort_category
                 @@clothing_glasses_category_text.string = ClothingTabGlasses.get_glasses_category
                 Utility::StringUtilities.center_text(@@clothing_glasses_category_text)
                 sleep 0.15.seconds
             end  
        end

        def InventoryManager.makeup_tab_mouse_handling(window)
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
                if ClothingTabMakeup.page == nil
                    ClothingTabMakeup.page = 1
                end
                 if ClothingTabMakeup.page.not_nil! > 1
                    ClothingTabMakeup.page=(ClothingTabMakeup.page.not_nil! - 1)
                 end
                 ClothingTabMakeup.assign_slot_textures(window)
                 sleep 0.15.seconds
            end
             
            if (mouse_x >= arrow_right_x && mouse_x <= arrow_right_x + arrow_right_width) &&
                (mouse_y >= arrow_right_y && mouse_y <= arrow_right_y + arrow_right_height)
                 if ClothingTabMakeup.page == nil
                    ClothingTabMakeup.page = 1
                 end
                 if ClothingTabMakeup.page.not_nil! <= 5
                    ClothingTabMakeup.page=(ClothingTabMakeup.page.not_nil! + 1)
                 end
                 ClothingTabMakeup.assign_slot_textures(window)
                 sleep 0.15.seconds
            end  
    
            if (mouse_x >= sort_button_x && mouse_x <= sort_button_x + sort_button_width) &&
                (mouse_y >= sort_button_y && mouse_y <= sort_button_y + sort_button_height)
                if ClothingTabMakeup.get_makeup_category == "Color"
                 Utility::ArrayUtilities.organise_array_by_color(window, ClothingTabMakeup.owned_makeup_array, ClothingTabMakeup)
                elsif "Type"
                 ClothingTabMakeup.organise_owned_makeup_array_by_type(window)
                end
                 sleep 0.15.seconds
             end        
     
             if (mouse_x >= category_button_x && mouse_x <= category_button_x + category_button_width) &&
                (mouse_y >= category_button_y && mouse_y <= category_button_y + category_button_height)
                 ClothingTabMakeup.change_makeup_sort_category
                 @@clothing_makeup_category_text.string = ClothingTabMakeup.get_makeup_category
                 Utility::StringUtilities.center_text(@@clothing_makeup_category_text)
                 sleep 0.15.seconds
             end  
        end

        def InventoryManager.necklace_tab_mouse_handling(window)
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
                if ClothingTabNecklace.page == nil
                    ClothingTabNecklace.page = 1
                end
                 if ClothingTabNecklace.page.not_nil! > 1
                    ClothingTabNecklace.page=(ClothingTabNecklace.page.not_nil! - 1)
                 end
                 ClothingTabNecklace.assign_slot_textures(window)
                 sleep 0.15.seconds
            end
             
            if (mouse_x >= arrow_right_x && mouse_x <= arrow_right_x + arrow_right_width) &&
                (mouse_y >= arrow_right_y && mouse_y <= arrow_right_y + arrow_right_height)
                 if ClothingTabNecklace.page == nil
                    ClothingTabNecklace.page = 1
                 end
                 if ClothingTabNecklace.page.not_nil! <= 5
                    ClothingTabNecklace.page=(ClothingTabNecklace.page.not_nil! + 1)
                 end
                 ClothingTabNecklace.assign_slot_textures(window)
                 sleep 0.15.seconds
            end  
            
            if (mouse_x >= sort_button_x && mouse_x <= sort_button_x + sort_button_width) &&
                (mouse_y >= sort_button_y && mouse_y <= sort_button_y + sort_button_height)
                if ClothingTabNecklace.get_necklace_category == "Color"
                 Utility::ArrayUtilities.organise_array_by_color(window, ClothingTabNecklace.owned_necklace_array, ClothingTabNecklace)
                elsif "Type"
                 ClothingTabNecklace.organise_owned_necklace_array_by_type(window)
                end
                 sleep 0.15.seconds
            end        
     
            if (mouse_x >= category_button_x && mouse_x <= category_button_x + category_button_width) &&
                (mouse_y >= category_button_y && mouse_y <= category_button_y + category_button_height)
                 ClothingTabNecklace.change_necklace_sort_category
                 @@clothing_necklace_category_text.string = ClothingTabNecklace.get_necklace_category
                 Utility::StringUtilities.center_text(@@clothing_necklace_category_text)
                 sleep 0.15.seconds
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

        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("White T-Shirt").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Black T-Shirt").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Red T-Shirt").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Orange T-Shirt").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Yellow T-Shirt").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Green T-Shirt").not_nil!)
        @@owned_shirt_array.push(Clothing::Shirt.get_shirt("Blue T-Shirt").not_nil!)
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

       def ClothingTabShirt.initialize_clothing_tab(window)
        @@page = 1
        INVENTORY_BOX.position = SF.vector2(20, 40)  
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

        @@shirt_slot_01_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 40 * max_scale)
        @@shirt_slot_01_sprite.scale = SF.vector2(1, 1)
        
        @@shirt_slot_01_image_sprite.position = @@shirt_slot_01_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_01_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_01_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 

        @@shirt_slot_01_text.position = @@shirt_slot_01_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shirt_slot_01_text)
        

        @@shirt_slot_02_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 40 * max_scale)
        @@shirt_slot_02_sprite.scale = SF.vector2(1, 1)
        
        @@shirt_slot_02_image_sprite.position = @@shirt_slot_02_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_02_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_02_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 

        @@shirt_slot_02_text.position = @@shirt_slot_02_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shirt_slot_02_text)
        

        @@shirt_slot_03_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 40 * max_scale)
        @@shirt_slot_03_sprite.scale = SF.vector2(1, 1)
        
        @@shirt_slot_03_image_sprite.position = @@shirt_slot_03_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_03_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_03_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 

        @@shirt_slot_03_text.position = @@shirt_slot_03_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shirt_slot_03_text)
        

        @@shirt_slot_04_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 40 * max_scale)
        @@shirt_slot_04_sprite.scale = SF.vector2(1, 1)

        @@shirt_slot_04_text.position = @@shirt_slot_04_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shirt_slot_04_text)
        
        @@shirt_slot_04_image_sprite.position = @@shirt_slot_04_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_04_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_04_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 


        @@shirt_slot_05_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 40 * max_scale)
        @@shirt_slot_05_sprite.scale = SF.vector2(1, 1)

        @@shirt_slot_05_text.position = @@shirt_slot_05_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shirt_slot_05_text)
        
        @@shirt_slot_05_image_sprite.position = @@shirt_slot_05_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_05_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_05_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@shirt_slot_06_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 120 * max_scale)
        @@shirt_slot_06_sprite.scale = SF.vector2(1, 1)

        @@shirt_slot_06_text.position = @@shirt_slot_06_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shirt_slot_06_text)
        
        @@shirt_slot_06_image_sprite.position = @@shirt_slot_06_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_06_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_06_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@shirt_slot_07_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 120 * max_scale)
        @@shirt_slot_07_sprite.scale = SF.vector2(1, 1)
        
        @@shirt_slot_07_text.position = @@shirt_slot_07_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shirt_slot_07_text)
        
        @@shirt_slot_07_image_sprite.position = @@shirt_slot_07_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_07_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_07_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@shirt_slot_08_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 120 * max_scale)
        @@shirt_slot_08_sprite.scale = SF.vector2(1, 1)
                
        @@shirt_slot_08_text.position = @@shirt_slot_08_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shirt_slot_08_text)
        
        @@shirt_slot_08_image_sprite.position = @@shirt_slot_08_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_08_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_08_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@shirt_slot_09_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 120 * max_scale)
        @@shirt_slot_09_sprite.scale = SF.vector2(1, 1)
                
        @@shirt_slot_09_text.position = @@shirt_slot_09_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shirt_slot_09_text)
        
        @@shirt_slot_09_image_sprite.position = @@shirt_slot_09_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_09_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_09_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@shirt_slot_10_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 120 * max_scale)
        @@shirt_slot_10_sprite.scale = SF.vector2(1, 1)
                        
        @@shirt_slot_10_text.position = @@shirt_slot_10_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shirt_slot_10_text)
        
        @@shirt_slot_10_image_sprite.position = @@shirt_slot_10_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_10_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_10_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@shirt_slot_11_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 200 * max_scale)
        @@shirt_slot_11_sprite.scale = SF.vector2(1, 1)
                        
        @@shirt_slot_11_text.position = @@shirt_slot_11_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shirt_slot_11_text)
        
        @@shirt_slot_11_image_sprite.position = @@shirt_slot_11_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_11_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_11_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@shirt_slot_12_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 200 * max_scale)
        @@shirt_slot_12_sprite.scale = SF.vector2(1, 1)
                        
        @@shirt_slot_12_text.position = @@shirt_slot_12_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shirt_slot_12_text)
        
        @@shirt_slot_12_image_sprite.position = @@shirt_slot_12_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_12_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_12_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@shirt_slot_13_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 200 * max_scale)
        @@shirt_slot_13_sprite.scale = SF.vector2(1, 1)
        
        @@shirt_slot_13_text.position = @@shirt_slot_13_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shirt_slot_13_text)
        
        @@shirt_slot_13_image_sprite.position = @@shirt_slot_13_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_13_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_13_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@shirt_slot_14_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 200 * max_scale)
        @@shirt_slot_14_sprite.scale = SF.vector2(1, 1)
                        
        @@shirt_slot_14_text.position = @@shirt_slot_14_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shirt_slot_14_text)
        
        @@shirt_slot_14_image_sprite.position = @@shirt_slot_14_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@shirt_slot_14_image_sprite.scale = SF.vector2(2, 2)
        @@shirt_slot_14_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@shirt_slot_15_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 200 * max_scale)
        @@shirt_slot_15_sprite.scale = SF.vector2(1, 1)
                        
        @@shirt_slot_15_text.position = @@shirt_slot_15_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shirt_slot_15_text)
        
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
                t = ((@@page || 1) * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(
                Player::Appearance.get_clothing("shirt").try(&.to_s) || Clothing::Shirt.get_shirt("No Shirt").not_nil!)).not_nil!
                Player::Appearance.change_shirt(@@shirt_slot_01.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shirt_array.uniq!
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_02_x && mouse_x <= slot_02_x + slot_02_width) &&
           (mouse_y >= slot_02_y && mouse_y <= slot_02_y + slot_02_height)
           
            if @@shirt_slot_02 != nil
                t = 1 + ((@@page || 1) * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(
                Player::Appearance.get_clothing("shirt").try(&.to_s) || Clothing::Shirt.get_shirt("No Shirt").not_nil!)).not_nil!
                Player::Appearance.change_shirt(@@shirt_slot_02.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shirt_array.uniq!
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_03_x && mouse_x <= slot_03_x + slot_03_width) &&
           (mouse_y >= slot_03_y && mouse_y <= slot_03_y + slot_03_height)
           
            if @@shirt_slot_03 != nil
                t = 2 + ((@@page || 1) * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(
                    Player::Appearance.get_clothing("shirt").try(&.to_s) || Clothing::Shirt.get_shirt("No Shirt").not_nil!)).not_nil!
                Player::Appearance.change_shirt(@@shirt_slot_03.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shirt_array.uniq!
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_04_x && mouse_x <= slot_04_x + slot_04_width) &&
           (mouse_y >= slot_04_y && mouse_y <= slot_04_y + slot_04_height)
           
            if @@shirt_slot_04 != nil
                t = 3 + ((@@page || 1) * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(
                    Player::Appearance.get_clothing("shirt").try(&.to_s) || Clothing::Shirt.get_shirt("No Shirt").not_nil!)).not_nil!
                Player::Appearance.change_shirt(@@shirt_slot_04.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shirt_array.uniq!
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_05_x && mouse_x <= slot_05_x + slot_05_width) &&
           (mouse_y >= slot_05_y && mouse_y <= slot_05_y + slot_05_height)
           
            if @@shirt_slot_05 != nil
                t = 4 + ((@@page || 1) * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(
                    Player::Appearance.get_clothing("shirt").try(&.to_s) || Clothing::Shirt.get_shirt("No Shirt").not_nil!)).not_nil!
                Player::Appearance.change_shirt(@@shirt_slot_05.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shirt_array.uniq!
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_06_x && mouse_x <= slot_06_x + slot_06_width) &&
           (mouse_y >= slot_06_y && mouse_y <= slot_06_y + slot_06_height)
           
            if @@shirt_slot_06 != nil
                t = 5 + ((@@page || 1) * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(
                    Player::Appearance.get_clothing("shirt").try(&.to_s) || Clothing::Shirt.get_shirt("No Shirt").not_nil!)).not_nil!
                Player::Appearance.change_shirt(@@shirt_slot_06.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shirt_array.uniq!
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_07_x && mouse_x <= slot_07_x + slot_07_width) &&
           (mouse_y >= slot_07_y && mouse_y <= slot_07_y + slot_07_height)
           
            if @@shirt_slot_07 != nil
                t = 6 + ((@@page || 1) * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(
                    Player::Appearance.get_clothing("shirt").try(&.to_s) || Clothing::Shirt.get_shirt("No Shirt").not_nil!)).not_nil!
                Player::Appearance.change_shirt(@@shirt_slot_07.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shirt_array.uniq!
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_08_x && mouse_x <= slot_08_x + slot_08_width) &&
           (mouse_y >= slot_08_y && mouse_y <= slot_08_y + slot_08_height)
           
            if @@shirt_slot_08 != nil
                t = 7 + ((@@page || 1) * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(
                    Player::Appearance.get_clothing("shirt").try(&.to_s) || Clothing::Shirt.get_shirt("No Shirt").not_nil!)).not_nil!
                Player::Appearance.change_shirt(@@shirt_slot_08.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shirt_array.uniq!
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_09_x && mouse_x <= slot_09_x + slot_09_width) &&
           (mouse_y >= slot_09_y && mouse_y <= slot_09_y + slot_09_height)
           
            if @@shirt_slot_09 != nil
                t = 8 + ((@@page || 1) * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(
                    Player::Appearance.get_clothing("shirt").try(&.to_s) || Clothing::Shirt.get_shirt("No Shirt").not_nil!)).not_nil!
                Player::Appearance.change_shirt(@@shirt_slot_09.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shirt_array.uniq!
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_10_x && mouse_x <= slot_10_x + slot_10_width) &&
           (mouse_y >= slot_10_y && mouse_y <= slot_10_y + slot_10_height)
           
            if @@shirt_slot_10 != nil
                t = 9 + ((@@page || 1) * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(
                    Player::Appearance.get_clothing("shirt").try(&.to_s) || Clothing::Shirt.get_shirt("No Shirt").not_nil!)).not_nil!
                Player::Appearance.change_shirt(@@shirt_slot_10.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shirt_array.uniq!
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_11_x && mouse_x <= slot_11_x + slot_11_width) &&
           (mouse_y >= slot_11_y && mouse_y <= slot_11_y + slot_11_height)
           
            if @@shirt_slot_11 != nil
                t = 10 + ((@@page || 1) * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(
                    Player::Appearance.get_clothing("shirt").try(&.to_s) || Clothing::Shirt.get_shirt("No Shirt").not_nil!)).not_nil!
                Player::Appearance.change_shirt(@@shirt_slot_11.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shirt_array.uniq!
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_12_x && mouse_x <= slot_12_x + slot_12_width) &&
           (mouse_y >= slot_12_y && mouse_y <= slot_12_y + slot_12_height)
           
            if @@shirt_slot_12 != nil
                t = 11 + ((@@page || 1) * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(
                    Player::Appearance.get_clothing("shirt").try(&.to_s) || Clothing::Shirt.get_shirt("No Shirt").not_nil!)).not_nil!
                Player::Appearance.change_shirt(@@shirt_slot_12.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shirt_array.uniq!
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_13_x && mouse_x <= slot_13_x + slot_13_width) &&
           (mouse_y >= slot_13_y && mouse_y <= slot_13_y + slot_13_height)
           
            if @@shirt_slot_13 != nil
                t = 12 + ((@@page || 1) * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(
                    Player::Appearance.get_clothing("shirt").try(&.to_s) || Clothing::Shirt.get_shirt("No Shirt").not_nil!)).not_nil!
                Player::Appearance.change_shirt(@@shirt_slot_13.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shirt_array.uniq!
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_14_x && mouse_x <= slot_14_x + slot_14_width) &&
           (mouse_y >= slot_14_y && mouse_y <= slot_14_y + slot_14_height)
           
            if @@shirt_slot_14 != nil
                t = 13 + ((@@page || 1) * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(
                    Player::Appearance.get_clothing("shirt").try(&.to_s) || Clothing::Shirt.get_shirt("No Shirt").not_nil!)).not_nil!
                Player::Appearance.change_shirt(@@shirt_slot_14.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shirt_array.uniq!
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_15_x && mouse_x <= slot_15_x + slot_15_width) &&
           (mouse_y >= slot_15_y && mouse_y <= slot_15_y + slot_15_height)
           
            if @@shirt_slot_15 != nil
                t = 14 + ((@@page || 1) * 15) - 15
                
                @@owned_shirt_array[t] = (Clothing::Shirt.get_shirt(
                Player::Appearance.get_clothing("shirt").try(&.to_s) || Clothing::Shirt.get_shirt("No Shirt").not_nil!)).not_nil!
                Player::Appearance.change_shirt(@@shirt_slot_15.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shirt_array.uniq!
            end
            ClothingTabShirt.assign_slot_textures(window)
            sleep 0.15.seconds
        end

       end
    end

    class ClothingTabJacket 

        @@owned_jacket_array = [] of Clothing::Jacket

        @@jacket_sorting_category = "Length"

        @@jacket_slot_01 : Clothing::Jacket? = nil
        @@jacket_slot_02 : Clothing::Jacket? = nil
        @@jacket_slot_03 : Clothing::Jacket? = nil
        @@jacket_slot_04 : Clothing::Jacket? = nil
        @@jacket_slot_05 : Clothing::Jacket? = nil
        @@jacket_slot_06 : Clothing::Jacket? = nil
        @@jacket_slot_07 : Clothing::Jacket? = nil
        @@jacket_slot_08 : Clothing::Jacket? = nil
        @@jacket_slot_09 : Clothing::Jacket? = nil
        @@jacket_slot_10 : Clothing::Jacket? = nil
        @@jacket_slot_11 : Clothing::Jacket? = nil
        @@jacket_slot_12 : Clothing::Jacket? = nil
        @@jacket_slot_13 : Clothing::Jacket? = nil
        @@jacket_slot_14 : Clothing::Jacket? = nil
        @@jacket_slot_15 : Clothing::Jacket? = nil

      #---------------------------------debug-------------------------------------------
        @@owned_jacket_array.push(Clothing::Jacket.get_jacket("No Jacket").not_nil!)

        @@owned_jacket_array.push(Clothing::Jacket.get_jacket("W/Light Jacket").not_nil!)
        @@owned_jacket_array.push(Clothing::Jacket.get_jacket("Gy/Light Jacket").not_nil!)
        @@owned_jacket_array.push(Clothing::Jacket.get_jacket("Bk/Light Jacket").not_nil!)
        @@owned_jacket_array.push(Clothing::Jacket.get_jacket("Br/Light Jacket").not_nil!)
        @@owned_jacket_array.push(Clothing::Jacket.get_jacket("R/Light Jacket").not_nil!)
        @@owned_jacket_array.push(Clothing::Jacket.get_jacket("O/Light Jacket").not_nil!)
        @@owned_jacket_array.push(Clothing::Jacket.get_jacket("Y/Light Jacket").not_nil!)
        @@owned_jacket_array.push(Clothing::Jacket.get_jacket("Gn/Light Jacket").not_nil!)
        @@owned_jacket_array.push(Clothing::Jacket.get_jacket("Bl/Light Jacket").not_nil!)
        @@owned_jacket_array.push(Clothing::Jacket.get_jacket("Pr/Light Jacket").not_nil!)
        @@owned_jacket_array.push(Clothing::Jacket.get_jacket("Pk/Light Jacket").not_nil!)

        @@owned_jacket_array.push(Clothing::Jacket.get_jacket("W/Backpack").not_nil!)
        @@owned_jacket_array.push(Clothing::Jacket.get_jacket("Gy/Backpack").not_nil!)
        @@owned_jacket_array.push(Clothing::Jacket.get_jacket("Bk/Backpack").not_nil!)
        @@owned_jacket_array.push(Clothing::Jacket.get_jacket("Br/Backpack").not_nil!)
        @@owned_jacket_array.push(Clothing::Jacket.get_jacket("R/Backpack").not_nil!)
        @@owned_jacket_array.push(Clothing::Jacket.get_jacket("O/Backpack").not_nil!)
        @@owned_jacket_array.push(Clothing::Jacket.get_jacket("Y/Backpack").not_nil!)
        @@owned_jacket_array.push(Clothing::Jacket.get_jacket("Gn/Backpack").not_nil!)
        @@owned_jacket_array.push(Clothing::Jacket.get_jacket("Pr/Backpack").not_nil!)
        @@owned_jacket_array.push(Clothing::Jacket.get_jacket("Pk/Backpack").not_nil!)
      #---------------------------------------------------------------------------------
        
      #--------------------------------objects------------------------------------------

        @@clothing_right_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_right_arrow_sprite.fill_color = SF.color(161, 183, 208)


        @@jacket_slot_01_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@jacket_slot_01_sprite.fill_color = SF.color(161, 183, 208)

        @@jacket_slot_01_text = SF::Text.new
        @@jacket_slot_01_text.font = QUICKSAND
        @@jacket_slot_01_text.character_size = 12
        @@jacket_slot_01_text.color = SF::Color::Blue

        @@jacket_slot_01_image_sprite = SF::Sprite.new


        @@jacket_slot_02_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@jacket_slot_02_sprite.fill_color = SF.color(161, 183, 208)

        @@jacket_slot_02_text = SF::Text.new
        @@jacket_slot_02_text.font = QUICKSAND
        @@jacket_slot_02_text.character_size = 12
        @@jacket_slot_02_text.color = SF::Color::Blue

        @@jacket_slot_02_image_sprite = SF::Sprite.new


        @@jacket_slot_03_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@jacket_slot_03_sprite.fill_color = SF.color(161, 183, 208)

        @@jacket_slot_03_text = SF::Text.new
        @@jacket_slot_03_text.font = QUICKSAND
        @@jacket_slot_03_text.character_size = 12
        @@jacket_slot_03_text.color = SF::Color::Blue

        @@jacket_slot_03_image_sprite = SF::Sprite.new


        @@jacket_slot_04_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@jacket_slot_04_sprite.fill_color = SF.color(161, 183, 208)

        @@jacket_slot_04_text = SF::Text.new
        @@jacket_slot_04_text.font = QUICKSAND
        @@jacket_slot_04_text.character_size = 12
        @@jacket_slot_04_text.color = SF::Color::Blue

        @@jacket_slot_04_image_sprite = SF::Sprite.new


        @@jacket_slot_05_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@jacket_slot_05_sprite.fill_color = SF.color(161, 183, 208)

        @@jacket_slot_05_text = SF::Text.new
        @@jacket_slot_05_text.font = QUICKSAND
        @@jacket_slot_05_text.character_size = 12
        @@jacket_slot_05_text.color = SF::Color::Blue

        @@jacket_slot_05_image_sprite = SF::Sprite.new


        @@jacket_slot_06_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@jacket_slot_06_sprite.fill_color = SF.color(161, 183, 208)

        @@jacket_slot_06_text = SF::Text.new
        @@jacket_slot_06_text.font = QUICKSAND
        @@jacket_slot_06_text.character_size = 12
        @@jacket_slot_06_text.color = SF::Color::Blue
        
        @@jacket_slot_06_image_sprite = SF::Sprite.new


        @@jacket_slot_07_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@jacket_slot_07_sprite.fill_color = SF.color(161, 183, 208)

        @@jacket_slot_07_text = SF::Text.new
        @@jacket_slot_07_text.font = QUICKSAND
        @@jacket_slot_07_text.character_size = 12
        @@jacket_slot_07_text.color = SF::Color::Blue

        @@jacket_slot_07_image_sprite = SF::Sprite.new


        @@jacket_slot_08_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@jacket_slot_08_sprite.fill_color = SF.color(161, 183, 208)

        @@jacket_slot_08_text = SF::Text.new
        @@jacket_slot_08_text.font = QUICKSAND
        @@jacket_slot_08_text.character_size = 12
        @@jacket_slot_08_text.color = SF::Color::Blue

        @@jacket_slot_08_image_sprite = SF::Sprite.new


        @@jacket_slot_09_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@jacket_slot_09_sprite.fill_color = SF.color(161, 183, 208)

        @@jacket_slot_09_text = SF::Text.new
        @@jacket_slot_09_text.font = QUICKSAND
        @@jacket_slot_09_text.character_size = 12
        @@jacket_slot_09_text.color = SF::Color::Blue

        @@jacket_slot_09_image_sprite = SF::Sprite.new


        @@jacket_slot_10_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@jacket_slot_10_sprite.fill_color = SF.color(161, 183, 208)

        @@jacket_slot_10_text = SF::Text.new
        @@jacket_slot_10_text.font = QUICKSAND
        @@jacket_slot_10_text.character_size = 12
        @@jacket_slot_10_text.color = SF::Color::Blue

        @@jacket_slot_10_image_sprite = SF::Sprite.new


        @@jacket_slot_11_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@jacket_slot_11_sprite.fill_color = SF.color(161, 183, 208)

        @@jacket_slot_11_text = SF::Text.new
        @@jacket_slot_11_text.font = QUICKSAND
        @@jacket_slot_11_text.character_size = 12
        @@jacket_slot_11_text.color = SF::Color::Blue

        @@jacket_slot_11_image_sprite = SF::Sprite.new


        @@jacket_slot_12_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@jacket_slot_12_sprite.fill_color = SF.color(161, 183, 208)

        @@jacket_slot_12_text = SF::Text.new
        @@jacket_slot_12_text.font = QUICKSAND
        @@jacket_slot_12_text.character_size = 12
        @@jacket_slot_12_text.color = SF::Color::Blue

        @@jacket_slot_12_image_sprite = SF::Sprite.new


        @@jacket_slot_13_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@jacket_slot_13_sprite.fill_color = SF.color(161, 183, 208)

        @@jacket_slot_13_text = SF::Text.new
        @@jacket_slot_13_text.font = QUICKSAND
        @@jacket_slot_13_text.character_size = 12
        @@jacket_slot_13_text.color = SF::Color::Blue

        @@jacket_slot_13_image_sprite = SF::Sprite.new


        @@jacket_slot_14_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@jacket_slot_14_sprite.fill_color = SF.color(161, 183, 208)

        @@jacket_slot_14_text = SF::Text.new
        @@jacket_slot_14_text.font = QUICKSAND
        @@jacket_slot_14_text.character_size = 12
        @@jacket_slot_14_text.color = SF::Color::Blue

        @@jacket_slot_14_image_sprite = SF::Sprite.new


        @@jacket_slot_15_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@jacket_slot_15_sprite.fill_color = SF.color(161, 183, 208)

        @@jacket_slot_15_text = SF::Text.new
        @@jacket_slot_15_text.font = QUICKSAND
        @@jacket_slot_15_text.character_size = 12
        @@jacket_slot_15_text.color = SF::Color::Blue

        @@jacket_slot_15_image_sprite = SF::Sprite.new
      #---------------------------------------------------------------------------------


       def initialize(is_open : Bool, page : Int32)
        @@is_open = is_open
        @@page = page
       end

       def ClothingTabJacket.is_open
        @@is_open
       end

       def ClothingTabJacket.page
        @@page
       end

       def ClothingTabJacket.is_open=(this)
        @@is_open = this
       end

       def ClothingTabJacket.page=(this)
        @@page = this
       end

       def ClothingTabJacket.owned_jacket_array
        @@owned_jacket_array
       end

       def ClothingTabJacket.owned_jacket_array=(this)
        @@owned_jacket_array = this
       end

       def ClothingTabJacket.push_to_owned_jacket_array(this)
        @@owned_jacket_array.push(this)
       end

       def ClothingTabJacket.change_jacket_sort_category
        case @@jacket_sorting_category
        when "Length"
            @@jacket_sorting_category = "Color"
        when "Color"
            @@jacket_sorting_category = "Length"
        end
       end

       def ClothingTabJacket.get_jacket_category
        return @@jacket_sorting_category
       end

       def ClothingTabJacket.initialize_clothing_tab(window)
        @@page = 1
        INVENTORY_BOX.position = SF.vector2(20, 40)  
       end

       def ClothingTabJacket.assign_slot_textures(window)
        if @@page == nil
            @@page = 1
        end
        @@owned_jacket_array.uniq!
        if @@owned_jacket_array.size > 0
            t = 0 + (@@page.not_nil! * 15) - 15
            if t < @@owned_jacket_array.size 
             @@jacket_slot_01_image_sprite.texture = @@owned_jacket_array[t].front_texture
             @@jacket_slot_01_text.string = @@owned_jacket_array[t].name
             @@jacket_slot_01 = @@owned_jacket_array[t]
        else
             @@jacket_slot_01_image_sprite.texture = NIL_TEXTURE
             @@jacket_slot_01_text.string = ""
             @@jacket_slot_01 = nil
            end
        end
        if @@owned_jacket_array.size > 1
            t = 1 + (@@page.not_nil! * 15) - 15
            if t < @@owned_jacket_array.size 
             @@jacket_slot_02_image_sprite.texture = @@owned_jacket_array[t].front_texture
             @@jacket_slot_02_text.string = @@owned_jacket_array[t].name
             @@jacket_slot_02 = @@owned_jacket_array[t]
        else
             @@jacket_slot_02_image_sprite.texture = NIL_TEXTURE
             @@jacket_slot_02_text.string = ""
             @@jacket_slot_02 = nil
            end
        end
        if @@owned_jacket_array.size > 2
            t = 2 + (@@page.not_nil! * 15) - 15
            if t < @@owned_jacket_array.size 
             @@jacket_slot_03_image_sprite.texture = @@owned_jacket_array[t].front_texture
             @@jacket_slot_03_text.string = @@owned_jacket_array[t].name
             @@jacket_slot_03 = @@owned_jacket_array[t]
        else
             @@jacket_slot_03_image_sprite.texture = NIL_TEXTURE
             @@jacket_slot_03_text.string = ""
             @@jacket_slot_03 = nil
            end
        end
        if @@owned_jacket_array.size > 3
            t = 3 + (@@page.not_nil! * 15) - 15
            if t < @@owned_jacket_array.size
             @@jacket_slot_04_image_sprite.texture = @@owned_jacket_array[t].front_texture
             @@jacket_slot_04_text.string = @@owned_jacket_array[t].name
             @@jacket_slot_04 = @@owned_jacket_array[t]
        else
             @@jacket_slot_04_image_sprite.texture = NIL_TEXTURE
             @@jacket_slot_04_text.string = ""
             @@jacket_slot_04 = nil
            end
        end
        if @@owned_jacket_array.size > 4
            t = 4 + (@@page.not_nil! * 15) - 15
            if t < @@owned_jacket_array.size
             @@jacket_slot_05_image_sprite.texture = @@owned_jacket_array[t].front_texture
             @@jacket_slot_05_text.string = @@owned_jacket_array[t].name
             @@jacket_slot_05 = @@owned_jacket_array[t]
        else
             @@jacket_slot_05_image_sprite.texture = NIL_TEXTURE
             @@jacket_slot_05_text.string = ""
             @@jacket_slot_05 = nil
            end
        end
        if @@owned_jacket_array.size > 5
            t = 5 + (@@page.not_nil! * 15) - 15
            if t < @@owned_jacket_array.size
             @@jacket_slot_06_image_sprite.texture = @@owned_jacket_array[t].front_texture
             @@jacket_slot_06_text.string = @@owned_jacket_array[t].name
             @@jacket_slot_06 = @@owned_jacket_array[t]
        else
             @@jacket_slot_06_image_sprite.texture = NIL_TEXTURE
             @@jacket_slot_06_text.string = ""
             @@jacket_slot_06 = nil
            end
        end
        if @@owned_jacket_array.size > 6
            t = 6 + (@@page.not_nil! * 15) - 15
            if t < @@owned_jacket_array.size
             @@jacket_slot_07_image_sprite.texture = @@owned_jacket_array[t].front_texture
             @@jacket_slot_07_text.string = @@owned_jacket_array[t].name
             @@jacket_slot_07 = @@owned_jacket_array[t]
        else
             @@jacket_slot_07_image_sprite.texture = NIL_TEXTURE
             @@jacket_slot_07_text.string = ""
             @@jacket_slot_07 = nil
            end
        end
        if @@owned_jacket_array.size > 7
            t = 7 + (@@page.not_nil! * 15) - 15
            if t < @@owned_jacket_array.size
             @@jacket_slot_08_image_sprite.texture = @@owned_jacket_array[t].front_texture
             @@jacket_slot_08_text.string = @@owned_jacket_array[t].name
             @@jacket_slot_08 = @@owned_jacket_array[t]
        else
             @@jacket_slot_08_image_sprite.texture = NIL_TEXTURE
             @@jacket_slot_08_text.string = ""
             @@jacket_slot_08 = nil
            end
        end
        if @@owned_jacket_array.size > 8
            t = 8 + (@@page.not_nil! * 15) - 15
            if t < @@owned_jacket_array.size
             @@jacket_slot_09_image_sprite.texture = @@owned_jacket_array[t].front_texture
             @@jacket_slot_09_text.string = @@owned_jacket_array[t].name
             @@jacket_slot_09 = @@owned_jacket_array[t]
        else
             @@jacket_slot_09_image_sprite.texture = NIL_TEXTURE
             @@jacket_slot_09_text.string = ""
             @@jacket_slot_09 = nil
            end
        end
        if @@owned_jacket_array.size > 9
            t = 9 + (@@page.not_nil! * 15) - 15
            if t < @@owned_jacket_array.size
             @@jacket_slot_10_image_sprite.texture = @@owned_jacket_array[t].front_texture
             @@jacket_slot_10_text.string = @@owned_jacket_array[t].name
             @@jacket_slot_10 = @@owned_jacket_array[t]
        else
             @@jacket_slot_10_image_sprite.texture = NIL_TEXTURE
             @@jacket_slot_10_text.string = ""
             @@jacket_slot_10 = nil
            end
        end
        if @@owned_jacket_array.size > 10
            t = 10 + (@@page.not_nil! * 15) - 15
            if t < @@owned_jacket_array.size
             @@jacket_slot_11_image_sprite.texture = @@owned_jacket_array[t].front_texture
             @@jacket_slot_11_text.string = @@owned_jacket_array[t].name
             @@jacket_slot_11 = @@owned_jacket_array[t]
        else
             @@jacket_slot_11_image_sprite.texture = NIL_TEXTURE
             @@jacket_slot_11_text.string = ""
             @@jacket_slot_11 = nil
            end
        end
        if @@owned_jacket_array.size > 11
            t = 11 + (@@page.not_nil! * 15) - 15
            if t < @@owned_jacket_array.size
             @@jacket_slot_12_image_sprite.texture = @@owned_jacket_array[t].front_texture
             @@jacket_slot_12_text.string = @@owned_jacket_array[t].name
             @@jacket_slot_12 = @@owned_jacket_array[t]
        else
             @@jacket_slot_12_image_sprite.texture = NIL_TEXTURE
             @@jacket_slot_12_text.string = ""
             @@jacket_slot_12 = nil
            end
        end
        if @@owned_jacket_array.size > 12
            t = 12 + (@@page.not_nil! * 15) - 15
            if t < @@owned_jacket_array.size
             @@jacket_slot_13_image_sprite.texture = @@owned_jacket_array[t].front_texture
             @@jacket_slot_13_text.string = @@owned_jacket_array[t].name
             @@jacket_slot_13 = @@owned_jacket_array[t]
        else
             @@jacket_slot_13_image_sprite.texture = NIL_TEXTURE
             @@jacket_slot_13_text.string = ""
             @@jacket_slot_13 = nil
            end
        end
        if @@owned_jacket_array.size > 13
            t = 13 + (@@page.not_nil! * 15) - 15
            if t < @@owned_jacket_array.size
             @@jacket_slot_14_image_sprite.texture = @@owned_jacket_array[t].front_texture
             @@jacket_slot_14_text.string = @@owned_jacket_array[t].name
             @@jacket_slot_14 = @@owned_jacket_array[t]
        else
             @@jacket_slot_14_image_sprite.texture = NIL_TEXTURE
             @@jacket_slot_14_text.string = ""
             @@jacket_slot_14 = nil
            end
        end
        if @@owned_jacket_array.size > 14
            t = 14 + (@@page.not_nil! * 15) - 15
            if t < @@owned_jacket_array.size
             @@jacket_slot_15_image_sprite.texture = @@owned_jacket_array[t].front_texture
             @@jacket_slot_15_text.string = @@owned_jacket_array[t].name
             @@jacket_slot_15 = @@owned_jacket_array[t]
        else
             @@jacket_slot_15_image_sprite.texture = NIL_TEXTURE
             @@jacket_slot_15_text.string = ""
             @@jacket_slot_15 = nil
            end
        end
        @@owned_jacket_array.uniq!
       end
       
       def ClothingTabJacket.draw_clothing_tab(window)
            current_size = window.size
            original_width = 800 
            original_height = 600
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
    
            scale_ratio = [scale_x, scale_y].min
            max_scale = 1.5
            clamped_scale = [scale_ratio, max_scale].min

        window.view = window.default_view

        @@jacket_slot_01_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 40 * max_scale)
        @@jacket_slot_01_sprite.scale = SF.vector2(1, 1)
        
        @@jacket_slot_01_image_sprite.position = @@jacket_slot_01_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@jacket_slot_01_image_sprite.scale = SF.vector2(2, 2)
        @@jacket_slot_01_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)

        @@jacket_slot_01_text.position = @@jacket_slot_01_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@jacket_slot_01_text)
        

        @@jacket_slot_02_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 40 * max_scale)
        @@jacket_slot_02_sprite.scale = SF.vector2(1, 1)
        
        @@jacket_slot_02_image_sprite.position = @@jacket_slot_02_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@jacket_slot_02_image_sprite.scale = SF.vector2(2, 2)
        @@jacket_slot_02_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)

        @@jacket_slot_02_text.position = @@jacket_slot_02_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@jacket_slot_02_text)
        

        @@jacket_slot_03_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 40 * max_scale)
        @@jacket_slot_03_sprite.scale = SF.vector2(1, 1)
        
        @@jacket_slot_03_image_sprite.position = @@jacket_slot_03_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@jacket_slot_03_image_sprite.scale = SF.vector2(2, 2)
        @@jacket_slot_03_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)

        @@jacket_slot_03_text.position = @@jacket_slot_03_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@jacket_slot_03_text)
        

        @@jacket_slot_04_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 40 * max_scale)
        @@jacket_slot_04_sprite.scale = SF.vector2(1, 1)

        @@jacket_slot_04_text.position = @@jacket_slot_04_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@jacket_slot_04_text)
        
        @@jacket_slot_04_image_sprite.position = @@jacket_slot_04_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@jacket_slot_04_image_sprite.scale = SF.vector2(2, 2)
        @@jacket_slot_04_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)


        @@jacket_slot_05_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 40 * max_scale)
        @@jacket_slot_05_sprite.scale = SF.vector2(1, 1)

        @@jacket_slot_05_text.position = @@jacket_slot_05_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@jacket_slot_05_text)
        
        @@jacket_slot_05_image_sprite.position = @@jacket_slot_05_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@jacket_slot_05_image_sprite.scale = SF.vector2(2, 2)
        @@jacket_slot_05_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)
        

        @@jacket_slot_06_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 120 * max_scale)
        @@jacket_slot_06_sprite.scale = SF.vector2(1, 1)

        @@jacket_slot_06_text.position = @@jacket_slot_06_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@jacket_slot_06_text)
        
        @@jacket_slot_06_image_sprite.position = @@jacket_slot_06_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@jacket_slot_06_image_sprite.scale = SF.vector2(2, 2)
        @@jacket_slot_06_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)
        

        @@jacket_slot_07_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 120 * max_scale)
        @@jacket_slot_07_sprite.scale = SF.vector2(1, 1)
        
        @@jacket_slot_07_text.position = @@jacket_slot_07_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@jacket_slot_07_text)
        
        @@jacket_slot_07_image_sprite.position = @@jacket_slot_07_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@jacket_slot_07_image_sprite.scale = SF.vector2(2, 2)
        @@jacket_slot_07_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)
        

        @@jacket_slot_08_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 120 * max_scale)
        @@jacket_slot_08_sprite.scale = SF.vector2(1, 1)
                
        @@jacket_slot_08_text.position = @@jacket_slot_08_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@jacket_slot_08_text)
        
        @@jacket_slot_08_image_sprite.position = @@jacket_slot_08_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@jacket_slot_08_image_sprite.scale = SF.vector2(2, 2)
        @@jacket_slot_08_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)
        

        @@jacket_slot_09_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 120 * max_scale)
        @@jacket_slot_09_sprite.scale = SF.vector2(1, 1)
                
        @@jacket_slot_09_text.position = @@jacket_slot_09_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@jacket_slot_09_text)
        
        @@jacket_slot_09_image_sprite.position = @@jacket_slot_09_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@jacket_slot_09_image_sprite.scale = SF.vector2(2, 2)
        @@jacket_slot_09_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)
        

        @@jacket_slot_10_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 120 * max_scale)
        @@jacket_slot_10_sprite.scale = SF.vector2(1, 1)
                        
        @@jacket_slot_10_text.position = @@jacket_slot_10_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@jacket_slot_10_text)
        
        @@jacket_slot_10_image_sprite.position = @@jacket_slot_10_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@jacket_slot_10_image_sprite.scale = SF.vector2(2, 2)
        @@jacket_slot_10_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)
        

        @@jacket_slot_11_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 200 * max_scale)
        @@jacket_slot_11_sprite.scale = SF.vector2(1, 1)
                        
        @@jacket_slot_11_text.position = @@jacket_slot_11_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@jacket_slot_11_text)
        
        @@jacket_slot_11_image_sprite.position = @@jacket_slot_11_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@jacket_slot_11_image_sprite.scale = SF.vector2(2, 2)
        @@jacket_slot_11_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)
        

        @@jacket_slot_12_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 200 * max_scale)
        @@jacket_slot_12_sprite.scale = SF.vector2(1, 1)
                        
        @@jacket_slot_12_text.position = @@jacket_slot_12_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@jacket_slot_12_text)
        
        @@jacket_slot_12_image_sprite.position = @@jacket_slot_12_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@jacket_slot_12_image_sprite.scale = SF.vector2(2, 2)
        @@jacket_slot_12_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)
        

        @@jacket_slot_13_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 200 * max_scale)
        @@jacket_slot_13_sprite.scale = SF.vector2(1, 1)
        
        @@jacket_slot_13_text.position = @@jacket_slot_13_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@jacket_slot_13_text)
        
        @@jacket_slot_13_image_sprite.position = @@jacket_slot_13_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@jacket_slot_13_image_sprite.scale = SF.vector2(2, 2)
        @@jacket_slot_13_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)
        

        @@jacket_slot_14_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 200 * max_scale)
        @@jacket_slot_14_sprite.scale = SF.vector2(1, 1)
                        
        @@jacket_slot_14_text.position = @@jacket_slot_14_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@jacket_slot_14_text)
        
        @@jacket_slot_14_image_sprite.position = @@jacket_slot_14_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@jacket_slot_14_image_sprite.scale = SF.vector2(2, 2)
        @@jacket_slot_14_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)
        

        @@jacket_slot_15_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 200 * max_scale)
        @@jacket_slot_15_sprite.scale = SF.vector2(1, 1)
                        
        @@jacket_slot_15_text.position = @@jacket_slot_15_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@jacket_slot_15_text)
        
        @@jacket_slot_15_image_sprite.position = @@jacket_slot_15_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@jacket_slot_15_image_sprite.scale = SF.vector2(2, 2)
        @@jacket_slot_15_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)


        window.draw(@@jacket_slot_01_sprite)
        window.draw(@@jacket_slot_01_image_sprite)
        window.draw(@@jacket_slot_01_text)

        window.draw(@@jacket_slot_02_sprite)
        window.draw(@@jacket_slot_02_image_sprite)
        window.draw(@@jacket_slot_02_text)

        window.draw(@@jacket_slot_03_sprite)
        window.draw(@@jacket_slot_03_image_sprite)
        window.draw(@@jacket_slot_03_text)
        
        window.draw(@@jacket_slot_04_sprite)
        window.draw(@@jacket_slot_04_image_sprite)
        window.draw(@@jacket_slot_04_text)

        window.draw(@@jacket_slot_05_sprite)
        window.draw(@@jacket_slot_05_image_sprite)
        window.draw(@@jacket_slot_05_text)

        window.draw(@@jacket_slot_06_sprite)
        window.draw(@@jacket_slot_06_image_sprite)
        window.draw(@@jacket_slot_06_text)

        window.draw(@@jacket_slot_07_sprite)
        window.draw(@@jacket_slot_07_image_sprite)
        window.draw(@@jacket_slot_07_text)

        window.draw(@@jacket_slot_08_sprite)
        window.draw(@@jacket_slot_08_image_sprite)
        window.draw(@@jacket_slot_08_text)

        window.draw(@@jacket_slot_09_sprite)
        window.draw(@@jacket_slot_09_image_sprite)
        window.draw(@@jacket_slot_09_text)

        window.draw(@@jacket_slot_10_sprite)
        window.draw(@@jacket_slot_10_image_sprite)
        window.draw(@@jacket_slot_10_text)

        window.draw(@@jacket_slot_11_sprite)
        window.draw(@@jacket_slot_11_image_sprite)
        window.draw(@@jacket_slot_11_text)

        window.draw(@@jacket_slot_12_sprite)
        window.draw(@@jacket_slot_12_image_sprite)
        window.draw(@@jacket_slot_12_text)

        window.draw(@@jacket_slot_13_sprite)
        window.draw(@@jacket_slot_13_image_sprite)
        window.draw(@@jacket_slot_13_text)

        window.draw(@@jacket_slot_14_sprite)
        window.draw(@@jacket_slot_14_image_sprite)
        window.draw(@@jacket_slot_14_text)

        window.draw(@@jacket_slot_15_sprite)
        window.draw(@@jacket_slot_15_image_sprite)
        window.draw(@@jacket_slot_15_text)

        if SF::Mouse.button_pressed?(SF::Mouse::Left)
            ClothingTabJacket.clothes_mouse_handling(window)
        end
       end

       def ClothingTabJacket.clothes_mouse_handling(window)
        mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window))
        mouse_x = mouse_position.x
        mouse_y = mouse_position.y
        
    
        current_size = window.size
        original_width = 800 
        original_height = 600 

        scale_x = (current_size.x.to_f / original_width)
        scale_y = current_size.y.to_f / original_height

        #------------------------------------objects-------------------------------------------------

            slot_01_x = @@jacket_slot_01_sprite.position.x
            slot_01_y = @@jacket_slot_01_sprite.position.y
            slot_01_width = @@jacket_slot_01_sprite.size.x
            slot_01_height = @@jacket_slot_01_sprite.size.y

            slot_02_x = @@jacket_slot_02_sprite.position.x
            slot_02_y = @@jacket_slot_02_sprite.position.y
            slot_02_width = @@jacket_slot_02_sprite.size.x
            slot_02_height = @@jacket_slot_02_sprite.size.y

            slot_03_x = @@jacket_slot_03_sprite.position.x
            slot_03_y = @@jacket_slot_03_sprite.position.y
            slot_03_width = @@jacket_slot_03_sprite.size.x
            slot_03_height = @@jacket_slot_03_sprite.size.y

            slot_04_x = @@jacket_slot_04_sprite.position.x
            slot_04_y = @@jacket_slot_04_sprite.position.y
            slot_04_width = @@jacket_slot_04_sprite.size.x
            slot_04_height = @@jacket_slot_04_sprite.size.y

            slot_05_x = @@jacket_slot_05_sprite.position.x
            slot_05_y = @@jacket_slot_05_sprite.position.y
            slot_05_width = @@jacket_slot_05_sprite.size.x
            slot_05_height = @@jacket_slot_05_sprite.size.y

            slot_06_x = @@jacket_slot_06_sprite.position.x
            slot_06_y = @@jacket_slot_06_sprite.position.y
            slot_06_width = @@jacket_slot_06_sprite.size.x
            slot_06_height = @@jacket_slot_06_sprite.size.y

            slot_07_x = @@jacket_slot_07_sprite.position.x
            slot_07_y = @@jacket_slot_07_sprite.position.y
            slot_07_width = @@jacket_slot_07_sprite.size.x
            slot_07_height = @@jacket_slot_07_sprite.size.y

            slot_08_x = @@jacket_slot_08_sprite.position.x
            slot_08_y = @@jacket_slot_08_sprite.position.y
            slot_08_width = @@jacket_slot_08_sprite.size.x
            slot_08_height = @@jacket_slot_08_sprite.size.y

            slot_09_x = @@jacket_slot_09_sprite.position.x
            slot_09_y = @@jacket_slot_09_sprite.position.y
            slot_09_width = @@jacket_slot_09_sprite.size.x
            slot_09_height = @@jacket_slot_09_sprite.size.y

            slot_10_x = @@jacket_slot_10_sprite.position.x
            slot_10_y = @@jacket_slot_10_sprite.position.y
            slot_10_width = @@jacket_slot_10_sprite.size.x
            slot_10_height = @@jacket_slot_10_sprite.size.y

            slot_11_x = @@jacket_slot_11_sprite.position.x
            slot_11_y = @@jacket_slot_11_sprite.position.y
            slot_11_width = @@jacket_slot_11_sprite.size.x
            slot_11_height = @@jacket_slot_11_sprite.size.y

            slot_12_x = @@jacket_slot_12_sprite.position.x
            slot_12_y = @@jacket_slot_12_sprite.position.y
            slot_12_width = @@jacket_slot_12_sprite.size.x
            slot_12_height = @@jacket_slot_12_sprite.size.y

            slot_13_x = @@jacket_slot_13_sprite.position.x
            slot_13_y = @@jacket_slot_13_sprite.position.y
            slot_13_width = @@jacket_slot_13_sprite.size.x
            slot_13_height = @@jacket_slot_13_sprite.size.y

            slot_14_x = @@jacket_slot_14_sprite.position.x
            slot_14_y = @@jacket_slot_14_sprite.position.y
            slot_14_width = @@jacket_slot_14_sprite.size.x
            slot_14_height = @@jacket_slot_14_sprite.size.y

            slot_15_x = @@jacket_slot_15_sprite.position.x
            slot_15_y = @@jacket_slot_15_sprite.position.y
            slot_15_width = @@jacket_slot_15_sprite.size.x
            slot_15_height = @@jacket_slot_15_sprite.size.y
        #---------------------------------------------------------------------------------------------
        
        if (mouse_x >= slot_01_x && mouse_x <= slot_01_x + slot_01_width) &&
           (mouse_y >= slot_01_y && mouse_y <= slot_01_y + slot_01_height)
           
            if @@jacket_slot_01 != nil   
                t = ((@@page || 1) * 15) - 15
                
                @@owned_jacket_array[t] = (Clothing::Jacket.get_jacket(
                Player::Appearance.get_clothing("jacket").try(&.to_s) || Clothing::Jacket.get_jacket("No Jacket").not_nil!)).not_nil!
                Player::Appearance.change_jacket(@@jacket_slot_01.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_jacket_array.uniq!
            end
            ClothingTabJacket.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_02_x && mouse_x <= slot_02_x + slot_02_width) &&
           (mouse_y >= slot_02_y && mouse_y <= slot_02_y + slot_02_height)
           
            if @@jacket_slot_02 != nil
                t = 1 + ((@@page || 1) * 15) - 15
                
                @@owned_jacket_array[t] = (Clothing::Jacket.get_jacket(
                Player::Appearance.get_clothing("jacket").try(&.to_s) || Clothing::Jacket.get_jacket("No Jacket").not_nil!)).not_nil!
                Player::Appearance.change_jacket(@@jacket_slot_02.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_jacket_array.uniq!
            end
            ClothingTabJacket.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_03_x && mouse_x <= slot_03_x + slot_03_width) &&
           (mouse_y >= slot_03_y && mouse_y <= slot_03_y + slot_03_height)
           
            if @@jacket_slot_03 != nil
                t = 2 + ((@@page || 1) * 15) - 15
                
                @@owned_jacket_array[t] = (Clothing::Jacket.get_jacket(
                    Player::Appearance.get_clothing("jacket").try(&.to_s) || Clothing::Jacket.get_jacket("No Jacket").not_nil!)).not_nil!
                Player::Appearance.change_jacket(@@jacket_slot_03.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_jacket_array.uniq!
            end
            ClothingTabJacket.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_04_x && mouse_x <= slot_04_x + slot_04_width) &&
           (mouse_y >= slot_04_y && mouse_y <= slot_04_y + slot_04_height)
           
            if @@jacket_slot_04 != nil
                t = 3 + ((@@page || 1) * 15) - 15
                
                @@owned_jacket_array[t] = (Clothing::Jacket.get_jacket(
                    Player::Appearance.get_clothing("jacket").try(&.to_s) || Clothing::Jacket.get_jacket("No Jacket").not_nil!)).not_nil!
                Player::Appearance.change_jacket(@@jacket_slot_04.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_jacket_array.uniq!
            end
            ClothingTabJacket.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_05_x && mouse_x <= slot_05_x + slot_05_width) &&
           (mouse_y >= slot_05_y && mouse_y <= slot_05_y + slot_05_height)
           
            if @@jacket_slot_05 != nil
                t = 4 + ((@@page || 1) * 15) - 15
                
                @@owned_jacket_array[t] = (Clothing::Jacket.get_jacket(
                    Player::Appearance.get_clothing("jacket").try(&.to_s) || Clothing::Jacket.get_jacket("No Jacket").not_nil!)).not_nil!
                Player::Appearance.change_jacket(@@jacket_slot_05.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_jacket_array.uniq!
            end
            ClothingTabJacket.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_06_x && mouse_x <= slot_06_x + slot_06_width) &&
           (mouse_y >= slot_06_y && mouse_y <= slot_06_y + slot_06_height)
           
            if @@jacket_slot_06 != nil
                t = 5 + ((@@page || 1) * 15) - 15
                
                @@owned_jacket_array[t] = (Clothing::Jacket.get_jacket(
                    Player::Appearance.get_clothing("jacket").try(&.to_s) || Clothing::Jacket.get_jacket("No Jacket").not_nil!)).not_nil!
                Player::Appearance.change_jacket(@@jacket_slot_06.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_jacket_array.uniq!
            end
            ClothingTabJacket.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_07_x && mouse_x <= slot_07_x + slot_07_width) &&
           (mouse_y >= slot_07_y && mouse_y <= slot_07_y + slot_07_height)
           
            if @@jacket_slot_07 != nil
                t = 6 + ((@@page || 1) * 15) - 15
                
                @@owned_jacket_array[t] = (Clothing::Jacket.get_jacket(
                    Player::Appearance.get_clothing("jacket").try(&.to_s) || Clothing::Jacket.get_jacket("No Jacket").not_nil!)).not_nil!
                Player::Appearance.change_jacket(@@jacket_slot_07.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_jacket_array.uniq!
            end
            ClothingTabJacket.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_08_x && mouse_x <= slot_08_x + slot_08_width) &&
           (mouse_y >= slot_08_y && mouse_y <= slot_08_y + slot_08_height)
           
            if @@jacket_slot_08 != nil
                t = 7 + ((@@page || 1) * 15) - 15
                
                @@owned_jacket_array[t] = (Clothing::Jacket.get_jacket(
                    Player::Appearance.get_clothing("jacket").try(&.to_s) || Clothing::Jacket.get_jacket("No Jacket").not_nil!)).not_nil!
                Player::Appearance.change_jacket(@@jacket_slot_08.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_jacket_array.uniq!
            end
            ClothingTabJacket.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_09_x && mouse_x <= slot_09_x + slot_09_width) &&
           (mouse_y >= slot_09_y && mouse_y <= slot_09_y + slot_09_height)
           
            if @@jacket_slot_09 != nil
                t = 8 + ((@@page || 1) * 15) - 15
                
                @@owned_jacket_array[t] = (Clothing::Jacket.get_jacket(
                    Player::Appearance.get_clothing("jacket").try(&.to_s) || Clothing::Jacket.get_jacket("No Jacket").not_nil!)).not_nil!
                Player::Appearance.change_jacket(@@jacket_slot_09.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_jacket_array.uniq!
            end
            ClothingTabJacket.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_10_x && mouse_x <= slot_10_x + slot_10_width) &&
           (mouse_y >= slot_10_y && mouse_y <= slot_10_y + slot_10_height)
           
            if @@jacket_slot_10 != nil
                t = 9 + ((@@page || 1) * 15) - 15
                
                @@owned_jacket_array[t] = (Clothing::Jacket.get_jacket(
                    Player::Appearance.get_clothing("jacket").try(&.to_s) || Clothing::Jacket.get_jacket("No Jacket").not_nil!)).not_nil!
                Player::Appearance.change_jacket(@@jacket_slot_10.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_jacket_array.uniq!
            end
            ClothingTabJacket.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_11_x && mouse_x <= slot_11_x + slot_11_width) &&
           (mouse_y >= slot_11_y && mouse_y <= slot_11_y + slot_11_height)
           
            if @@jacket_slot_11 != nil
                t = 10 + ((@@page || 1) * 15) - 15
                
                @@owned_jacket_array[t] = (Clothing::Jacket.get_jacket(
                    Player::Appearance.get_clothing("jacket").try(&.to_s) || Clothing::Jacket.get_jacket("No Jacket").not_nil!)).not_nil!
                Player::Appearance.change_jacket(@@jacket_slot_11.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_jacket_array.uniq!
            end
            ClothingTabJacket.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_12_x && mouse_x <= slot_12_x + slot_12_width) &&
           (mouse_y >= slot_12_y && mouse_y <= slot_12_y + slot_12_height)
           
            if @@jacket_slot_12 != nil
                t = 11 + ((@@page || 1) * 15) - 15
                
                @@owned_jacket_array[t] = (Clothing::Jacket.get_jacket(
                    Player::Appearance.get_clothing("jacket").try(&.to_s) || Clothing::Jacket.get_jacket("No Jacket").not_nil!)).not_nil!
                Player::Appearance.change_jacket(@@jacket_slot_12.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_jacket_array.uniq!
            end
            ClothingTabJacket.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_13_x && mouse_x <= slot_13_x + slot_13_width) &&
           (mouse_y >= slot_13_y && mouse_y <= slot_13_y + slot_13_height)
           
            if @@jacket_slot_13 != nil
                t = 12 + ((@@page || 1) * 15) - 15
                
                @@owned_jacket_array[t] = (Clothing::Jacket.get_jacket(
                    Player::Appearance.get_clothing("jacket").try(&.to_s) || Clothing::Jacket.get_jacket("No Jacket").not_nil!)).not_nil!
                Player::Appearance.change_jacket(@@jacket_slot_13.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_jacket_array.uniq!
            end
            ClothingTabJacket.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_14_x && mouse_x <= slot_14_x + slot_14_width) &&
           (mouse_y >= slot_14_y && mouse_y <= slot_14_y + slot_14_height)
           
            if @@jacket_slot_14 != nil
                t = 13 + ((@@page || 1) * 15) - 15
                
                @@owned_jacket_array[t] = (Clothing::Jacket.get_jacket(
                    Player::Appearance.get_clothing("jacket").try(&.to_s) || Clothing::Jacket.get_jacket("No Jacket").not_nil!)).not_nil!
                Player::Appearance.change_jacket(@@jacket_slot_14.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_jacket_array.uniq!
            end
            ClothingTabJacket.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_15_x && mouse_x <= slot_15_x + slot_15_width) &&
           (mouse_y >= slot_15_y && mouse_y <= slot_15_y + slot_15_height)
           
            if @@jacket_slot_15 != nil
                t = 14 + ((@@page || 1) * 15) - 15
                
                @@owned_jacket_array[t] = (Clothing::Jacket.get_jacket(
                Player::Appearance.get_clothing("jacket").try(&.to_s) || Clothing::Jacket.get_jacket("No Jacket").not_nil!)).not_nil!
                Player::Appearance.change_jacket(@@jacket_slot_15.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_jacket_array.uniq!
            end
            ClothingTabJacket.assign_slot_textures(window)
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

       def ClothingTabPants.initialize_clothing_tab(window)
        @@page = 1
        INVENTORY_BOX.position = SF.vector2(20, 40)  
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

        INVENTORY_BOX.position = SF.vector2(80 * max_scale, 40 * max_scale)
        INVENTORY_BOX.scale = SF.vector2(1, 1)


        @@pants_slot_01_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 40 * max_scale)
        @@pants_slot_01_sprite.scale = SF.vector2(1, 1)
        
        @@pants_slot_01_image_sprite.position = @@pants_slot_01_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_01_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_01_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)

        @@pants_slot_01_text.position = @@pants_slot_01_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@pants_slot_01_text)
        

        @@pants_slot_02_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 40 * max_scale)
        @@pants_slot_02_sprite.scale = SF.vector2(1, 1)
        
        @@pants_slot_02_image_sprite.position = @@pants_slot_02_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_02_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_02_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)

        @@pants_slot_02_text.position = @@pants_slot_02_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@pants_slot_02_text)
        

        @@pants_slot_03_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 40 * max_scale)
        @@pants_slot_03_sprite.scale = SF.vector2(1, 1)
        
        @@pants_slot_03_image_sprite.position = @@pants_slot_03_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_03_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_03_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)

        @@pants_slot_03_text.position = @@pants_slot_03_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@pants_slot_03_text)
        

        @@pants_slot_04_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 40 * max_scale)
        @@pants_slot_04_sprite.scale = SF.vector2(1, 1)

        @@pants_slot_04_text.position = @@pants_slot_04_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@pants_slot_04_text)
        
        @@pants_slot_04_image_sprite.position = @@pants_slot_04_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_04_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_04_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)


        @@pants_slot_05_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 40 * max_scale)
        @@pants_slot_05_sprite.scale = SF.vector2(1, 1)

        @@pants_slot_05_text.position = @@pants_slot_05_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@pants_slot_05_text)
        
        @@pants_slot_05_image_sprite.position = @@pants_slot_05_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_05_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_05_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)
        

        @@pants_slot_06_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 120 * max_scale)
        @@pants_slot_06_sprite.scale = SF.vector2(1, 1)

        @@pants_slot_06_text.position = @@pants_slot_06_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@pants_slot_06_text)
        
        @@pants_slot_06_image_sprite.position = @@pants_slot_06_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_06_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_06_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)
        

        @@pants_slot_07_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 120 * max_scale)
        @@pants_slot_07_sprite.scale = SF.vector2(1, 1)
        
        @@pants_slot_07_text.position = @@pants_slot_07_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@pants_slot_07_text)
        
        @@pants_slot_07_image_sprite.position = @@pants_slot_07_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_07_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_07_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)
        

        @@pants_slot_08_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 120 * max_scale)
        @@pants_slot_08_sprite.scale = SF.vector2(1, 1)
                
        @@pants_slot_08_text.position = @@pants_slot_08_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@pants_slot_08_text)
        
        @@pants_slot_08_image_sprite.position = @@pants_slot_08_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_08_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_08_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)
        

        @@pants_slot_09_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 120 * max_scale)
        @@pants_slot_09_sprite.scale = SF.vector2(1, 1)
                
        @@pants_slot_09_text.position = @@pants_slot_09_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@pants_slot_09_text)
        
        @@pants_slot_09_image_sprite.position = @@pants_slot_09_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_09_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_09_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)
        

        @@pants_slot_10_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 120 * max_scale)
        @@pants_slot_10_sprite.scale = SF.vector2(1, 1)
                        
        @@pants_slot_10_text.position = @@pants_slot_10_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@pants_slot_10_text)
        
        @@pants_slot_10_image_sprite.position = @@pants_slot_10_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_10_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_10_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)
        

        @@pants_slot_11_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 200 * max_scale)
        @@pants_slot_11_sprite.scale = SF.vector2(1, 1)
                        
        @@pants_slot_11_text.position = @@pants_slot_11_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@pants_slot_11_text)
        
        @@pants_slot_11_image_sprite.position = @@pants_slot_11_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_11_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_11_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)
        

        @@pants_slot_12_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 200 * max_scale)
        @@pants_slot_12_sprite.scale = SF.vector2(1, 1)
                        
        @@pants_slot_12_text.position = @@pants_slot_12_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@pants_slot_12_text)
        
        @@pants_slot_12_image_sprite.position = @@pants_slot_12_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_12_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_12_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)
        

        @@pants_slot_13_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 200 * max_scale)
        @@pants_slot_13_sprite.scale = SF.vector2(1, 1)
        
        @@pants_slot_13_text.position = @@pants_slot_13_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@pants_slot_13_text)
        
        @@pants_slot_13_image_sprite.position = @@pants_slot_13_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_13_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_13_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)
        

        @@pants_slot_14_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 200 * max_scale)
        @@pants_slot_14_sprite.scale = SF.vector2(1, 1)
                        
        @@pants_slot_14_text.position = @@pants_slot_14_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@pants_slot_14_text)
        
        @@pants_slot_14_image_sprite.position = @@pants_slot_14_sprite.position - SF.vector2(25 * max_scale, 95 * max_scale)
        @@pants_slot_14_image_sprite.scale = SF.vector2(2, 2)
        @@pants_slot_14_image_sprite.texture_rect = SF.int_rect(192, 640, 96, 128)
        

        @@pants_slot_15_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 200 * max_scale)
        @@pants_slot_15_sprite.scale = SF.vector2(1, 1)
                        
        @@pants_slot_15_text.position = @@pants_slot_15_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@pants_slot_15_text)
        
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
                t = 0 + ((@@page || 1) * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(
                Player::Appearance.get_clothing("pants").try(&.to_s) || Clothing::Pants.get_pants("No Pants").not_nil!)).not_nil!
                Player::Appearance.change_pants(@@pants_slot_01.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_pants_array.uniq!
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_02_x && mouse_x <= slot_02_x + slot_02_width) &&
           (mouse_y >= slot_02_y && mouse_y <= slot_02_y + slot_02_height)
           
            if @@pants_slot_02 != nil
                t = 1 + ((@@page || 1) * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(
                Player::Appearance.get_clothing("pants").try(&.to_s) || Clothing::Pants.get_pants("No Pants").not_nil!)).not_nil!
                Player::Appearance.change_pants(@@pants_slot_02.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_pants_array.uniq!
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_03_x && mouse_x <= slot_03_x + slot_03_width) &&
           (mouse_y >= slot_03_y && mouse_y <= slot_03_y + slot_03_height)
           
            if @@pants_slot_03 != nil
                t = 2 + ((@@page || 1) * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(
                Player::Appearance.get_clothing("pants").try(&.to_s) || Clothing::Pants.get_pants("No Pants").not_nil!)).not_nil!
                Player::Appearance.change_pants(@@pants_slot_03.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_pants_array.uniq!
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_04_x && mouse_x <= slot_04_x + slot_04_width) &&
           (mouse_y >= slot_04_y && mouse_y <= slot_04_y + slot_04_height)
           
            if @@pants_slot_04 != nil
                t = 3 + ((@@page || 1) * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(
                Player::Appearance.get_clothing("pants").try(&.to_s) || Clothing::Pants.get_pants("No Pants").not_nil!)).not_nil!
                Player::Appearance.change_pants(@@pants_slot_04.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_pants_array.uniq!
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_05_x && mouse_x <= slot_05_x + slot_05_width) &&
           (mouse_y >= slot_05_y && mouse_y <= slot_05_y + slot_05_height)
           
            if @@pants_slot_05 != nil
                t = 4 + ((@@page || 1) * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(
                Player::Appearance.get_clothing("pants").try(&.to_s) || Clothing::Pants.get_pants("No Pants").not_nil!)).not_nil!
                Player::Appearance.change_pants(@@pants_slot_05.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_pants_array.uniq!
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_06_x && mouse_x <= slot_06_x + slot_06_width) &&
           (mouse_y >= slot_06_y && mouse_y <= slot_06_y + slot_06_height)
           
            if @@pants_slot_06 != nil
                t = 5 + ((@@page || 1) * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(
                Player::Appearance.get_clothing("pants").try(&.to_s) || Clothing::Pants.get_pants("No Pants").not_nil!)).not_nil!
                Player::Appearance.change_pants(@@pants_slot_06.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_pants_array.uniq!
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_07_x && mouse_x <= slot_07_x + slot_07_width) &&
           (mouse_y >= slot_07_y && mouse_y <= slot_07_y + slot_07_height)
           
            if @@pants_slot_07 != nil
                t = 6 + ((@@page || 1) * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(
                Player::Appearance.get_clothing("pants").try(&.to_s) || Clothing::Pants.get_pants("No Pants").not_nil!)).not_nil!
                Player::Appearance.change_pants(@@pants_slot_07.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_pants_array.uniq!
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_08_x && mouse_x <= slot_08_x + slot_08_width) &&
           (mouse_y >= slot_08_y && mouse_y <= slot_08_y + slot_08_height)
           
            if @@pants_slot_08 != nil
                t = 7 + ((@@page || 1) * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(
                Player::Appearance.get_clothing("pants").try(&.to_s) || Clothing::Pants.get_pants("No Pants").not_nil!)).not_nil!
                Player::Appearance.change_pants(@@pants_slot_08.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_pants_array.uniq!
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_09_x && mouse_x <= slot_09_x + slot_09_width) &&
           (mouse_y >= slot_09_y && mouse_y <= slot_09_y + slot_09_height)
           
            if @@pants_slot_09 != nil
                t = 8 + ((@@page || 1) * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(
                Player::Appearance.get_clothing("pants").try(&.to_s) || Clothing::Pants.get_pants("No Pants").not_nil!)).not_nil!
                Player::Appearance.change_pants(@@pants_slot_09.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_pants_array.uniq!
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_10_x && mouse_x <= slot_10_x + slot_10_width) &&
           (mouse_y >= slot_10_y && mouse_y <= slot_10_y + slot_10_height)
           
            if @@pants_slot_10 != nil
                t = 9 + ((@@page || 1) * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(
                Player::Appearance.get_clothing("pants").try(&.to_s) || Clothing::Pants.get_pants("No Pants").not_nil!)).not_nil!
                Player::Appearance.change_pants(@@pants_slot_10.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_pants_array.uniq!
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_11_x && mouse_x <= slot_11_x + slot_11_width) &&
           (mouse_y >= slot_11_y && mouse_y <= slot_11_y + slot_11_height)
           
            if @@pants_slot_11 != nil
                t = 10 + ((@@page || 1) * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(
                Player::Appearance.get_clothing("pants").try(&.to_s) || Clothing::Pants.get_pants("No Pants").not_nil!)).not_nil!
                Player::Appearance.change_pants(@@pants_slot_11.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_pants_array.uniq!
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_12_x && mouse_x <= slot_12_x + slot_12_width) &&
           (mouse_y >= slot_12_y && mouse_y <= slot_12_y + slot_12_height)
           
            if @@pants_slot_12 != nil
                t = 11 + ((@@page || 1) * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(
                Player::Appearance.get_clothing("pants").try(&.to_s) || Clothing::Pants.get_pants("No Pants").not_nil!)).not_nil!
                Player::Appearance.change_pants(@@pants_slot_12.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_pants_array.uniq!
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_13_x && mouse_x <= slot_13_x + slot_13_width) &&
           (mouse_y >= slot_13_y && mouse_y <= slot_13_y + slot_13_height)
           
            if @@pants_slot_13 != nil
                t = 12 + ((@@page || 1) * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(
                Player::Appearance.get_clothing("pants").try(&.to_s) || Clothing::Pants.get_pants("No Pants").not_nil!)).not_nil!
                Player::Appearance.change_pants(@@pants_slot_13.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_pants_array.uniq!
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_14_x && mouse_x <= slot_14_x + slot_14_width) &&
           (mouse_y >= slot_14_y && mouse_y <= slot_14_y + slot_14_height)
           
            if @@pants_slot_14 != nil
                t = 13 + ((@@page || 1) * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(
                Player::Appearance.get_clothing("pants").try(&.to_s) || Clothing::Pants.get_pants("No Pants").not_nil!)).not_nil!
                Player::Appearance.change_pants(@@pants_slot_14.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_pants_array.uniq!
            end
            ClothingTabPants.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_15_x && mouse_x <= slot_15_x + slot_15_width) &&
           (mouse_y >= slot_15_y && mouse_y <= slot_15_y + slot_15_height)
           
            if @@pants_slot_15 != nil
                t = 14 + ((@@page || 1) * 15) - 15
                
                @@owned_pants_array[t] = (Clothing::Pants.get_pants(
                Player::Appearance.get_clothing("pants").try(&.to_s) || Clothing::Pants.get_pants("No Pants").not_nil!)).not_nil!
                Player::Appearance.change_pants(@@pants_slot_15.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_pants_array.uniq!
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

        @@owned_shoes_array.push(Clothing::Shoes.get_shoes("White Sneakers").not_nil!)
        @@owned_shoes_array.push(Clothing::Shoes.get_shoes("Black Sneakers").not_nil!)
        @@owned_shoes_array.push(Clothing::Shoes.get_shoes("Red Sneakers").not_nil!)
        @@owned_shoes_array.push(Clothing::Shoes.get_shoes("Orange Sneakers").not_nil!)
        @@owned_shoes_array.push(Clothing::Shoes.get_shoes("Yellow Sneakers").not_nil!)
        @@owned_shoes_array.push(Clothing::Shoes.get_shoes("Green Sneakers").not_nil!)
        @@owned_shoes_array.push(Clothing::Shoes.get_shoes("Blue Sneakers").not_nil!)
        @@owned_shoes_array.push(Clothing::Shoes.get_shoes("Purple Sneakers").not_nil!)
        @@owned_shoes_array.push(Clothing::Shoes.get_shoes("Pink Sneakers").not_nil!)
       #---------------------------------------------------------------------------------

       #--------------------------------objects------------------------------------------
        INVENTORY_BOX = SF::RectangleShape.new(SF.vector2(610, 420))
        INVENTORY_BOX.fill_color = SF.color( 137, 170, 208 )

        
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

       def ClothingTabShoes.initialize_clothing_tab(window)
        @@page = 1
        INVENTORY_BOX.position = SF.vector2(20, 40)  
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

        INVENTORY_BOX.position = SF.vector2(80 * max_scale, 40 * max_scale)
        INVENTORY_BOX.scale = SF.vector2(1, 1)


        @@shoes_slot_01_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 40 * max_scale)
        @@shoes_slot_01_sprite.scale = SF.vector2(1, 1)
        
        @@shoes_slot_01_image_sprite.position = @@shoes_slot_01_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_01_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_01_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        @@shoes_slot_01_text.position = @@shoes_slot_01_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shoes_slot_01_text)
        

        @@shoes_slot_02_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 40 * max_scale)
        @@shoes_slot_02_sprite.scale = SF.vector2(1, 1)
        
        @@shoes_slot_02_image_sprite.position = @@shoes_slot_02_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_02_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_02_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        @@shoes_slot_02_text.position = @@shoes_slot_02_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shoes_slot_02_text)
        

        @@shoes_slot_03_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 40 * max_scale)
        @@shoes_slot_03_sprite.scale = SF.vector2(1, 1)
        
        @@shoes_slot_03_image_sprite.position = @@shoes_slot_03_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_03_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_03_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        @@shoes_slot_03_text.position = @@shoes_slot_03_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shoes_slot_03_text)
        

        @@shoes_slot_04_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 40 * max_scale)
        @@shoes_slot_04_sprite.scale = SF.vector2(1, 1)

        @@shoes_slot_04_text.position = @@shoes_slot_04_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shoes_slot_04_text)
        
        @@shoes_slot_04_image_sprite.position = @@shoes_slot_04_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_04_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_04_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)


        @@shoes_slot_05_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 40 * max_scale)
        @@shoes_slot_05_sprite.scale = SF.vector2(1, 1)

        @@shoes_slot_05_text.position = @@shoes_slot_05_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shoes_slot_05_text)
        
        @@shoes_slot_05_image_sprite.position = @@shoes_slot_05_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_05_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_05_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@shoes_slot_06_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 120 * max_scale)
        @@shoes_slot_06_sprite.scale = SF.vector2(1, 1)

        @@shoes_slot_06_text.position = @@shoes_slot_06_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shoes_slot_06_text)
        
        @@shoes_slot_06_image_sprite.position = @@shoes_slot_06_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_06_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_06_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@shoes_slot_07_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 120 * max_scale)
        @@shoes_slot_07_sprite.scale = SF.vector2(1, 1)
        
        @@shoes_slot_07_text.position = @@shoes_slot_07_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shoes_slot_07_text)
        
        @@shoes_slot_07_image_sprite.position = @@shoes_slot_07_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_07_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_07_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@shoes_slot_08_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 120 * max_scale)
        @@shoes_slot_08_sprite.scale = SF.vector2(1, 1)
                
        @@shoes_slot_08_text.position = @@shoes_slot_08_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shoes_slot_08_text)
        
        @@shoes_slot_08_image_sprite.position = @@shoes_slot_08_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_08_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_08_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@shoes_slot_09_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 120 * max_scale)
        @@shoes_slot_09_sprite.scale = SF.vector2(1, 1)
                
        @@shoes_slot_09_text.position = @@shoes_slot_09_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shoes_slot_09_text)
        
        @@shoes_slot_09_image_sprite.position = @@shoes_slot_09_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_09_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_09_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@shoes_slot_10_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 120 * max_scale)
        @@shoes_slot_10_sprite.scale = SF.vector2(1, 1)
                        
        @@shoes_slot_10_text.position = @@shoes_slot_10_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shoes_slot_10_text)
        
        @@shoes_slot_10_image_sprite.position = @@shoes_slot_10_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_10_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_10_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@shoes_slot_11_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 200 * max_scale)
        @@shoes_slot_11_sprite.scale = SF.vector2(1, 1)
                        
        @@shoes_slot_11_text.position = @@shoes_slot_11_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shoes_slot_11_text)
        
        @@shoes_slot_11_image_sprite.position = @@shoes_slot_11_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_11_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_11_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@shoes_slot_12_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 200 * max_scale)
        @@shoes_slot_12_sprite.scale = SF.vector2(1, 1)
                        
        @@shoes_slot_12_text.position = @@shoes_slot_12_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shoes_slot_12_text)
        
        @@shoes_slot_12_image_sprite.position = @@shoes_slot_12_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_12_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_12_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@shoes_slot_13_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 200 * max_scale)
        @@shoes_slot_13_sprite.scale = SF.vector2(1, 1)
        
        @@shoes_slot_13_text.position = @@shoes_slot_13_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shoes_slot_13_text)
        
        @@shoes_slot_13_image_sprite.position = @@shoes_slot_13_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_13_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_13_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@shoes_slot_14_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 200 * max_scale)
        @@shoes_slot_14_sprite.scale = SF.vector2(1, 1)
                        
        @@shoes_slot_14_text.position = @@shoes_slot_14_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shoes_slot_14_text)
        
        @@shoes_slot_14_image_sprite.position = @@shoes_slot_14_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@shoes_slot_14_image_sprite.scale = SF.vector2(2, 2)
        @@shoes_slot_14_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@shoes_slot_15_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 200 * max_scale)
        @@shoes_slot_15_sprite.scale = SF.vector2(1, 1)
                        
        @@shoes_slot_15_text.position = @@shoes_slot_15_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@shoes_slot_15_text)
        
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
                t = 0 + ((@@page || 1) * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(
                Player::Appearance.get_clothing("shoes").try(&.to_s) || Clothing::Shoes.get_shoes("No Shoes").not_nil!)).not_nil!
                Player::Appearance.change_shoes(@@shoes_slot_01.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shoes_array.uniq!
                
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_02_x && mouse_x <= slot_02_x + slot_02_width) &&
           (mouse_y >= slot_02_y && mouse_y <= slot_02_y + slot_02_height)
           
            if @@shoes_slot_02 != nil
                t = 1 + ((@@page || 1) * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(
                Player::Appearance.get_clothing("shoes").try(&.to_s) || Clothing::Shoes.get_shoes("No Shoes").not_nil!)).not_nil!
                Player::Appearance.change_shoes(@@shoes_slot_02.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shoes_array.uniq!
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_03_x && mouse_x <= slot_03_x + slot_03_width) &&
           (mouse_y >= slot_03_y && mouse_y <= slot_03_y + slot_03_height)
           
            if @@shoes_slot_03 != nil
                t = 2 + ((@@page || 1) * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(
                Player::Appearance.get_clothing("shoes").try(&.to_s) || Clothing::Shoes.get_shoes("No Shoes").not_nil!)).not_nil!
                Player::Appearance.change_shoes(@@shoes_slot_03.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shoes_array.uniq!
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_04_x && mouse_x <= slot_04_x + slot_04_width) &&
           (mouse_y >= slot_04_y && mouse_y <= slot_04_y + slot_04_height)
           
            if @@shoes_slot_04 != nil
                t = 3 + ((@@page || 1) * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(
                Player::Appearance.get_clothing("shoes").try(&.to_s) || Clothing::Shoes.get_shoes("No Shoes").not_nil!)).not_nil!
                Player::Appearance.change_shoes(@@shoes_slot_04.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shoes_array.uniq!
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_05_x && mouse_x <= slot_05_x + slot_05_width) &&
           (mouse_y >= slot_05_y && mouse_y <= slot_05_y + slot_05_height)
           
            if @@shoes_slot_05 != nil
                t = 4 + ((@@page || 1) * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(
                Player::Appearance.get_clothing("shoes").try(&.to_s) || Clothing::Shoes.get_shoes("No Shoes").not_nil!)).not_nil!
                Player::Appearance.change_shoes(@@shoes_slot_05.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shoes_array.uniq!
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_06_x && mouse_x <= slot_06_x + slot_06_width) &&
           (mouse_y >= slot_06_y && mouse_y <= slot_06_y + slot_06_height)
           
            if @@shoes_slot_06 != nil
                t = 5 + ((@@page || 1) * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(
                Player::Appearance.get_clothing("shoes").try(&.to_s) || Clothing::Shoes.get_shoes("No Shoes").not_nil!)).not_nil!
                Player::Appearance.change_shoes(@@shoes_slot_06.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shoes_array.uniq!
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_07_x && mouse_x <= slot_07_x + slot_07_width) &&
           (mouse_y >= slot_07_y && mouse_y <= slot_07_y + slot_07_height)
           
            if @@shoes_slot_07 != nil
                t = 6 + ((@@page || 1) * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(
                Player::Appearance.get_clothing("shoes").try(&.to_s) || Clothing::Shoes.get_shoes("No Shoes").not_nil!)).not_nil!
                Player::Appearance.change_shoes(@@shoes_slot_07.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shoes_array.uniq!
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_08_x && mouse_x <= slot_08_x + slot_08_width) &&
           (mouse_y >= slot_08_y && mouse_y <= slot_08_y + slot_08_height)
           
            if @@shoes_slot_08 != nil
                t = 7 + ((@@page || 1) * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(
                Player::Appearance.get_clothing("shoes").try(&.to_s) || Clothing::Shoes.get_shoes("No Shoes").not_nil!)).not_nil!
                Player::Appearance.change_shoes(@@shoes_slot_08.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shoes_array.uniq!
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_09_x && mouse_x <= slot_09_x + slot_09_width) &&
           (mouse_y >= slot_09_y && mouse_y <= slot_09_y + slot_09_height)
           
            if @@shoes_slot_09 != nil
                t = 8 + ((@@page || 1) * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(
                Player::Appearance.get_clothing("shoes").try(&.to_s) || Clothing::Shoes.get_shoes("No Shoes").not_nil!)).not_nil!
                Player::Appearance.change_shoes(@@shoes_slot_09.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shoes_array.uniq!
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_10_x && mouse_x <= slot_10_x + slot_10_width) &&
           (mouse_y >= slot_10_y && mouse_y <= slot_10_y + slot_10_height)
           
            if @@shoes_slot_10 != nil
                t = 9 + ((@@page || 1) * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(
                Player::Appearance.get_clothing("shoes").try(&.to_s) || Clothing::Shoes.get_shoes("No Shoes").not_nil!)).not_nil!
                Player::Appearance.change_shoes(@@shoes_slot_10.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shoes_array.uniq!
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_11_x && mouse_x <= slot_11_x + slot_11_width) &&
           (mouse_y >= slot_11_y && mouse_y <= slot_11_y + slot_11_height)
           
            if @@shoes_slot_11 != nil
                t = 10 + ((@@page || 1) * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(
                Player::Appearance.get_clothing("shoes").try(&.to_s) || Clothing::Shoes.get_shoes("No Shoes").not_nil!)).not_nil!
                Player::Appearance.change_shoes(@@shoes_slot_11.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shoes_array.uniq!
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_12_x && mouse_x <= slot_12_x + slot_12_width) &&
           (mouse_y >= slot_12_y && mouse_y <= slot_12_y + slot_12_height)
           
            if @@shoes_slot_12 != nil
                t = 11 + ((@@page || 1) * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(
                Player::Appearance.get_clothing("shoes").try(&.to_s) || Clothing::Shoes.get_shoes("No Shoes").not_nil!)).not_nil!
                Player::Appearance.change_shoes(@@shoes_slot_12.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shoes_array.uniq!
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_13_x && mouse_x <= slot_13_x + slot_13_width) &&
           (mouse_y >= slot_13_y && mouse_y <= slot_13_y + slot_13_height)
           
            if @@shoes_slot_13 != nil
                t = 12 + ((@@page || 1) * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(
                Player::Appearance.get_clothing("shoes").try(&.to_s) || Clothing::Shoes.get_shoes("No Shoes").not_nil!)).not_nil!
                Player::Appearance.change_shoes(@@shoes_slot_13.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shoes_array.uniq!
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_14_x && mouse_x <= slot_14_x + slot_14_width) &&
           (mouse_y >= slot_14_y && mouse_y <= slot_14_y + slot_14_height)
           
            if @@shoes_slot_14 != nil
                t = 13 + ((@@page || 1) * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(
                Player::Appearance.get_clothing("shoes").try(&.to_s) || Clothing::Shoes.get_shoes("No Shoes").not_nil!)).not_nil!
                Player::Appearance.change_shoes(@@shoes_slot_14.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shoes_array.uniq!
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_15_x && mouse_x <= slot_15_x + slot_15_width) &&
           (mouse_y >= slot_15_y && mouse_y <= slot_15_y + slot_15_height)
           
            if @@shoes_slot_15 != nil
                t = 14 + ((@@page || 1) * 15) - 15
                
                @@owned_shoes_array[t] = (Clothing::Shoes.get_shoes(
                Player::Appearance.get_clothing("shoes").try(&.to_s) || Clothing::Shoes.get_shoes("No Shoes").not_nil!)).not_nil!
                Player::Appearance.change_shoes(@@shoes_slot_15.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_shoes_array.uniq!
            end
            ClothingTabShoes.assign_slot_textures(window)
            sleep 0.15.seconds
        end

       end

    end

    class ClothingTabSocks
        @@owned_socks_array = [] of Clothing::Socks

        @@socks_sorting_category = "Length"

        @@socks_slot_01 : Clothing::Socks? = nil
        @@socks_slot_02 : Clothing::Socks? = nil
        @@socks_slot_03 : Clothing::Socks? = nil
        @@socks_slot_04 : Clothing::Socks? = nil
        @@socks_slot_05 : Clothing::Socks? = nil
        @@socks_slot_06 : Clothing::Socks? = nil
        @@socks_slot_07 : Clothing::Socks? = nil
        @@socks_slot_08 : Clothing::Socks? = nil
        @@socks_slot_09 : Clothing::Socks? = nil
        @@socks_slot_10 : Clothing::Socks? = nil
        @@socks_slot_11 : Clothing::Socks? = nil
        @@socks_slot_12 : Clothing::Socks? = nil
        @@socks_slot_13 : Clothing::Socks? = nil
        @@socks_slot_14 : Clothing::Socks? = nil
        @@socks_slot_15 : Clothing::Socks? = nil

       #---------------------------------debug-------------------------------------------
        @@owned_socks_array.push(Clothing::Socks.get_socks("No Socks").not_nil!)

        @@owned_socks_array.push(Clothing::Socks.get_socks("W/Socks").not_nil!)
        @@owned_socks_array.push(Clothing::Socks.get_socks("Gy/Socks").not_nil!)
        @@owned_socks_array.push(Clothing::Socks.get_socks("Bk/Socks").not_nil!)
        @@owned_socks_array.push(Clothing::Socks.get_socks("Br/Socks").not_nil!)
        @@owned_socks_array.push(Clothing::Socks.get_socks("R/Socks").not_nil!)
        @@owned_socks_array.push(Clothing::Socks.get_socks("O/Socks").not_nil!)
        @@owned_socks_array.push(Clothing::Socks.get_socks("Y/Socks").not_nil!)
        @@owned_socks_array.push(Clothing::Socks.get_socks("Gn/Socks").not_nil!)
        @@owned_socks_array.push(Clothing::Socks.get_socks("Bl/Socks").not_nil!)
        @@owned_socks_array.push(Clothing::Socks.get_socks("Pr/Socks").not_nil!)
        @@owned_socks_array.push(Clothing::Socks.get_socks("Pk/Socks").not_nil!)

        @@owned_socks_array.push(Clothing::Socks.get_socks("W/Knee Socks").not_nil!)
        @@owned_socks_array.push(Clothing::Socks.get_socks("Gy/Knee Socks").not_nil!)
        @@owned_socks_array.push(Clothing::Socks.get_socks("Bk/Knee Socks").not_nil!)
        @@owned_socks_array.push(Clothing::Socks.get_socks("Br/Knee Socks").not_nil!)
        @@owned_socks_array.push(Clothing::Socks.get_socks("R/Knee Socks").not_nil!)
        @@owned_socks_array.push(Clothing::Socks.get_socks("O/Knee Socks").not_nil!)
        @@owned_socks_array.push(Clothing::Socks.get_socks("Y/Knee Socks").not_nil!)
        @@owned_socks_array.push(Clothing::Socks.get_socks("Gn/Knee Socks").not_nil!)
        @@owned_socks_array.push(Clothing::Socks.get_socks("Bl/Knee Socks").not_nil!)
        @@owned_socks_array.push(Clothing::Socks.get_socks("Pr/Knee Socks").not_nil!)
        @@owned_socks_array.push(Clothing::Socks.get_socks("Pk/Knee Socks").not_nil!)
       #---------------------------------------------------------------------------------

       #--------------------------------objects------------------------------------------
        INVENTORY_BOX = SF::RectangleShape.new(SF.vector2(610, 420))
        INVENTORY_BOX.fill_color = SF.color( 137, 170, 208 )

        
        @@clothing_left_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_left_arrow_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_right_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_right_arrow_sprite.fill_color = SF.color(161, 183, 208)


        @@clothing_sort_button_sprite = SF::RectangleShape.new(SF.vector2(75, 25))
        @@clothing_sort_button_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_socks_category_box = SF::RectangleShape.new(SF.vector2(100, 25))
        @@clothing_socks_category_box.fill_color = SF.color(161, 183, 208)

        @@clothing_sort_button_text = SF::Text.new
        @@clothing_sort_button_text.font = QUICKSAND
        @@clothing_sort_button_text.character_size = 20
        @@clothing_sort_button_text.color = SF::Color::Blue
        @@clothing_sort_button_text.string = "Sort"


        @@clothing_right_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_right_arrow_sprite.fill_color = SF.color(161, 183, 208)

        @@socks_tab = SF::RectangleShape.new(SF.vector2(100, 50))
        @@socks_tab.fill_color = SF.color(141, 163, 188)

        @@socks_tab_text = SF::Text.new
        @@socks_tab_text.font = QUICKSAND
        @@socks_tab_text.character_size = 20
        @@socks_tab_text.color = SF::Color::Blue
        @@socks_tab_text.string = "Socks"

        @@socks_tab = SF::RectangleShape.new(SF.vector2(100, 50))
        @@socks_tab.fill_color = SF.color(161, 183, 208)

        @@socks_tab_text = SF::Text.new
        @@socks_tab_text.font = QUICKSAND
        @@socks_tab_text.character_size = 20
        @@socks_tab_text.color = SF::Color::Blue
        @@socks_tab_text.string = "Socks"


        @@socks_slot_01_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@socks_slot_01_sprite.fill_color = SF.color(161, 183, 208)

        @@socks_slot_01_text = SF::Text.new
        @@socks_slot_01_text.font = QUICKSAND
        @@socks_slot_01_text.character_size = 12
        @@socks_slot_01_text.color = SF::Color::Blue

        @@socks_slot_01_image_sprite = SF::Sprite.new


        @@socks_slot_02_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@socks_slot_02_sprite.fill_color = SF.color(161, 183, 208)

        @@socks_slot_02_text = SF::Text.new
        @@socks_slot_02_text.font = QUICKSAND
        @@socks_slot_02_text.character_size = 12
        @@socks_slot_02_text.color = SF::Color::Blue

        @@socks_slot_02_image_sprite = SF::Sprite.new


        @@socks_slot_03_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@socks_slot_03_sprite.fill_color = SF.color(161, 183, 208)

        @@socks_slot_03_text = SF::Text.new
        @@socks_slot_03_text.font = QUICKSAND
        @@socks_slot_03_text.character_size = 12
        @@socks_slot_03_text.color = SF::Color::Blue

        @@socks_slot_03_image_sprite = SF::Sprite.new


        @@socks_slot_04_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@socks_slot_04_sprite.fill_color = SF.color(161, 183, 208)

        @@socks_slot_04_text = SF::Text.new
        @@socks_slot_04_text.font = QUICKSAND
        @@socks_slot_04_text.character_size = 12
        @@socks_slot_04_text.color = SF::Color::Blue

        @@socks_slot_04_image_sprite = SF::Sprite.new


        @@socks_slot_05_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@socks_slot_05_sprite.fill_color = SF.color(161, 183, 208)

        @@socks_slot_05_text = SF::Text.new
        @@socks_slot_05_text.font = QUICKSAND
        @@socks_slot_05_text.character_size = 12
        @@socks_slot_05_text.color = SF::Color::Blue

        @@socks_slot_05_image_sprite = SF::Sprite.new


        @@socks_slot_06_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@socks_slot_06_sprite.fill_color = SF.color(161, 183, 208)

        @@socks_slot_06_text = SF::Text.new
        @@socks_slot_06_text.font = QUICKSAND
        @@socks_slot_06_text.character_size = 12
        @@socks_slot_06_text.color = SF::Color::Blue
        
        @@socks_slot_06_image_sprite = SF::Sprite.new


        @@socks_slot_07_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@socks_slot_07_sprite.fill_color = SF.color(161, 183, 208)

        @@socks_slot_07_text = SF::Text.new
        @@socks_slot_07_text.font = QUICKSAND
        @@socks_slot_07_text.character_size = 12
        @@socks_slot_07_text.color = SF::Color::Blue

        @@socks_slot_07_image_sprite = SF::Sprite.new


        @@socks_slot_08_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@socks_slot_08_sprite.fill_color = SF.color(161, 183, 208)

        @@socks_slot_08_text = SF::Text.new
        @@socks_slot_08_text.font = QUICKSAND
        @@socks_slot_08_text.character_size = 12
        @@socks_slot_08_text.color = SF::Color::Blue

        @@socks_slot_08_image_sprite = SF::Sprite.new


        @@socks_slot_09_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@socks_slot_09_sprite.fill_color = SF.color(161, 183, 208)

        @@socks_slot_09_text = SF::Text.new
        @@socks_slot_09_text.font = QUICKSAND
        @@socks_slot_09_text.character_size = 12
        @@socks_slot_09_text.color = SF::Color::Blue

        @@socks_slot_09_image_sprite = SF::Sprite.new


        @@socks_slot_10_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@socks_slot_10_sprite.fill_color = SF.color(161, 183, 208)

        @@socks_slot_10_text = SF::Text.new
        @@socks_slot_10_text.font = QUICKSAND
        @@socks_slot_10_text.character_size = 12
        @@socks_slot_10_text.color = SF::Color::Blue

        @@socks_slot_10_image_sprite = SF::Sprite.new


        @@socks_slot_11_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@socks_slot_11_sprite.fill_color = SF.color(161, 183, 208)

        @@socks_slot_11_text = SF::Text.new
        @@socks_slot_11_text.font = QUICKSAND
        @@socks_slot_11_text.character_size = 12
        @@socks_slot_11_text.color = SF::Color::Blue

        @@socks_slot_11_image_sprite = SF::Sprite.new


        @@socks_slot_12_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@socks_slot_12_sprite.fill_color = SF.color(161, 183, 208)

        @@socks_slot_12_text = SF::Text.new
        @@socks_slot_12_text.font = QUICKSAND
        @@socks_slot_12_text.character_size = 12
        @@socks_slot_12_text.color = SF::Color::Blue

        @@socks_slot_12_image_sprite = SF::Sprite.new


        @@socks_slot_13_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@socks_slot_13_sprite.fill_color = SF.color(161, 183, 208)

        @@socks_slot_13_text = SF::Text.new
        @@socks_slot_13_text.font = QUICKSAND
        @@socks_slot_13_text.character_size = 12
        @@socks_slot_13_text.color = SF::Color::Blue

        @@socks_slot_13_image_sprite = SF::Sprite.new


        @@socks_slot_14_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@socks_slot_14_sprite.fill_color = SF.color(161, 183, 208)

        @@socks_slot_14_text = SF::Text.new
        @@socks_slot_14_text.font = QUICKSAND
        @@socks_slot_14_text.character_size = 12
        @@socks_slot_14_text.color = SF::Color::Blue

        @@socks_slot_14_image_sprite = SF::Sprite.new


        @@socks_slot_15_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@socks_slot_15_sprite.fill_color = SF.color(161, 183, 208)

        @@socks_slot_15_text = SF::Text.new
        @@socks_slot_15_text.font = QUICKSAND
        @@socks_slot_15_text.character_size = 12
        @@socks_slot_15_text.color = SF::Color::Blue

        @@socks_slot_15_image_sprite = SF::Sprite.new

       #---------------------------------------------------------------------------------

       def initialize(is_open : Bool, page : Int32)
        @@is_open = is_open
        @@page = page
       end

       def ClothingTabSocks.is_open
        @@is_open
       end

       def ClothingTabSocks.page
        @@page
       end

       def ClothingTabSocks.is_open=(this)
        @@is_open = this
       end

       def ClothingTabSocks.page=(this)
        @@page = this
       end

       def ClothingTabSocks.owned_socks_array
        @@owned_socks_array
       end

       def ClothingTabSocks.owned_socks_array=(this)
        @@owned_socks_array = this
       end

       def ClothingTabSocks.push_to_owned_socks_array(this)
        @@owned_socks_array.push(this)
       end

       def ClothingTabSocks.change_socks_sort_category
        case @@socks_sorting_category
        when "Length"
            @@socks_sorting_category = "Color"
        when "Color"
            @@socks_sorting_category = "Length"
        end
       end

       def ClothingTabSocks.get_socks_category
        return @@socks_sorting_category
       end

       def ClothingTabSocks.initialize_clothing_tab(window)
        @@page = 1
        INVENTORY_BOX.position = SF.vector2(20, 40)  
       end

       def ClothingTabSocks.assign_slot_textures(window)
        if @@page == nil
            @@page = 1
        end
        @@owned_socks_array.uniq!
            t = (@@page.not_nil! - 1) * 15
            if t < @@owned_socks_array.size 
             @@socks_slot_01_image_sprite.texture = @@owned_socks_array[t].texture
             @@socks_slot_01_text.string = @@owned_socks_array[t].name
             @@socks_slot_01 = @@owned_socks_array[t]
            else 
                @@socks_slot_01_image_sprite.texture = NIL_TEXTURE
                @@socks_slot_01_text.string = ""
                @@socks_slot_01 = nil
            end
            t = (@@page.not_nil! - 1) * 15 + 1
            if t < @@owned_socks_array.size 
             @@socks_slot_02_image_sprite.texture = @@owned_socks_array[t].texture
             @@socks_slot_02_text.string = @@owned_socks_array[t].name
             @@socks_slot_02 = @@owned_socks_array[t]
            else
                @@socks_slot_02_image_sprite.texture = NIL_TEXTURE
                @@socks_slot_02_text.string = ""
                @@socks_slot_02 = nil
            end
            t = 2 + (@@page.not_nil! * 15) - 15
            if t < @@owned_socks_array.size 
             @@socks_slot_03_image_sprite.texture = @@owned_socks_array[t].texture
             @@socks_slot_03_text.string = @@owned_socks_array[t].name
             @@socks_slot_03 = @@owned_socks_array[t]
            else
             @@socks_slot_03_image_sprite.texture = NIL_TEXTURE
             @@socks_slot_03_text.string = ""
             @@socks_slot_03 = nil
            end
            t = 3 + (@@page.not_nil! * 15) - 15
            if t < @@owned_socks_array.size
             @@socks_slot_04_image_sprite.texture = @@owned_socks_array[t].texture
             @@socks_slot_04_text.string = @@owned_socks_array[t].name
             @@socks_slot_04 = @@owned_socks_array[t]
            else
             @@socks_slot_04_image_sprite.texture = NIL_TEXTURE
             @@socks_slot_04_text.string = ""
             @@socks_slot_04 = nil
            end
            t = 4 + (@@page.not_nil! * 15) - 15
            if t < @@owned_socks_array.size
             @@socks_slot_05_image_sprite.texture = @@owned_socks_array[t].texture
             @@socks_slot_05_text.string = @@owned_socks_array[t].name
             @@socks_slot_05 = @@owned_socks_array[t]
            else
             @@socks_slot_05_image_sprite.texture = NIL_TEXTURE
             @@socks_slot_05_text.string = ""
             @@socks_slot_05 = nil
            end
            t = 5 + (@@page.not_nil! * 15) - 15
            if t < @@owned_socks_array.size
             @@socks_slot_06_image_sprite.texture = @@owned_socks_array[t].texture
             @@socks_slot_06_text.string = @@owned_socks_array[t].name
             @@socks_slot_06 = @@owned_socks_array[t]
            else
             @@socks_slot_06_image_sprite.texture = NIL_TEXTURE
             @@socks_slot_06_text.string = ""
             @@socks_slot_06 = nil
            end
            t = 6 + (@@page.not_nil! * 15) - 15
            if t < @@owned_socks_array.size
             @@socks_slot_07_image_sprite.texture = @@owned_socks_array[t].texture
             @@socks_slot_07_text.string = @@owned_socks_array[t].name
             @@socks_slot_07 = @@owned_socks_array[t]
            else
             @@socks_slot_07_image_sprite.texture = NIL_TEXTURE
             @@socks_slot_07_text.string = ""
             @@socks_slot_07 = nil
            end
            t = 7 + (@@page.not_nil! * 15) - 15
            if t < @@owned_socks_array.size
             @@socks_slot_08_image_sprite.texture = @@owned_socks_array[t].texture
             @@socks_slot_08_text.string = @@owned_socks_array[t].name
             @@socks_slot_08 = @@owned_socks_array[t]
            else
             @@socks_slot_08_image_sprite.texture = NIL_TEXTURE
             @@socks_slot_08_text.string = ""
             @@socks_slot_08 = nil
            end
            t = 8 + (@@page.not_nil! * 15) - 15
            if t < @@owned_socks_array.size
             @@socks_slot_09_image_sprite.texture = @@owned_socks_array[t].texture
             @@socks_slot_09_text.string = @@owned_socks_array[t].name
             @@socks_slot_09 = @@owned_socks_array[t]
            else
             @@socks_slot_09_image_sprite.texture = NIL_TEXTURE
             @@socks_slot_09_text.string = ""
             @@socks_slot_09 = nil
            end
            t = 9 + (@@page.not_nil! * 15) - 15
            if t < @@owned_socks_array.size
             @@socks_slot_10_image_sprite.texture = @@owned_socks_array[t].texture
             @@socks_slot_10_text.string = @@owned_socks_array[t].name
             @@socks_slot_10 = @@owned_socks_array[t]
            else
             @@socks_slot_10_image_sprite.texture = NIL_TEXTURE
             @@socks_slot_10_text.string = ""
             @@socks_slot_10 = nil
            end
            t = 10 + (@@page.not_nil! * 15) - 15
            if t < @@owned_socks_array.size
             @@socks_slot_11_image_sprite.texture = @@owned_socks_array[t].texture
             @@socks_slot_11_text.string = @@owned_socks_array[t].name
             @@socks_slot_11 = @@owned_socks_array[t]
            else
             @@socks_slot_11_image_sprite.texture = NIL_TEXTURE
             @@socks_slot_11_text.string = ""
             @@socks_slot_11 = nil
            end
            t = 11 + (@@page.not_nil! * 15) - 15
            if t < @@owned_socks_array.size
             @@socks_slot_12_image_sprite.texture = @@owned_socks_array[t].texture
             @@socks_slot_12_text.string = @@owned_socks_array[t].name
             @@socks_slot_12 = @@owned_socks_array[t]
            else
             @@socks_slot_12_image_sprite.texture = NIL_TEXTURE
             @@socks_slot_12_text.string = ""
             @@socks_slot_12 = nil
            end
            t = 12 + (@@page.not_nil! * 15) - 15
            if t < @@owned_socks_array.size
             @@socks_slot_13_image_sprite.texture = @@owned_socks_array[t].texture
             @@socks_slot_13_text.string = @@owned_socks_array[t].name
             @@socks_slot_13 = @@owned_socks_array[t]
            else
             @@socks_slot_13_image_sprite.texture = NIL_TEXTURE
             @@socks_slot_13_text.string = ""
             @@socks_slot_13 = nil
            end
            t = 13 + (@@page.not_nil! * 15) - 15
            if t < @@owned_socks_array.size
             @@socks_slot_14_image_sprite.texture = @@owned_socks_array[t].texture
             @@socks_slot_14_text.string = @@owned_socks_array[t].name
             @@socks_slot_14 = @@owned_socks_array[t]
            else
             @@socks_slot_14_image_sprite.texture = NIL_TEXTURE
             @@socks_slot_14_text.string = ""
             @@socks_slot_14 = nil
            end
            t = 14 + (@@page.not_nil! * 15) - 15
            if t < @@owned_socks_array.size
             @@socks_slot_15_image_sprite.texture = @@owned_socks_array[t].texture
             @@socks_slot_15_text.string = @@owned_socks_array[t].name
             @@socks_slot_15 = @@owned_socks_array[t]
            else
             @@socks_slot_15_image_sprite.texture = NIL_TEXTURE
             @@socks_slot_15_text.string = ""
             @@socks_slot_15 = nil
            end
        @@owned_socks_array.uniq!
       end
       
       def ClothingTabSocks.draw_clothing_tab(window)
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


        @@socks_slot_01_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 40 * max_scale)
        @@socks_slot_01_sprite.scale = SF.vector2(1, 1)
        
        @@socks_slot_01_image_sprite.position = @@socks_slot_01_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@socks_slot_01_image_sprite.scale = SF.vector2(2, 2)
        @@socks_slot_01_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        @@socks_slot_01_text.position = @@socks_slot_01_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@socks_slot_01_text)
        

        @@socks_slot_02_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 40 * max_scale)
        @@socks_slot_02_sprite.scale = SF.vector2(1, 1)
        
        @@socks_slot_02_image_sprite.position = @@socks_slot_02_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@socks_slot_02_image_sprite.scale = SF.vector2(2, 2)
        @@socks_slot_02_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        @@socks_slot_02_text.position = @@socks_slot_02_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@socks_slot_02_text)
        

        @@socks_slot_03_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 40 * max_scale)
        @@socks_slot_03_sprite.scale = SF.vector2(1, 1)
        
        @@socks_slot_03_image_sprite.position = @@socks_slot_03_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@socks_slot_03_image_sprite.scale = SF.vector2(2, 2)
        @@socks_slot_03_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        @@socks_slot_03_text.position = @@socks_slot_03_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@socks_slot_03_text)
        

        @@socks_slot_04_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 40 * max_scale)
        @@socks_slot_04_sprite.scale = SF.vector2(1, 1)

        @@socks_slot_04_text.position = @@socks_slot_04_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@socks_slot_04_text)
        
        @@socks_slot_04_image_sprite.position = @@socks_slot_04_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@socks_slot_04_image_sprite.scale = SF.vector2(2, 2)
        @@socks_slot_04_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)


        @@socks_slot_05_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 40 * max_scale)
        @@socks_slot_05_sprite.scale = SF.vector2(1, 1)

        @@socks_slot_05_text.position = @@socks_slot_05_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@socks_slot_05_text)
        
        @@socks_slot_05_image_sprite.position = @@socks_slot_05_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@socks_slot_05_image_sprite.scale = SF.vector2(2, 2)
        @@socks_slot_05_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@socks_slot_06_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 120 * max_scale)
        @@socks_slot_06_sprite.scale = SF.vector2(1, 1)

        @@socks_slot_06_text.position = @@socks_slot_06_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@socks_slot_06_text)
        
        @@socks_slot_06_image_sprite.position = @@socks_slot_06_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@socks_slot_06_image_sprite.scale = SF.vector2(2, 2)
        @@socks_slot_06_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@socks_slot_07_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 120 * max_scale)
        @@socks_slot_07_sprite.scale = SF.vector2(1, 1)
        
        @@socks_slot_07_text.position = @@socks_slot_07_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@socks_slot_07_text)
        
        @@socks_slot_07_image_sprite.position = @@socks_slot_07_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@socks_slot_07_image_sprite.scale = SF.vector2(2, 2)
        @@socks_slot_07_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@socks_slot_08_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 120 * max_scale)
        @@socks_slot_08_sprite.scale = SF.vector2(1, 1)
                
        @@socks_slot_08_text.position = @@socks_slot_08_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@socks_slot_08_text)
        
        @@socks_slot_08_image_sprite.position = @@socks_slot_08_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@socks_slot_08_image_sprite.scale = SF.vector2(2, 2)
        @@socks_slot_08_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@socks_slot_09_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 120 * max_scale)
        @@socks_slot_09_sprite.scale = SF.vector2(1, 1)
                
        @@socks_slot_09_text.position = @@socks_slot_09_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@socks_slot_09_text)
        
        @@socks_slot_09_image_sprite.position = @@socks_slot_09_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@socks_slot_09_image_sprite.scale = SF.vector2(2, 2)
        @@socks_slot_09_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@socks_slot_10_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 120 * max_scale)
        @@socks_slot_10_sprite.scale = SF.vector2(1, 1)
                        
        @@socks_slot_10_text.position = @@socks_slot_10_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@socks_slot_10_text)
        
        @@socks_slot_10_image_sprite.position = @@socks_slot_10_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@socks_slot_10_image_sprite.scale = SF.vector2(2, 2)
        @@socks_slot_10_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@socks_slot_11_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 200 * max_scale)
        @@socks_slot_11_sprite.scale = SF.vector2(1, 1)
                        
        @@socks_slot_11_text.position = @@socks_slot_11_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@socks_slot_11_text)
        
        @@socks_slot_11_image_sprite.position = @@socks_slot_11_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@socks_slot_11_image_sprite.scale = SF.vector2(2, 2)
        @@socks_slot_11_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@socks_slot_12_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 200 * max_scale)
        @@socks_slot_12_sprite.scale = SF.vector2(1, 1)
                        
        @@socks_slot_12_text.position = @@socks_slot_12_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@socks_slot_12_text)
        
        @@socks_slot_12_image_sprite.position = @@socks_slot_12_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@socks_slot_12_image_sprite.scale = SF.vector2(2, 2)
        @@socks_slot_12_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@socks_slot_13_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 200 * max_scale)
        @@socks_slot_13_sprite.scale = SF.vector2(1, 1)
        
        @@socks_slot_13_text.position = @@socks_slot_13_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@socks_slot_13_text)
        
        @@socks_slot_13_image_sprite.position = @@socks_slot_13_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@socks_slot_13_image_sprite.scale = SF.vector2(2, 2)
        @@socks_slot_13_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@socks_slot_14_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 200 * max_scale)
        @@socks_slot_14_sprite.scale = SF.vector2(1, 1)
                        
        @@socks_slot_14_text.position = @@socks_slot_14_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@socks_slot_14_text)
        
        @@socks_slot_14_image_sprite.position = @@socks_slot_14_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@socks_slot_14_image_sprite.scale = SF.vector2(2, 2)
        @@socks_slot_14_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@socks_slot_15_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 200 * max_scale)
        @@socks_slot_15_sprite.scale = SF.vector2(1, 1)
                        
        @@socks_slot_15_text.position = @@socks_slot_15_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@socks_slot_15_text)
        
        @@socks_slot_15_image_sprite.position = @@socks_slot_15_sprite.position - SF.vector2(30 * max_scale, 120 * max_scale)
        @@socks_slot_15_image_sprite.scale = SF.vector2(2, 2)
        @@socks_slot_15_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)


        window.draw(@@socks_slot_01_sprite)
        window.draw(@@socks_slot_01_image_sprite)
        window.draw(@@socks_slot_01_text)

        window.draw(@@socks_slot_02_sprite)
        window.draw(@@socks_slot_02_image_sprite)
        window.draw(@@socks_slot_02_text)

        window.draw(@@socks_slot_03_sprite)
        window.draw(@@socks_slot_03_image_sprite)
        window.draw(@@socks_slot_03_text)
        
        window.draw(@@socks_slot_04_sprite)
        window.draw(@@socks_slot_04_image_sprite)
        window.draw(@@socks_slot_04_text)

        window.draw(@@socks_slot_05_sprite)
        window.draw(@@socks_slot_05_image_sprite)
        window.draw(@@socks_slot_05_text)

        window.draw(@@socks_slot_06_sprite)
        window.draw(@@socks_slot_06_image_sprite)
        window.draw(@@socks_slot_06_text)

        window.draw(@@socks_slot_07_sprite)
        window.draw(@@socks_slot_07_image_sprite)
        window.draw(@@socks_slot_07_text)

        window.draw(@@socks_slot_08_sprite)
        window.draw(@@socks_slot_08_image_sprite)
        window.draw(@@socks_slot_08_text)

        window.draw(@@socks_slot_09_sprite)
        window.draw(@@socks_slot_09_image_sprite)
        window.draw(@@socks_slot_09_text)

        window.draw(@@socks_slot_10_sprite)
        window.draw(@@socks_slot_10_image_sprite)
        window.draw(@@socks_slot_10_text)

        window.draw(@@socks_slot_11_sprite)
        window.draw(@@socks_slot_11_image_sprite)
        window.draw(@@socks_slot_11_text)

        window.draw(@@socks_slot_12_sprite)
        window.draw(@@socks_slot_12_image_sprite)
        window.draw(@@socks_slot_12_text)

        window.draw(@@socks_slot_13_sprite)
        window.draw(@@socks_slot_13_image_sprite)
        window.draw(@@socks_slot_13_text)

        window.draw(@@socks_slot_14_sprite)
        window.draw(@@socks_slot_14_image_sprite)
        window.draw(@@socks_slot_14_text)

        window.draw(@@socks_slot_15_sprite)
        window.draw(@@socks_slot_15_image_sprite)
        window.draw(@@socks_slot_15_text)

        if SF::Mouse.button_pressed?(SF::Mouse::Left)
            ClothingTabSocks.clothes_mouse_handling(window)
        end
       end

       def ClothingTabSocks.clothes_mouse_handling(window)
        mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window))
        mouse_x = mouse_position.x
        mouse_y = mouse_position.y
        
    
        current_size = window.size
        original_width = 800 
        original_height = 600 

        scale_x = (current_size.x.to_f / original_width)
        scale_y = current_size.y.to_f / original_height
        

        #------------------------------------objects-------------------------------------------------

            slot_01_x = @@socks_slot_01_sprite.position.x
            slot_01_y = @@socks_slot_01_sprite.position.y
            slot_01_width = @@socks_slot_01_sprite.size.x
            slot_01_height = @@socks_slot_01_sprite.size.y

            slot_02_x = @@socks_slot_02_sprite.position.x
            slot_02_y = @@socks_slot_02_sprite.position.y
            slot_02_width = @@socks_slot_02_sprite.size.x
            slot_02_height = @@socks_slot_02_sprite.size.y

            slot_03_x = @@socks_slot_03_sprite.position.x
            slot_03_y = @@socks_slot_03_sprite.position.y
            slot_03_width = @@socks_slot_03_sprite.size.x
            slot_03_height = @@socks_slot_03_sprite.size.y

            slot_04_x = @@socks_slot_04_sprite.position.x
            slot_04_y = @@socks_slot_04_sprite.position.y
            slot_04_width = @@socks_slot_04_sprite.size.x
            slot_04_height = @@socks_slot_04_sprite.size.y

            slot_05_x = @@socks_slot_05_sprite.position.x
            slot_05_y = @@socks_slot_05_sprite.position.y
            slot_05_width = @@socks_slot_05_sprite.size.x
            slot_05_height = @@socks_slot_05_sprite.size.y

            slot_06_x = @@socks_slot_06_sprite.position.x
            slot_06_y = @@socks_slot_06_sprite.position.y
            slot_06_width = @@socks_slot_06_sprite.size.x
            slot_06_height = @@socks_slot_06_sprite.size.y

            slot_07_x = @@socks_slot_07_sprite.position.x
            slot_07_y = @@socks_slot_07_sprite.position.y
            slot_07_width = @@socks_slot_07_sprite.size.x
            slot_07_height = @@socks_slot_07_sprite.size.y

            slot_08_x = @@socks_slot_08_sprite.position.x
            slot_08_y = @@socks_slot_08_sprite.position.y
            slot_08_width = @@socks_slot_08_sprite.size.x
            slot_08_height = @@socks_slot_08_sprite.size.y

            slot_09_x = @@socks_slot_09_sprite.position.x
            slot_09_y = @@socks_slot_09_sprite.position.y
            slot_09_width = @@socks_slot_09_sprite.size.x
            slot_09_height = @@socks_slot_09_sprite.size.y

            slot_10_x = @@socks_slot_10_sprite.position.x
            slot_10_y = @@socks_slot_10_sprite.position.y
            slot_10_width = @@socks_slot_10_sprite.size.x
            slot_10_height = @@socks_slot_10_sprite.size.y

            slot_11_x = @@socks_slot_11_sprite.position.x
            slot_11_y = @@socks_slot_11_sprite.position.y
            slot_11_width = @@socks_slot_11_sprite.size.x
            slot_11_height = @@socks_slot_11_sprite.size.y

            slot_12_x = @@socks_slot_12_sprite.position.x
            slot_12_y = @@socks_slot_12_sprite.position.y
            slot_12_width = @@socks_slot_12_sprite.size.x
            slot_12_height = @@socks_slot_12_sprite.size.y

            slot_13_x = @@socks_slot_13_sprite.position.x
            slot_13_y = @@socks_slot_13_sprite.position.y
            slot_13_width = @@socks_slot_13_sprite.size.x
            slot_13_height = @@socks_slot_13_sprite.size.y

            slot_14_x = @@socks_slot_14_sprite.position.x
            slot_14_y = @@socks_slot_14_sprite.position.y
            slot_14_width = @@socks_slot_14_sprite.size.x
            slot_14_height = @@socks_slot_14_sprite.size.y

            slot_15_x = @@socks_slot_15_sprite.position.x
            slot_15_y = @@socks_slot_15_sprite.position.y
            slot_15_width = @@socks_slot_15_sprite.size.x
            slot_15_height = @@socks_slot_15_sprite.size.y
        #---------------------------------------------------------------------------------------------
        
        if (mouse_x >= slot_01_x && mouse_x <= slot_01_x + slot_01_width) &&
           (mouse_y >= slot_01_y && mouse_y <= slot_01_y + slot_01_height)
            if @@socks_slot_01 != nil   
                t = 0 + ((@@page || 1) * 15) - 15
                
                @@owned_socks_array[t] = (Clothing::Socks.get_socks(
                Player::Appearance.get_clothing("socks").try(&.to_s) || Clothing::Socks.get_socks("No Socks").not_nil!)).not_nil!
                Player::Appearance.change_socks(@@socks_slot_01.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                
            end
            ClothingTabSocks.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_02_x && mouse_x <= slot_02_x + slot_02_width) &&
           (mouse_y >= slot_02_y && mouse_y <= slot_02_y + slot_02_height)
           
            if @@socks_slot_02 != nil
                t = 1 + ((@@page || 1) * 15) - 15
                
                @@owned_socks_array[t] = (Clothing::Socks.get_socks(
                Player::Appearance.get_clothing("socks").try(&.to_s) || Clothing::Socks.get_socks("No Socks").not_nil!)).not_nil!
                Player::Appearance.change_socks(@@socks_slot_02.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabSocks.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_03_x && mouse_x <= slot_03_x + slot_03_width) &&
           (mouse_y >= slot_03_y && mouse_y <= slot_03_y + slot_03_height)
           
            if @@socks_slot_03 != nil
                t = 2 + ((@@page || 1) * 15) - 15
                
                @@owned_socks_array[t] = (Clothing::Socks.get_socks(
                Player::Appearance.get_clothing("socks").try(&.to_s) || Clothing::Socks.get_socks("No Socks").not_nil!)).not_nil!
                Player::Appearance.change_socks(@@socks_slot_03.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabSocks.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_04_x && mouse_x <= slot_04_x + slot_04_width) &&
           (mouse_y >= slot_04_y && mouse_y <= slot_04_y + slot_04_height)
           
            if @@socks_slot_04 != nil
                t = 3 + ((@@page || 1) * 15) - 15
                
                @@owned_socks_array[t] = (Clothing::Socks.get_socks(
                Player::Appearance.get_clothing("socks").try(&.to_s) || Clothing::Socks.get_socks("No Socks").not_nil!)).not_nil!
                Player::Appearance.change_socks(@@socks_slot_04.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabSocks.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_05_x && mouse_x <= slot_05_x + slot_05_width) &&
           (mouse_y >= slot_05_y && mouse_y <= slot_05_y + slot_05_height)
           
            if @@socks_slot_05 != nil
                t = 4 + ((@@page || 1) * 15) - 15
                
                @@owned_socks_array[t] = (Clothing::Socks.get_socks(
                Player::Appearance.get_clothing("socks").try(&.to_s) || Clothing::Socks.get_socks("No Socks").not_nil!)).not_nil!
                Player::Appearance.change_socks(@@socks_slot_05.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabSocks.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_06_x && mouse_x <= slot_06_x + slot_06_width) &&
           (mouse_y >= slot_06_y && mouse_y <= slot_06_y + slot_06_height)
           
            if @@socks_slot_06 != nil
                t = 5 + ((@@page || 1) * 15) - 15
                
                @@owned_socks_array[t] = (Clothing::Socks.get_socks(
                Player::Appearance.get_clothing("socks").try(&.to_s) || Clothing::Socks.get_socks("No Socks").not_nil!)).not_nil!
                Player::Appearance.change_socks(@@socks_slot_06.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabSocks.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_07_x && mouse_x <= slot_07_x + slot_07_width) &&
           (mouse_y >= slot_07_y && mouse_y <= slot_07_y + slot_07_height)
           
            if @@socks_slot_07 != nil
                t = 6 + ((@@page || 1) * 15) - 15
                
                @@owned_socks_array[t] = (Clothing::Socks.get_socks(
                Player::Appearance.get_clothing("socks").try(&.to_s) || Clothing::Socks.get_socks("No Socks").not_nil!)).not_nil!
                Player::Appearance.change_socks(@@socks_slot_07.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabSocks.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_08_x && mouse_x <= slot_08_x + slot_08_width) &&
           (mouse_y >= slot_08_y && mouse_y <= slot_08_y + slot_08_height)
           
            if @@socks_slot_08 != nil
                t = 7 + ((@@page || 1) * 15) - 15
                
                @@owned_socks_array[t] = (Clothing::Socks.get_socks(
                Player::Appearance.get_clothing("socks").try(&.to_s) || Clothing::Socks.get_socks("No Socks").not_nil!)).not_nil!
                Player::Appearance.change_socks(@@socks_slot_08.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabSocks.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_09_x && mouse_x <= slot_09_x + slot_09_width) &&
           (mouse_y >= slot_09_y && mouse_y <= slot_09_y + slot_09_height)
           
            if @@socks_slot_09 != nil
                t = 8 + ((@@page || 1) * 15) - 15
                
                @@owned_socks_array[t] = (Clothing::Socks.get_socks(
                Player::Appearance.get_clothing("socks").try(&.to_s) || Clothing::Socks.get_socks("No Socks").not_nil!)).not_nil!
                Player::Appearance.change_socks(@@socks_slot_09.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabSocks.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_10_x && mouse_x <= slot_10_x + slot_10_width) &&
           (mouse_y >= slot_10_y && mouse_y <= slot_10_y + slot_10_height)
           
            if @@socks_slot_10 != nil
                t = 9 + ((@@page || 1) * 15) - 15
                
                @@owned_socks_array[t] = (Clothing::Socks.get_socks(
                Player::Appearance.get_clothing("socks").try(&.to_s) || Clothing::Socks.get_socks("No Socks").not_nil!)).not_nil!
                Player::Appearance.change_socks(@@socks_slot_10.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabSocks.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_11_x && mouse_x <= slot_11_x + slot_11_width) &&
           (mouse_y >= slot_11_y && mouse_y <= slot_11_y + slot_11_height)
           
            if @@socks_slot_11 != nil
                t = 10 + ((@@page || 1) * 15) - 15
                
                @@owned_socks_array[t] = (Clothing::Socks.get_socks(
                Player::Appearance.get_clothing("socks").try(&.to_s) || Clothing::Socks.get_socks("No Socks").not_nil!)).not_nil!
                Player::Appearance.change_socks(@@socks_slot_11.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabSocks.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_12_x && mouse_x <= slot_12_x + slot_12_width) &&
           (mouse_y >= slot_12_y && mouse_y <= slot_12_y + slot_12_height)
           
            if @@socks_slot_12 != nil
                t = 11 + ((@@page || 1) * 15) - 15
                
                @@owned_socks_array[t] = (Clothing::Socks.get_socks(
                Player::Appearance.get_clothing("socks").try(&.to_s) || Clothing::Socks.get_socks("No Socks").not_nil!)).not_nil!
                Player::Appearance.change_socks(@@socks_slot_12.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabSocks.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_13_x && mouse_x <= slot_13_x + slot_13_width) &&
           (mouse_y >= slot_13_y && mouse_y <= slot_13_y + slot_13_height)
           
            if @@socks_slot_13 != nil
                t = 12 + ((@@page || 1) * 15) - 15
                
                @@owned_socks_array[t] = (Clothing::Socks.get_socks(
                Player::Appearance.get_clothing("socks").try(&.to_s) || Clothing::Socks.get_socks("No Socks").not_nil!)).not_nil!
                Player::Appearance.change_socks(@@socks_slot_13.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabSocks.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_14_x && mouse_x <= slot_14_x + slot_14_width) &&
           (mouse_y >= slot_14_y && mouse_y <= slot_14_y + slot_14_height)
           
            if @@socks_slot_14 != nil
                t = 13 + ((@@page || 1) * 15) - 15
                
                @@owned_socks_array[t] = (Clothing::Socks.get_socks(
                Player::Appearance.get_clothing("socks").try(&.to_s) || Clothing::Socks.get_socks("No Socks").not_nil!)).not_nil!
                Player::Appearance.change_socks(@@socks_slot_14.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabSocks.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_15_x && mouse_x <= slot_15_x + slot_15_width) &&
           (mouse_y >= slot_15_y && mouse_y <= slot_15_y + slot_15_height)
           
            if @@socks_slot_15 != nil
                t = 14 + ((@@page || 1) * 15) - 15
                
                @@owned_socks_array[t] = (Clothing::Socks.get_socks(
                Player::Appearance.get_clothing("socks").try(&.to_s) || Clothing::Socks.get_socks("No Socks").not_nil!)).not_nil!
                Player::Appearance.change_socks(@@socks_slot_15.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabSocks.assign_slot_textures(window)
            sleep 0.15.seconds
        end

       end

    end

    class ClothingTabGloves
        @@owned_gloves_array = [] of Clothing::Gloves

        @@gloves_sorting_category = "Length"

        @@gloves_slot_01 : Clothing::Gloves? = nil
        @@gloves_slot_02 : Clothing::Gloves? = nil
        @@gloves_slot_03 : Clothing::Gloves? = nil
        @@gloves_slot_04 : Clothing::Gloves? = nil
        @@gloves_slot_05 : Clothing::Gloves? = nil
        @@gloves_slot_06 : Clothing::Gloves? = nil
        @@gloves_slot_07 : Clothing::Gloves? = nil
        @@gloves_slot_08 : Clothing::Gloves? = nil
        @@gloves_slot_09 : Clothing::Gloves? = nil
        @@gloves_slot_10 : Clothing::Gloves? = nil
        @@gloves_slot_11 : Clothing::Gloves? = nil
        @@gloves_slot_12 : Clothing::Gloves? = nil
        @@gloves_slot_13 : Clothing::Gloves? = nil
        @@gloves_slot_14 : Clothing::Gloves? = nil
        @@gloves_slot_15 : Clothing::Gloves? = nil

       #---------------------------------debug-------------------------------------------
        @@owned_gloves_array.push(Clothing::Gloves.get_gloves("W/Fngrless Gloves").not_nil!)
        @@owned_gloves_array.push(Clothing::Gloves.get_gloves("Bk/Fngrless Gloves").not_nil!)
        @@owned_gloves_array.push(Clothing::Gloves.get_gloves("R/Fngrless Gloves").not_nil!)
        @@owned_gloves_array.push(Clothing::Gloves.get_gloves("O/Fngrless Gloves").not_nil!)
        @@owned_gloves_array.push(Clothing::Gloves.get_gloves("Y/Fngrless Gloves").not_nil!)
        @@owned_gloves_array.push(Clothing::Gloves.get_gloves("G/Fngrless Gloves").not_nil!)
        @@owned_gloves_array.push(Clothing::Gloves.get_gloves("Bl/Fngrless Gloves").not_nil!)
        @@owned_gloves_array.push(Clothing::Gloves.get_gloves("Pr/Fngrless Gloves").not_nil!)
        @@owned_gloves_array.push(Clothing::Gloves.get_gloves("Pk/Fngrless Gloves").not_nil!)

        @@owned_gloves_array.push(Clothing::Gloves.get_gloves("White Gloves").not_nil!)
        @@owned_gloves_array.push(Clothing::Gloves.get_gloves("Black Gloves").not_nil!)
        @@owned_gloves_array.push(Clothing::Gloves.get_gloves("Red Gloves").not_nil!)
        @@owned_gloves_array.push(Clothing::Gloves.get_gloves("Orange Gloves").not_nil!)
        @@owned_gloves_array.push(Clothing::Gloves.get_gloves("Yellow Gloves").not_nil!)
        @@owned_gloves_array.push(Clothing::Gloves.get_gloves("Green Gloves").not_nil!)
        @@owned_gloves_array.push(Clothing::Gloves.get_gloves("Blue Gloves").not_nil!)
        @@owned_gloves_array.push(Clothing::Gloves.get_gloves("Purple Gloves").not_nil!)
        @@owned_gloves_array.push(Clothing::Gloves.get_gloves("Pink Gloves").not_nil!)

        @@owned_gloves_array.push(Clothing::Gloves.get_gloves("White Opera Gloves").not_nil!)
        @@owned_gloves_array.push(Clothing::Gloves.get_gloves("Black Opera Gloves").not_nil!)
        @@owned_gloves_array.push(Clothing::Gloves.get_gloves("Red Opera Gloves").not_nil!)
        @@owned_gloves_array.push(Clothing::Gloves.get_gloves("Orange Opera Gloves").not_nil!)
        @@owned_gloves_array.push(Clothing::Gloves.get_gloves("Yellow Opera Gloves").not_nil!)
        @@owned_gloves_array.push(Clothing::Gloves.get_gloves("Green Opera Gloves").not_nil!)
        @@owned_gloves_array.push(Clothing::Gloves.get_gloves("Blue Opera Gloves").not_nil!)
        @@owned_gloves_array.push(Clothing::Gloves.get_gloves("Purple Opera Gloves").not_nil!)
        @@owned_gloves_array.push(Clothing::Gloves.get_gloves("Pink Opera Gloves").not_nil!)
       #---------------------------------------------------------------------------------

       #--------------------------------objects------------------------------------------
        INVENTORY_BOX = SF::RectangleShape.new(SF.vector2(610, 420))
        INVENTORY_BOX.fill_color = SF.color( 137, 170, 208 )

        
        @@clothing_left_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_left_arrow_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_right_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_right_arrow_sprite.fill_color = SF.color(161, 183, 208)


        @@clothing_sort_button_sprite = SF::RectangleShape.new(SF.vector2(75, 25))
        @@clothing_sort_button_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_gloves_category_box = SF::RectangleShape.new(SF.vector2(100, 25))
        @@clothing_gloves_category_box.fill_color = SF.color(161, 183, 208)

        @@clothing_sort_button_text = SF::Text.new
        @@clothing_sort_button_text.font = QUICKSAND
        @@clothing_sort_button_text.character_size = 20
        @@clothing_sort_button_text.color = SF::Color::Blue
        @@clothing_sort_button_text.string = "Sort"


        @@clothing_right_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_right_arrow_sprite.fill_color = SF.color(161, 183, 208)

        @@gloves_tab = SF::RectangleShape.new(SF.vector2(100, 50))
        @@gloves_tab.fill_color = SF.color(141, 163, 188)

        @@gloves_tab_text = SF::Text.new
        @@gloves_tab_text.font = QUICKSAND
        @@gloves_tab_text.character_size = 20
        @@gloves_tab_text.color = SF::Color::Blue
        @@gloves_tab_text.string = "Glovess"

        @@gloves_tab = SF::RectangleShape.new(SF.vector2(100, 50))
        @@gloves_tab.fill_color = SF.color(161, 183, 208)

        @@gloves_tab_text = SF::Text.new
        @@gloves_tab_text.font = QUICKSAND
        @@gloves_tab_text.character_size = 20
        @@gloves_tab_text.color = SF::Color::Blue
        @@gloves_tab_text.string = "Gloves"


        @@gloves_slot_01_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@gloves_slot_01_sprite.fill_color = SF.color(161, 183, 208)

        @@gloves_slot_01_text = SF::Text.new
        @@gloves_slot_01_text.font = QUICKSAND
        @@gloves_slot_01_text.character_size = 12
        @@gloves_slot_01_text.color = SF::Color::Blue

        @@gloves_slot_01_image_sprite = SF::Sprite.new


        @@gloves_slot_02_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@gloves_slot_02_sprite.fill_color = SF.color(161, 183, 208)

        @@gloves_slot_02_text = SF::Text.new
        @@gloves_slot_02_text.font = QUICKSAND
        @@gloves_slot_02_text.character_size = 12
        @@gloves_slot_02_text.color = SF::Color::Blue

        @@gloves_slot_02_image_sprite = SF::Sprite.new


        @@gloves_slot_03_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@gloves_slot_03_sprite.fill_color = SF.color(161, 183, 208)

        @@gloves_slot_03_text = SF::Text.new
        @@gloves_slot_03_text.font = QUICKSAND
        @@gloves_slot_03_text.character_size = 12
        @@gloves_slot_03_text.color = SF::Color::Blue

        @@gloves_slot_03_image_sprite = SF::Sprite.new


        @@gloves_slot_04_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@gloves_slot_04_sprite.fill_color = SF.color(161, 183, 208)

        @@gloves_slot_04_text = SF::Text.new
        @@gloves_slot_04_text.font = QUICKSAND
        @@gloves_slot_04_text.character_size = 12
        @@gloves_slot_04_text.color = SF::Color::Blue

        @@gloves_slot_04_image_sprite = SF::Sprite.new


        @@gloves_slot_05_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@gloves_slot_05_sprite.fill_color = SF.color(161, 183, 208)

        @@gloves_slot_05_text = SF::Text.new
        @@gloves_slot_05_text.font = QUICKSAND
        @@gloves_slot_05_text.character_size = 12
        @@gloves_slot_05_text.color = SF::Color::Blue

        @@gloves_slot_05_image_sprite = SF::Sprite.new


        @@gloves_slot_06_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@gloves_slot_06_sprite.fill_color = SF.color(161, 183, 208)

        @@gloves_slot_06_text = SF::Text.new
        @@gloves_slot_06_text.font = QUICKSAND
        @@gloves_slot_06_text.character_size = 12
        @@gloves_slot_06_text.color = SF::Color::Blue
        
        @@gloves_slot_06_image_sprite = SF::Sprite.new


        @@gloves_slot_07_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@gloves_slot_07_sprite.fill_color = SF.color(161, 183, 208)

        @@gloves_slot_07_text = SF::Text.new
        @@gloves_slot_07_text.font = QUICKSAND
        @@gloves_slot_07_text.character_size = 12
        @@gloves_slot_07_text.color = SF::Color::Blue

        @@gloves_slot_07_image_sprite = SF::Sprite.new


        @@gloves_slot_08_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@gloves_slot_08_sprite.fill_color = SF.color(161, 183, 208)

        @@gloves_slot_08_text = SF::Text.new
        @@gloves_slot_08_text.font = QUICKSAND
        @@gloves_slot_08_text.character_size = 12
        @@gloves_slot_08_text.color = SF::Color::Blue

        @@gloves_slot_08_image_sprite = SF::Sprite.new


        @@gloves_slot_09_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@gloves_slot_09_sprite.fill_color = SF.color(161, 183, 208)

        @@gloves_slot_09_text = SF::Text.new
        @@gloves_slot_09_text.font = QUICKSAND
        @@gloves_slot_09_text.character_size = 12
        @@gloves_slot_09_text.color = SF::Color::Blue

        @@gloves_slot_09_image_sprite = SF::Sprite.new


        @@gloves_slot_10_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@gloves_slot_10_sprite.fill_color = SF.color(161, 183, 208)

        @@gloves_slot_10_text = SF::Text.new
        @@gloves_slot_10_text.font = QUICKSAND
        @@gloves_slot_10_text.character_size = 12
        @@gloves_slot_10_text.color = SF::Color::Blue

        @@gloves_slot_10_image_sprite = SF::Sprite.new


        @@gloves_slot_11_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@gloves_slot_11_sprite.fill_color = SF.color(161, 183, 208)

        @@gloves_slot_11_text = SF::Text.new
        @@gloves_slot_11_text.font = QUICKSAND
        @@gloves_slot_11_text.character_size = 12
        @@gloves_slot_11_text.color = SF::Color::Blue

        @@gloves_slot_11_image_sprite = SF::Sprite.new


        @@gloves_slot_12_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@gloves_slot_12_sprite.fill_color = SF.color(161, 183, 208)

        @@gloves_slot_12_text = SF::Text.new
        @@gloves_slot_12_text.font = QUICKSAND
        @@gloves_slot_12_text.character_size = 12
        @@gloves_slot_12_text.color = SF::Color::Blue

        @@gloves_slot_12_image_sprite = SF::Sprite.new


        @@gloves_slot_13_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@gloves_slot_13_sprite.fill_color = SF.color(161, 183, 208)

        @@gloves_slot_13_text = SF::Text.new
        @@gloves_slot_13_text.font = QUICKSAND
        @@gloves_slot_13_text.character_size = 12
        @@gloves_slot_13_text.color = SF::Color::Blue

        @@gloves_slot_13_image_sprite = SF::Sprite.new


        @@gloves_slot_14_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@gloves_slot_14_sprite.fill_color = SF.color(161, 183, 208)

        @@gloves_slot_14_text = SF::Text.new
        @@gloves_slot_14_text.font = QUICKSAND
        @@gloves_slot_14_text.character_size = 12
        @@gloves_slot_14_text.color = SF::Color::Blue

        @@gloves_slot_14_image_sprite = SF::Sprite.new


        @@gloves_slot_15_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@gloves_slot_15_sprite.fill_color = SF.color(161, 183, 208)

        @@gloves_slot_15_text = SF::Text.new
        @@gloves_slot_15_text.font = QUICKSAND
        @@gloves_slot_15_text.character_size = 12
        @@gloves_slot_15_text.color = SF::Color::Blue

        @@gloves_slot_15_image_sprite = SF::Sprite.new

       #---------------------------------------------------------------------------------

       def initialize(is_open : Bool, page : Int32)
        @@is_open = is_open
        @@page = page
       end

       def ClothingTabGloves.is_open
        @@is_open
       end

       def ClothingTabGloves.page
        @@page
       end

       def ClothingTabGloves.is_open=(this)
        @@is_open = this
       end

       def ClothingTabGloves.page=(this)
        @@page = this
       end

       def ClothingTabGloves.owned_gloves_array
        @@owned_gloves_array
       end

       def ClothingTabGloves.owned_gloves_array=(this)
        @@owned_gloves_array = this
       end

       def ClothingTabGloves.push_to_owned_gloves_array(this)
        @@owned_gloves_array.push(this)
       end

       def ClothingTabGloves.change_gloves_sort_category
        case @@gloves_sorting_category
        when "Length"
            @@gloves_sorting_category = "Color"
        when "Color"
            @@gloves_sorting_category = "Length"
        end
       end

       def ClothingTabGloves.get_gloves_category
        return @@gloves_sorting_category
       end

       def ClothingTabGloves.initialize_clothing_tab(window)
        @@page = 1
        INVENTORY_BOX.position = SF.vector2(20, 40)  
       end

       def ClothingTabGloves.assign_slot_textures(window)
        if @@page == nil
            @@page = 1
        end
        if @@owned_gloves_array.size > 0
            t = (@@page.not_nil! * 15) - 15
            if t <= @@owned_gloves_array.size - 1
             @@gloves_slot_01_image_sprite.texture = @@owned_gloves_array[t].texture
             @@gloves_slot_01_text.string = @@owned_gloves_array[t].name
             @@gloves_slot_01 = @@owned_gloves_array[t]
            else
                @@gloves_slot_01_image_sprite.texture = NIL_TEXTURE
                @@gloves_slot_01_text.string = ""
                @@gloves_slot_01 = nil
            end
        end
        if @@owned_gloves_array.size > 1
            t = 1 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_gloves_array.size - 1
             @@gloves_slot_02_image_sprite.texture = @@owned_gloves_array[t].texture
             @@gloves_slot_02_text.string = @@owned_gloves_array[t].name
             @@gloves_slot_02 = @@owned_gloves_array[t]
            else
                puts "nil slot 2"
                @@gloves_slot_02_image_sprite.texture = NIL_TEXTURE
                @@gloves_slot_02_text.string = ""
                @@gloves_slot_02 = nil
            end
        end
        if @@owned_gloves_array.size > 2
            t = 2 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_gloves_array.size - 1
             @@gloves_slot_03_image_sprite.texture = @@owned_gloves_array[t].texture
             @@gloves_slot_03_text.string = @@owned_gloves_array[t].name
             @@gloves_slot_03 = @@owned_gloves_array[t]
            else
                @@gloves_slot_03_image_sprite.texture = NIL_TEXTURE
                @@gloves_slot_03_text.string = ""
                @@gloves_slot_03 = nil
            end
        end
        if @@owned_gloves_array.size > 3
            t = 3 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_gloves_array.size - 1
             @@gloves_slot_04_image_sprite.texture = @@owned_gloves_array[t].texture
             @@gloves_slot_04_text.string = @@owned_gloves_array[t].name
             @@gloves_slot_04 = @@owned_gloves_array[t]
            else
                @@gloves_slot_04_image_sprite.texture = NIL_TEXTURE
                @@gloves_slot_04_text.string = ""
                @@gloves_slot_04 = nil
            end
        end
        if @@owned_gloves_array.size > 4
            t = 4 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_gloves_array.size - 1
             @@gloves_slot_05_image_sprite.texture = @@owned_gloves_array[t].texture
             @@gloves_slot_05_text.string = @@owned_gloves_array[t].name
             @@gloves_slot_05 = @@owned_gloves_array[t]
            else
                @@gloves_slot_05_image_sprite.texture = NIL_TEXTURE
                @@gloves_slot_05_text.string = ""
                @@gloves_slot_05 = nil
            end
        end
        if @@owned_gloves_array.size > 5
            t = 5 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_gloves_array.size - 1
             @@gloves_slot_06_image_sprite.texture = @@owned_gloves_array[t].texture
             @@gloves_slot_06_text.string = @@owned_gloves_array[t].name
             @@gloves_slot_06 = @@owned_gloves_array[t]
            else
                @@gloves_slot_06_image_sprite.texture = NIL_TEXTURE
                @@gloves_slot_06_text.string = ""
                @@gloves_slot_06 = nil
            end
        end
        if @@owned_gloves_array.size > 6
            t = 6 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_gloves_array.size - 1
             @@gloves_slot_07_image_sprite.texture = @@owned_gloves_array[t].texture
             @@gloves_slot_07_text.string = @@owned_gloves_array[t].name
             @@gloves_slot_07 = @@owned_gloves_array[t]
            else
                @@gloves_slot_07_image_sprite.texture = NIL_TEXTURE
                @@gloves_slot_07_text.string = ""
                @@gloves_slot_07 = nil
            end
        end
        if @@owned_gloves_array.size > 7
            t = 7 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_gloves_array.size - 1
             @@gloves_slot_08_image_sprite.texture = @@owned_gloves_array[t].texture
             @@gloves_slot_08_text.string = @@owned_gloves_array[t].name
             @@gloves_slot_08 = @@owned_gloves_array[t]
            else
                @@gloves_slot_08_image_sprite.texture = NIL_TEXTURE
                @@gloves_slot_08_text.string = ""
                @@gloves_slot_08 = nil
            end
        end
        if @@owned_gloves_array.size > 8
            t = 8 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_gloves_array.size - 1
             @@gloves_slot_09_image_sprite.texture = @@owned_gloves_array[t].texture
             @@gloves_slot_09_text.string = @@owned_gloves_array[t].name
             @@gloves_slot_09 = @@owned_gloves_array[t]
            else
                @@gloves_slot_09_image_sprite.texture = NIL_TEXTURE
                @@gloves_slot_09_text.string = ""
                @@gloves_slot_09 = nil
            end
        end
        if @@owned_gloves_array.size > 9
            t = 9 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_gloves_array.size - 1
             @@gloves_slot_10_image_sprite.texture = @@owned_gloves_array[t].texture
             @@gloves_slot_10_text.string = @@owned_gloves_array[t].name
             @@gloves_slot_10 = @@owned_gloves_array[t]
            else
                @@gloves_slot_10_image_sprite.texture = NIL_TEXTURE
                @@gloves_slot_10_text.string = ""
                @@gloves_slot_10 = nil
            end
        end
        if @@owned_gloves_array.size > 10
            t = 10 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_gloves_array.size - 1
             @@gloves_slot_11_image_sprite.texture = @@owned_gloves_array[t].texture
             @@gloves_slot_11_text.string = @@owned_gloves_array[t].name
             @@gloves_slot_11 = @@owned_gloves_array[t]
            else
                @@gloves_slot_11_image_sprite.texture = NIL_TEXTURE
                @@gloves_slot_11_text.string = ""
                @@gloves_slot_11 = nil
            end
        end
        if @@owned_gloves_array.size > 11
            t = 11 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_gloves_array.size - 1
             @@gloves_slot_12_image_sprite.texture = @@owned_gloves_array[t].texture
             @@gloves_slot_12_text.string = @@owned_gloves_array[t].name
             @@gloves_slot_12 = @@owned_gloves_array[t]
            else
                @@gloves_slot_12_image_sprite.texture = NIL_TEXTURE
                @@gloves_slot_12_text.string = ""
                @@gloves_slot_12 = nil
            end
        end
        if @@owned_gloves_array.size > 12
            t = 12 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_gloves_array.size - 1
             @@gloves_slot_13_image_sprite.texture = @@owned_gloves_array[t].texture
             @@gloves_slot_13_text.string = @@owned_gloves_array[t].name
             @@gloves_slot_13 = @@owned_gloves_array[t]
            else
                @@gloves_slot_13_image_sprite.texture = NIL_TEXTURE
                @@gloves_slot_13_text.string = ""
                @@gloves_slot_13 = nil
            end
        end
        if @@owned_gloves_array.size > 13
            t = 13 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_gloves_array.size - 1
             @@gloves_slot_14_image_sprite.texture = @@owned_gloves_array[t].texture
             @@gloves_slot_14_text.string = @@owned_gloves_array[t].name
             @@gloves_slot_14 = @@owned_gloves_array[t]
            else
                @@gloves_slot_14_image_sprite.texture = NIL_TEXTURE
                @@gloves_slot_14_text.string = ""
                @@gloves_slot_14 = nil
            end
        end
        if @@owned_gloves_array.size > 14
            t = 14 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_gloves_array.size - 1
             @@gloves_slot_15_image_sprite.texture = @@owned_gloves_array[t].texture
             @@gloves_slot_15_text.string = @@owned_gloves_array[t].name
             @@gloves_slot_15 = @@owned_gloves_array[t]
            else
                @@gloves_slot_15_image_sprite.texture = NIL_TEXTURE
                @@gloves_slot_15_text.string = ""
                @@gloves_slot_15 = nil
            end
        end
       end
       

       def ClothingTabGloves.draw_clothing_tab(window)
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


        @@gloves_slot_01_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 40 * max_scale)
        @@gloves_slot_01_sprite.scale = SF.vector2(1, 1)
        
        @@gloves_slot_01_image_sprite.position = @@gloves_slot_01_sprite.position - SF.vector2(80 * max_scale, 190 * max_scale)
        @@gloves_slot_01_image_sprite.scale = SF.vector2(4, 4)
        @@gloves_slot_01_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        @@gloves_slot_01_text.position = @@gloves_slot_01_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@gloves_slot_01_text)
        

        @@gloves_slot_02_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 40 * max_scale)
        @@gloves_slot_02_sprite.scale = SF.vector2(1, 1)
        
        @@gloves_slot_02_image_sprite.position = @@gloves_slot_02_sprite.position - SF.vector2(80 * max_scale, 190 * max_scale)
        @@gloves_slot_02_image_sprite.scale = SF.vector2(4, 4)
        @@gloves_slot_02_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        @@gloves_slot_02_text.position = @@gloves_slot_02_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@gloves_slot_02_text)
        

        @@gloves_slot_03_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 40 * max_scale)
        @@gloves_slot_03_sprite.scale = SF.vector2(1, 1)
        
        @@gloves_slot_03_image_sprite.position = @@gloves_slot_03_sprite.position - SF.vector2(80 * max_scale, 190 * max_scale)
        @@gloves_slot_03_image_sprite.scale = SF.vector2(4, 4)
        @@gloves_slot_03_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        @@gloves_slot_03_text.position = @@gloves_slot_03_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@gloves_slot_03_text)
        

        @@gloves_slot_04_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 40 * max_scale)
        @@gloves_slot_04_sprite.scale = SF.vector2(1, 1)

        @@gloves_slot_04_text.position = @@gloves_slot_04_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@gloves_slot_04_text)
        
        @@gloves_slot_04_image_sprite.position = @@gloves_slot_04_sprite.position - SF.vector2(80 * max_scale, 190 * max_scale)
        @@gloves_slot_04_image_sprite.scale = SF.vector2(4, 4)
        @@gloves_slot_04_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)


        @@gloves_slot_05_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 40 * max_scale)
        @@gloves_slot_05_sprite.scale = SF.vector2(1, 1)

        @@gloves_slot_05_text.position = @@gloves_slot_05_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@gloves_slot_05_text)
        
        @@gloves_slot_05_image_sprite.position = @@gloves_slot_05_sprite.position - SF.vector2(80 * max_scale, 190 * max_scale)
        @@gloves_slot_05_image_sprite.scale = SF.vector2(4, 4)
        @@gloves_slot_05_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@gloves_slot_06_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 120 * max_scale)
        @@gloves_slot_06_sprite.scale = SF.vector2(1, 1)

        @@gloves_slot_06_text.position = @@gloves_slot_06_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@gloves_slot_06_text)
        
        @@gloves_slot_06_image_sprite.position = @@gloves_slot_06_sprite.position - SF.vector2(80 * max_scale, 190 * max_scale)
        @@gloves_slot_06_image_sprite.scale = SF.vector2(4, 4)
        @@gloves_slot_06_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@gloves_slot_07_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 120 * max_scale)
        @@gloves_slot_07_sprite.scale = SF.vector2(1, 1)
        
        @@gloves_slot_07_text.position = @@gloves_slot_07_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@gloves_slot_07_text)
        
        @@gloves_slot_07_image_sprite.position = @@gloves_slot_07_sprite.position - SF.vector2(80 * max_scale, 190 * max_scale)
        @@gloves_slot_07_image_sprite.scale = SF.vector2(4, 4)
        @@gloves_slot_07_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@gloves_slot_08_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 120 * max_scale)
        @@gloves_slot_08_sprite.scale = SF.vector2(1, 1)
                
        @@gloves_slot_08_text.position = @@gloves_slot_08_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@gloves_slot_08_text)
        
        @@gloves_slot_08_image_sprite.position = @@gloves_slot_08_sprite.position - SF.vector2(80 * max_scale, 190 * max_scale)
        @@gloves_slot_08_image_sprite.scale = SF.vector2(4, 4)
        @@gloves_slot_08_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@gloves_slot_09_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 120 * max_scale)
        @@gloves_slot_09_sprite.scale = SF.vector2(1, 1)
                
        @@gloves_slot_09_text.position = @@gloves_slot_09_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@gloves_slot_09_text)
        
        @@gloves_slot_09_image_sprite.position = @@gloves_slot_09_sprite.position - SF.vector2(80 * max_scale, 190 * max_scale)
        @@gloves_slot_09_image_sprite.scale = SF.vector2(4, 4)
        @@gloves_slot_09_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@gloves_slot_10_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 120 * max_scale)
        @@gloves_slot_10_sprite.scale = SF.vector2(1, 1)
                        
        @@gloves_slot_10_text.position = @@gloves_slot_10_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@gloves_slot_10_text)
        
        @@gloves_slot_10_image_sprite.position = @@gloves_slot_10_sprite.position - SF.vector2(80 * max_scale, 190 * max_scale)
        @@gloves_slot_10_image_sprite.scale = SF.vector2(4, 4)
        @@gloves_slot_10_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@gloves_slot_11_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 200 * max_scale)
        @@gloves_slot_11_sprite.scale = SF.vector2(1, 1)
                        
        @@gloves_slot_11_text.position = @@gloves_slot_11_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@gloves_slot_11_text)
        
        @@gloves_slot_11_image_sprite.position = @@gloves_slot_11_sprite.position - SF.vector2(80 * max_scale, 190 * max_scale)
        @@gloves_slot_11_image_sprite.scale = SF.vector2(4, 4)
        @@gloves_slot_11_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@gloves_slot_12_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 200 * max_scale)
        @@gloves_slot_12_sprite.scale = SF.vector2(1, 1)
                        
        @@gloves_slot_12_text.position = @@gloves_slot_12_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@gloves_slot_12_text)
        
        @@gloves_slot_12_image_sprite.position = @@gloves_slot_12_sprite.position - SF.vector2(80 * max_scale, 190 * max_scale)
        @@gloves_slot_12_image_sprite.scale = SF.vector2(4, 4)
        @@gloves_slot_12_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@gloves_slot_13_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 200 * max_scale)
        @@gloves_slot_13_sprite.scale = SF.vector2(1, 1)
        
        @@gloves_slot_13_text.position = @@gloves_slot_13_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@gloves_slot_13_text)
        
        @@gloves_slot_13_image_sprite.position = @@gloves_slot_13_sprite.position - SF.vector2(80 * max_scale, 190 * max_scale)
        @@gloves_slot_13_image_sprite.scale = SF.vector2(4, 4)
        @@gloves_slot_13_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@gloves_slot_14_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 200 * max_scale)
        @@gloves_slot_14_sprite.scale = SF.vector2(1, 1)
                        
        @@gloves_slot_14_text.position = @@gloves_slot_14_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@gloves_slot_14_text)
        
        @@gloves_slot_14_image_sprite.position = @@gloves_slot_14_sprite.position - SF.vector2(80 * max_scale, 190 * max_scale)
        @@gloves_slot_14_image_sprite.scale = SF.vector2(4, 4)
        @@gloves_slot_14_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@gloves_slot_15_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 200 * max_scale)
        @@gloves_slot_15_sprite.scale = SF.vector2(1, 1)
                        
        @@gloves_slot_15_text.position = @@gloves_slot_15_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@gloves_slot_15_text)
        
        @@gloves_slot_15_image_sprite.position = @@gloves_slot_15_sprite.position - SF.vector2(80 * max_scale, 190 * max_scale)
        @@gloves_slot_15_image_sprite.scale = SF.vector2(4, 4)
        @@gloves_slot_15_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)


        window.draw(@@gloves_slot_01_sprite)
        window.draw(@@gloves_slot_01_image_sprite)
        window.draw(@@gloves_slot_01_text)

        window.draw(@@gloves_slot_02_sprite)
        window.draw(@@gloves_slot_02_image_sprite)
        window.draw(@@gloves_slot_02_text)

        window.draw(@@gloves_slot_03_sprite)
        window.draw(@@gloves_slot_03_image_sprite)
        window.draw(@@gloves_slot_03_text)
        
        window.draw(@@gloves_slot_04_sprite)
        window.draw(@@gloves_slot_04_image_sprite)
        window.draw(@@gloves_slot_04_text)

        window.draw(@@gloves_slot_05_sprite)
        window.draw(@@gloves_slot_05_image_sprite)
        window.draw(@@gloves_slot_05_text)

        window.draw(@@gloves_slot_06_sprite)
        window.draw(@@gloves_slot_06_image_sprite)
        window.draw(@@gloves_slot_06_text)

        window.draw(@@gloves_slot_07_sprite)
        window.draw(@@gloves_slot_07_image_sprite)
        window.draw(@@gloves_slot_07_text)

        window.draw(@@gloves_slot_08_sprite)
        window.draw(@@gloves_slot_08_image_sprite)
        window.draw(@@gloves_slot_08_text)

        window.draw(@@gloves_slot_09_sprite)
        window.draw(@@gloves_slot_09_image_sprite)
        window.draw(@@gloves_slot_09_text)

        window.draw(@@gloves_slot_10_sprite)
        window.draw(@@gloves_slot_10_image_sprite)
        window.draw(@@gloves_slot_10_text)

        window.draw(@@gloves_slot_11_sprite)
        window.draw(@@gloves_slot_11_image_sprite)
        window.draw(@@gloves_slot_11_text)

        window.draw(@@gloves_slot_12_sprite)
        window.draw(@@gloves_slot_12_image_sprite)
        window.draw(@@gloves_slot_12_text)

        window.draw(@@gloves_slot_13_sprite)
        window.draw(@@gloves_slot_13_image_sprite)
        window.draw(@@gloves_slot_13_text)

        window.draw(@@gloves_slot_14_sprite)
        window.draw(@@gloves_slot_14_image_sprite)
        window.draw(@@gloves_slot_14_text)

        window.draw(@@gloves_slot_15_sprite)
        window.draw(@@gloves_slot_15_image_sprite)
        window.draw(@@gloves_slot_15_text)

        if SF::Mouse.button_pressed?(SF::Mouse::Left)
            ClothingTabGloves.clothes_mouse_handling(window)
        end
       end

       def ClothingTabGloves.clothes_mouse_handling(window)
        mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window))
        mouse_x = mouse_position.x
        mouse_y = mouse_position.y
        
    
        current_size = window.size
        original_width = 800 
        original_height = 600 

        scale_x = (current_size.x.to_f / original_width)
        scale_y = current_size.y.to_f / original_height
        

        #------------------------------------objects-------------------------------------------------

            slot_01_x = @@gloves_slot_01_sprite.position.x
            slot_01_y = @@gloves_slot_01_sprite.position.y
            slot_01_width = @@gloves_slot_01_sprite.size.x
            slot_01_height = @@gloves_slot_01_sprite.size.y

            slot_02_x = @@gloves_slot_02_sprite.position.x
            slot_02_y = @@gloves_slot_02_sprite.position.y
            slot_02_width = @@gloves_slot_02_sprite.size.x
            slot_02_height = @@gloves_slot_02_sprite.size.y

            slot_03_x = @@gloves_slot_03_sprite.position.x
            slot_03_y = @@gloves_slot_03_sprite.position.y
            slot_03_width = @@gloves_slot_03_sprite.size.x
            slot_03_height = @@gloves_slot_03_sprite.size.y

            slot_04_x = @@gloves_slot_04_sprite.position.x
            slot_04_y = @@gloves_slot_04_sprite.position.y
            slot_04_width = @@gloves_slot_04_sprite.size.x
            slot_04_height = @@gloves_slot_04_sprite.size.y

            slot_05_x = @@gloves_slot_05_sprite.position.x
            slot_05_y = @@gloves_slot_05_sprite.position.y
            slot_05_width = @@gloves_slot_05_sprite.size.x
            slot_05_height = @@gloves_slot_05_sprite.size.y

            slot_06_x = @@gloves_slot_06_sprite.position.x
            slot_06_y = @@gloves_slot_06_sprite.position.y
            slot_06_width = @@gloves_slot_06_sprite.size.x
            slot_06_height = @@gloves_slot_06_sprite.size.y

            slot_07_x = @@gloves_slot_07_sprite.position.x
            slot_07_y = @@gloves_slot_07_sprite.position.y
            slot_07_width = @@gloves_slot_07_sprite.size.x
            slot_07_height = @@gloves_slot_07_sprite.size.y

            slot_08_x = @@gloves_slot_08_sprite.position.x
            slot_08_y = @@gloves_slot_08_sprite.position.y
            slot_08_width = @@gloves_slot_08_sprite.size.x
            slot_08_height = @@gloves_slot_08_sprite.size.y

            slot_09_x = @@gloves_slot_09_sprite.position.x
            slot_09_y = @@gloves_slot_09_sprite.position.y
            slot_09_width = @@gloves_slot_09_sprite.size.x
            slot_09_height = @@gloves_slot_09_sprite.size.y

            slot_10_x = @@gloves_slot_10_sprite.position.x
            slot_10_y = @@gloves_slot_10_sprite.position.y
            slot_10_width = @@gloves_slot_10_sprite.size.x
            slot_10_height = @@gloves_slot_10_sprite.size.y

            slot_11_x = @@gloves_slot_11_sprite.position.x
            slot_11_y = @@gloves_slot_11_sprite.position.y
            slot_11_width = @@gloves_slot_11_sprite.size.x
            slot_11_height = @@gloves_slot_11_sprite.size.y

            slot_12_x = @@gloves_slot_12_sprite.position.x
            slot_12_y = @@gloves_slot_12_sprite.position.y
            slot_12_width = @@gloves_slot_12_sprite.size.x
            slot_12_height = @@gloves_slot_12_sprite.size.y

            slot_13_x = @@gloves_slot_13_sprite.position.x
            slot_13_y = @@gloves_slot_13_sprite.position.y
            slot_13_width = @@gloves_slot_13_sprite.size.x
            slot_13_height = @@gloves_slot_13_sprite.size.y

            slot_14_x = @@gloves_slot_14_sprite.position.x
            slot_14_y = @@gloves_slot_14_sprite.position.y
            slot_14_width = @@gloves_slot_14_sprite.size.x
            slot_14_height = @@gloves_slot_14_sprite.size.y

            slot_15_x = @@gloves_slot_15_sprite.position.x
            slot_15_y = @@gloves_slot_15_sprite.position.y
            slot_15_width = @@gloves_slot_15_sprite.size.x
            slot_15_height = @@gloves_slot_15_sprite.size.y
        #---------------------------------------------------------------------------------------------
         
        if (mouse_x >= slot_01_x && mouse_x <= slot_01_x + slot_01_width) &&
           (mouse_y >= slot_01_y && mouse_y <= slot_01_y + slot_01_height)
            if @@gloves_slot_01 != nil   
                t = ((@@page || 1) * 15) - 15
                
                @@owned_gloves_array[t] = (Clothing::Gloves.get_gloves(
                Player::Appearance.get_clothing("gloves").try(&.to_s) || Clothing::Gloves.get_gloves("No Gloves").not_nil!)).not_nil!
                Player::Appearance.change_gloves(@@gloves_slot_01.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                
            end
            ClothingTabGloves.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_02_x && mouse_x <= slot_02_x + slot_02_width) &&
           (mouse_y >= slot_02_y && mouse_y <= slot_02_y + slot_02_height)
           
            if @@gloves_slot_02 != nil
                t = 1 + ((@@page || 1) * 15) - 15
                
                @@owned_gloves_array[t] = (Clothing::Gloves.get_gloves(
                Player::Appearance.get_clothing("gloves").try(&.to_s) || Clothing::Gloves.get_gloves("No Gloves").not_nil!)).not_nil!
                Player::Appearance.change_gloves(@@gloves_slot_02.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGloves.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_03_x && mouse_x <= slot_03_x + slot_03_width) &&
           (mouse_y >= slot_03_y && mouse_y <= slot_03_y + slot_03_height)
           
            if @@gloves_slot_03 != nil
                t = 2 + ((@@page || 1) * 15) - 15
                
                @@owned_gloves_array[t] = (Clothing::Gloves.get_gloves(
                Player::Appearance.get_clothing("gloves").try(&.to_s) || Clothing::Gloves.get_gloves("No Gloves").not_nil!)).not_nil!
                Player::Appearance.change_gloves(@@gloves_slot_03.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGloves.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_04_x && mouse_x <= slot_04_x + slot_04_width) &&
           (mouse_y >= slot_04_y && mouse_y <= slot_04_y + slot_04_height)
           
            if @@gloves_slot_04 != nil
                t = 3 + ((@@page || 1) * 15) - 15
                
                @@owned_gloves_array[t] = (Clothing::Gloves.get_gloves(
                Player::Appearance.get_clothing("gloves").try(&.to_s) || Clothing::Gloves.get_gloves("No Gloves").not_nil!)).not_nil!
                Player::Appearance.change_gloves(@@gloves_slot_04.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGloves.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_05_x && mouse_x <= slot_05_x + slot_05_width) &&
           (mouse_y >= slot_05_y && mouse_y <= slot_05_y + slot_05_height)
           
            if @@gloves_slot_05 != nil
                t = 4 + ((@@page || 1) * 15) - 15
                
                @@owned_gloves_array[t] = (Clothing::Gloves.get_gloves(
                Player::Appearance.get_clothing("gloves").try(&.to_s) || Clothing::Gloves.get_gloves("No Gloves").not_nil!)).not_nil!
                Player::Appearance.change_gloves(@@gloves_slot_04.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGloves.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_06_x && mouse_x <= slot_06_x + slot_06_width) &&
           (mouse_y >= slot_06_y && mouse_y <= slot_06_y + slot_06_height)
           
            if @@gloves_slot_06 != nil
                t = 5 + ((@@page || 1) * 15) - 15
                
                @@owned_gloves_array[t] = (Clothing::Gloves.get_gloves(
                Player::Appearance.get_clothing("gloves").try(&.to_s) || Clothing::Gloves.get_gloves("No Gloves").not_nil!)).not_nil!
                Player::Appearance.change_gloves(@@gloves_slot_06.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGloves.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_07_x && mouse_x <= slot_07_x + slot_07_width) &&
           (mouse_y >= slot_07_y && mouse_y <= slot_07_y + slot_07_height)
           
            if @@gloves_slot_07 != nil
                t = 6 + ((@@page || 1) * 15) - 15
                
                @@owned_gloves_array[t] = (Clothing::Gloves.get_gloves(
                Player::Appearance.get_clothing("gloves").try(&.to_s) || Clothing::Gloves.get_gloves("No Gloves").not_nil!)).not_nil!
                Player::Appearance.change_gloves(@@gloves_slot_07.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGloves.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_08_x && mouse_x <= slot_08_x + slot_08_width) &&
           (mouse_y >= slot_08_y && mouse_y <= slot_08_y + slot_08_height)
           
            if @@gloves_slot_08 != nil
                t = 7 + ((@@page || 1) * 15) - 15
                
                @@owned_gloves_array[t] = (Clothing::Gloves.get_gloves(
                Player::Appearance.get_clothing("gloves").try(&.to_s) || Clothing::Gloves.get_gloves("No Gloves").not_nil!)).not_nil!
                Player::Appearance.change_gloves(@@gloves_slot_08.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGloves.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_09_x && mouse_x <= slot_09_x + slot_09_width) &&
           (mouse_y >= slot_09_y && mouse_y <= slot_09_y + slot_09_height)
           
            if @@gloves_slot_09 != nil
                t = 8 + ((@@page || 1) * 15) - 15
                
                @@owned_gloves_array[t] = (Clothing::Gloves.get_gloves(
                Player::Appearance.get_clothing("gloves").try(&.to_s) || Clothing::Gloves.get_gloves("No Gloves").not_nil!)).not_nil!
                Player::Appearance.change_gloves(@@gloves_slot_09.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGloves.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_10_x && mouse_x <= slot_10_x + slot_10_width) &&
           (mouse_y >= slot_10_y && mouse_y <= slot_10_y + slot_10_height)
           
            if @@gloves_slot_10 != nil
                t = 9 + ((@@page || 1) * 15) - 15
                
                @@owned_gloves_array[t] = (Clothing::Gloves.get_gloves(
                Player::Appearance.get_clothing("gloves").try(&.to_s) || Clothing::Gloves.get_gloves("No Gloves").not_nil!)).not_nil!
                Player::Appearance.change_gloves(@@gloves_slot_10.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGloves.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_11_x && mouse_x <= slot_11_x + slot_11_width) &&
           (mouse_y >= slot_11_y && mouse_y <= slot_11_y + slot_11_height)
           
            if @@gloves_slot_11 != nil
                t = 10 + ((@@page || 1) * 15) - 15
                
                @@owned_gloves_array[t] = (Clothing::Gloves.get_gloves(
                Player::Appearance.get_clothing("gloves").try(&.to_s) || Clothing::Gloves.get_gloves("No Gloves").not_nil!)).not_nil!
                Player::Appearance.change_gloves(@@gloves_slot_11.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGloves.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_12_x && mouse_x <= slot_12_x + slot_12_width) &&
           (mouse_y >= slot_12_y && mouse_y <= slot_12_y + slot_12_height)
           
            if @@gloves_slot_12 != nil
                t = 11 + ((@@page || 1) * 15) - 15
                
                @@owned_gloves_array[t] = (Clothing::Gloves.get_gloves(
                Player::Appearance.get_clothing("gloves").try(&.to_s) || Clothing::Gloves.get_gloves("No Gloves").not_nil!)).not_nil!
                Player::Appearance.change_gloves(@@gloves_slot_12.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGloves.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_13_x && mouse_x <= slot_13_x + slot_13_width) &&
           (mouse_y >= slot_13_y && mouse_y <= slot_13_y + slot_13_height)
           
            if @@gloves_slot_13 != nil
                t = 12 + ((@@page || 1) * 15) - 15
                
                @@owned_gloves_array[t] = (Clothing::Gloves.get_gloves(
                Player::Appearance.get_clothing("gloves").try(&.to_s) || Clothing::Gloves.get_gloves("No Gloves").not_nil!)).not_nil!
                Player::Appearance.change_gloves(@@gloves_slot_13.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGloves.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_14_x && mouse_x <= slot_14_x + slot_14_width) &&
           (mouse_y >= slot_14_y && mouse_y <= slot_14_y + slot_14_height)
           
            if @@gloves_slot_14 != nil
                t = 13 + ((@@page || 1) * 15) - 15
                
                @@owned_gloves_array[t] = (Clothing::Gloves.get_gloves(
                Player::Appearance.get_clothing("gloves").try(&.to_s) || Clothing::Gloves.get_gloves("No Gloves").not_nil!)).not_nil!
                Player::Appearance.change_gloves(@@gloves_slot_14.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGloves.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_15_x && mouse_x <= slot_15_x + slot_15_width) &&
           (mouse_y >= slot_15_y && mouse_y <= slot_15_y + slot_15_height)
           
            if @@gloves_slot_15 != nil
                t = 14 + ((@@page || 1) * 15) - 15
                
                @@owned_gloves_array[t] = (Clothing::Gloves.get_gloves(
                Player::Appearance.get_clothing("gloves").try(&.to_s) || Clothing::Gloves.get_gloves("No Gloves").not_nil!)).not_nil!
                Player::Appearance.change_gloves(@@gloves_slot_15.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGloves.assign_slot_textures(window)
            sleep 0.15.seconds
        end

       end

    end

    class ClothingTabEarrings
        @@owned_earrings_array = [] of Clothing::Earrings
        #@@owned_earrings_set = Set(Clothing::Earrings).new
        @@earrings_sorting_category = "Length"

        @@earrings_slot_01 : Clothing::Earrings? = nil
        @@earrings_slot_02 : Clothing::Earrings? = nil
        @@earrings_slot_03 : Clothing::Earrings? = nil
        @@earrings_slot_04 : Clothing::Earrings? = nil
        @@earrings_slot_05 : Clothing::Earrings? = nil
        @@earrings_slot_06 : Clothing::Earrings? = nil
        @@earrings_slot_07 : Clothing::Earrings? = nil
        @@earrings_slot_08 : Clothing::Earrings? = nil
        @@earrings_slot_09 : Clothing::Earrings? = nil
        @@earrings_slot_10 : Clothing::Earrings? = nil
        @@earrings_slot_11 : Clothing::Earrings? = nil
        @@earrings_slot_12 : Clothing::Earrings? = nil
        @@earrings_slot_13 : Clothing::Earrings? = nil
        @@earrings_slot_14 : Clothing::Earrings? = nil
        @@earrings_slot_15 : Clothing::Earrings? = nil

       #---------------------------------debug-------------------------------------------
        @@owned_earrings_array.push(Clothing::Earrings.get_earrings("No Earrings").not_nil!)
        #@@owned_earrings_set.add?(Clothing::Earrings.get_earrings("Ruby Earrings").not_nil!)
        @@owned_earrings_array.push(Clothing::Earrings.get_earrings("Ruby Earrings").not_nil!)
        @@owned_earrings_array.push(Clothing::Earrings.get_earrings("Amber Earrings").not_nil!)
        @@owned_earrings_array.push(Clothing::Earrings.get_earrings("Topaz Earrings").not_nil!)
       #---------------------------------------------------------------------------------

       #--------------------------------objects------------------------------------------
        INVENTORY_BOX = SF::RectangleShape.new(SF.vector2(610, 420))
        INVENTORY_BOX.fill_color = SF.color( 137, 170, 208 )

        
        @@clothing_left_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_left_arrow_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_right_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_right_arrow_sprite.fill_color = SF.color(161, 183, 208)


        @@clothing_sort_button_sprite = SF::RectangleShape.new(SF.vector2(75, 25))
        @@clothing_sort_button_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_earrings_category_box = SF::RectangleShape.new(SF.vector2(100, 25))
        @@clothing_earrings_category_box.fill_color = SF.color(161, 183, 208)

        @@clothing_sort_button_text = SF::Text.new
        @@clothing_sort_button_text.font = QUICKSAND
        @@clothing_sort_button_text.character_size = 20
        @@clothing_sort_button_text.color = SF::Color::Blue
        @@clothing_sort_button_text.string = "Sort"


        @@clothing_right_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_right_arrow_sprite.fill_color = SF.color(161, 183, 208)

        @@earrings_tab = SF::RectangleShape.new(SF.vector2(100, 50))
        @@earrings_tab.fill_color = SF.color(141, 163, 188)

        @@earrings_tab_text = SF::Text.new
        @@earrings_tab_text.font = QUICKSAND
        @@earrings_tab_text.character_size = 20
        @@earrings_tab_text.color = SF::Color::Blue
        @@earrings_tab_text.string = "Earringss"

        @@earrings_tab = SF::RectangleShape.new(SF.vector2(100, 50))
        @@earrings_tab.fill_color = SF.color(161, 183, 208)

        @@earrings_tab_text = SF::Text.new
        @@earrings_tab_text.font = QUICKSAND
        @@earrings_tab_text.character_size = 20
        @@earrings_tab_text.color = SF::Color::Blue
        @@earrings_tab_text.string = "Earrings"


        @@earrings_slot_01_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@earrings_slot_01_sprite.fill_color = SF.color(161, 183, 208)

        @@earrings_slot_01_text = SF::Text.new
        @@earrings_slot_01_text.font = QUICKSAND
        @@earrings_slot_01_text.character_size = 12
        @@earrings_slot_01_text.color = SF::Color::Blue

        @@earrings_slot_01_image_sprite = SF::Sprite.new


        @@earrings_slot_02_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@earrings_slot_02_sprite.fill_color = SF.color(161, 183, 208)

        @@earrings_slot_02_text = SF::Text.new
        @@earrings_slot_02_text.font = QUICKSAND
        @@earrings_slot_02_text.character_size = 12
        @@earrings_slot_02_text.color = SF::Color::Blue

        @@earrings_slot_02_image_sprite = SF::Sprite.new


        @@earrings_slot_03_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@earrings_slot_03_sprite.fill_color = SF.color(161, 183, 208)

        @@earrings_slot_03_text = SF::Text.new
        @@earrings_slot_03_text.font = QUICKSAND
        @@earrings_slot_03_text.character_size = 12
        @@earrings_slot_03_text.color = SF::Color::Blue

        @@earrings_slot_03_image_sprite = SF::Sprite.new


        @@earrings_slot_04_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@earrings_slot_04_sprite.fill_color = SF.color(161, 183, 208)

        @@earrings_slot_04_text = SF::Text.new
        @@earrings_slot_04_text.font = QUICKSAND
        @@earrings_slot_04_text.character_size = 12
        @@earrings_slot_04_text.color = SF::Color::Blue

        @@earrings_slot_04_image_sprite = SF::Sprite.new


        @@earrings_slot_05_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@earrings_slot_05_sprite.fill_color = SF.color(161, 183, 208)

        @@earrings_slot_05_text = SF::Text.new
        @@earrings_slot_05_text.font = QUICKSAND
        @@earrings_slot_05_text.character_size = 12
        @@earrings_slot_05_text.color = SF::Color::Blue

        @@earrings_slot_05_image_sprite = SF::Sprite.new


        @@earrings_slot_06_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@earrings_slot_06_sprite.fill_color = SF.color(161, 183, 208)

        @@earrings_slot_06_text = SF::Text.new
        @@earrings_slot_06_text.font = QUICKSAND
        @@earrings_slot_06_text.character_size = 12
        @@earrings_slot_06_text.color = SF::Color::Blue
        
        @@earrings_slot_06_image_sprite = SF::Sprite.new


        @@earrings_slot_07_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@earrings_slot_07_sprite.fill_color = SF.color(161, 183, 208)

        @@earrings_slot_07_text = SF::Text.new
        @@earrings_slot_07_text.font = QUICKSAND
        @@earrings_slot_07_text.character_size = 12
        @@earrings_slot_07_text.color = SF::Color::Blue

        @@earrings_slot_07_image_sprite = SF::Sprite.new


        @@earrings_slot_08_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@earrings_slot_08_sprite.fill_color = SF.color(161, 183, 208)

        @@earrings_slot_08_text = SF::Text.new
        @@earrings_slot_08_text.font = QUICKSAND
        @@earrings_slot_08_text.character_size = 12
        @@earrings_slot_08_text.color = SF::Color::Blue

        @@earrings_slot_08_image_sprite = SF::Sprite.new


        @@earrings_slot_09_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@earrings_slot_09_sprite.fill_color = SF.color(161, 183, 208)

        @@earrings_slot_09_text = SF::Text.new
        @@earrings_slot_09_text.font = QUICKSAND
        @@earrings_slot_09_text.character_size = 12
        @@earrings_slot_09_text.color = SF::Color::Blue

        @@earrings_slot_09_image_sprite = SF::Sprite.new


        @@earrings_slot_10_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@earrings_slot_10_sprite.fill_color = SF.color(161, 183, 208)

        @@earrings_slot_10_text = SF::Text.new
        @@earrings_slot_10_text.font = QUICKSAND
        @@earrings_slot_10_text.character_size = 12
        @@earrings_slot_10_text.color = SF::Color::Blue

        @@earrings_slot_10_image_sprite = SF::Sprite.new


        @@earrings_slot_11_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@earrings_slot_11_sprite.fill_color = SF.color(161, 183, 208)

        @@earrings_slot_11_text = SF::Text.new
        @@earrings_slot_11_text.font = QUICKSAND
        @@earrings_slot_11_text.character_size = 12
        @@earrings_slot_11_text.color = SF::Color::Blue

        @@earrings_slot_11_image_sprite = SF::Sprite.new


        @@earrings_slot_12_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@earrings_slot_12_sprite.fill_color = SF.color(161, 183, 208)

        @@earrings_slot_12_text = SF::Text.new
        @@earrings_slot_12_text.font = QUICKSAND
        @@earrings_slot_12_text.character_size = 12
        @@earrings_slot_12_text.color = SF::Color::Blue

        @@earrings_slot_12_image_sprite = SF::Sprite.new


        @@earrings_slot_13_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@earrings_slot_13_sprite.fill_color = SF.color(161, 183, 208)

        @@earrings_slot_13_text = SF::Text.new
        @@earrings_slot_13_text.font = QUICKSAND
        @@earrings_slot_13_text.character_size = 12
        @@earrings_slot_13_text.color = SF::Color::Blue

        @@earrings_slot_13_image_sprite = SF::Sprite.new


        @@earrings_slot_14_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@earrings_slot_14_sprite.fill_color = SF.color(161, 183, 208)

        @@earrings_slot_14_text = SF::Text.new
        @@earrings_slot_14_text.font = QUICKSAND
        @@earrings_slot_14_text.character_size = 12
        @@earrings_slot_14_text.color = SF::Color::Blue

        @@earrings_slot_14_image_sprite = SF::Sprite.new


        @@earrings_slot_15_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@earrings_slot_15_sprite.fill_color = SF.color(161, 183, 208)

        @@earrings_slot_15_text = SF::Text.new
        @@earrings_slot_15_text.font = QUICKSAND
        @@earrings_slot_15_text.character_size = 12
        @@earrings_slot_15_text.color = SF::Color::Blue

        @@earrings_slot_15_image_sprite = SF::Sprite.new

       #---------------------------------------------------------------------------------

       def initialize(is_open : Bool, page : Int32)
        @@is_open = is_open
        @@page = page
       end

       def ClothingTabEarrings.is_open
        @@is_open
       end

       def ClothingTabEarrings.page
        @@page
       end

       def ClothingTabEarrings.is_open=(this)
        @@is_open = this
       end

       def ClothingTabEarrings.page=(this)
        @@page = this
       end

       def ClothingTabEarrings.owned_earrings_array
        @@owned_earrings_array
       end

       def ClothingTabEarrings.owned_earrings_array=(this)
        @@owned_earrings_array = this
       end

       def ClothingTabEarrings.push_to_owned_earrings_array(this)
        @@owned_earrings_array.push(this)
       end

       def ClothingTabEarrings.change_earrings_sort_category
        case @@earrings_sorting_category
        when "Length"
            @@earrings_sorting_category = "Color"
        when "Color"
            @@earrings_sorting_category = "Length"
        end
       end

       def ClothingTabEarrings.get_earrings_category
        return @@earrings_sorting_category
       end

       def ClothingTabEarrings.organise_owned_earrings_array_by_color(window)
        temp_clothing_array_01 = [] of Clothing::Earrings
        @@owned_earrings_array.each { |earrings| if earrings.id == 0
        temp_clothing_array_01.push(earrings)
        end}
        @@owned_earrings_array.each { |earrings| if earrings.color == "white"
        temp_clothing_array_01.push(earrings)
        end}

        @@owned_earrings_array.each { |earrings| if earrings.color == "black"
        temp_clothing_array_01.push(earrings)
        end}

        @@owned_earrings_array.each { |earrings| if earrings.color == "red"
        temp_clothing_array_01.push(earrings)
        end}

        @@owned_earrings_array.each { |earrings| if earrings.color == "orange"
        temp_clothing_array_01.push(earrings)
        end}

        @@owned_earrings_array.each { |earrings| if earrings.color == "yellow"
        temp_clothing_array_01.push(earrings)
        end}

        @@owned_earrings_array.each { |earrings| if earrings.color == "green"
        temp_clothing_array_01.push(earrings)
        end}

        @@owned_earrings_array.each { |earrings| if earrings.color == "blue"
        temp_clothing_array_01.push(earrings)
        end}

        @@owned_earrings_array.each { |earrings| if earrings.color == "purple"
        temp_clothing_array_01.push(earrings)
        end}

        @@owned_earrings_array.each { |earrings| if earrings.color == "pink"
        temp_clothing_array_01.push(earrings)
        end}

        @@owned_earrings_array.clear
        @@owned_earrings_array = temp_clothing_array_01
        @@owned_earrings_array.uniq!
        ClothingTabEarrings.assign_slot_textures(window)
       end

       def ClothingTabEarrings.initialize_clothing_tab(window)
        @@page = 1
        INVENTORY_BOX.position = SF.vector2(20, 40)  
       end

       def ClothingTabEarrings.assign_slot_textures(window)
        if @@page == nil
            @@page = 1
        end
        @@owned_earrings_array.uniq!
            t = (@@page.not_nil! - 1) * 15
            if t < @@owned_earrings_array.size 
             @@earrings_slot_01_image_sprite.texture = @@owned_earrings_array[t].texture
             @@earrings_slot_01_text.string = @@owned_earrings_array[t].name
             @@earrings_slot_01 = @@owned_earrings_array[t]
            else 
                @@earrings_slot_01_image_sprite.texture = NIL_TEXTURE
                @@earrings_slot_01_text.string = ""
                @@earrings_slot_01 = nil
            end
            t = (@@page.not_nil! - 1) * 15 + 1
            if t < @@owned_earrings_array.size 
             @@earrings_slot_02_image_sprite.texture = @@owned_earrings_array[t].texture
             @@earrings_slot_02_text.string = @@owned_earrings_array[t].name
             @@earrings_slot_02 = @@owned_earrings_array[t]
            else
                @@earrings_slot_02_image_sprite.texture = NIL_TEXTURE
                @@earrings_slot_02_text.string = ""
                @@earrings_slot_02 = nil
            end
            t = 2 + (@@page.not_nil! * 15) - 15
            if t < @@owned_earrings_array.size 
             @@earrings_slot_03_image_sprite.texture = @@owned_earrings_array[t].texture
             @@earrings_slot_03_text.string = @@owned_earrings_array[t].name
             @@earrings_slot_03 = @@owned_earrings_array[t]
            else
             @@earrings_slot_03_image_sprite.texture = NIL_TEXTURE
             @@earrings_slot_03_text.string = ""
             @@earrings_slot_03 = nil
            end
            t = 3 + (@@page.not_nil! * 15) - 15
            if t < @@owned_earrings_array.size
             @@earrings_slot_04_image_sprite.texture = @@owned_earrings_array[t].texture
             @@earrings_slot_04_text.string = @@owned_earrings_array[t].name
             @@earrings_slot_04 = @@owned_earrings_array[t]
            else
             @@earrings_slot_04_image_sprite.texture = NIL_TEXTURE
             @@earrings_slot_04_text.string = ""
             @@earrings_slot_04 = nil
            end
            t = 4 + (@@page.not_nil! * 15) - 15
            if t < @@owned_earrings_array.size
             @@earrings_slot_05_image_sprite.texture = @@owned_earrings_array[t].texture
             @@earrings_slot_05_text.string = @@owned_earrings_array[t].name
             @@earrings_slot_05 = @@owned_earrings_array[t]
            else
             @@earrings_slot_05_image_sprite.texture = NIL_TEXTURE
             @@earrings_slot_05_text.string = ""
             @@earrings_slot_05 = nil
            end
            t = 5 + (@@page.not_nil! * 15) - 15
            if t < @@owned_earrings_array.size
             @@earrings_slot_06_image_sprite.texture = @@owned_earrings_array[t].texture
             @@earrings_slot_06_text.string = @@owned_earrings_array[t].name
             @@earrings_slot_06 = @@owned_earrings_array[t]
            else
             @@earrings_slot_06_image_sprite.texture = NIL_TEXTURE
             @@earrings_slot_06_text.string = ""
             @@earrings_slot_06 = nil
            end
            t = 6 + (@@page.not_nil! * 15) - 15
            if t < @@owned_earrings_array.size
             @@earrings_slot_07_image_sprite.texture = @@owned_earrings_array[t].texture
             @@earrings_slot_07_text.string = @@owned_earrings_array[t].name
             @@earrings_slot_07 = @@owned_earrings_array[t]
            else
             @@earrings_slot_07_image_sprite.texture = NIL_TEXTURE
             @@earrings_slot_07_text.string = ""
             @@earrings_slot_07 = nil
            end
            t = 7 + (@@page.not_nil! * 15) - 15
            if t < @@owned_earrings_array.size
             @@earrings_slot_08_image_sprite.texture = @@owned_earrings_array[t].texture
             @@earrings_slot_08_text.string = @@owned_earrings_array[t].name
             @@earrings_slot_08 = @@owned_earrings_array[t]
            else
             @@earrings_slot_08_image_sprite.texture = NIL_TEXTURE
             @@earrings_slot_08_text.string = ""
             @@earrings_slot_08 = nil
            end
            t = 8 + (@@page.not_nil! * 15) - 15
            if t < @@owned_earrings_array.size
             @@earrings_slot_09_image_sprite.texture = @@owned_earrings_array[t].texture
             @@earrings_slot_09_text.string = @@owned_earrings_array[t].name
             @@earrings_slot_09 = @@owned_earrings_array[t]
            else
             @@earrings_slot_09_image_sprite.texture = NIL_TEXTURE
             @@earrings_slot_09_text.string = ""
             @@earrings_slot_09 = nil
            end
            t = 9 + (@@page.not_nil! * 15) - 15
            if t < @@owned_earrings_array.size
             @@earrings_slot_10_image_sprite.texture = @@owned_earrings_array[t].texture
             @@earrings_slot_10_text.string = @@owned_earrings_array[t].name
             @@earrings_slot_10 = @@owned_earrings_array[t]
            else
             @@earrings_slot_10_image_sprite.texture = NIL_TEXTURE
             @@earrings_slot_10_text.string = ""
             @@earrings_slot_10 = nil
            end
            t = 10 + (@@page.not_nil! * 15) - 15
            if t < @@owned_earrings_array.size
             @@earrings_slot_11_image_sprite.texture = @@owned_earrings_array[t].texture
             @@earrings_slot_11_text.string = @@owned_earrings_array[t].name
             @@earrings_slot_11 = @@owned_earrings_array[t]
            else
             @@earrings_slot_11_image_sprite.texture = NIL_TEXTURE
             @@earrings_slot_11_text.string = ""
             @@earrings_slot_11 = nil
            end
            t = 11 + (@@page.not_nil! * 15) - 15
            if t < @@owned_earrings_array.size
             @@earrings_slot_12_image_sprite.texture = @@owned_earrings_array[t].texture
             @@earrings_slot_12_text.string = @@owned_earrings_array[t].name
             @@earrings_slot_12 = @@owned_earrings_array[t]
            else
             @@earrings_slot_12_image_sprite.texture = NIL_TEXTURE
             @@earrings_slot_12_text.string = ""
             @@earrings_slot_12 = nil
            end
            t = 12 + (@@page.not_nil! * 15) - 15
            if t < @@owned_earrings_array.size
             @@earrings_slot_13_image_sprite.texture = @@owned_earrings_array[t].texture
             @@earrings_slot_13_text.string = @@owned_earrings_array[t].name
             @@earrings_slot_13 = @@owned_earrings_array[t]
            else
             @@earrings_slot_13_image_sprite.texture = NIL_TEXTURE
             @@earrings_slot_13_text.string = ""
             @@earrings_slot_13 = nil
            end
            t = 13 + (@@page.not_nil! * 15) - 15
            if t < @@owned_earrings_array.size
             @@earrings_slot_14_image_sprite.texture = @@owned_earrings_array[t].texture
             @@earrings_slot_14_text.string = @@owned_earrings_array[t].name
             @@earrings_slot_14 = @@owned_earrings_array[t]
            else
             @@earrings_slot_14_image_sprite.texture = NIL_TEXTURE
             @@earrings_slot_14_text.string = ""
             @@earrings_slot_14 = nil
            end
            t = 14 + (@@page.not_nil! * 15) - 15
            if t < @@owned_earrings_array.size
             @@earrings_slot_15_image_sprite.texture = @@owned_earrings_array[t].texture
             @@earrings_slot_15_text.string = @@owned_earrings_array[t].name
             @@earrings_slot_15 = @@owned_earrings_array[t]
            else
             @@earrings_slot_15_image_sprite.texture = NIL_TEXTURE
             @@earrings_slot_15_text.string = ""
             @@earrings_slot_15 = nil
            end
        @@owned_earrings_array.uniq!
       end

       def ClothingTabEarrings.draw_clothing_tab(window)
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


        @@earrings_slot_01_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 40 * max_scale)
        @@earrings_slot_01_sprite.scale = SF.vector2(1, 1)
        
        @@earrings_slot_01_image_sprite.position = @@earrings_slot_01_sprite.position - SF.vector2(90 * max_scale, 100 * max_scale)
        @@earrings_slot_01_image_sprite.scale = SF.vector2(4, 4)
        @@earrings_slot_01_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        earrings_slot_01_image_sprite_dup = @@earrings_slot_01_image_sprite.dup
        earrings_slot_01_image_sprite_dup.position = @@earrings_slot_01_sprite.position - SF.vector2(65 * max_scale, 100 * max_scale)

        @@earrings_slot_01_text.position = @@earrings_slot_01_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@earrings_slot_01_text)
        

        @@earrings_slot_02_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 40 * max_scale)
        @@earrings_slot_02_sprite.scale = SF.vector2(1, 1)
        
        @@earrings_slot_02_image_sprite.position = @@earrings_slot_02_sprite.position - SF.vector2(80 * max_scale, 100 * max_scale)
        @@earrings_slot_02_image_sprite.scale = SF.vector2(4, 4)
        @@earrings_slot_02_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        earrings_slot_02_image_sprite_dup = @@earrings_slot_02_image_sprite.dup
        earrings_slot_02_image_sprite_dup.position = @@earrings_slot_02_sprite.position - SF.vector2(65 * max_scale, 100 * max_scale)

        @@earrings_slot_02_text.position = @@earrings_slot_02_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@earrings_slot_02_text)
        

        @@earrings_slot_03_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 40 * max_scale)
        @@earrings_slot_03_sprite.scale = SF.vector2(1, 1)
        
        @@earrings_slot_03_image_sprite.position = @@earrings_slot_03_sprite.position - SF.vector2(80 * max_scale, 100 * max_scale)
        @@earrings_slot_03_image_sprite.scale = SF.vector2(4, 4)
        @@earrings_slot_03_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        earrings_slot_03_image_sprite_dup = @@earrings_slot_03_image_sprite.dup
        earrings_slot_03_image_sprite_dup.position = @@earrings_slot_03_sprite.position - SF.vector2(65 * max_scale, 100 * max_scale)

        @@earrings_slot_03_text.position = @@earrings_slot_03_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@earrings_slot_03_text)
        

        @@earrings_slot_04_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 40 * max_scale)
        @@earrings_slot_04_sprite.scale = SF.vector2(1, 1)

        @@earrings_slot_04_text.position = @@earrings_slot_04_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@earrings_slot_04_text)
        
        @@earrings_slot_04_image_sprite.position = @@earrings_slot_04_sprite.position - SF.vector2(80 * max_scale, 100 * max_scale)
        @@earrings_slot_04_image_sprite.scale = SF.vector2(4, 4)
        @@earrings_slot_04_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)


        earrings_slot_04_image_sprite_dup = @@earrings_slot_04_image_sprite.dup
        earrings_slot_04_image_sprite_dup.position = @@earrings_slot_04_sprite.position - SF.vector2(65 * max_scale, 100 * max_scale)


        @@earrings_slot_05_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 40 * max_scale)
        @@earrings_slot_05_sprite.scale = SF.vector2(1, 1)

        @@earrings_slot_05_text.position = @@earrings_slot_05_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@earrings_slot_05_text)
        
        @@earrings_slot_05_image_sprite.position = @@earrings_slot_05_sprite.position - SF.vector2(80 * max_scale, 100 * max_scale)
        @@earrings_slot_05_image_sprite.scale = SF.vector2(4, 4)
        @@earrings_slot_05_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        earrings_slot_05_image_sprite_dup = @@earrings_slot_05_image_sprite.dup
        earrings_slot_05_image_sprite_dup.position = @@earrings_slot_05_sprite.position - SF.vector2(65 * max_scale, 100 * max_scale)
        

        @@earrings_slot_06_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 120 * max_scale)
        @@earrings_slot_06_sprite.scale = SF.vector2(1, 1)

        @@earrings_slot_06_text.position = @@earrings_slot_06_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@earrings_slot_06_text)
        
        @@earrings_slot_06_image_sprite.position = @@earrings_slot_06_sprite.position - SF.vector2(80 * max_scale, 100 * max_scale)
        @@earrings_slot_06_image_sprite.scale = SF.vector2(4, 4)
        @@earrings_slot_06_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        earrings_slot_06_image_sprite_dup = @@earrings_slot_06_image_sprite.dup
        earrings_slot_06_image_sprite_dup.position = @@earrings_slot_06_sprite.position - SF.vector2(65 * max_scale, 100 * max_scale)
        

        @@earrings_slot_07_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 120 * max_scale)
        @@earrings_slot_07_sprite.scale = SF.vector2(1, 1)
        
        @@earrings_slot_07_text.position = @@earrings_slot_07_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@earrings_slot_07_text)
        
        @@earrings_slot_07_image_sprite.position = @@earrings_slot_07_sprite.position - SF.vector2(80 * max_scale, 100 * max_scale)
        @@earrings_slot_07_image_sprite.scale = SF.vector2(4, 4)
        @@earrings_slot_07_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)


        earrings_slot_07_image_sprite_dup = @@earrings_slot_07_image_sprite.dup
        earrings_slot_07_image_sprite_dup.position = @@earrings_slot_07_sprite.position - SF.vector2(65 * max_scale, 100 * max_scale)
        

        @@earrings_slot_08_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 120 * max_scale)
        @@earrings_slot_08_sprite.scale = SF.vector2(1, 1)
                
        @@earrings_slot_08_text.position = @@earrings_slot_08_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@earrings_slot_08_text)
        
        @@earrings_slot_08_image_sprite.position = @@earrings_slot_08_sprite.position - SF.vector2(80 * max_scale, 100 * max_scale)
        @@earrings_slot_08_image_sprite.scale = SF.vector2(4, 4)
        @@earrings_slot_08_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        earrings_slot_08_image_sprite_dup = @@earrings_slot_08_image_sprite.dup
        earrings_slot_08_image_sprite_dup.position = @@earrings_slot_08_sprite.position - SF.vector2(65 * max_scale, 100 * max_scale)
        

        @@earrings_slot_09_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 120 * max_scale)
        @@earrings_slot_09_sprite.scale = SF.vector2(1, 1)
                
        @@earrings_slot_09_text.position = @@earrings_slot_09_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@earrings_slot_09_text)
        
        @@earrings_slot_09_image_sprite.position = @@earrings_slot_09_sprite.position - SF.vector2(80 * max_scale, 100 * max_scale)
        @@earrings_slot_09_image_sprite.scale = SF.vector2(4, 4)
        @@earrings_slot_09_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        earrings_slot_09_image_sprite_dup = @@earrings_slot_09_image_sprite.dup
        earrings_slot_09_image_sprite_dup.position = @@earrings_slot_09_sprite.position - SF.vector2(65 * max_scale, 100 * max_scale)
        

        @@earrings_slot_10_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 120 * max_scale)
        @@earrings_slot_10_sprite.scale = SF.vector2(1, 1)
                        
        @@earrings_slot_10_text.position = @@earrings_slot_10_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@earrings_slot_10_text)
        
        @@earrings_slot_10_image_sprite.position = @@earrings_slot_10_sprite.position - SF.vector2(80 * max_scale, 100 * max_scale)
        @@earrings_slot_10_image_sprite.scale = SF.vector2(4, 4)
        @@earrings_slot_10_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        earrings_slot_10_image_sprite_dup = @@earrings_slot_10_image_sprite.dup
        earrings_slot_10_image_sprite_dup.position = @@earrings_slot_10_sprite.position - SF.vector2(65 * max_scale, 100 * max_scale)
        

        @@earrings_slot_11_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 200 * max_scale)
        @@earrings_slot_11_sprite.scale = SF.vector2(1, 1)
                        
        @@earrings_slot_11_text.position = @@earrings_slot_11_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@earrings_slot_11_text)
        
        @@earrings_slot_11_image_sprite.position = @@earrings_slot_11_sprite.position - SF.vector2(80 * max_scale, 100 * max_scale)
        @@earrings_slot_11_image_sprite.scale = SF.vector2(4, 4)
        @@earrings_slot_11_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        earrings_slot_11_image_sprite_dup = @@earrings_slot_11_image_sprite.dup
        earrings_slot_11_image_sprite_dup.position = @@earrings_slot_11_sprite.position - SF.vector2(65 * max_scale, 100 * max_scale)
        

        @@earrings_slot_12_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 200 * max_scale)
        @@earrings_slot_12_sprite.scale = SF.vector2(1, 1)
                        
        @@earrings_slot_12_text.position = @@earrings_slot_12_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@earrings_slot_12_text)
        
        @@earrings_slot_12_image_sprite.position = @@earrings_slot_12_sprite.position - SF.vector2(80 * max_scale, 100 * max_scale)
        @@earrings_slot_12_image_sprite.scale = SF.vector2(4, 4)
        @@earrings_slot_12_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        earrings_slot_12_image_sprite_dup = @@earrings_slot_12_image_sprite.dup
        earrings_slot_12_image_sprite_dup.position = @@earrings_slot_12_sprite.position - SF.vector2(65 * max_scale, 100 * max_scale)
        

        @@earrings_slot_13_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 200 * max_scale)
        @@earrings_slot_13_sprite.scale = SF.vector2(1, 1)
        
        @@earrings_slot_13_text.position = @@earrings_slot_13_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@earrings_slot_13_text)
        
        @@earrings_slot_13_image_sprite.position = @@earrings_slot_13_sprite.position - SF.vector2(80 * max_scale, 100 * max_scale)
        @@earrings_slot_13_image_sprite.scale = SF.vector2(4, 4)
        @@earrings_slot_13_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        earrings_slot_13_image_sprite_dup = @@earrings_slot_13_image_sprite.dup
        earrings_slot_13_image_sprite_dup.position = @@earrings_slot_13_sprite.position - SF.vector2(65 * max_scale, 100 * max_scale)
        

        @@earrings_slot_14_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 200 * max_scale)
        @@earrings_slot_14_sprite.scale = SF.vector2(1, 1)
                        
        @@earrings_slot_14_text.position = @@earrings_slot_14_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@earrings_slot_14_text)
        
        @@earrings_slot_14_image_sprite.position = @@earrings_slot_14_sprite.position - SF.vector2(80 * max_scale, 100 * max_scale)
        @@earrings_slot_14_image_sprite.scale = SF.vector2(4, 4)
        @@earrings_slot_14_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        earrings_slot_14_image_sprite_dup = @@earrings_slot_14_image_sprite.dup
        earrings_slot_14_image_sprite_dup.position = @@earrings_slot_14_sprite.position - SF.vector2(65 * max_scale, 100 * max_scale)
        

        @@earrings_slot_15_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 200 * max_scale)
        @@earrings_slot_15_sprite.scale = SF.vector2(1, 1)
                        
        @@earrings_slot_15_text.position = @@earrings_slot_15_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@earrings_slot_15_text)
        
        @@earrings_slot_15_image_sprite.position = @@earrings_slot_15_sprite.position - SF.vector2(80 * max_scale, 100 * max_scale)
        @@earrings_slot_15_image_sprite.scale = SF.vector2(4, 4)
        @@earrings_slot_15_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        earrings_slot_15_image_sprite_dup = @@earrings_slot_15_image_sprite.dup
        earrings_slot_15_image_sprite_dup.position = @@earrings_slot_15_sprite.position - SF.vector2(65 * max_scale, 100 * max_scale)


        window.draw(@@earrings_slot_01_sprite)
        window.draw(@@earrings_slot_01_image_sprite)
        window.draw(earrings_slot_01_image_sprite_dup)
        window.draw(@@earrings_slot_01_text)

        window.draw(@@earrings_slot_02_sprite)
        window.draw(@@earrings_slot_02_image_sprite)
        window.draw(earrings_slot_02_image_sprite_dup)
        window.draw(@@earrings_slot_02_text)

        window.draw(@@earrings_slot_03_sprite)
        window.draw(@@earrings_slot_03_image_sprite)
        window.draw(earrings_slot_03_image_sprite_dup)
        window.draw(@@earrings_slot_03_text)
        
        window.draw(@@earrings_slot_04_sprite)
        window.draw(@@earrings_slot_04_image_sprite)
        window.draw(earrings_slot_04_image_sprite_dup)
        window.draw(@@earrings_slot_04_text)

        window.draw(@@earrings_slot_05_sprite)
        window.draw(@@earrings_slot_05_image_sprite)
        window.draw(earrings_slot_05_image_sprite_dup)
        window.draw(@@earrings_slot_05_text)

        window.draw(@@earrings_slot_06_sprite)
        window.draw(@@earrings_slot_06_image_sprite)
        window.draw(earrings_slot_06_image_sprite_dup)
        window.draw(@@earrings_slot_06_text)

        window.draw(@@earrings_slot_07_sprite)
        window.draw(@@earrings_slot_07_image_sprite)
        window.draw(earrings_slot_07_image_sprite_dup)
        window.draw(@@earrings_slot_07_text)

        window.draw(@@earrings_slot_08_sprite)
        window.draw(@@earrings_slot_08_image_sprite)
        window.draw(earrings_slot_08_image_sprite_dup)
        window.draw(@@earrings_slot_08_text)

        window.draw(@@earrings_slot_09_sprite)
        window.draw(@@earrings_slot_09_image_sprite)
        window.draw(earrings_slot_09_image_sprite_dup)
        window.draw(@@earrings_slot_09_text)

        window.draw(@@earrings_slot_10_sprite)
        window.draw(@@earrings_slot_10_image_sprite)
        window.draw(earrings_slot_10_image_sprite_dup)
        window.draw(@@earrings_slot_10_text)

        window.draw(@@earrings_slot_11_sprite)
        window.draw(@@earrings_slot_11_image_sprite)
        window.draw(earrings_slot_11_image_sprite_dup)
        window.draw(@@earrings_slot_11_text)

        window.draw(@@earrings_slot_12_sprite)
        window.draw(@@earrings_slot_12_image_sprite)
        window.draw(earrings_slot_12_image_sprite_dup)
        window.draw(@@earrings_slot_12_text)

        window.draw(@@earrings_slot_13_sprite)
        window.draw(@@earrings_slot_13_image_sprite)
        window.draw(earrings_slot_13_image_sprite_dup)
        window.draw(@@earrings_slot_13_text)

        window.draw(@@earrings_slot_14_sprite)
        window.draw(@@earrings_slot_14_image_sprite)
        window.draw(earrings_slot_14_image_sprite_dup)
        window.draw(@@earrings_slot_14_text)

        window.draw(@@earrings_slot_15_sprite)
        window.draw(@@earrings_slot_15_image_sprite)
        window.draw(earrings_slot_15_image_sprite_dup)
        window.draw(@@earrings_slot_15_text)

        if SF::Mouse.button_pressed?(SF::Mouse::Left)
            ClothingTabEarrings.clothes_mouse_handling(window)
        end
       end

       def ClothingTabEarrings.clothes_mouse_handling(window)
        ClothingTabEarrings.owned_earrings_array
        mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window))
        mouse_x = mouse_position.x
        mouse_y = mouse_position.y
        
    
        current_size = window.size
        original_width = 800 
        original_height = 600 

        scale_x = (current_size.x.to_f / original_width)
        scale_y = current_size.y.to_f / original_height
        

        #------------------------------------objects-------------------------------------------------

            slot_01_x = @@earrings_slot_01_sprite.position.x
            slot_01_y = @@earrings_slot_01_sprite.position.y
            slot_01_width = @@earrings_slot_01_sprite.size.x
            slot_01_height = @@earrings_slot_01_sprite.size.y

            slot_02_x = @@earrings_slot_02_sprite.position.x
            slot_02_y = @@earrings_slot_02_sprite.position.y
            slot_02_width = @@earrings_slot_02_sprite.size.x
            slot_02_height = @@earrings_slot_02_sprite.size.y

            slot_03_x = @@earrings_slot_03_sprite.position.x
            slot_03_y = @@earrings_slot_03_sprite.position.y
            slot_03_width = @@earrings_slot_03_sprite.size.x
            slot_03_height = @@earrings_slot_03_sprite.size.y

            slot_04_x = @@earrings_slot_04_sprite.position.x
            slot_04_y = @@earrings_slot_04_sprite.position.y
            slot_04_width = @@earrings_slot_04_sprite.size.x
            slot_04_height = @@earrings_slot_04_sprite.size.y

            slot_05_x = @@earrings_slot_05_sprite.position.x
            slot_05_y = @@earrings_slot_05_sprite.position.y
            slot_05_width = @@earrings_slot_05_sprite.size.x
            slot_05_height = @@earrings_slot_05_sprite.size.y

            slot_06_x = @@earrings_slot_06_sprite.position.x
            slot_06_y = @@earrings_slot_06_sprite.position.y
            slot_06_width = @@earrings_slot_06_sprite.size.x
            slot_06_height = @@earrings_slot_06_sprite.size.y

            slot_07_x = @@earrings_slot_07_sprite.position.x
            slot_07_y = @@earrings_slot_07_sprite.position.y
            slot_07_width = @@earrings_slot_07_sprite.size.x
            slot_07_height = @@earrings_slot_07_sprite.size.y

            slot_08_x = @@earrings_slot_08_sprite.position.x
            slot_08_y = @@earrings_slot_08_sprite.position.y
            slot_08_width = @@earrings_slot_08_sprite.size.x
            slot_08_height = @@earrings_slot_08_sprite.size.y

            slot_09_x = @@earrings_slot_09_sprite.position.x
            slot_09_y = @@earrings_slot_09_sprite.position.y
            slot_09_width = @@earrings_slot_09_sprite.size.x
            slot_09_height = @@earrings_slot_09_sprite.size.y

            slot_10_x = @@earrings_slot_10_sprite.position.x
            slot_10_y = @@earrings_slot_10_sprite.position.y
            slot_10_width = @@earrings_slot_10_sprite.size.x
            slot_10_height = @@earrings_slot_10_sprite.size.y

            slot_11_x = @@earrings_slot_11_sprite.position.x
            slot_11_y = @@earrings_slot_11_sprite.position.y
            slot_11_width = @@earrings_slot_11_sprite.size.x
            slot_11_height = @@earrings_slot_11_sprite.size.y

            slot_12_x = @@earrings_slot_12_sprite.position.x
            slot_12_y = @@earrings_slot_12_sprite.position.y
            slot_12_width = @@earrings_slot_12_sprite.size.x
            slot_12_height = @@earrings_slot_12_sprite.size.y

            slot_13_x = @@earrings_slot_13_sprite.position.x
            slot_13_y = @@earrings_slot_13_sprite.position.y
            slot_13_width = @@earrings_slot_13_sprite.size.x
            slot_13_height = @@earrings_slot_13_sprite.size.y

            slot_14_x = @@earrings_slot_14_sprite.position.x
            slot_14_y = @@earrings_slot_14_sprite.position.y
            slot_14_width = @@earrings_slot_14_sprite.size.x
            slot_14_height = @@earrings_slot_14_sprite.size.y

            slot_15_x = @@earrings_slot_15_sprite.position.x
            slot_15_y = @@earrings_slot_15_sprite.position.y
            slot_15_width = @@earrings_slot_15_sprite.size.x
            slot_15_height = @@earrings_slot_15_sprite.size.y
        #---------------------------------------------------------------------------------------------
        
        if (mouse_x >= slot_01_x && mouse_x <= slot_01_x + slot_01_width) &&
           (mouse_y >= slot_01_y && mouse_y <= slot_01_y + slot_01_height)
            if @@earrings_slot_01 != nil   
                t = 0 + ((@@page || 1) * 15) - 15
                
                @@owned_earrings_array[t] = (Clothing::Earrings.get_earrings(
                Player::Appearance.get_clothing("earrings").try(&.to_s) || Clothing::Earrings.get_earrings("No Earrings").not_nil!)).not_nil!
                Player::Appearance.change_earrings(@@earrings_slot_01.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_earrings_array.uniq!
                @@owned_earrings_array.compact!
            end
            ClothingTabEarrings.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_02_x && mouse_x <= slot_02_x + slot_02_width) &&
           (mouse_y >= slot_02_y && mouse_y <= slot_02_y + slot_02_height)
           
            if @@earrings_slot_02 != nil
                t = 1 + ((@@page || 1) * 15) - 15
                
                @@owned_earrings_array[t] = (Clothing::Earrings.get_earrings(
                Player::Appearance.get_clothing("earrings").try(&.to_s) || Clothing::Earrings.get_earrings("No Earrings").not_nil!)).not_nil!
                Player::Appearance.change_earrings(@@earrings_slot_02.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_earrings_array.uniq!
                @@owned_earrings_array.compact!
            end
            ClothingTabEarrings.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_03_x && mouse_x <= slot_03_x + slot_03_width) &&
           (mouse_y >= slot_03_y && mouse_y <= slot_03_y + slot_03_height)
           
            if @@earrings_slot_03 != nil
                t = 2 + ((@@page || 1) * 15) - 15
                if t < @@owned_earrings_array.size
                @@owned_earrings_array[t] = (Clothing::Earrings.get_earrings(
                Player::Appearance.get_clothing("earrings").try(&.to_s) || Clothing::Earrings.get_earrings("No Earrings").not_nil!)).not_nil!
                Player::Appearance.change_earrings(@@earrings_slot_03.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_earrings_array.uniq!
                @@owned_earrings_array.compact!
                end
            end
            ClothingTabEarrings.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_04_x && mouse_x <= slot_04_x + slot_04_width) &&
           (mouse_y >= slot_04_y && mouse_y <= slot_04_y + slot_04_height)
           
            if @@earrings_slot_04 != nil
                t = 3 + ((@@page || 1) * 15) - 15
                
                @@owned_earrings_array[t] = (Clothing::Earrings.get_earrings(Player::Appearance.get_clothing("earrings").not_nil!).not_nil!)
                Player::Appearance.change_earrings(@@earrings_slot_04.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_earrings_array.uniq!
                @@owned_earrings_array.compact!
            end
            ClothingTabEarrings.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_05_x && mouse_x <= slot_05_x + slot_05_width) &&
           (mouse_y >= slot_05_y && mouse_y <= slot_05_y + slot_05_height)
           
            if @@earrings_slot_05 != nil
                t = 4 + ((@@page || 1) * 15) - 15
                
                @@owned_earrings_array[t] = (Clothing::Earrings.get_earrings(Player::Appearance.get_clothing("earrings").not_nil!).not_nil!)
                Player::Appearance.change_earrings(@@earrings_slot_05.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_earrings_array.uniq!
                @@owned_earrings_array.compact!
            end
            ClothingTabEarrings.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_06_x && mouse_x <= slot_06_x + slot_06_width) &&
           (mouse_y >= slot_06_y && mouse_y <= slot_06_y + slot_06_height)
           
            if @@earrings_slot_06 != nil
                t = 5 + ((@@page || 1) * 15) - 15
                
                @@owned_earrings_array[t] = (Clothing::Earrings.get_earrings(Player::Appearance.get_clothing("earrings").not_nil!).not_nil!)
                Player::Appearance.change_earrings(@@earrings_slot_06.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_earrings_array.uniq!
                @@owned_earrings_array.compact!
            end
            ClothingTabEarrings.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_07_x && mouse_x <= slot_07_x + slot_07_width) &&
           (mouse_y >= slot_07_y && mouse_y <= slot_07_y + slot_07_height)
           
            if @@earrings_slot_07 != nil
                t = 6 + ((@@page || 1) * 15) - 15
                
                @@owned_earrings_array[t] = (Clothing::Earrings.get_earrings(Player::Appearance.get_clothing("earrings").not_nil!).not_nil!)
                Player::Appearance.change_earrings(@@earrings_slot_07.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_earrings_array.uniq!
                @@owned_earrings_array.compact!
            end
            ClothingTabEarrings.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_08_x && mouse_x <= slot_08_x + slot_08_width) &&
           (mouse_y >= slot_08_y && mouse_y <= slot_08_y + slot_08_height)
           
            if @@earrings_slot_08 != nil
                t = 7 + ((@@page || 1) * 15) - 15
                
                @@owned_earrings_array[t] = (Clothing::Earrings.get_earrings(Player::Appearance.get_clothing("earrings").not_nil!).not_nil!)
                Player::Appearance.change_earrings(@@earrings_slot_08.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_earrings_array.uniq!
                @@owned_earrings_array.compact!
            end
            ClothingTabEarrings.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_09_x && mouse_x <= slot_09_x + slot_09_width) &&
           (mouse_y >= slot_09_y && mouse_y <= slot_09_y + slot_09_height)
           
            if @@earrings_slot_09 != nil
                t = 8 + ((@@page || 1) * 15) - 15
                
                @@owned_earrings_array[t] = (Clothing::Earrings.get_earrings(Player::Appearance.get_clothing("earrings").not_nil!).not_nil!)
                Player::Appearance.change_earrings(@@earrings_slot_09.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_earrings_array.uniq!
                @@owned_earrings_array.compact!
            end
            ClothingTabEarrings.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_10_x && mouse_x <= slot_10_x + slot_10_width) &&
           (mouse_y >= slot_10_y && mouse_y <= slot_10_y + slot_10_height)
           
            if @@earrings_slot_10 != nil
                t = 9 + ((@@page || 1) * 15) - 15
                
                @@owned_earrings_array[t] = (Clothing::Earrings.get_earrings(Player::Appearance.get_clothing("earrings").not_nil!).not_nil!)
                Player::Appearance.change_earrings(@@earrings_slot_10.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_earrings_array.uniq!
                @@owned_earrings_array.compact!
            end
            ClothingTabEarrings.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_11_x && mouse_x <= slot_11_x + slot_11_width) &&
           (mouse_y >= slot_11_y && mouse_y <= slot_11_y + slot_11_height)
           
            if @@earrings_slot_11 != nil
                t = 10 + ((@@page || 1) * 15) - 15
                
                @@owned_earrings_array[t] = (Clothing::Earrings.get_earrings(Player::Appearance.get_clothing("earrings").not_nil!).not_nil!)
                Player::Appearance.change_earrings(@@earrings_slot_11.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_earrings_array.uniq!
                @@owned_earrings_array.compact!
            end
            ClothingTabEarrings.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_12_x && mouse_x <= slot_12_x + slot_12_width) &&
           (mouse_y >= slot_12_y && mouse_y <= slot_12_y + slot_12_height)
           
            if @@earrings_slot_12 != nil
                t = 11 + ((@@page || 1) * 15) - 15
                
                @@owned_earrings_array[t] = (Clothing::Earrings.get_earrings(Player::Appearance.get_clothing("earrings").not_nil!).not_nil!)
                Player::Appearance.change_earrings(@@earrings_slot_12.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_earrings_array.uniq!
                @@owned_earrings_array.compact!
            end
            ClothingTabEarrings.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_13_x && mouse_x <= slot_13_x + slot_13_width) &&
           (mouse_y >= slot_13_y && mouse_y <= slot_13_y + slot_13_height)
           
            if @@earrings_slot_13 != nil
                t = 12 + ((@@page || 1) * 15) - 15
                
                @@owned_earrings_array[t] = (Clothing::Earrings.get_earrings(Player::Appearance.get_clothing("earrings").not_nil!).not_nil!)
                Player::Appearance.change_earrings(@@earrings_slot_13.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_earrings_array.uniq!
                @@owned_earrings_array.compact!
            end
            ClothingTabEarrings.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_14_x && mouse_x <= slot_14_x + slot_14_width) &&
           (mouse_y >= slot_14_y && mouse_y <= slot_14_y + slot_14_height)
           
            if @@earrings_slot_14 != nil
                t = 13 + ((@@page || 1) * 15) - 15
                
                @@owned_earrings_array[t] = (Clothing::Earrings.get_earrings(Player::Appearance.get_clothing("earrings").not_nil!).not_nil!)
                Player::Appearance.change_earrings(@@earrings_slot_14.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_earrings_array.uniq!
                @@owned_earrings_array.compact!
            end
            ClothingTabEarrings.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_15_x && mouse_x <= slot_15_x + slot_15_width) &&
           (mouse_y >= slot_15_y && mouse_y <= slot_15_y + slot_15_height)
           
            if @@earrings_slot_15 != nil
                t = 14 + ((@@page || 1) * 15) - 15
                
                @@owned_earrings_array[t] = (Clothing::Earrings.get_earrings(Player::Appearance.get_clothing("earrings").not_nil!).not_nil!)
                Player::Appearance.change_earrings(@@earrings_slot_15.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                @@owned_earrings_array.uniq!
                @@owned_earrings_array.compact!
            end
            ClothingTabEarrings.assign_slot_textures(window)
            sleep 0.15.seconds
        end

       end

    end

    class ClothingTabHat
        @@owned_hat_array = [] of Clothing::Hat

        @@hat_sorting_category = "Type"

        @@hat_slot_01 : Clothing::Hat? = nil
        @@hat_slot_02 : Clothing::Hat? = nil
        @@hat_slot_03 : Clothing::Hat? = nil
        @@hat_slot_04 : Clothing::Hat? = nil
        @@hat_slot_05 : Clothing::Hat? = nil
        @@hat_slot_06 : Clothing::Hat? = nil
        @@hat_slot_07 : Clothing::Hat? = nil
        @@hat_slot_08 : Clothing::Hat? = nil
        @@hat_slot_09 : Clothing::Hat? = nil
        @@hat_slot_10 : Clothing::Hat? = nil
        @@hat_slot_11 : Clothing::Hat? = nil
        @@hat_slot_12 : Clothing::Hat? = nil
        @@hat_slot_13 : Clothing::Hat? = nil
        @@hat_slot_14 : Clothing::Hat? = nil
        @@hat_slot_15 : Clothing::Hat? = nil

       #---------------------------------debug-------------------------------------------
        @@owned_hat_array.push(Clothing::Hat.get_hat("No Hat").not_nil!)

        @@owned_hat_array.push(Clothing::Hat.get_hat("White Baseball Cap").not_nil!)
        @@owned_hat_array.push(Clothing::Hat.get_hat("Black Baseball Cap").not_nil!)
        @@owned_hat_array.push(Clothing::Hat.get_hat("Brown Baseball Cap").not_nil!)
        @@owned_hat_array.push(Clothing::Hat.get_hat("Red Baseball Cap").not_nil!)
        @@owned_hat_array.push(Clothing::Hat.get_hat("Orange Baseball Cap").not_nil!)
        @@owned_hat_array.push(Clothing::Hat.get_hat("Yellow Baseball Cap").not_nil!)
        @@owned_hat_array.push(Clothing::Hat.get_hat("Green Baseball Cap").not_nil!)
        @@owned_hat_array.push(Clothing::Hat.get_hat("Blue Baseball Cap").not_nil!)
        @@owned_hat_array.push(Clothing::Hat.get_hat("Purple Baseball Cap").not_nil!)
        @@owned_hat_array.push(Clothing::Hat.get_hat("Pink Baseball Cap").not_nil!)

        @@owned_hat_array.push(Clothing::Hat.get_hat("White Sweatband").not_nil!)
        @@owned_hat_array.push(Clothing::Hat.get_hat("Black Sweatband").not_nil!)
        @@owned_hat_array.push(Clothing::Hat.get_hat("Brown Sweatband").not_nil!)
        @@owned_hat_array.push(Clothing::Hat.get_hat("Red Sweatband").not_nil!)
        @@owned_hat_array.push(Clothing::Hat.get_hat("Orange Sweatband").not_nil!)
        @@owned_hat_array.push(Clothing::Hat.get_hat("Yellow Sweatband").not_nil!)
        @@owned_hat_array.push(Clothing::Hat.get_hat("Green Sweatband").not_nil!)
        @@owned_hat_array.push(Clothing::Hat.get_hat("Blue Sweatband").not_nil!)
        @@owned_hat_array.push(Clothing::Hat.get_hat("Purple Sweatband").not_nil!)
        @@owned_hat_array.push(Clothing::Hat.get_hat("Pink Sweatband").not_nil!)
        
        @@owned_hat_array.uniq!
       #---------------------------------------------------------------------------------

       #--------------------------------objects------------------------------------------
        INVENTORY_BOX = SF::RectangleShape.new(SF.vector2(610, 420))
        INVENTORY_BOX.fill_color = SF.color( 137, 170, 208 )

        
        @@clothing_left_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_left_arrow_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_right_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_right_arrow_sprite.fill_color = SF.color(161, 183, 208)


        @@clothing_sort_button_sprite = SF::RectangleShape.new(SF.vector2(75, 25))
        @@clothing_sort_button_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_hat_category_box = SF::RectangleShape.new(SF.vector2(100, 25))
        @@clothing_hat_category_box.fill_color = SF.color(161, 183, 208)

        @@clothing_sort_button_text = SF::Text.new
        @@clothing_sort_button_text.font = QUICKSAND
        @@clothing_sort_button_text.character_size = 20
        @@clothing_sort_button_text.color = SF::Color::Blue
        @@clothing_sort_button_text.string = "Sort"


        @@clothing_right_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_right_arrow_sprite.fill_color = SF.color(161, 183, 208)

        @@hat_tab = SF::RectangleShape.new(SF.vector2(100, 50))
        @@hat_tab.fill_color = SF.color(141, 163, 188)

        @@hat_tab_text = SF::Text.new
        @@hat_tab_text.font = QUICKSAND
        @@hat_tab_text.character_size = 20
        @@hat_tab_text.color = SF::Color::Blue
        @@hat_tab_text.string = "Hats"

        @@hat_tab = SF::RectangleShape.new(SF.vector2(100, 50))
        @@hat_tab.fill_color = SF.color(161, 183, 208)

        @@hat_tab_text = SF::Text.new
        @@hat_tab_text.font = QUICKSAND
        @@hat_tab_text.character_size = 20
        @@hat_tab_text.color = SF::Color::Blue
        @@hat_tab_text.string = "Hat"


        @@hat_slot_01_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@hat_slot_01_sprite.fill_color = SF.color(161, 183, 208)

        @@hat_slot_01_text = SF::Text.new
        @@hat_slot_01_text.font = QUICKSAND
        @@hat_slot_01_text.character_size = 12
        @@hat_slot_01_text.color = SF::Color::Blue

        @@hat_slot_01_image_sprite = SF::Sprite.new


        @@hat_slot_02_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@hat_slot_02_sprite.fill_color = SF.color(161, 183, 208)

        @@hat_slot_02_text = SF::Text.new
        @@hat_slot_02_text.font = QUICKSAND
        @@hat_slot_02_text.character_size = 12
        @@hat_slot_02_text.color = SF::Color::Blue

        @@hat_slot_02_image_sprite = SF::Sprite.new


        @@hat_slot_03_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@hat_slot_03_sprite.fill_color = SF.color(161, 183, 208)

        @@hat_slot_03_text = SF::Text.new
        @@hat_slot_03_text.font = QUICKSAND
        @@hat_slot_03_text.character_size = 12
        @@hat_slot_03_text.color = SF::Color::Blue

        @@hat_slot_03_image_sprite = SF::Sprite.new


        @@hat_slot_04_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@hat_slot_04_sprite.fill_color = SF.color(161, 183, 208)

        @@hat_slot_04_text = SF::Text.new
        @@hat_slot_04_text.font = QUICKSAND
        @@hat_slot_04_text.character_size = 12
        @@hat_slot_04_text.color = SF::Color::Blue

        @@hat_slot_04_image_sprite = SF::Sprite.new


        @@hat_slot_05_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@hat_slot_05_sprite.fill_color = SF.color(161, 183, 208)

        @@hat_slot_05_text = SF::Text.new
        @@hat_slot_05_text.font = QUICKSAND
        @@hat_slot_05_text.character_size = 12
        @@hat_slot_05_text.color = SF::Color::Blue

        @@hat_slot_05_image_sprite = SF::Sprite.new


        @@hat_slot_06_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@hat_slot_06_sprite.fill_color = SF.color(161, 183, 208)

        @@hat_slot_06_text = SF::Text.new
        @@hat_slot_06_text.font = QUICKSAND
        @@hat_slot_06_text.character_size = 12
        @@hat_slot_06_text.color = SF::Color::Blue
        
        @@hat_slot_06_image_sprite = SF::Sprite.new


        @@hat_slot_07_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@hat_slot_07_sprite.fill_color = SF.color(161, 183, 208)

        @@hat_slot_07_text = SF::Text.new
        @@hat_slot_07_text.font = QUICKSAND
        @@hat_slot_07_text.character_size = 12
        @@hat_slot_07_text.color = SF::Color::Blue

        @@hat_slot_07_image_sprite = SF::Sprite.new


        @@hat_slot_08_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@hat_slot_08_sprite.fill_color = SF.color(161, 183, 208)

        @@hat_slot_08_text = SF::Text.new
        @@hat_slot_08_text.font = QUICKSAND
        @@hat_slot_08_text.character_size = 12
        @@hat_slot_08_text.color = SF::Color::Blue

        @@hat_slot_08_image_sprite = SF::Sprite.new


        @@hat_slot_09_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@hat_slot_09_sprite.fill_color = SF.color(161, 183, 208)

        @@hat_slot_09_text = SF::Text.new
        @@hat_slot_09_text.font = QUICKSAND
        @@hat_slot_09_text.character_size = 12
        @@hat_slot_09_text.color = SF::Color::Blue

        @@hat_slot_09_image_sprite = SF::Sprite.new


        @@hat_slot_10_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@hat_slot_10_sprite.fill_color = SF.color(161, 183, 208)

        @@hat_slot_10_text = SF::Text.new
        @@hat_slot_10_text.font = QUICKSAND
        @@hat_slot_10_text.character_size = 12
        @@hat_slot_10_text.color = SF::Color::Blue

        @@hat_slot_10_image_sprite = SF::Sprite.new


        @@hat_slot_11_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@hat_slot_11_sprite.fill_color = SF.color(161, 183, 208)

        @@hat_slot_11_text = SF::Text.new
        @@hat_slot_11_text.font = QUICKSAND
        @@hat_slot_11_text.character_size = 12
        @@hat_slot_11_text.color = SF::Color::Blue

        @@hat_slot_11_image_sprite = SF::Sprite.new


        @@hat_slot_12_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@hat_slot_12_sprite.fill_color = SF.color(161, 183, 208)

        @@hat_slot_12_text = SF::Text.new
        @@hat_slot_12_text.font = QUICKSAND
        @@hat_slot_12_text.character_size = 12
        @@hat_slot_12_text.color = SF::Color::Blue

        @@hat_slot_12_image_sprite = SF::Sprite.new


        @@hat_slot_13_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@hat_slot_13_sprite.fill_color = SF.color(161, 183, 208)

        @@hat_slot_13_text = SF::Text.new
        @@hat_slot_13_text.font = QUICKSAND
        @@hat_slot_13_text.character_size = 12
        @@hat_slot_13_text.color = SF::Color::Blue

        @@hat_slot_13_image_sprite = SF::Sprite.new


        @@hat_slot_14_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@hat_slot_14_sprite.fill_color = SF.color(161, 183, 208)

        @@hat_slot_14_text = SF::Text.new
        @@hat_slot_14_text.font = QUICKSAND
        @@hat_slot_14_text.character_size = 12
        @@hat_slot_14_text.color = SF::Color::Blue

        @@hat_slot_14_image_sprite = SF::Sprite.new


        @@hat_slot_15_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@hat_slot_15_sprite.fill_color = SF.color(161, 183, 208)

        @@hat_slot_15_text = SF::Text.new
        @@hat_slot_15_text.font = QUICKSAND
        @@hat_slot_15_text.character_size = 12
        @@hat_slot_15_text.color = SF::Color::Blue

        @@hat_slot_15_image_sprite = SF::Sprite.new

       #---------------------------------------------------------------------------------

       def initialize(is_open : Bool, page : Int32)
        @@is_open = is_open
        @@page = page
       end

       def ClothingTabHat.is_open
        @@is_open
       end

       def ClothingTabHat.page
        @@page
       end

       def ClothingTabHat.is_open=(this)
        @@is_open = this
       end

       def ClothingTabHat.page=(this)
        @@page = this
       end

       def ClothingTabHat.owned_hat_array
        @@owned_hat_array
       end

       def ClothingTabHat.owned_hat_array=(this)
        @@owned_hat_array = this
       end

       def ClothingTabHat.push_to_owned_hat_array(this)
        @@owned_hat_array.push(this)
       end

       def ClothingTabHat.change_hat_sort_category
        case @@hat_sorting_category
        when "Type"
            @@hat_sorting_category = "Color"
        when "Color"
            @@hat_sorting_category = "Type"
        end
       end

       def ClothingTabHat.get_hat_category
        return @@hat_sorting_category
       end

       def ClothingTabHat.organise_owned_hat_array_by_type(window)
        temp_clothing_array_01 = [] of Clothing::Hat
        @@owned_hat_array.each { |hat| if hat.length.includes?("full") == true
        temp_clothing_array_01.push(hat)
        end}

        @@owned_hat_array.each { |hat| if hat.length.includes?("ring") == true
        temp_clothing_array_01.push(hat)
        end}

        @@owned_hat_array.each { |hat| if hat.length.includes?("floating") == true
        temp_clothing_array_01.push(hat)
        end}

        @@owned_hat_array.clear
        @@owned_hat_array = temp_clothing_array_01
        @@owned_hat_array.uniq!
        ClothingTabHat.assign_slot_textures(window)
       end

       def ClothingTabHat.initialize_clothing_tab(window)
        @@page = 1
        INVENTORY_BOX.position = SF.vector2(20, 40)  
       end

       def ClothingTabHat.assign_slot_textures(window)
        if @@page == nil
            @@page = 1
        end
        if @@owned_hat_array.size > 0
            t = 0 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_hat_array.size - 1
             @@hat_slot_01_image_sprite.texture = @@owned_hat_array[t].texture
             @@hat_slot_01_text.string = @@owned_hat_array[t].name
             @@hat_slot_01 = @@owned_hat_array[t]
            else
                @@hat_slot_01_image_sprite.texture = NIL_TEXTURE
                @@hat_slot_01_text.string = ""
                @@hat_slot_01 = nil
            end
        end
        if @@owned_hat_array.size > 1
            t = 1 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_hat_array.size - 1
             @@hat_slot_02_image_sprite.texture = @@owned_hat_array[t].texture
             @@hat_slot_02_text.string = @@owned_hat_array[t].name
             @@hat_slot_02 = @@owned_hat_array[t]
            else
                @@hat_slot_02_image_sprite.texture = NIL_TEXTURE
                @@hat_slot_02_text.string = ""
                @@hat_slot_02 = nil
            end
        end
        if @@owned_hat_array.size > 2
            t = 2 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_hat_array.size - 1
             @@hat_slot_03_image_sprite.texture = @@owned_hat_array[t].texture
             @@hat_slot_03_text.string = @@owned_hat_array[t].name
             @@hat_slot_03 = @@owned_hat_array[t]
            else
                @@hat_slot_03_image_sprite.texture = NIL_TEXTURE
                @@hat_slot_03_text.string = ""
                @@hat_slot_03 = nil
            end
        end
        if @@owned_hat_array.size > 3
            t = 3 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_hat_array.size - 1
             @@hat_slot_04_image_sprite.texture = @@owned_hat_array[t].texture
             @@hat_slot_04_text.string = @@owned_hat_array[t].name
             @@hat_slot_04 = @@owned_hat_array[t]
            else
                @@hat_slot_04_image_sprite.texture = NIL_TEXTURE
                @@hat_slot_04_text.string = ""
                @@hat_slot_04 = nil
            end
        end
        if @@owned_hat_array.size > 4
            t = 4 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_hat_array.size - 1
             @@hat_slot_05_image_sprite.texture = @@owned_hat_array[t].texture
             @@hat_slot_05_text.string = @@owned_hat_array[t].name
             @@hat_slot_05 = @@owned_hat_array[t]
            else
                @@hat_slot_05_image_sprite.texture = NIL_TEXTURE
                @@hat_slot_05_text.string = ""
                @@hat_slot_05 = nil
            end
        end
        if @@owned_hat_array.size > 5
            t = 5 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_hat_array.size - 1
             @@hat_slot_06_image_sprite.texture = @@owned_hat_array[t].texture
             @@hat_slot_06_text.string = @@owned_hat_array[t].name
             @@hat_slot_06 = @@owned_hat_array[t]
            else
                @@hat_slot_06_image_sprite.texture = NIL_TEXTURE
                @@hat_slot_06_text.string = ""
                @@hat_slot_06 = nil
            end
        end
        if @@owned_hat_array.size > 6
            t = 6 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_hat_array.size - 1
             @@hat_slot_07_image_sprite.texture = @@owned_hat_array[t].texture
             @@hat_slot_07_text.string = @@owned_hat_array[t].name
             @@hat_slot_07 = @@owned_hat_array[t]
            else
                @@hat_slot_07_image_sprite.texture = NIL_TEXTURE
                @@hat_slot_07_text.string = ""
                @@hat_slot_07 = nil
            end
        end
        if @@owned_hat_array.size > 7
            t = 7 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_hat_array.size - 1
             @@hat_slot_08_image_sprite.texture = @@owned_hat_array[t].texture
             @@hat_slot_08_text.string = @@owned_hat_array[t].name
             @@hat_slot_08 = @@owned_hat_array[t]
            else
                @@hat_slot_08_image_sprite.texture = NIL_TEXTURE
                @@hat_slot_08_text.string = ""
                @@hat_slot_08 = nil
            end
        end
        if @@owned_hat_array.size > 8
            t = 8 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_hat_array.size - 1
             @@hat_slot_09_image_sprite.texture = @@owned_hat_array[t].texture
             @@hat_slot_09_text.string = @@owned_hat_array[t].name
             @@hat_slot_09 = @@owned_hat_array[t]
            else
                @@hat_slot_09_image_sprite.texture = NIL_TEXTURE
                @@hat_slot_09_text.string = ""
                @@hat_slot_09 = nil
            end
        end
        if @@owned_hat_array.size > 9
            t = 9 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_hat_array.size - 1
             @@hat_slot_10_image_sprite.texture = @@owned_hat_array[t].texture
             @@hat_slot_10_text.string = @@owned_hat_array[t].name
             @@hat_slot_10 = @@owned_hat_array[t]
            else
                @@hat_slot_10_image_sprite.texture = NIL_TEXTURE
                @@hat_slot_10_text.string = ""
                @@hat_slot_10 = nil
            end
        end
        if @@owned_hat_array.size > 10
            t = 10 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_hat_array.size - 1
             @@hat_slot_11_image_sprite.texture = @@owned_hat_array[t].texture
             @@hat_slot_11_text.string = @@owned_hat_array[t].name
             @@hat_slot_11 = @@owned_hat_array[t]
            else
                @@hat_slot_11_image_sprite.texture = NIL_TEXTURE
                @@hat_slot_11_text.string = ""
                @@hat_slot_11 = nil
            end
        end
        if @@owned_hat_array.size > 11
            t = 11 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_hat_array.size - 1
             @@hat_slot_12_image_sprite.texture = @@owned_hat_array[t].texture
             @@hat_slot_12_text.string = @@owned_hat_array[t].name
             @@hat_slot_12 = @@owned_hat_array[t]
            else
                @@hat_slot_12_image_sprite.texture = NIL_TEXTURE
                @@hat_slot_12_text.string = ""
                @@hat_slot_12 = nil
            end
        end
        if @@owned_hat_array.size > 12
            t = 12 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_hat_array.size - 1
             @@hat_slot_13_image_sprite.texture = @@owned_hat_array[t].texture
             @@hat_slot_13_text.string = @@owned_hat_array[t].name
             @@hat_slot_13 = @@owned_hat_array[t]
            else
                @@hat_slot_13_image_sprite.texture = NIL_TEXTURE
                @@hat_slot_13_text.string = ""
                @@hat_slot_13 = nil
            end
        end
        if @@owned_hat_array.size > 13
            t = 13 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_hat_array.size - 1
             @@hat_slot_14_image_sprite.texture = @@owned_hat_array[t].texture
             @@hat_slot_14_text.string = @@owned_hat_array[t].name
             @@hat_slot_14 = @@owned_hat_array[t]
            else
                @@hat_slot_14_image_sprite.texture = NIL_TEXTURE
                @@hat_slot_14_text.string = ""
                @@hat_slot_14 = nil
            end
        end
        if @@owned_hat_array.size > 14
            t = 14 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_hat_array.size - 1
             @@hat_slot_15_image_sprite.texture = @@owned_hat_array[t].texture
             @@hat_slot_15_text.string = @@owned_hat_array[t].name
             @@hat_slot_15 = @@owned_hat_array[t]
            else
                @@hat_slot_15_image_sprite.texture = NIL_TEXTURE
                @@hat_slot_15_text.string = ""
                @@hat_slot_15 = nil
            end
        end
       end
       

       def ClothingTabHat.draw_clothing_tab(window)
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


        @@hat_slot_01_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 40 * max_scale)
        @@hat_slot_01_sprite.scale = SF.vector2(1, 1)
        
        @@hat_slot_01_image_sprite.position = @@hat_slot_01_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@hat_slot_01_image_sprite.scale = SF.vector2(2, 2)
        @@hat_slot_01_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        @@hat_slot_01_text.position = @@hat_slot_01_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@hat_slot_01_text)
        

        @@hat_slot_02_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 40 * max_scale)
        @@hat_slot_02_sprite.scale = SF.vector2(1, 1)
        
        @@hat_slot_02_image_sprite.position = @@hat_slot_02_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@hat_slot_02_image_sprite.scale = SF.vector2(2, 2)
        @@hat_slot_02_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        @@hat_slot_02_text.position = @@hat_slot_02_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@hat_slot_02_text)
        

        @@hat_slot_03_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 40 * max_scale)
        @@hat_slot_03_sprite.scale = SF.vector2(1, 1)
        
        @@hat_slot_03_image_sprite.position = @@hat_slot_03_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@hat_slot_03_image_sprite.scale = SF.vector2(2, 2)
        @@hat_slot_03_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        @@hat_slot_03_text.position = @@hat_slot_03_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@hat_slot_03_text)
        

        @@hat_slot_04_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 40 * max_scale)
        @@hat_slot_04_sprite.scale = SF.vector2(1, 1)

        @@hat_slot_04_text.position = @@hat_slot_04_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@hat_slot_04_text)
        
        @@hat_slot_04_image_sprite.position = @@hat_slot_04_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@hat_slot_04_image_sprite.scale = SF.vector2(2, 2)
        @@hat_slot_04_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)


        @@hat_slot_05_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 40 * max_scale)
        @@hat_slot_05_sprite.scale = SF.vector2(1, 1)

        @@hat_slot_05_text.position = @@hat_slot_05_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@hat_slot_05_text)
        
        @@hat_slot_05_image_sprite.position = @@hat_slot_05_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@hat_slot_05_image_sprite.scale = SF.vector2(2, 2)
        @@hat_slot_05_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@hat_slot_06_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 120 * max_scale)
        @@hat_slot_06_sprite.scale = SF.vector2(1, 1)

        @@hat_slot_06_text.position = @@hat_slot_06_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@hat_slot_06_text)
        
        @@hat_slot_06_image_sprite.position = @@hat_slot_06_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@hat_slot_06_image_sprite.scale = SF.vector2(2, 2)
        @@hat_slot_06_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@hat_slot_07_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 120 * max_scale)
        @@hat_slot_07_sprite.scale = SF.vector2(1, 1)
        
        @@hat_slot_07_text.position = @@hat_slot_07_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@hat_slot_07_text)
        
        @@hat_slot_07_image_sprite.position = @@hat_slot_07_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@hat_slot_07_image_sprite.scale = SF.vector2(2, 2)
        @@hat_slot_07_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@hat_slot_08_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 120 * max_scale)
        @@hat_slot_08_sprite.scale = SF.vector2(1, 1)
                
        @@hat_slot_08_text.position = @@hat_slot_08_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@hat_slot_08_text)
        
        @@hat_slot_08_image_sprite.position = @@hat_slot_08_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@hat_slot_08_image_sprite.scale = SF.vector2(2, 2)
        @@hat_slot_08_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@hat_slot_09_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 120 * max_scale)
        @@hat_slot_09_sprite.scale = SF.vector2(1, 1)
                
        @@hat_slot_09_text.position = @@hat_slot_09_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@hat_slot_09_text)
        
        @@hat_slot_09_image_sprite.position = @@hat_slot_09_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@hat_slot_09_image_sprite.scale = SF.vector2(2, 2)
        @@hat_slot_09_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@hat_slot_10_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 120 * max_scale)
        @@hat_slot_10_sprite.scale = SF.vector2(1, 1)
                        
        @@hat_slot_10_text.position = @@hat_slot_10_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@hat_slot_10_text)
        
        @@hat_slot_10_image_sprite.position = @@hat_slot_10_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@hat_slot_10_image_sprite.scale = SF.vector2(2, 2)
        @@hat_slot_10_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@hat_slot_11_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 200 * max_scale)
        @@hat_slot_11_sprite.scale = SF.vector2(1, 1)
                        
        @@hat_slot_11_text.position = @@hat_slot_11_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@hat_slot_11_text)
        
        @@hat_slot_11_image_sprite.position = @@hat_slot_11_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@hat_slot_11_image_sprite.scale = SF.vector2(2, 2)
        @@hat_slot_11_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@hat_slot_12_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 200 * max_scale)
        @@hat_slot_12_sprite.scale = SF.vector2(1, 1)
                        
        @@hat_slot_12_text.position = @@hat_slot_12_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@hat_slot_12_text)
        
        @@hat_slot_12_image_sprite.position = @@hat_slot_12_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@hat_slot_12_image_sprite.scale = SF.vector2(2, 2)
        @@hat_slot_12_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@hat_slot_13_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 200 * max_scale)
        @@hat_slot_13_sprite.scale = SF.vector2(1, 1)
        
        @@hat_slot_13_text.position = @@hat_slot_13_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@hat_slot_13_text)
        
        @@hat_slot_13_image_sprite.position = @@hat_slot_13_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@hat_slot_13_image_sprite.scale = SF.vector2(2, 2)
        @@hat_slot_13_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@hat_slot_14_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 200 * max_scale)
        @@hat_slot_14_sprite.scale = SF.vector2(1, 1)
                        
        @@hat_slot_14_text.position = @@hat_slot_14_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@hat_slot_14_text)
        
        @@hat_slot_14_image_sprite.position = @@hat_slot_14_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@hat_slot_14_image_sprite.scale = SF.vector2(2, 2)
        @@hat_slot_14_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@hat_slot_15_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 200 * max_scale)
        @@hat_slot_15_sprite.scale = SF.vector2(1, 1)
                        
        @@hat_slot_15_text.position = @@hat_slot_15_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@hat_slot_15_text)
        
        @@hat_slot_15_image_sprite.position = @@hat_slot_15_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@hat_slot_15_image_sprite.scale = SF.vector2(2, 2)
        @@hat_slot_15_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)


        window.draw(@@hat_slot_01_sprite)
        window.draw(@@hat_slot_01_image_sprite)
        window.draw(@@hat_slot_01_text)

        window.draw(@@hat_slot_02_sprite)
        window.draw(@@hat_slot_02_image_sprite)
        window.draw(@@hat_slot_02_text)

        window.draw(@@hat_slot_03_sprite)
        window.draw(@@hat_slot_03_image_sprite)
        window.draw(@@hat_slot_03_text)
        
        window.draw(@@hat_slot_04_sprite)
        window.draw(@@hat_slot_04_image_sprite)
        window.draw(@@hat_slot_04_text)

        window.draw(@@hat_slot_05_sprite)
        window.draw(@@hat_slot_05_image_sprite)
        window.draw(@@hat_slot_05_text)

        window.draw(@@hat_slot_06_sprite)
        window.draw(@@hat_slot_06_image_sprite)
        window.draw(@@hat_slot_06_text)

        window.draw(@@hat_slot_07_sprite)
        window.draw(@@hat_slot_07_image_sprite)
        window.draw(@@hat_slot_07_text)

        window.draw(@@hat_slot_08_sprite)
        window.draw(@@hat_slot_08_image_sprite)
        window.draw(@@hat_slot_08_text)

        window.draw(@@hat_slot_09_sprite)
        window.draw(@@hat_slot_09_image_sprite)
        window.draw(@@hat_slot_09_text)

        window.draw(@@hat_slot_10_sprite)
        window.draw(@@hat_slot_10_image_sprite)
        window.draw(@@hat_slot_10_text)

        window.draw(@@hat_slot_11_sprite)
        window.draw(@@hat_slot_11_image_sprite)
        window.draw(@@hat_slot_11_text)

        window.draw(@@hat_slot_12_sprite)
        window.draw(@@hat_slot_12_image_sprite)
        window.draw(@@hat_slot_12_text)

        window.draw(@@hat_slot_13_sprite)
        window.draw(@@hat_slot_13_image_sprite)
        window.draw(@@hat_slot_13_text)

        window.draw(@@hat_slot_14_sprite)
        window.draw(@@hat_slot_14_image_sprite)
        window.draw(@@hat_slot_14_text)

        window.draw(@@hat_slot_15_sprite)
        window.draw(@@hat_slot_15_image_sprite)
        window.draw(@@hat_slot_15_text)

        if SF::Mouse.button_pressed?(SF::Mouse::Left)
            ClothingTabHat.clothes_mouse_handling(window)
        end
       end

       def ClothingTabHat.clothes_mouse_handling(window)
        mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window))
        mouse_x = mouse_position.x
        mouse_y = mouse_position.y
        
    
        current_size = window.size
        original_width = 800 
        original_height = 600 

        scale_x = (current_size.x.to_f / original_width)
        scale_y = current_size.y.to_f / original_height
        

        #------------------------------------objects-------------------------------------------------

            slot_01_x = @@hat_slot_01_sprite.position.x
            slot_01_y = @@hat_slot_01_sprite.position.y
            slot_01_width = @@hat_slot_01_sprite.size.x
            slot_01_height = @@hat_slot_01_sprite.size.y

            slot_02_x = @@hat_slot_02_sprite.position.x
            slot_02_y = @@hat_slot_02_sprite.position.y
            slot_02_width = @@hat_slot_02_sprite.size.x
            slot_02_height = @@hat_slot_02_sprite.size.y

            slot_03_x = @@hat_slot_03_sprite.position.x
            slot_03_y = @@hat_slot_03_sprite.position.y
            slot_03_width = @@hat_slot_03_sprite.size.x
            slot_03_height = @@hat_slot_03_sprite.size.y

            slot_04_x = @@hat_slot_04_sprite.position.x
            slot_04_y = @@hat_slot_04_sprite.position.y
            slot_04_width = @@hat_slot_04_sprite.size.x
            slot_04_height = @@hat_slot_04_sprite.size.y

            slot_05_x = @@hat_slot_05_sprite.position.x
            slot_05_y = @@hat_slot_05_sprite.position.y
            slot_05_width = @@hat_slot_05_sprite.size.x
            slot_05_height = @@hat_slot_05_sprite.size.y

            slot_06_x = @@hat_slot_06_sprite.position.x
            slot_06_y = @@hat_slot_06_sprite.position.y
            slot_06_width = @@hat_slot_06_sprite.size.x
            slot_06_height = @@hat_slot_06_sprite.size.y

            slot_07_x = @@hat_slot_07_sprite.position.x
            slot_07_y = @@hat_slot_07_sprite.position.y
            slot_07_width = @@hat_slot_07_sprite.size.x
            slot_07_height = @@hat_slot_07_sprite.size.y

            slot_08_x = @@hat_slot_08_sprite.position.x
            slot_08_y = @@hat_slot_08_sprite.position.y
            slot_08_width = @@hat_slot_08_sprite.size.x
            slot_08_height = @@hat_slot_08_sprite.size.y

            slot_09_x = @@hat_slot_09_sprite.position.x
            slot_09_y = @@hat_slot_09_sprite.position.y
            slot_09_width = @@hat_slot_09_sprite.size.x
            slot_09_height = @@hat_slot_09_sprite.size.y

            slot_10_x = @@hat_slot_10_sprite.position.x
            slot_10_y = @@hat_slot_10_sprite.position.y
            slot_10_width = @@hat_slot_10_sprite.size.x
            slot_10_height = @@hat_slot_10_sprite.size.y

            slot_11_x = @@hat_slot_11_sprite.position.x
            slot_11_y = @@hat_slot_11_sprite.position.y
            slot_11_width = @@hat_slot_11_sprite.size.x
            slot_11_height = @@hat_slot_11_sprite.size.y

            slot_12_x = @@hat_slot_12_sprite.position.x
            slot_12_y = @@hat_slot_12_sprite.position.y
            slot_12_width = @@hat_slot_12_sprite.size.x
            slot_12_height = @@hat_slot_12_sprite.size.y

            slot_13_x = @@hat_slot_13_sprite.position.x
            slot_13_y = @@hat_slot_13_sprite.position.y
            slot_13_width = @@hat_slot_13_sprite.size.x
            slot_13_height = @@hat_slot_13_sprite.size.y

            slot_14_x = @@hat_slot_14_sprite.position.x
            slot_14_y = @@hat_slot_14_sprite.position.y
            slot_14_width = @@hat_slot_14_sprite.size.x
            slot_14_height = @@hat_slot_14_sprite.size.y

            slot_15_x = @@hat_slot_15_sprite.position.x
            slot_15_y = @@hat_slot_15_sprite.position.y
            slot_15_width = @@hat_slot_15_sprite.size.x
            slot_15_height = @@hat_slot_15_sprite.size.y
        #---------------------------------------------------------------------------------------------
        
        if (mouse_x >= slot_01_x && mouse_x <= slot_01_x + slot_01_width) &&
           (mouse_y >= slot_01_y && mouse_y <= slot_01_y + slot_01_height)
            if @@hat_slot_01 != nil   
                t = 0 + (@@page.not_nil! * 15) - 15
                
                @@owned_hat_array[t] = (Clothing::Hat.get_hat(Player::Appearance.get_clothing("hat").not_nil!).not_nil!)
                Player::Appearance.change_hat(@@hat_slot_01.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                
            end
            ClothingTabHat.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_02_x && mouse_x <= slot_02_x + slot_02_width) &&
           (mouse_y >= slot_02_y && mouse_y <= slot_02_y + slot_02_height)
           
            if @@hat_slot_02 != nil
                t = 1 + (@@page.not_nil! * 15) - 15
                
                @@owned_hat_array[t] = (Clothing::Hat.get_hat(Player::Appearance.get_clothing("hat").not_nil!).not_nil!)
                Player::Appearance.change_hat(@@hat_slot_02.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabHat.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_03_x && mouse_x <= slot_03_x + slot_03_width) &&
           (mouse_y >= slot_03_y && mouse_y <= slot_03_y + slot_03_height)
           
            if @@hat_slot_03 != nil
                t = 2 + (@@page.not_nil! * 15) - 15
                
                @@owned_hat_array[t] = (Clothing::Hat.get_hat(Player::Appearance.get_clothing("hat").not_nil!).not_nil!)
                Player::Appearance.change_hat(@@hat_slot_03.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabHat.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_04_x && mouse_x <= slot_04_x + slot_04_width) &&
           (mouse_y >= slot_04_y && mouse_y <= slot_04_y + slot_04_height)
           
            if @@hat_slot_04 != nil
                t = 3 + (@@page.not_nil! * 15) - 15
                
                @@owned_hat_array[t] = (Clothing::Hat.get_hat(Player::Appearance.get_clothing("hat").not_nil!).not_nil!)
                Player::Appearance.change_hat(@@hat_slot_04.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabHat.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_05_x && mouse_x <= slot_05_x + slot_05_width) &&
           (mouse_y >= slot_05_y && mouse_y <= slot_05_y + slot_05_height)
           
            if @@hat_slot_05 != nil
                t = 4 + (@@page.not_nil! * 15) - 15
                
                @@owned_hat_array[t] = (Clothing::Hat.get_hat(Player::Appearance.get_clothing("hat").not_nil!).not_nil!)
                Player::Appearance.change_hat(@@hat_slot_05.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabHat.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_06_x && mouse_x <= slot_06_x + slot_06_width) &&
           (mouse_y >= slot_06_y && mouse_y <= slot_06_y + slot_06_height)
           
            if @@hat_slot_06 != nil
                t = 5 + (@@page.not_nil! * 15) - 15
                
                @@owned_hat_array[t] = (Clothing::Hat.get_hat(Player::Appearance.get_clothing("hat").not_nil!).not_nil!)
                Player::Appearance.change_hat(@@hat_slot_06.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabHat.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_07_x && mouse_x <= slot_07_x + slot_07_width) &&
           (mouse_y >= slot_07_y && mouse_y <= slot_07_y + slot_07_height)
           
            if @@hat_slot_07 != nil
                t = 6 + (@@page.not_nil! * 15) - 15
                
                @@owned_hat_array[t] = (Clothing::Hat.get_hat(Player::Appearance.get_clothing("hat").not_nil!).not_nil!)
                Player::Appearance.change_hat(@@hat_slot_07.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabHat.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_08_x && mouse_x <= slot_08_x + slot_08_width) &&
           (mouse_y >= slot_08_y && mouse_y <= slot_08_y + slot_08_height)
           
            if @@hat_slot_08 != nil
                t = 7 + (@@page.not_nil! * 15) - 15
                
                @@owned_hat_array[t] = (Clothing::Hat.get_hat(Player::Appearance.get_clothing("hat").not_nil!).not_nil!)
                Player::Appearance.change_hat(@@hat_slot_08.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabHat.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_09_x && mouse_x <= slot_09_x + slot_09_width) &&
           (mouse_y >= slot_09_y && mouse_y <= slot_09_y + slot_09_height)
           
            if @@hat_slot_09 != nil
                t = 8 + (@@page.not_nil! * 15) - 15
                
                @@owned_hat_array[t] = (Clothing::Hat.get_hat(Player::Appearance.get_clothing("hat").not_nil!).not_nil!)
                Player::Appearance.change_hat(@@hat_slot_09.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabHat.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_10_x && mouse_x <= slot_10_x + slot_10_width) &&
           (mouse_y >= slot_10_y && mouse_y <= slot_10_y + slot_10_height)
           
            if @@hat_slot_10 != nil
                t = 9 + (@@page.not_nil! * 15) - 15
                
                @@owned_hat_array[t] = (Clothing::Hat.get_hat(Player::Appearance.get_clothing("hat").not_nil!).not_nil!)
                Player::Appearance.change_hat(@@hat_slot_10.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabHat.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_11_x && mouse_x <= slot_11_x + slot_11_width) &&
           (mouse_y >= slot_11_y && mouse_y <= slot_11_y + slot_11_height)
           
            if @@hat_slot_11 != nil
                t = 10 + (@@page.not_nil! * 15) - 15
                
                @@owned_hat_array[t] = (Clothing::Hat.get_hat(Player::Appearance.get_clothing("hat").not_nil!).not_nil!)
                Player::Appearance.change_hat(@@hat_slot_11.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabHat.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_12_x && mouse_x <= slot_12_x + slot_12_width) &&
           (mouse_y >= slot_12_y && mouse_y <= slot_12_y + slot_12_height)
           
            if @@hat_slot_12 != nil
                t = 11 + (@@page.not_nil! * 15) - 15
                
                @@owned_hat_array[t] = (Clothing::Hat.get_hat(Player::Appearance.get_clothing("hat").not_nil!).not_nil!)
                Player::Appearance.change_hat(@@hat_slot_12.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabHat.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_13_x && mouse_x <= slot_13_x + slot_13_width) &&
           (mouse_y >= slot_13_y && mouse_y <= slot_13_y + slot_13_height)
           
            if @@hat_slot_13 != nil
                t = 12 + (@@page.not_nil! * 15) - 15
                
                @@owned_hat_array[t] = (Clothing::Hat.get_hat(Player::Appearance.get_clothing("hat").not_nil!).not_nil!)
                Player::Appearance.change_hat(@@hat_slot_13.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabHat.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_14_x && mouse_x <= slot_14_x + slot_14_width) &&
           (mouse_y >= slot_14_y && mouse_y <= slot_14_y + slot_14_height)
           
            if @@hat_slot_14 != nil
                t = 13 + (@@page.not_nil! * 15) - 15
                
                @@owned_hat_array[t] = (Clothing::Hat.get_hat(Player::Appearance.get_clothing("hat").not_nil!).not_nil!)
                Player::Appearance.change_hat(@@hat_slot_14.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabHat.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_15_x && mouse_x <= slot_15_x + slot_15_width) &&
           (mouse_y >= slot_15_y && mouse_y <= slot_15_y + slot_15_height)
           
            if @@hat_slot_15 != nil
                t = 14 + (@@page.not_nil! * 15) - 15
                
                @@owned_hat_array[t] = (Clothing::Hat.get_hat(Player::Appearance.get_clothing("hat").not_nil!).not_nil!)
                Player::Appearance.change_hat(@@hat_slot_15.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabHat.assign_slot_textures(window)
            sleep 0.15.seconds
        end

       end

    end

    class ClothingTabGlasses
        @@owned_glasses_array = [] of Clothing::Glasses

        @@glasses_sorting_category = "Type"

        @@glasses_slot_01 : Clothing::Glasses? = nil
        @@glasses_slot_02 : Clothing::Glasses? = nil
        @@glasses_slot_03 : Clothing::Glasses? = nil
        @@glasses_slot_04 : Clothing::Glasses? = nil
        @@glasses_slot_05 : Clothing::Glasses? = nil
        @@glasses_slot_06 : Clothing::Glasses? = nil
        @@glasses_slot_07 : Clothing::Glasses? = nil
        @@glasses_slot_08 : Clothing::Glasses? = nil
        @@glasses_slot_09 : Clothing::Glasses? = nil
        @@glasses_slot_10 : Clothing::Glasses? = nil
        @@glasses_slot_11 : Clothing::Glasses? = nil
        @@glasses_slot_12 : Clothing::Glasses? = nil
        @@glasses_slot_13 : Clothing::Glasses? = nil
        @@glasses_slot_14 : Clothing::Glasses? = nil
        @@glasses_slot_15 : Clothing::Glasses? = nil

       #---------------------------------debug-------------------------------------------
        @@owned_glasses_array.push(Clothing::Glasses.get_glasses("No Glasses").not_nil!)

        @@owned_glasses_array.push(Clothing::Glasses.get_glasses("Sunglasses").not_nil!)

        @@owned_glasses_array.push(Clothing::Glasses.get_glasses("Round Glasses").not_nil!)

        @@owned_glasses_array.push(Clothing::Glasses.get_glasses("Eye Bandage").not_nil!)
        
        @@owned_glasses_array.uniq!
       #---------------------------------------------------------------------------------

       #--------------------------------objects------------------------------------------
        INVENTORY_BOX = SF::RectangleShape.new(SF.vector2(610, 420))
        INVENTORY_BOX.fill_color = SF.color( 137, 170, 208 )

        
        @@clothing_left_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_left_arrow_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_right_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_right_arrow_sprite.fill_color = SF.color(161, 183, 208)


        @@clothing_sort_button_sprite = SF::RectangleShape.new(SF.vector2(75, 25))
        @@clothing_sort_button_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_glasses_category_box = SF::RectangleShape.new(SF.vector2(100, 25))
        @@clothing_glasses_category_box.fill_color = SF.color(161, 183, 208)

        @@clothing_sort_button_text = SF::Text.new
        @@clothing_sort_button_text.font = QUICKSAND
        @@clothing_sort_button_text.character_size = 20
        @@clothing_sort_button_text.color = SF::Color::Blue
        @@clothing_sort_button_text.string = "Sort"


        @@clothing_right_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_right_arrow_sprite.fill_color = SF.color(161, 183, 208)

        @@glasses_tab = SF::RectangleShape.new(SF.vector2(100, 50))
        @@glasses_tab.fill_color = SF.color(141, 163, 188)

        @@glasses_tab_text = SF::Text.new
        @@glasses_tab_text.font = QUICKSAND
        @@glasses_tab_text.character_size = 20
        @@glasses_tab_text.color = SF::Color::Blue
        @@glasses_tab_text.string = "Glassess"

        @@glasses_tab = SF::RectangleShape.new(SF.vector2(100, 50))
        @@glasses_tab.fill_color = SF.color(161, 183, 208)

        @@glasses_tab_text = SF::Text.new
        @@glasses_tab_text.font = QUICKSAND
        @@glasses_tab_text.character_size = 20
        @@glasses_tab_text.color = SF::Color::Blue
        @@glasses_tab_text.string = "Glasses"


        @@glasses_slot_01_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@glasses_slot_01_sprite.fill_color = SF.color(161, 183, 208)

        @@glasses_slot_01_text = SF::Text.new
        @@glasses_slot_01_text.font = QUICKSAND
        @@glasses_slot_01_text.character_size = 12
        @@glasses_slot_01_text.color = SF::Color::Blue

        @@glasses_slot_01_image_sprite = SF::Sprite.new


        @@glasses_slot_02_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@glasses_slot_02_sprite.fill_color = SF.color(161, 183, 208)

        @@glasses_slot_02_text = SF::Text.new
        @@glasses_slot_02_text.font = QUICKSAND
        @@glasses_slot_02_text.character_size = 12
        @@glasses_slot_02_text.color = SF::Color::Blue

        @@glasses_slot_02_image_sprite = SF::Sprite.new


        @@glasses_slot_03_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@glasses_slot_03_sprite.fill_color = SF.color(161, 183, 208)

        @@glasses_slot_03_text = SF::Text.new
        @@glasses_slot_03_text.font = QUICKSAND
        @@glasses_slot_03_text.character_size = 12
        @@glasses_slot_03_text.color = SF::Color::Blue

        @@glasses_slot_03_image_sprite = SF::Sprite.new


        @@glasses_slot_04_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@glasses_slot_04_sprite.fill_color = SF.color(161, 183, 208)

        @@glasses_slot_04_text = SF::Text.new
        @@glasses_slot_04_text.font = QUICKSAND
        @@glasses_slot_04_text.character_size = 12
        @@glasses_slot_04_text.color = SF::Color::Blue

        @@glasses_slot_04_image_sprite = SF::Sprite.new


        @@glasses_slot_05_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@glasses_slot_05_sprite.fill_color = SF.color(161, 183, 208)

        @@glasses_slot_05_text = SF::Text.new
        @@glasses_slot_05_text.font = QUICKSAND
        @@glasses_slot_05_text.character_size = 12
        @@glasses_slot_05_text.color = SF::Color::Blue

        @@glasses_slot_05_image_sprite = SF::Sprite.new


        @@glasses_slot_06_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@glasses_slot_06_sprite.fill_color = SF.color(161, 183, 208)

        @@glasses_slot_06_text = SF::Text.new
        @@glasses_slot_06_text.font = QUICKSAND
        @@glasses_slot_06_text.character_size = 12
        @@glasses_slot_06_text.color = SF::Color::Blue
        
        @@glasses_slot_06_image_sprite = SF::Sprite.new


        @@glasses_slot_07_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@glasses_slot_07_sprite.fill_color = SF.color(161, 183, 208)

        @@glasses_slot_07_text = SF::Text.new
        @@glasses_slot_07_text.font = QUICKSAND
        @@glasses_slot_07_text.character_size = 12
        @@glasses_slot_07_text.color = SF::Color::Blue

        @@glasses_slot_07_image_sprite = SF::Sprite.new


        @@glasses_slot_08_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@glasses_slot_08_sprite.fill_color = SF.color(161, 183, 208)

        @@glasses_slot_08_text = SF::Text.new
        @@glasses_slot_08_text.font = QUICKSAND
        @@glasses_slot_08_text.character_size = 12
        @@glasses_slot_08_text.color = SF::Color::Blue

        @@glasses_slot_08_image_sprite = SF::Sprite.new


        @@glasses_slot_09_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@glasses_slot_09_sprite.fill_color = SF.color(161, 183, 208)

        @@glasses_slot_09_text = SF::Text.new
        @@glasses_slot_09_text.font = QUICKSAND
        @@glasses_slot_09_text.character_size = 12
        @@glasses_slot_09_text.color = SF::Color::Blue

        @@glasses_slot_09_image_sprite = SF::Sprite.new


        @@glasses_slot_10_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@glasses_slot_10_sprite.fill_color = SF.color(161, 183, 208)

        @@glasses_slot_10_text = SF::Text.new
        @@glasses_slot_10_text.font = QUICKSAND
        @@glasses_slot_10_text.character_size = 12
        @@glasses_slot_10_text.color = SF::Color::Blue

        @@glasses_slot_10_image_sprite = SF::Sprite.new


        @@glasses_slot_11_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@glasses_slot_11_sprite.fill_color = SF.color(161, 183, 208)

        @@glasses_slot_11_text = SF::Text.new
        @@glasses_slot_11_text.font = QUICKSAND
        @@glasses_slot_11_text.character_size = 12
        @@glasses_slot_11_text.color = SF::Color::Blue

        @@glasses_slot_11_image_sprite = SF::Sprite.new


        @@glasses_slot_12_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@glasses_slot_12_sprite.fill_color = SF.color(161, 183, 208)

        @@glasses_slot_12_text = SF::Text.new
        @@glasses_slot_12_text.font = QUICKSAND
        @@glasses_slot_12_text.character_size = 12
        @@glasses_slot_12_text.color = SF::Color::Blue

        @@glasses_slot_12_image_sprite = SF::Sprite.new


        @@glasses_slot_13_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@glasses_slot_13_sprite.fill_color = SF.color(161, 183, 208)

        @@glasses_slot_13_text = SF::Text.new
        @@glasses_slot_13_text.font = QUICKSAND
        @@glasses_slot_13_text.character_size = 12
        @@glasses_slot_13_text.color = SF::Color::Blue

        @@glasses_slot_13_image_sprite = SF::Sprite.new


        @@glasses_slot_14_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@glasses_slot_14_sprite.fill_color = SF.color(161, 183, 208)

        @@glasses_slot_14_text = SF::Text.new
        @@glasses_slot_14_text.font = QUICKSAND
        @@glasses_slot_14_text.character_size = 12
        @@glasses_slot_14_text.color = SF::Color::Blue

        @@glasses_slot_14_image_sprite = SF::Sprite.new


        @@glasses_slot_15_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@glasses_slot_15_sprite.fill_color = SF.color(161, 183, 208)

        @@glasses_slot_15_text = SF::Text.new
        @@glasses_slot_15_text.font = QUICKSAND
        @@glasses_slot_15_text.character_size = 12
        @@glasses_slot_15_text.color = SF::Color::Blue

        @@glasses_slot_15_image_sprite = SF::Sprite.new

       #---------------------------------------------------------------------------------

       def initialize(is_open : Bool, page : Int32)
        @@is_open = is_open
        @@page = page
       end

       def ClothingTabGlasses.is_open
        @@is_open
       end

       def ClothingTabGlasses.page
        @@page
       end

       def ClothingTabGlasses.is_open=(this)
        @@is_open = this
       end

       def ClothingTabGlasses.page=(this)
        @@page = this
       end

       def ClothingTabGlasses.owned_glasses_array
        @@owned_glasses_array
       end

       def ClothingTabGlasses.owned_glasses_array=(this)
        @@owned_glasses_array = this
       end

       def ClothingTabGlasses.push_to_owned_glasses_array(this)
        @@owned_glasses_array.push(this)
       end

       def ClothingTabGlasses.change_glasses_sort_category
        case @@glasses_sorting_category
        when "Type"
            @@glasses_sorting_category = "Color"
        when "Color"
            @@glasses_sorting_category = "Type"
        end
       end

       def ClothingTabGlasses.get_glasses_category
        return @@glasses_sorting_category
       end

       def ClothingTabGlasses.organise_owned_glasses_array_by_type(window)
        temp_clothing_array_01 = [] of Clothing::Glasses
        @@owned_glasses_array.each { |glasses| if glasses.glasses_type.includes?("transparent") == true
        temp_clothing_array_01.push(glasses)
        end}

        @@owned_glasses_array.each { |glasses| if glasses.glasses_type.includes?("translucent") == true
        temp_clothing_array_01.push(glasses)
        end}

        @@owned_glasses_array.each { |glasses| if glasses.glasses_type.includes?("opaque") == true
        temp_clothing_array_01.push(glasses)
        end}

        @@owned_glasses_array.clear
        @@owned_glasses_array = temp_clothing_array_01
        @@owned_glasses_array.uniq!
        ClothingTabGlasses.assign_slot_textures(window)
       end

       def ClothingTabGlasses.initialize_clothing_tab(window)
        @@page = 1
        INVENTORY_BOX.position = SF.vector2(20, 40)  
       end

       def ClothingTabGlasses.assign_slot_textures(window)
        if @@page == nil
            @@page = 1
        end
        @@owned_glasses_array.uniq!
            t = (@@page.not_nil! - 1) * 15
            if t < @@owned_glasses_array.size 
             @@glasses_slot_01_image_sprite.texture = @@owned_glasses_array[t].texture
             @@glasses_slot_01_text.string = @@owned_glasses_array[t].name
             @@glasses_slot_01 = @@owned_glasses_array[t]
            else 
                @@glasses_slot_01_image_sprite.texture = NIL_TEXTURE
                @@glasses_slot_01_text.string = ""
                @@glasses_slot_01 = nil
            end
            t = (@@page.not_nil! - 1) * 15 + 1
            if t < @@owned_glasses_array.size 
             @@glasses_slot_02_image_sprite.texture = @@owned_glasses_array[t].texture
             @@glasses_slot_02_text.string = @@owned_glasses_array[t].name
             @@glasses_slot_02 = @@owned_glasses_array[t]
            else
                @@glasses_slot_02_image_sprite.texture = NIL_TEXTURE
                @@glasses_slot_02_text.string = ""
                @@glasses_slot_02 = nil
            end
            t = 2 + (@@page.not_nil! * 15) - 15
            if t < @@owned_glasses_array.size 
             @@glasses_slot_03_image_sprite.texture = @@owned_glasses_array[t].texture
             @@glasses_slot_03_text.string = @@owned_glasses_array[t].name
             @@glasses_slot_03 = @@owned_glasses_array[t]
            else
             @@glasses_slot_03_image_sprite.texture = NIL_TEXTURE
             @@glasses_slot_03_text.string = ""
             @@glasses_slot_03 = nil
            end
            t = 3 + (@@page.not_nil! * 15) - 15
            if t < @@owned_glasses_array.size
             @@glasses_slot_04_image_sprite.texture = @@owned_glasses_array[t].texture
             @@glasses_slot_04_text.string = @@owned_glasses_array[t].name
             @@glasses_slot_04 = @@owned_glasses_array[t]
            else
             @@glasses_slot_04_image_sprite.texture = NIL_TEXTURE
             @@glasses_slot_04_text.string = ""
             @@glasses_slot_04 = nil
            end
            t = 4 + (@@page.not_nil! * 15) - 15
            if t < @@owned_glasses_array.size
             @@glasses_slot_05_image_sprite.texture = @@owned_glasses_array[t].texture
             @@glasses_slot_05_text.string = @@owned_glasses_array[t].name
             @@glasses_slot_05 = @@owned_glasses_array[t]
            else
             @@glasses_slot_05_image_sprite.texture = NIL_TEXTURE
             @@glasses_slot_05_text.string = ""
             @@glasses_slot_05 = nil
            end
            t = 5 + (@@page.not_nil! * 15) - 15
            if t < @@owned_glasses_array.size
             @@glasses_slot_06_image_sprite.texture = @@owned_glasses_array[t].texture
             @@glasses_slot_06_text.string = @@owned_glasses_array[t].name
             @@glasses_slot_06 = @@owned_glasses_array[t]
            else
             @@glasses_slot_06_image_sprite.texture = NIL_TEXTURE
             @@glasses_slot_06_text.string = ""
             @@glasses_slot_06 = nil
            end
            t = 6 + (@@page.not_nil! * 15) - 15
            if t < @@owned_glasses_array.size
             @@glasses_slot_07_image_sprite.texture = @@owned_glasses_array[t].texture
             @@glasses_slot_07_text.string = @@owned_glasses_array[t].name
             @@glasses_slot_07 = @@owned_glasses_array[t]
            else
             @@glasses_slot_07_image_sprite.texture = NIL_TEXTURE
             @@glasses_slot_07_text.string = ""
             @@glasses_slot_07 = nil
            end
            t = 7 + (@@page.not_nil! * 15) - 15
            if t < @@owned_glasses_array.size
             @@glasses_slot_08_image_sprite.texture = @@owned_glasses_array[t].texture
             @@glasses_slot_08_text.string = @@owned_glasses_array[t].name
             @@glasses_slot_08 = @@owned_glasses_array[t]
            else
             @@glasses_slot_08_image_sprite.texture = NIL_TEXTURE
             @@glasses_slot_08_text.string = ""
             @@glasses_slot_08 = nil
            end
            t = 8 + (@@page.not_nil! * 15) - 15
            if t < @@owned_glasses_array.size
             @@glasses_slot_09_image_sprite.texture = @@owned_glasses_array[t].texture
             @@glasses_slot_09_text.string = @@owned_glasses_array[t].name
             @@glasses_slot_09 = @@owned_glasses_array[t]
            else
             @@glasses_slot_09_image_sprite.texture = NIL_TEXTURE
             @@glasses_slot_09_text.string = ""
             @@glasses_slot_09 = nil
            end
            t = 9 + (@@page.not_nil! * 15) - 15
            if t < @@owned_glasses_array.size
             @@glasses_slot_10_image_sprite.texture = @@owned_glasses_array[t].texture
             @@glasses_slot_10_text.string = @@owned_glasses_array[t].name
             @@glasses_slot_10 = @@owned_glasses_array[t]
            else
             @@glasses_slot_10_image_sprite.texture = NIL_TEXTURE
             @@glasses_slot_10_text.string = ""
             @@glasses_slot_10 = nil
            end
            t = 10 + (@@page.not_nil! * 15) - 15
            if t < @@owned_glasses_array.size
             @@glasses_slot_11_image_sprite.texture = @@owned_glasses_array[t].texture
             @@glasses_slot_11_text.string = @@owned_glasses_array[t].name
             @@glasses_slot_11 = @@owned_glasses_array[t]
            else
             @@glasses_slot_11_image_sprite.texture = NIL_TEXTURE
             @@glasses_slot_11_text.string = ""
             @@glasses_slot_11 = nil
            end
            t = 11 + (@@page.not_nil! * 15) - 15
            if t < @@owned_glasses_array.size
             @@glasses_slot_12_image_sprite.texture = @@owned_glasses_array[t].texture
             @@glasses_slot_12_text.string = @@owned_glasses_array[t].name
             @@glasses_slot_12 = @@owned_glasses_array[t]
            else
             @@glasses_slot_12_image_sprite.texture = NIL_TEXTURE
             @@glasses_slot_12_text.string = ""
             @@glasses_slot_12 = nil
            end
            t = 12 + (@@page.not_nil! * 15) - 15
            if t < @@owned_glasses_array.size
             @@glasses_slot_13_image_sprite.texture = @@owned_glasses_array[t].texture
             @@glasses_slot_13_text.string = @@owned_glasses_array[t].name
             @@glasses_slot_13 = @@owned_glasses_array[t]
            else
             @@glasses_slot_13_image_sprite.texture = NIL_TEXTURE
             @@glasses_slot_13_text.string = ""
             @@glasses_slot_13 = nil
            end
            t = 13 + (@@page.not_nil! * 15) - 15
            if t < @@owned_glasses_array.size
             @@glasses_slot_14_image_sprite.texture = @@owned_glasses_array[t].texture
             @@glasses_slot_14_text.string = @@owned_glasses_array[t].name
             @@glasses_slot_14 = @@owned_glasses_array[t]
            else
             @@glasses_slot_14_image_sprite.texture = NIL_TEXTURE
             @@glasses_slot_14_text.string = ""
             @@glasses_slot_14 = nil
            end
            t = 14 + (@@page.not_nil! * 15) - 15
            if t < @@owned_glasses_array.size
             @@glasses_slot_15_image_sprite.texture = @@owned_glasses_array[t].texture
             @@glasses_slot_15_text.string = @@owned_glasses_array[t].name
             @@glasses_slot_15 = @@owned_glasses_array[t]
            else
             @@glasses_slot_15_image_sprite.texture = NIL_TEXTURE
             @@glasses_slot_15_text.string = ""
             @@glasses_slot_15 = nil
            end
        @@owned_glasses_array.uniq!
       end
       
       def ClothingTabGlasses.draw_clothing_tab(window)
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


        @@glasses_slot_01_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 40 * max_scale)
        @@glasses_slot_01_sprite.scale = SF.vector2(1, 1)
        
        @@glasses_slot_01_image_sprite.position = @@glasses_slot_01_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@glasses_slot_01_image_sprite.scale = SF.vector2(2, 2)
        @@glasses_slot_01_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        @@glasses_slot_01_text.position = @@glasses_slot_01_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@glasses_slot_01_text)
        

        @@glasses_slot_02_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 40 * max_scale)
        @@glasses_slot_02_sprite.scale = SF.vector2(1, 1)
        
        @@glasses_slot_02_image_sprite.position = @@glasses_slot_02_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@glasses_slot_02_image_sprite.scale = SF.vector2(2, 2)
        @@glasses_slot_02_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        @@glasses_slot_02_text.position = @@glasses_slot_02_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@glasses_slot_02_text)
        

        @@glasses_slot_03_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 40 * max_scale)
        @@glasses_slot_03_sprite.scale = SF.vector2(1, 1)
        
        @@glasses_slot_03_image_sprite.position = @@glasses_slot_03_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@glasses_slot_03_image_sprite.scale = SF.vector2(2, 2)
        @@glasses_slot_03_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        @@glasses_slot_03_text.position = @@glasses_slot_03_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@glasses_slot_03_text)
        

        @@glasses_slot_04_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 40 * max_scale)
        @@glasses_slot_04_sprite.scale = SF.vector2(1, 1)

        @@glasses_slot_04_text.position = @@glasses_slot_04_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@glasses_slot_04_text)
        
        @@glasses_slot_04_image_sprite.position = @@glasses_slot_04_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@glasses_slot_04_image_sprite.scale = SF.vector2(2, 2)
        @@glasses_slot_04_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)


        @@glasses_slot_05_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 40 * max_scale)
        @@glasses_slot_05_sprite.scale = SF.vector2(1, 1)

        @@glasses_slot_05_text.position = @@glasses_slot_05_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@glasses_slot_05_text)
        
        @@glasses_slot_05_image_sprite.position = @@glasses_slot_05_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@glasses_slot_05_image_sprite.scale = SF.vector2(2, 2)
        @@glasses_slot_05_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@glasses_slot_06_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 120 * max_scale)
        @@glasses_slot_06_sprite.scale = SF.vector2(1, 1)

        @@glasses_slot_06_text.position = @@glasses_slot_06_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@glasses_slot_06_text)
        
        @@glasses_slot_06_image_sprite.position = @@glasses_slot_06_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@glasses_slot_06_image_sprite.scale = SF.vector2(2, 2)
        @@glasses_slot_06_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@glasses_slot_07_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 120 * max_scale)
        @@glasses_slot_07_sprite.scale = SF.vector2(1, 1)
        
        @@glasses_slot_07_text.position = @@glasses_slot_07_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@glasses_slot_07_text)
        
        @@glasses_slot_07_image_sprite.position = @@glasses_slot_07_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@glasses_slot_07_image_sprite.scale = SF.vector2(2, 2)
        @@glasses_slot_07_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@glasses_slot_08_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 120 * max_scale)
        @@glasses_slot_08_sprite.scale = SF.vector2(1, 1)
                
        @@glasses_slot_08_text.position = @@glasses_slot_08_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@glasses_slot_08_text)
        
        @@glasses_slot_08_image_sprite.position = @@glasses_slot_08_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@glasses_slot_08_image_sprite.scale = SF.vector2(2, 2)
        @@glasses_slot_08_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@glasses_slot_09_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 120 * max_scale)
        @@glasses_slot_09_sprite.scale = SF.vector2(1, 1)
                
        @@glasses_slot_09_text.position = @@glasses_slot_09_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@glasses_slot_09_text)
        
        @@glasses_slot_09_image_sprite.position = @@glasses_slot_09_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@glasses_slot_09_image_sprite.scale = SF.vector2(2, 2)
        @@glasses_slot_09_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@glasses_slot_10_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 120 * max_scale)
        @@glasses_slot_10_sprite.scale = SF.vector2(1, 1)
                        
        @@glasses_slot_10_text.position = @@glasses_slot_10_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@glasses_slot_10_text)
        
        @@glasses_slot_10_image_sprite.position = @@glasses_slot_10_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@glasses_slot_10_image_sprite.scale = SF.vector2(2, 2)
        @@glasses_slot_10_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@glasses_slot_11_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 200 * max_scale)
        @@glasses_slot_11_sprite.scale = SF.vector2(1, 1)
                        
        @@glasses_slot_11_text.position = @@glasses_slot_11_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@glasses_slot_11_text)
        
        @@glasses_slot_11_image_sprite.position = @@glasses_slot_11_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@glasses_slot_11_image_sprite.scale = SF.vector2(2, 2)
        @@glasses_slot_11_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@glasses_slot_12_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 200 * max_scale)
        @@glasses_slot_12_sprite.scale = SF.vector2(1, 1)
                        
        @@glasses_slot_12_text.position = @@glasses_slot_12_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@glasses_slot_12_text)
        
        @@glasses_slot_12_image_sprite.position = @@glasses_slot_12_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@glasses_slot_12_image_sprite.scale = SF.vector2(2, 2)
        @@glasses_slot_12_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@glasses_slot_13_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 200 * max_scale)
        @@glasses_slot_13_sprite.scale = SF.vector2(1, 1)
        
        @@glasses_slot_13_text.position = @@glasses_slot_13_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@glasses_slot_13_text)
        
        @@glasses_slot_13_image_sprite.position = @@glasses_slot_13_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@glasses_slot_13_image_sprite.scale = SF.vector2(2, 2)
        @@glasses_slot_13_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@glasses_slot_14_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 200 * max_scale)
        @@glasses_slot_14_sprite.scale = SF.vector2(1, 1)
                        
        @@glasses_slot_14_text.position = @@glasses_slot_14_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@glasses_slot_14_text)
        
        @@glasses_slot_14_image_sprite.position = @@glasses_slot_14_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@glasses_slot_14_image_sprite.scale = SF.vector2(2, 2)
        @@glasses_slot_14_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@glasses_slot_15_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 200 * max_scale)
        @@glasses_slot_15_sprite.scale = SF.vector2(1, 1)
                        
        @@glasses_slot_15_text.position = @@glasses_slot_15_sprite.position + SF.vector2(45, 55 * max_scale)
        Utility::StringUtilities.center_text(@@glasses_slot_15_text)
        
        @@glasses_slot_15_image_sprite.position = @@glasses_slot_15_sprite.position - SF.vector2(35 * max_scale, 5 * max_scale)
        @@glasses_slot_15_image_sprite.scale = SF.vector2(2, 2)
        @@glasses_slot_15_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)


        window.draw(@@glasses_slot_01_sprite)
        window.draw(@@glasses_slot_01_image_sprite)
        window.draw(@@glasses_slot_01_text)

        window.draw(@@glasses_slot_02_sprite)
        window.draw(@@glasses_slot_02_image_sprite)
        window.draw(@@glasses_slot_02_text)

        window.draw(@@glasses_slot_03_sprite)
        window.draw(@@glasses_slot_03_image_sprite)
        window.draw(@@glasses_slot_03_text)
        
        window.draw(@@glasses_slot_04_sprite)
        window.draw(@@glasses_slot_04_image_sprite)
        window.draw(@@glasses_slot_04_text)

        window.draw(@@glasses_slot_05_sprite)
        window.draw(@@glasses_slot_05_image_sprite)
        window.draw(@@glasses_slot_05_text)

        window.draw(@@glasses_slot_06_sprite)
        window.draw(@@glasses_slot_06_image_sprite)
        window.draw(@@glasses_slot_06_text)

        window.draw(@@glasses_slot_07_sprite)
        window.draw(@@glasses_slot_07_image_sprite)
        window.draw(@@glasses_slot_07_text)

        window.draw(@@glasses_slot_08_sprite)
        window.draw(@@glasses_slot_08_image_sprite)
        window.draw(@@glasses_slot_08_text)

        window.draw(@@glasses_slot_09_sprite)
        window.draw(@@glasses_slot_09_image_sprite)
        window.draw(@@glasses_slot_09_text)

        window.draw(@@glasses_slot_10_sprite)
        window.draw(@@glasses_slot_10_image_sprite)
        window.draw(@@glasses_slot_10_text)

        window.draw(@@glasses_slot_11_sprite)
        window.draw(@@glasses_slot_11_image_sprite)
        window.draw(@@glasses_slot_11_text)

        window.draw(@@glasses_slot_12_sprite)
        window.draw(@@glasses_slot_12_image_sprite)
        window.draw(@@glasses_slot_12_text)

        window.draw(@@glasses_slot_13_sprite)
        window.draw(@@glasses_slot_13_image_sprite)
        window.draw(@@glasses_slot_13_text)

        window.draw(@@glasses_slot_14_sprite)
        window.draw(@@glasses_slot_14_image_sprite)
        window.draw(@@glasses_slot_14_text)

        window.draw(@@glasses_slot_15_sprite)
        window.draw(@@glasses_slot_15_image_sprite)
        window.draw(@@glasses_slot_15_text)

        if SF::Mouse.button_pressed?(SF::Mouse::Left)
            ClothingTabGlasses.clothes_mouse_handling(window)
        end
       end

       def ClothingTabGlasses.clothes_mouse_handling(window)
        mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window))
        mouse_x = mouse_position.x
        mouse_y = mouse_position.y
        
    
        current_size = window.size
        original_width = 800 
        original_height = 600 

        scale_x = (current_size.x.to_f / original_width)
        scale_y = current_size.y.to_f / original_height
        

        #------------------------------------objects-------------------------------------------------

            slot_01_x = @@glasses_slot_01_sprite.position.x
            slot_01_y = @@glasses_slot_01_sprite.position.y
            slot_01_width = @@glasses_slot_01_sprite.size.x
            slot_01_height = @@glasses_slot_01_sprite.size.y

            slot_02_x = @@glasses_slot_02_sprite.position.x
            slot_02_y = @@glasses_slot_02_sprite.position.y
            slot_02_width = @@glasses_slot_02_sprite.size.x
            slot_02_height = @@glasses_slot_02_sprite.size.y

            slot_03_x = @@glasses_slot_03_sprite.position.x
            slot_03_y = @@glasses_slot_03_sprite.position.y
            slot_03_width = @@glasses_slot_03_sprite.size.x
            slot_03_height = @@glasses_slot_03_sprite.size.y

            slot_04_x = @@glasses_slot_04_sprite.position.x
            slot_04_y = @@glasses_slot_04_sprite.position.y
            slot_04_width = @@glasses_slot_04_sprite.size.x
            slot_04_height = @@glasses_slot_04_sprite.size.y

            slot_05_x = @@glasses_slot_05_sprite.position.x
            slot_05_y = @@glasses_slot_05_sprite.position.y
            slot_05_width = @@glasses_slot_05_sprite.size.x
            slot_05_height = @@glasses_slot_05_sprite.size.y

            slot_06_x = @@glasses_slot_06_sprite.position.x
            slot_06_y = @@glasses_slot_06_sprite.position.y
            slot_06_width = @@glasses_slot_06_sprite.size.x
            slot_06_height = @@glasses_slot_06_sprite.size.y

            slot_07_x = @@glasses_slot_07_sprite.position.x
            slot_07_y = @@glasses_slot_07_sprite.position.y
            slot_07_width = @@glasses_slot_07_sprite.size.x
            slot_07_height = @@glasses_slot_07_sprite.size.y

            slot_08_x = @@glasses_slot_08_sprite.position.x
            slot_08_y = @@glasses_slot_08_sprite.position.y
            slot_08_width = @@glasses_slot_08_sprite.size.x
            slot_08_height = @@glasses_slot_08_sprite.size.y

            slot_09_x = @@glasses_slot_09_sprite.position.x
            slot_09_y = @@glasses_slot_09_sprite.position.y
            slot_09_width = @@glasses_slot_09_sprite.size.x
            slot_09_height = @@glasses_slot_09_sprite.size.y

            slot_10_x = @@glasses_slot_10_sprite.position.x
            slot_10_y = @@glasses_slot_10_sprite.position.y
            slot_10_width = @@glasses_slot_10_sprite.size.x
            slot_10_height = @@glasses_slot_10_sprite.size.y

            slot_11_x = @@glasses_slot_11_sprite.position.x
            slot_11_y = @@glasses_slot_11_sprite.position.y
            slot_11_width = @@glasses_slot_11_sprite.size.x
            slot_11_height = @@glasses_slot_11_sprite.size.y

            slot_12_x = @@glasses_slot_12_sprite.position.x
            slot_12_y = @@glasses_slot_12_sprite.position.y
            slot_12_width = @@glasses_slot_12_sprite.size.x
            slot_12_height = @@glasses_slot_12_sprite.size.y

            slot_13_x = @@glasses_slot_13_sprite.position.x
            slot_13_y = @@glasses_slot_13_sprite.position.y
            slot_13_width = @@glasses_slot_13_sprite.size.x
            slot_13_height = @@glasses_slot_13_sprite.size.y

            slot_14_x = @@glasses_slot_14_sprite.position.x
            slot_14_y = @@glasses_slot_14_sprite.position.y
            slot_14_width = @@glasses_slot_14_sprite.size.x
            slot_14_height = @@glasses_slot_14_sprite.size.y

            slot_15_x = @@glasses_slot_15_sprite.position.x
            slot_15_y = @@glasses_slot_15_sprite.position.y
            slot_15_width = @@glasses_slot_15_sprite.size.x
            slot_15_height = @@glasses_slot_15_sprite.size.y
        #---------------------------------------------------------------------------------------------
        if @@page == nil
            @@page = 1
        end
        if (mouse_x >= slot_01_x && mouse_x <= slot_01_x + slot_01_width) &&
           (mouse_y >= slot_01_y && mouse_y <= slot_01_y + slot_01_height)
            if @@glasses_slot_01 != nil   
                t = 0 + (@@page.not_nil! * 15) - 15
                
                @@owned_glasses_array[t] = (Clothing::Glasses.get_glasses(Player::Appearance.get_clothing("glasses").not_nil!).not_nil!)
                Player::Appearance.change_glasses(@@glasses_slot_01.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
                
            end
            ClothingTabGlasses.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_02_x && mouse_x <= slot_02_x + slot_02_width) &&
           (mouse_y >= slot_02_y && mouse_y <= slot_02_y + slot_02_height)
           
            if @@glasses_slot_02 != nil
                t = 1 + (@@page.not_nil! * 15) - 15
                
                @@owned_glasses_array[t] = (Clothing::Glasses.get_glasses(Player::Appearance.get_clothing("glasses").not_nil!).not_nil!)
                Player::Appearance.change_glasses(@@glasses_slot_02.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGlasses.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_03_x && mouse_x <= slot_03_x + slot_03_width) &&
           (mouse_y >= slot_03_y && mouse_y <= slot_03_y + slot_03_height)
           
            if @@glasses_slot_03 != nil
                t = 2 + (@@page.not_nil! * 15) - 15
                
                @@owned_glasses_array[t] = (Clothing::Glasses.get_glasses(Player::Appearance.get_clothing("glasses").not_nil!).not_nil!)
                Player::Appearance.change_glasses(@@glasses_slot_03.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGlasses.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_04_x && mouse_x <= slot_04_x + slot_04_width) &&
           (mouse_y >= slot_04_y && mouse_y <= slot_04_y + slot_04_height)
           
            if @@glasses_slot_04 != nil
                t = 3 + (@@page.not_nil! * 15) - 15
                
                @@owned_glasses_array[t] = (Clothing::Glasses.get_glasses(Player::Appearance.get_clothing("glasses").not_nil!).not_nil!)
                Player::Appearance.change_glasses(@@glasses_slot_04.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGlasses.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_05_x && mouse_x <= slot_05_x + slot_05_width) &&
           (mouse_y >= slot_05_y && mouse_y <= slot_05_y + slot_05_height)
           
            if @@glasses_slot_05 != nil
                t = 4 + (@@page.not_nil! * 15) - 15
                
                @@owned_glasses_array[t] = (Clothing::Glasses.get_glasses(Player::Appearance.get_clothing("glasses").not_nil!).not_nil!)
                Player::Appearance.change_glasses(@@glasses_slot_05.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGlasses.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_06_x && mouse_x <= slot_06_x + slot_06_width) &&
           (mouse_y >= slot_06_y && mouse_y <= slot_06_y + slot_06_height)
           
            if @@glasses_slot_06 != nil
                t = 5 + (@@page.not_nil! * 15) - 15
                
                @@owned_glasses_array[t] = (Clothing::Glasses.get_glasses(Player::Appearance.get_clothing("glasses").not_nil!).not_nil!)
                Player::Appearance.change_glasses(@@glasses_slot_06.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGlasses.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_07_x && mouse_x <= slot_07_x + slot_07_width) &&
           (mouse_y >= slot_07_y && mouse_y <= slot_07_y + slot_07_height)
           
            if @@glasses_slot_07 != nil
                t = 6 + (@@page.not_nil! * 15) - 15
                
                @@owned_glasses_array[t] = (Clothing::Glasses.get_glasses(Player::Appearance.get_clothing("glasses").not_nil!).not_nil!)
                Player::Appearance.change_glasses(@@glasses_slot_07.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGlasses.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_08_x && mouse_x <= slot_08_x + slot_08_width) &&
           (mouse_y >= slot_08_y && mouse_y <= slot_08_y + slot_08_height)
           
            if @@glasses_slot_08 != nil
                t = 7 + (@@page.not_nil! * 15) - 15
                
                @@owned_glasses_array[t] = (Clothing::Glasses.get_glasses(Player::Appearance.get_clothing("glasses").not_nil!).not_nil!)
                Player::Appearance.change_glasses(@@glasses_slot_08.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGlasses.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_09_x && mouse_x <= slot_09_x + slot_09_width) &&
           (mouse_y >= slot_09_y && mouse_y <= slot_09_y + slot_09_height)
           
            if @@glasses_slot_09 != nil
                t = 8 + (@@page.not_nil! * 15) - 15
                
                @@owned_glasses_array[t] = (Clothing::Glasses.get_glasses(Player::Appearance.get_clothing("glasses").not_nil!).not_nil!)
                Player::Appearance.change_glasses(@@glasses_slot_09.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGlasses.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_10_x && mouse_x <= slot_10_x + slot_10_width) &&
           (mouse_y >= slot_10_y && mouse_y <= slot_10_y + slot_10_height)
           
            if @@glasses_slot_10 != nil
                t = 9 + (@@page.not_nil! * 15) - 15
                
                @@owned_glasses_array[t] = (Clothing::Glasses.get_glasses(Player::Appearance.get_clothing("glasses").not_nil!).not_nil!)
                Player::Appearance.change_glasses(@@glasses_slot_10.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGlasses.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_11_x && mouse_x <= slot_11_x + slot_11_width) &&
           (mouse_y >= slot_11_y && mouse_y <= slot_11_y + slot_11_height)
           
            if @@glasses_slot_11 != nil
                t = 10 + (@@page.not_nil! * 15) - 15
                
                @@owned_glasses_array[t] = (Clothing::Glasses.get_glasses(Player::Appearance.get_clothing("glasses").not_nil!).not_nil!)
                Player::Appearance.change_glasses(@@glasses_slot_11.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGlasses.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_12_x && mouse_x <= slot_12_x + slot_12_width) &&
           (mouse_y >= slot_12_y && mouse_y <= slot_12_y + slot_12_height)
           
            if @@glasses_slot_12 != nil
                t = 11 + (@@page.not_nil! * 15) - 15
                
                @@owned_glasses_array[t] = (Clothing::Glasses.get_glasses(Player::Appearance.get_clothing("glasses").not_nil!).not_nil!)
                Player::Appearance.change_glasses(@@glasses_slot_12.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGlasses.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_13_x && mouse_x <= slot_13_x + slot_13_width) &&
           (mouse_y >= slot_13_y && mouse_y <= slot_13_y + slot_13_height)
           
            if @@glasses_slot_13 != nil
                t = 12 + (@@page.not_nil! * 15) - 15
                
                @@owned_glasses_array[t] = (Clothing::Glasses.get_glasses(Player::Appearance.get_clothing("glasses").not_nil!).not_nil!)
                Player::Appearance.change_glasses(@@glasses_slot_13.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGlasses.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_14_x && mouse_x <= slot_14_x + slot_14_width) &&
           (mouse_y >= slot_14_y && mouse_y <= slot_14_y + slot_14_height)
           
            if @@glasses_slot_14 != nil
                t = 13 + (@@page.not_nil! * 15) - 15
                
                @@owned_glasses_array[t] = (Clothing::Glasses.get_glasses(Player::Appearance.get_clothing("glasses").not_nil!).not_nil!)
                Player::Appearance.change_glasses(@@glasses_slot_14.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGlasses.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_15_x && mouse_x <= slot_15_x + slot_15_width) &&
           (mouse_y >= slot_15_y && mouse_y <= slot_15_y + slot_15_height)
           
            if @@glasses_slot_15 != nil
                t = 14 + (@@page.not_nil! * 15) - 15
                
                @@owned_glasses_array[t] = (Clothing::Glasses.get_glasses(Player::Appearance.get_clothing("glasses").not_nil!).not_nil!)
                Player::Appearance.change_glasses(@@glasses_slot_15.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabGlasses.assign_slot_textures(window)
            sleep 0.15.seconds
        end

       end

    end

    class ClothingTabMakeup
        @@owned_makeup_array = [] of Clothing::Makeup

        @@makeup_sorting_category = "Type"

        @@makeup_slot_01 : Clothing::Makeup? = nil
        @@makeup_slot_02 : Clothing::Makeup? = nil
        @@makeup_slot_03 : Clothing::Makeup? = nil
        @@makeup_slot_04 : Clothing::Makeup? = nil
        @@makeup_slot_05 : Clothing::Makeup? = nil
        @@makeup_slot_06 : Clothing::Makeup? = nil
        @@makeup_slot_07 : Clothing::Makeup? = nil
        @@makeup_slot_08 : Clothing::Makeup? = nil
        @@makeup_slot_09 : Clothing::Makeup? = nil
        @@makeup_slot_10 : Clothing::Makeup? = nil
        @@makeup_slot_11 : Clothing::Makeup? = nil
        @@makeup_slot_12 : Clothing::Makeup? = nil
        @@makeup_slot_13 : Clothing::Makeup? = nil
        @@makeup_slot_14 : Clothing::Makeup? = nil
        @@makeup_slot_15 : Clothing::Makeup? = nil

       #---------------------------------debug-------------------------------------------
        @@owned_makeup_array.push(Clothing::Makeup.get_makeup("No Makeup").not_nil!)

        @@owned_makeup_array.push(Clothing::Makeup.get_makeup("Eye Scar").not_nil!)

        @@owned_makeup_array.push(Clothing::Makeup.get_makeup("Red Makeup").not_nil!)

        @@owned_makeup_array.push(Clothing::Makeup.get_makeup("Blue Makeup").not_nil!)

        @@owned_makeup_array.push(Clothing::Makeup.get_makeup("Pink Makeup").not_nil!)
        
        @@owned_makeup_array.uniq!
       #---------------------------------------------------------------------------------

       #--------------------------------objects------------------------------------------
        INVENTORY_BOX = SF::RectangleShape.new(SF.vector2(610, 420))
        INVENTORY_BOX.fill_color = SF.color( 137, 170, 208 )

        
        @@clothing_left_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_left_arrow_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_right_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_right_arrow_sprite.fill_color = SF.color(161, 183, 208)


        @@clothing_sort_button_sprite = SF::RectangleShape.new(SF.vector2(75, 25))
        @@clothing_sort_button_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_makeup_category_box = SF::RectangleShape.new(SF.vector2(100, 25))
        @@clothing_makeup_category_box.fill_color = SF.color(161, 183, 208)

        @@clothing_sort_button_text = SF::Text.new
        @@clothing_sort_button_text.font = QUICKSAND
        @@clothing_sort_button_text.character_size = 20
        @@clothing_sort_button_text.color = SF::Color::Blue
        @@clothing_sort_button_text.string = "Sort"


        @@clothing_right_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_right_arrow_sprite.fill_color = SF.color(161, 183, 208)

        @@makeup_tab = SF::RectangleShape.new(SF.vector2(100, 50))
        @@makeup_tab.fill_color = SF.color(141, 163, 188)

        @@makeup_tab_text = SF::Text.new
        @@makeup_tab_text.font = QUICKSAND
        @@makeup_tab_text.character_size = 20
        @@makeup_tab_text.color = SF::Color::Blue
        @@makeup_tab_text.string = "Makeups"

        @@makeup_tab = SF::RectangleShape.new(SF.vector2(100, 50))
        @@makeup_tab.fill_color = SF.color(161, 183, 208)

        @@makeup_tab_text = SF::Text.new
        @@makeup_tab_text.font = QUICKSAND
        @@makeup_tab_text.character_size = 20
        @@makeup_tab_text.color = SF::Color::Blue
        @@makeup_tab_text.string = "Makeup"


        @@makeup_slot_01_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@makeup_slot_01_sprite.fill_color = SF.color(161, 183, 208)

        @@makeup_slot_01_text = SF::Text.new
        @@makeup_slot_01_text.font = QUICKSAND
        @@makeup_slot_01_text.character_size = 12
        @@makeup_slot_01_text.color = SF::Color::Blue

        @@makeup_slot_01_image_sprite = SF::Sprite.new


        @@makeup_slot_02_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@makeup_slot_02_sprite.fill_color = SF.color(161, 183, 208)

        @@makeup_slot_02_text = SF::Text.new
        @@makeup_slot_02_text.font = QUICKSAND
        @@makeup_slot_02_text.character_size = 12
        @@makeup_slot_02_text.color = SF::Color::Blue

        @@makeup_slot_02_image_sprite = SF::Sprite.new


        @@makeup_slot_03_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@makeup_slot_03_sprite.fill_color = SF.color(161, 183, 208)

        @@makeup_slot_03_text = SF::Text.new
        @@makeup_slot_03_text.font = QUICKSAND
        @@makeup_slot_03_text.character_size = 12
        @@makeup_slot_03_text.color = SF::Color::Blue

        @@makeup_slot_03_image_sprite = SF::Sprite.new


        @@makeup_slot_04_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@makeup_slot_04_sprite.fill_color = SF.color(161, 183, 208)

        @@makeup_slot_04_text = SF::Text.new
        @@makeup_slot_04_text.font = QUICKSAND
        @@makeup_slot_04_text.character_size = 12
        @@makeup_slot_04_text.color = SF::Color::Blue

        @@makeup_slot_04_image_sprite = SF::Sprite.new


        @@makeup_slot_05_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@makeup_slot_05_sprite.fill_color = SF.color(161, 183, 208)

        @@makeup_slot_05_text = SF::Text.new
        @@makeup_slot_05_text.font = QUICKSAND
        @@makeup_slot_05_text.character_size = 12
        @@makeup_slot_05_text.color = SF::Color::Blue

        @@makeup_slot_05_image_sprite = SF::Sprite.new


        @@makeup_slot_06_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@makeup_slot_06_sprite.fill_color = SF.color(161, 183, 208)

        @@makeup_slot_06_text = SF::Text.new
        @@makeup_slot_06_text.font = QUICKSAND
        @@makeup_slot_06_text.character_size = 12
        @@makeup_slot_06_text.color = SF::Color::Blue
        
        @@makeup_slot_06_image_sprite = SF::Sprite.new


        @@makeup_slot_07_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@makeup_slot_07_sprite.fill_color = SF.color(161, 183, 208)

        @@makeup_slot_07_text = SF::Text.new
        @@makeup_slot_07_text.font = QUICKSAND
        @@makeup_slot_07_text.character_size = 12
        @@makeup_slot_07_text.color = SF::Color::Blue

        @@makeup_slot_07_image_sprite = SF::Sprite.new


        @@makeup_slot_08_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@makeup_slot_08_sprite.fill_color = SF.color(161, 183, 208)

        @@makeup_slot_08_text = SF::Text.new
        @@makeup_slot_08_text.font = QUICKSAND
        @@makeup_slot_08_text.character_size = 12
        @@makeup_slot_08_text.color = SF::Color::Blue

        @@makeup_slot_08_image_sprite = SF::Sprite.new


        @@makeup_slot_09_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@makeup_slot_09_sprite.fill_color = SF.color(161, 183, 208)

        @@makeup_slot_09_text = SF::Text.new
        @@makeup_slot_09_text.font = QUICKSAND
        @@makeup_slot_09_text.character_size = 12
        @@makeup_slot_09_text.color = SF::Color::Blue

        @@makeup_slot_09_image_sprite = SF::Sprite.new


        @@makeup_slot_10_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@makeup_slot_10_sprite.fill_color = SF.color(161, 183, 208)

        @@makeup_slot_10_text = SF::Text.new
        @@makeup_slot_10_text.font = QUICKSAND
        @@makeup_slot_10_text.character_size = 12
        @@makeup_slot_10_text.color = SF::Color::Blue

        @@makeup_slot_10_image_sprite = SF::Sprite.new


        @@makeup_slot_11_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@makeup_slot_11_sprite.fill_color = SF.color(161, 183, 208)

        @@makeup_slot_11_text = SF::Text.new
        @@makeup_slot_11_text.font = QUICKSAND
        @@makeup_slot_11_text.character_size = 12
        @@makeup_slot_11_text.color = SF::Color::Blue

        @@makeup_slot_11_image_sprite = SF::Sprite.new


        @@makeup_slot_12_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@makeup_slot_12_sprite.fill_color = SF.color(161, 183, 208)

        @@makeup_slot_12_text = SF::Text.new
        @@makeup_slot_12_text.font = QUICKSAND
        @@makeup_slot_12_text.character_size = 12
        @@makeup_slot_12_text.color = SF::Color::Blue

        @@makeup_slot_12_image_sprite = SF::Sprite.new


        @@makeup_slot_13_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@makeup_slot_13_sprite.fill_color = SF.color(161, 183, 208)

        @@makeup_slot_13_text = SF::Text.new
        @@makeup_slot_13_text.font = QUICKSAND
        @@makeup_slot_13_text.character_size = 12
        @@makeup_slot_13_text.color = SF::Color::Blue

        @@makeup_slot_13_image_sprite = SF::Sprite.new


        @@makeup_slot_14_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@makeup_slot_14_sprite.fill_color = SF.color(161, 183, 208)

        @@makeup_slot_14_text = SF::Text.new
        @@makeup_slot_14_text.font = QUICKSAND
        @@makeup_slot_14_text.character_size = 12
        @@makeup_slot_14_text.color = SF::Color::Blue

        @@makeup_slot_14_image_sprite = SF::Sprite.new


        @@makeup_slot_15_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@makeup_slot_15_sprite.fill_color = SF.color(161, 183, 208)

        @@makeup_slot_15_text = SF::Text.new
        @@makeup_slot_15_text.font = QUICKSAND
        @@makeup_slot_15_text.character_size = 12
        @@makeup_slot_15_text.color = SF::Color::Blue

        @@makeup_slot_15_image_sprite = SF::Sprite.new

       #---------------------------------------------------------------------------------

       def initialize(is_open : Bool, page : Int32)
        @@is_open = is_open
        @@page = page
       end

       def ClothingTabMakeup.is_open
        @@is_open
       end

       def ClothingTabMakeup.page
        @@page
       end

       def ClothingTabMakeup.is_open=(this)
        @@is_open = this
       end

       def ClothingTabMakeup.page=(this)
        @@page = this
       end

       def ClothingTabMakeup.owned_makeup_array
        @@owned_makeup_array
       end

       def ClothingTabMakeup.owned_makeup_array=(this)
        @@owned_makeup_array = this
       end

       def ClothingTabMakeup.push_to_owned_makeup_array(this)
        @@owned_makeup_array.push(this)
       end

       def ClothingTabMakeup.change_makeup_sort_category
        case @@makeup_sorting_category
        when "Type"
            @@makeup_sorting_category = "Color"
        when "Color"
            @@makeup_sorting_category = "Type"
        end
       end

       def ClothingTabMakeup.get_makeup_category
        return @@makeup_sorting_category
       end

       def ClothingTabMakeup.organise_owned_makeup_array_by_type(window)
        temp_clothing_array_01 = [] of Clothing::Makeup
        @@owned_makeup_array.each { |makeup| if makeup.makeup_type.includes?("eye") == true
        temp_clothing_array_01.push(makeup)
        end}

        @@owned_makeup_array.each { |makeup| if makeup.makeup_type.includes?("cheek") == true
        temp_clothing_array_01.push(makeup)
        end}

        @@owned_makeup_array.each { |makeup| if makeup.makeup_type.includes?("lips") == true
        temp_clothing_array_01.push(makeup)
        end}

        @@owned_makeup_array.each { |makeup| if makeup.makeup_type.includes?("face") == true
        temp_clothing_array_01.push(makeup)
        end}

        @@owned_makeup_array.clear
        @@owned_makeup_array = temp_clothing_array_01
        @@owned_makeup_array.uniq!
        ClothingTabMakeup.assign_slot_textures(window)
       end

       def ClothingTabMakeup.initialize_clothing_tab(window)
        @@page = 1
        INVENTORY_BOX.position = SF.vector2(20, 40)  
       end

       def ClothingTabMakeup.assign_slot_textures(window)
        if @@page == nil
            @@page = 1
        end
        @@owned_makeup_array.uniq!
            t = (@@page.not_nil! - 1) * 15
            if t < @@owned_makeup_array.size 
             @@makeup_slot_01_image_sprite.texture = @@owned_makeup_array[t].texture
             @@makeup_slot_01_text.string = @@owned_makeup_array[t].name
             @@makeup_slot_01 = @@owned_makeup_array[t]
            else 
                @@makeup_slot_01_image_sprite.texture = NIL_TEXTURE
                @@makeup_slot_01_text.string = ""
                @@makeup_slot_01 = nil
            end
            t = (@@page.not_nil! - 1) * 15 + 1
            if t < @@owned_makeup_array.size 
             @@makeup_slot_02_image_sprite.texture = @@owned_makeup_array[t].texture
             @@makeup_slot_02_text.string = @@owned_makeup_array[t].name
             @@makeup_slot_02 = @@owned_makeup_array[t]
            else
                @@makeup_slot_02_image_sprite.texture = NIL_TEXTURE
                @@makeup_slot_02_text.string = ""
                @@makeup_slot_02 = nil
            end
            t = 2 + (@@page.not_nil! * 15) - 15
            if t < @@owned_makeup_array.size 
             @@makeup_slot_03_image_sprite.texture = @@owned_makeup_array[t].texture
             @@makeup_slot_03_text.string = @@owned_makeup_array[t].name
             @@makeup_slot_03 = @@owned_makeup_array[t]
            else
             @@makeup_slot_03_image_sprite.texture = NIL_TEXTURE
             @@makeup_slot_03_text.string = ""
             @@makeup_slot_03 = nil
            end
            t = 3 + (@@page.not_nil! * 15) - 15
            if t < @@owned_makeup_array.size
             @@makeup_slot_04_image_sprite.texture = @@owned_makeup_array[t].texture
             @@makeup_slot_04_text.string = @@owned_makeup_array[t].name
             @@makeup_slot_04 = @@owned_makeup_array[t]
            else
             @@makeup_slot_04_image_sprite.texture = NIL_TEXTURE
             @@makeup_slot_04_text.string = ""
             @@makeup_slot_04 = nil
            end
            t = 4 + (@@page.not_nil! * 15) - 15
            if t < @@owned_makeup_array.size
             @@makeup_slot_05_image_sprite.texture = @@owned_makeup_array[t].texture
             @@makeup_slot_05_text.string = @@owned_makeup_array[t].name
             @@makeup_slot_05 = @@owned_makeup_array[t]
            else
             @@makeup_slot_05_image_sprite.texture = NIL_TEXTURE
             @@makeup_slot_05_text.string = ""
             @@makeup_slot_05 = nil
            end
            t = 5 + (@@page.not_nil! * 15) - 15
            if t < @@owned_makeup_array.size
             @@makeup_slot_06_image_sprite.texture = @@owned_makeup_array[t].texture
             @@makeup_slot_06_text.string = @@owned_makeup_array[t].name
             @@makeup_slot_06 = @@owned_makeup_array[t]
            else
             @@makeup_slot_06_image_sprite.texture = NIL_TEXTURE
             @@makeup_slot_06_text.string = ""
             @@makeup_slot_06 = nil
            end
            t = 6 + (@@page.not_nil! * 15) - 15
            if t < @@owned_makeup_array.size
             @@makeup_slot_07_image_sprite.texture = @@owned_makeup_array[t].texture
             @@makeup_slot_07_text.string = @@owned_makeup_array[t].name
             @@makeup_slot_07 = @@owned_makeup_array[t]
            else
             @@makeup_slot_07_image_sprite.texture = NIL_TEXTURE
             @@makeup_slot_07_text.string = ""
             @@makeup_slot_07 = nil
            end
            t = 7 + (@@page.not_nil! * 15) - 15
            if t < @@owned_makeup_array.size
             @@makeup_slot_08_image_sprite.texture = @@owned_makeup_array[t].texture
             @@makeup_slot_08_text.string = @@owned_makeup_array[t].name
             @@makeup_slot_08 = @@owned_makeup_array[t]
            else
             @@makeup_slot_08_image_sprite.texture = NIL_TEXTURE
             @@makeup_slot_08_text.string = ""
             @@makeup_slot_08 = nil
            end
            t = 8 + (@@page.not_nil! * 15) - 15
            if t < @@owned_makeup_array.size
             @@makeup_slot_09_image_sprite.texture = @@owned_makeup_array[t].texture
             @@makeup_slot_09_text.string = @@owned_makeup_array[t].name
             @@makeup_slot_09 = @@owned_makeup_array[t]
            else
             @@makeup_slot_09_image_sprite.texture = NIL_TEXTURE
             @@makeup_slot_09_text.string = ""
             @@makeup_slot_09 = nil
            end
            t = 9 + (@@page.not_nil! * 15) - 15
            if t < @@owned_makeup_array.size
             @@makeup_slot_10_image_sprite.texture = @@owned_makeup_array[t].texture
             @@makeup_slot_10_text.string = @@owned_makeup_array[t].name
             @@makeup_slot_10 = @@owned_makeup_array[t]
            else
             @@makeup_slot_10_image_sprite.texture = NIL_TEXTURE
             @@makeup_slot_10_text.string = ""
             @@makeup_slot_10 = nil
            end
            t = 10 + (@@page.not_nil! * 15) - 15
            if t < @@owned_makeup_array.size
             @@makeup_slot_11_image_sprite.texture = @@owned_makeup_array[t].texture
             @@makeup_slot_11_text.string = @@owned_makeup_array[t].name
             @@makeup_slot_11 = @@owned_makeup_array[t]
            else
             @@makeup_slot_11_image_sprite.texture = NIL_TEXTURE
             @@makeup_slot_11_text.string = ""
             @@makeup_slot_11 = nil
            end
            t = 11 + (@@page.not_nil! * 15) - 15
            if t < @@owned_makeup_array.size
             @@makeup_slot_12_image_sprite.texture = @@owned_makeup_array[t].texture
             @@makeup_slot_12_text.string = @@owned_makeup_array[t].name
             @@makeup_slot_12 = @@owned_makeup_array[t]
            else
             @@makeup_slot_12_image_sprite.texture = NIL_TEXTURE
             @@makeup_slot_12_text.string = ""
             @@makeup_slot_12 = nil
            end
            t = 12 + (@@page.not_nil! * 15) - 15
            if t < @@owned_makeup_array.size
             @@makeup_slot_13_image_sprite.texture = @@owned_makeup_array[t].texture
             @@makeup_slot_13_text.string = @@owned_makeup_array[t].name
             @@makeup_slot_13 = @@owned_makeup_array[t]
            else
             @@makeup_slot_13_image_sprite.texture = NIL_TEXTURE
             @@makeup_slot_13_text.string = ""
             @@makeup_slot_13 = nil
            end
            t = 13 + (@@page.not_nil! * 15) - 15
            if t < @@owned_makeup_array.size
             @@makeup_slot_14_image_sprite.texture = @@owned_makeup_array[t].texture
             @@makeup_slot_14_text.string = @@owned_makeup_array[t].name
             @@makeup_slot_14 = @@owned_makeup_array[t]
            else
             @@makeup_slot_14_image_sprite.texture = NIL_TEXTURE
             @@makeup_slot_14_text.string = ""
             @@makeup_slot_14 = nil
            end
            t = 14 + (@@page.not_nil! * 15) - 15
            if t < @@owned_makeup_array.size
             @@makeup_slot_15_image_sprite.texture = @@owned_makeup_array[t].texture
             @@makeup_slot_15_text.string = @@owned_makeup_array[t].name
             @@makeup_slot_15 = @@owned_makeup_array[t]
            else
             @@makeup_slot_15_image_sprite.texture = NIL_TEXTURE
             @@makeup_slot_15_text.string = ""
             @@makeup_slot_15 = nil
            end
        @@owned_makeup_array.uniq!
       end
       

       def ClothingTabMakeup.draw_clothing_tab(window)
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


        @@makeup_slot_01_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 40 * max_scale)
        @@makeup_slot_01_sprite.scale = SF.vector2(1, 1)
        
        @@makeup_slot_01_image_sprite.position = @@makeup_slot_01_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@makeup_slot_01_image_sprite.scale = SF.vector2(2, 2)
        @@makeup_slot_01_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        @@makeup_slot_01_text.position = @@makeup_slot_01_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@makeup_slot_01_text)
        

        @@makeup_slot_02_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 40 * max_scale)
        @@makeup_slot_02_sprite.scale = SF.vector2(1, 1)
        
        @@makeup_slot_02_image_sprite.position = @@makeup_slot_02_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@makeup_slot_02_image_sprite.scale = SF.vector2(2, 2)
        @@makeup_slot_02_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        @@makeup_slot_02_text.position = @@makeup_slot_02_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@makeup_slot_02_text)
        

        @@makeup_slot_03_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 40 * max_scale)
        @@makeup_slot_03_sprite.scale = SF.vector2(1, 1)
        
        @@makeup_slot_03_image_sprite.position = @@makeup_slot_03_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@makeup_slot_03_image_sprite.scale = SF.vector2(2, 2)
        @@makeup_slot_03_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)

        @@makeup_slot_03_text.position = @@makeup_slot_03_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@makeup_slot_03_text)
        

        @@makeup_slot_04_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 40 * max_scale)
        @@makeup_slot_04_sprite.scale = SF.vector2(1, 1)

        @@makeup_slot_04_text.position = @@makeup_slot_04_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@makeup_slot_04_text)
        
        @@makeup_slot_04_image_sprite.position = @@makeup_slot_04_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@makeup_slot_04_image_sprite.scale = SF.vector2(2, 2)
        @@makeup_slot_04_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)


        @@makeup_slot_05_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 40 * max_scale)
        @@makeup_slot_05_sprite.scale = SF.vector2(1, 1)

        @@makeup_slot_05_text.position = @@makeup_slot_05_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@makeup_slot_05_text)
        
        @@makeup_slot_05_image_sprite.position = @@makeup_slot_05_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@makeup_slot_05_image_sprite.scale = SF.vector2(2, 2)
        @@makeup_slot_05_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@makeup_slot_06_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 120 * max_scale)
        @@makeup_slot_06_sprite.scale = SF.vector2(1, 1)

        @@makeup_slot_06_text.position = @@makeup_slot_06_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@makeup_slot_06_text)
        
        @@makeup_slot_06_image_sprite.position = @@makeup_slot_06_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@makeup_slot_06_image_sprite.scale = SF.vector2(2, 2)
        @@makeup_slot_06_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@makeup_slot_07_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 120 * max_scale)
        @@makeup_slot_07_sprite.scale = SF.vector2(1, 1)
        
        @@makeup_slot_07_text.position = @@makeup_slot_07_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@makeup_slot_07_text)
        
        @@makeup_slot_07_image_sprite.position = @@makeup_slot_07_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@makeup_slot_07_image_sprite.scale = SF.vector2(2, 2)
        @@makeup_slot_07_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@makeup_slot_08_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 120 * max_scale)
        @@makeup_slot_08_sprite.scale = SF.vector2(1, 1)
                
        @@makeup_slot_08_text.position = @@makeup_slot_08_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@makeup_slot_08_text)
        
        @@makeup_slot_08_image_sprite.position = @@makeup_slot_08_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@makeup_slot_08_image_sprite.scale = SF.vector2(2, 2)
        @@makeup_slot_08_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@makeup_slot_09_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 120 * max_scale)
        @@makeup_slot_09_sprite.scale = SF.vector2(1, 1)
                
        @@makeup_slot_09_text.position = @@makeup_slot_09_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@makeup_slot_09_text)
        
        @@makeup_slot_09_image_sprite.position = @@makeup_slot_09_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@makeup_slot_09_image_sprite.scale = SF.vector2(2, 2)
        @@makeup_slot_09_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@makeup_slot_10_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 120 * max_scale)
        @@makeup_slot_10_sprite.scale = SF.vector2(1, 1)
                        
        @@makeup_slot_10_text.position = @@makeup_slot_10_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@makeup_slot_10_text)
        
        @@makeup_slot_10_image_sprite.position = @@makeup_slot_10_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@makeup_slot_10_image_sprite.scale = SF.vector2(2, 2)
        @@makeup_slot_10_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@makeup_slot_11_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 200 * max_scale)
        @@makeup_slot_11_sprite.scale = SF.vector2(1, 1)
                        
        @@makeup_slot_11_text.position = @@makeup_slot_11_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@makeup_slot_11_text)
        
        @@makeup_slot_11_image_sprite.position = @@makeup_slot_11_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@makeup_slot_11_image_sprite.scale = SF.vector2(2, 2)
        @@makeup_slot_11_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@makeup_slot_12_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 200 * max_scale)
        @@makeup_slot_12_sprite.scale = SF.vector2(1, 1)
                        
        @@makeup_slot_12_text.position = @@makeup_slot_12_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@makeup_slot_12_text)
        
        @@makeup_slot_12_image_sprite.position = @@makeup_slot_12_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@makeup_slot_12_image_sprite.scale = SF.vector2(2, 2)
        @@makeup_slot_12_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@makeup_slot_13_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 200 * max_scale)
        @@makeup_slot_13_sprite.scale = SF.vector2(1, 1)
        
        @@makeup_slot_13_text.position = @@makeup_slot_13_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@makeup_slot_13_text)
        
        @@makeup_slot_13_image_sprite.position = @@makeup_slot_13_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@makeup_slot_13_image_sprite.scale = SF.vector2(2, 2)
        @@makeup_slot_13_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@makeup_slot_14_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 200 * max_scale)
        @@makeup_slot_14_sprite.scale = SF.vector2(1, 1)
                        
        @@makeup_slot_14_text.position = @@makeup_slot_14_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@makeup_slot_14_text)
        
        @@makeup_slot_14_image_sprite.position = @@makeup_slot_14_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@makeup_slot_14_image_sprite.scale = SF.vector2(2, 2)
        @@makeup_slot_14_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)
        

        @@makeup_slot_15_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 200 * max_scale)
        @@makeup_slot_15_sprite.scale = SF.vector2(1, 1)
                        
        @@makeup_slot_15_text.position = @@makeup_slot_15_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@makeup_slot_15_text)
        
        @@makeup_slot_15_image_sprite.position = @@makeup_slot_15_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@makeup_slot_15_image_sprite.scale = SF.vector2(2, 2)
        @@makeup_slot_15_image_sprite.texture_rect = SF.int_rect(192, 256, 96, 128)


        window.draw(@@makeup_slot_01_sprite)
        window.draw(@@makeup_slot_01_image_sprite)
        window.draw(@@makeup_slot_01_text)

        window.draw(@@makeup_slot_02_sprite)
        window.draw(@@makeup_slot_02_image_sprite)
        window.draw(@@makeup_slot_02_text)

        window.draw(@@makeup_slot_03_sprite)
        window.draw(@@makeup_slot_03_image_sprite)
        window.draw(@@makeup_slot_03_text)
        
        window.draw(@@makeup_slot_04_sprite)
        window.draw(@@makeup_slot_04_image_sprite)
        window.draw(@@makeup_slot_04_text)

        window.draw(@@makeup_slot_05_sprite)
        window.draw(@@makeup_slot_05_image_sprite)
        window.draw(@@makeup_slot_05_text)

        window.draw(@@makeup_slot_06_sprite)
        window.draw(@@makeup_slot_06_image_sprite)
        window.draw(@@makeup_slot_06_text)

        window.draw(@@makeup_slot_07_sprite)
        window.draw(@@makeup_slot_07_image_sprite)
        window.draw(@@makeup_slot_07_text)

        window.draw(@@makeup_slot_08_sprite)
        window.draw(@@makeup_slot_08_image_sprite)
        window.draw(@@makeup_slot_08_text)

        window.draw(@@makeup_slot_09_sprite)
        window.draw(@@makeup_slot_09_image_sprite)
        window.draw(@@makeup_slot_09_text)

        window.draw(@@makeup_slot_10_sprite)
        window.draw(@@makeup_slot_10_image_sprite)
        window.draw(@@makeup_slot_10_text)

        window.draw(@@makeup_slot_11_sprite)
        window.draw(@@makeup_slot_11_image_sprite)
        window.draw(@@makeup_slot_11_text)

        window.draw(@@makeup_slot_12_sprite)
        window.draw(@@makeup_slot_12_image_sprite)
        window.draw(@@makeup_slot_12_text)

        window.draw(@@makeup_slot_13_sprite)
        window.draw(@@makeup_slot_13_image_sprite)
        window.draw(@@makeup_slot_13_text)

        window.draw(@@makeup_slot_14_sprite)
        window.draw(@@makeup_slot_14_image_sprite)
        window.draw(@@makeup_slot_14_text)

        window.draw(@@makeup_slot_15_sprite)
        window.draw(@@makeup_slot_15_image_sprite)
        window.draw(@@makeup_slot_15_text)

        if SF::Mouse.button_pressed?(SF::Mouse::Left)
            ClothingTabMakeup.clothes_mouse_handling(window)
        end
       end

       def ClothingTabMakeup.clothes_mouse_handling(window)
        mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window))
        mouse_x = mouse_position.x
        mouse_y = mouse_position.y
        
    
        current_size = window.size
        original_width = 800 
        original_height = 600 

        scale_x = (current_size.x.to_f / original_width)
        scale_y = current_size.y.to_f / original_height
        

        #------------------------------------objects-------------------------------------------------

            slot_01_x = @@makeup_slot_01_sprite.position.x
            slot_01_y = @@makeup_slot_01_sprite.position.y
            slot_01_width = @@makeup_slot_01_sprite.size.x
            slot_01_height = @@makeup_slot_01_sprite.size.y

            slot_02_x = @@makeup_slot_02_sprite.position.x
            slot_02_y = @@makeup_slot_02_sprite.position.y
            slot_02_width = @@makeup_slot_02_sprite.size.x
            slot_02_height = @@makeup_slot_02_sprite.size.y

            slot_03_x = @@makeup_slot_03_sprite.position.x
            slot_03_y = @@makeup_slot_03_sprite.position.y
            slot_03_width = @@makeup_slot_03_sprite.size.x
            slot_03_height = @@makeup_slot_03_sprite.size.y

            slot_04_x = @@makeup_slot_04_sprite.position.x
            slot_04_y = @@makeup_slot_04_sprite.position.y
            slot_04_width = @@makeup_slot_04_sprite.size.x
            slot_04_height = @@makeup_slot_04_sprite.size.y

            slot_05_x = @@makeup_slot_05_sprite.position.x
            slot_05_y = @@makeup_slot_05_sprite.position.y
            slot_05_width = @@makeup_slot_05_sprite.size.x
            slot_05_height = @@makeup_slot_05_sprite.size.y

            slot_06_x = @@makeup_slot_06_sprite.position.x
            slot_06_y = @@makeup_slot_06_sprite.position.y
            slot_06_width = @@makeup_slot_06_sprite.size.x
            slot_06_height = @@makeup_slot_06_sprite.size.y

            slot_07_x = @@makeup_slot_07_sprite.position.x
            slot_07_y = @@makeup_slot_07_sprite.position.y
            slot_07_width = @@makeup_slot_07_sprite.size.x
            slot_07_height = @@makeup_slot_07_sprite.size.y

            slot_08_x = @@makeup_slot_08_sprite.position.x
            slot_08_y = @@makeup_slot_08_sprite.position.y
            slot_08_width = @@makeup_slot_08_sprite.size.x
            slot_08_height = @@makeup_slot_08_sprite.size.y

            slot_09_x = @@makeup_slot_09_sprite.position.x
            slot_09_y = @@makeup_slot_09_sprite.position.y
            slot_09_width = @@makeup_slot_09_sprite.size.x
            slot_09_height = @@makeup_slot_09_sprite.size.y

            slot_10_x = @@makeup_slot_10_sprite.position.x
            slot_10_y = @@makeup_slot_10_sprite.position.y
            slot_10_width = @@makeup_slot_10_sprite.size.x
            slot_10_height = @@makeup_slot_10_sprite.size.y

            slot_11_x = @@makeup_slot_11_sprite.position.x
            slot_11_y = @@makeup_slot_11_sprite.position.y
            slot_11_width = @@makeup_slot_11_sprite.size.x
            slot_11_height = @@makeup_slot_11_sprite.size.y

            slot_12_x = @@makeup_slot_12_sprite.position.x
            slot_12_y = @@makeup_slot_12_sprite.position.y
            slot_12_width = @@makeup_slot_12_sprite.size.x
            slot_12_height = @@makeup_slot_12_sprite.size.y

            slot_13_x = @@makeup_slot_13_sprite.position.x
            slot_13_y = @@makeup_slot_13_sprite.position.y
            slot_13_width = @@makeup_slot_13_sprite.size.x
            slot_13_height = @@makeup_slot_13_sprite.size.y

            slot_14_x = @@makeup_slot_14_sprite.position.x
            slot_14_y = @@makeup_slot_14_sprite.position.y
            slot_14_width = @@makeup_slot_14_sprite.size.x
            slot_14_height = @@makeup_slot_14_sprite.size.y

            slot_15_x = @@makeup_slot_15_sprite.position.x
            slot_15_y = @@makeup_slot_15_sprite.position.y
            slot_15_width = @@makeup_slot_15_sprite.size.x
            slot_15_height = @@makeup_slot_15_sprite.size.y
        #---------------------------------------------------------------------------------------------
        if @@page == nil
            @@page = 1
        end
        if (mouse_x >= slot_01_x && mouse_x <= slot_01_x + slot_01_width) &&
           (mouse_y >= slot_01_y && mouse_y <= slot_01_y + slot_01_height)
            if @@makeup_slot_01 != nil   
                t = 0 + (@@page.not_nil! * 15) - 15
                
                @@owned_makeup_array[t] = (Clothing::Makeup.get_makeup(Player::Appearance.get_clothing("makeup").not_nil!).not_nil!)
                Player::Appearance.change_makeup(@@makeup_slot_01.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabMakeup.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_02_x && mouse_x <= slot_02_x + slot_02_width) &&
           (mouse_y >= slot_02_y && mouse_y <= slot_02_y + slot_02_height)
           
            if @@makeup_slot_02 != nil
                t = 1 + (@@page.not_nil! * 15) - 15
                
                @@owned_makeup_array[t] = (Clothing::Makeup.get_makeup(Player::Appearance.get_clothing("makeup").not_nil!).not_nil!)
                Player::Appearance.change_makeup(@@makeup_slot_02.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabMakeup.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_03_x && mouse_x <= slot_03_x + slot_03_width) &&
           (mouse_y >= slot_03_y && mouse_y <= slot_03_y + slot_03_height)
           
            if @@makeup_slot_03 != nil
                t = 2 + (@@page.not_nil! * 15) - 15
                
                @@owned_makeup_array[t] = (Clothing::Makeup.get_makeup(Player::Appearance.get_clothing("makeup").not_nil!).not_nil!)
                Player::Appearance.change_makeup(@@makeup_slot_03.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabMakeup.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_04_x && mouse_x <= slot_04_x + slot_04_width) &&
           (mouse_y >= slot_04_y && mouse_y <= slot_04_y + slot_04_height)
           
            if @@makeup_slot_04 != nil
                t = 3 + (@@page.not_nil! * 15) - 15
                
                @@owned_makeup_array[t] = (Clothing::Makeup.get_makeup(Player::Appearance.get_clothing("makeup").not_nil!).not_nil!)
                Player::Appearance.change_makeup(@@makeup_slot_04.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabMakeup.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_05_x && mouse_x <= slot_05_x + slot_05_width) &&
           (mouse_y >= slot_05_y && mouse_y <= slot_05_y + slot_05_height)
           
            if @@makeup_slot_05 != nil
                t = 4 + (@@page.not_nil! * 15) - 15
                
                @@owned_makeup_array[t] = (Clothing::Makeup.get_makeup(Player::Appearance.get_clothing("makeup").not_nil!).not_nil!)
                Player::Appearance.change_makeup(@@makeup_slot_05.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabMakeup.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_06_x && mouse_x <= slot_06_x + slot_06_width) &&
           (mouse_y >= slot_06_y && mouse_y <= slot_06_y + slot_06_height)
           
            if @@makeup_slot_06 != nil
                t = 5 + (@@page.not_nil! * 15) - 15
                
                @@owned_makeup_array[t] = (Clothing::Makeup.get_makeup(Player::Appearance.get_clothing("makeup").not_nil!).not_nil!)
                Player::Appearance.change_makeup(@@makeup_slot_06.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabMakeup.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_07_x && mouse_x <= slot_07_x + slot_07_width) &&
           (mouse_y >= slot_07_y && mouse_y <= slot_07_y + slot_07_height)
           
            if @@makeup_slot_07 != nil
                t = 6 + (@@page.not_nil! * 15) - 15
                
                @@owned_makeup_array[t] = (Clothing::Makeup.get_makeup(Player::Appearance.get_clothing("makeup").not_nil!).not_nil!)
                Player::Appearance.change_makeup(@@makeup_slot_07.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabMakeup.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_08_x && mouse_x <= slot_08_x + slot_08_width) &&
           (mouse_y >= slot_08_y && mouse_y <= slot_08_y + slot_08_height)
           
            if @@makeup_slot_08 != nil
                t = 7 + (@@page.not_nil! * 15) - 15
                
                @@owned_makeup_array[t] = (Clothing::Makeup.get_makeup(Player::Appearance.get_clothing("makeup").not_nil!).not_nil!)
                Player::Appearance.change_makeup(@@makeup_slot_08.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabMakeup.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_09_x && mouse_x <= slot_09_x + slot_09_width) &&
           (mouse_y >= slot_09_y && mouse_y <= slot_09_y + slot_09_height)
           
            if @@makeup_slot_09 != nil
                t = 8 + (@@page.not_nil! * 15) - 15
                
                @@owned_makeup_array[t] = (Clothing::Makeup.get_makeup(Player::Appearance.get_clothing("makeup").not_nil!).not_nil!)
                Player::Appearance.change_makeup(@@makeup_slot_09.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabMakeup.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_10_x && mouse_x <= slot_10_x + slot_10_width) &&
           (mouse_y >= slot_10_y && mouse_y <= slot_10_y + slot_10_height)
           
            if @@makeup_slot_10 != nil
                t = 9 + (@@page.not_nil! * 15) - 15
                
                @@owned_makeup_array[t] = (Clothing::Makeup.get_makeup(Player::Appearance.get_clothing("makeup").not_nil!).not_nil!)
                Player::Appearance.change_makeup(@@makeup_slot_10.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabMakeup.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_11_x && mouse_x <= slot_11_x + slot_11_width) &&
           (mouse_y >= slot_11_y && mouse_y <= slot_11_y + slot_11_height)
           
            if @@makeup_slot_11 != nil
                t = 10 + (@@page.not_nil! * 15) - 15
                
                @@owned_makeup_array[t] = (Clothing::Makeup.get_makeup(Player::Appearance.get_clothing("makeup").not_nil!).not_nil!)
                Player::Appearance.change_makeup(@@makeup_slot_11.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabMakeup.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_12_x && mouse_x <= slot_12_x + slot_12_width) &&
           (mouse_y >= slot_12_y && mouse_y <= slot_12_y + slot_12_height)
           
            if @@makeup_slot_12 != nil
                t = 11 + (@@page.not_nil! * 15) - 15
                
                @@owned_makeup_array[t] = (Clothing::Makeup.get_makeup(Player::Appearance.get_clothing("makeup").not_nil!).not_nil!)
                Player::Appearance.change_makeup(@@makeup_slot_12.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabMakeup.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_13_x && mouse_x <= slot_13_x + slot_13_width) &&
           (mouse_y >= slot_13_y && mouse_y <= slot_13_y + slot_13_height)
           
            if @@makeup_slot_13 != nil
                t = 12 + (@@page.not_nil! * 15) - 15
                
                @@owned_makeup_array[t] = (Clothing::Makeup.get_makeup(Player::Appearance.get_clothing("makeup").not_nil!).not_nil!)
                Player::Appearance.change_makeup(@@makeup_slot_13.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabMakeup.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_14_x && mouse_x <= slot_14_x + slot_14_width) &&
           (mouse_y >= slot_14_y && mouse_y <= slot_14_y + slot_14_height)
           
            if @@makeup_slot_14 != nil
                t = 13 + (@@page.not_nil! * 15) - 15
                
                @@owned_makeup_array[t] = (Clothing::Makeup.get_makeup(Player::Appearance.get_clothing("makeup").not_nil!).not_nil!)
                Player::Appearance.change_makeup(@@makeup_slot_14.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabMakeup.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_15_x && mouse_x <= slot_15_x + slot_15_width) &&
           (mouse_y >= slot_15_y && mouse_y <= slot_15_y + slot_15_height)
           
            if @@makeup_slot_15 != nil
                t = 14 + (@@page.not_nil! * 15) - 15
                
                @@owned_makeup_array[t] = (Clothing::Makeup.get_makeup(Player::Appearance.get_clothing("makeup").not_nil!).not_nil!)
                Player::Appearance.change_makeup(@@makeup_slot_15.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabMakeup.assign_slot_textures(window)
            sleep 0.15.seconds
        end

       end

    end

    class ClothingTabNecklace
        @@owned_necklace_array = [] of Clothing::Necklace

        @@necklace_sorting_category = "Type"

        @@necklace_slot_01 : Clothing::Necklace? = nil
        @@necklace_slot_02 : Clothing::Necklace? = nil
        @@necklace_slot_03 : Clothing::Necklace? = nil
        @@necklace_slot_04 : Clothing::Necklace? = nil
        @@necklace_slot_05 : Clothing::Necklace? = nil
        @@necklace_slot_06 : Clothing::Necklace? = nil
        @@necklace_slot_07 : Clothing::Necklace? = nil
        @@necklace_slot_08 : Clothing::Necklace? = nil
        @@necklace_slot_09 : Clothing::Necklace? = nil
        @@necklace_slot_10 : Clothing::Necklace? = nil
        @@necklace_slot_11 : Clothing::Necklace? = nil
        @@necklace_slot_12 : Clothing::Necklace? = nil
        @@necklace_slot_13 : Clothing::Necklace? = nil
        @@necklace_slot_14 : Clothing::Necklace? = nil
        @@necklace_slot_15 : Clothing::Necklace? = nil

       #---------------------------------debug-------------------------------------------
        @@owned_necklace_array.push(Clothing::Necklace.get_necklace("No Necklace").not_nil!)

        @@owned_necklace_array.push(Clothing::Necklace.get_necklace("Ruby Necklace").not_nil!)
        @@owned_necklace_array.push(Clothing::Necklace.get_necklace("Topaz Necklace").not_nil!)
        @@owned_necklace_array.push(Clothing::Necklace.get_necklace("Amber Necklace").not_nil!)
        
        @@owned_necklace_array.uniq!
       #---------------------------------------------------------------------------------

       #--------------------------------objects------------------------------------------
        INVENTORY_BOX = SF::RectangleShape.new(SF.vector2(610, 420))
        INVENTORY_BOX.fill_color = SF.color( 137, 170, 208 )

        
        @@clothing_left_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_left_arrow_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_right_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_right_arrow_sprite.fill_color = SF.color(161, 183, 208)


        @@clothing_sort_button_sprite = SF::RectangleShape.new(SF.vector2(75, 25))
        @@clothing_sort_button_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_necklace_category_box = SF::RectangleShape.new(SF.vector2(100, 25))
        @@clothing_necklace_category_box.fill_color = SF.color(161, 183, 208)

        @@clothing_sort_button_text = SF::Text.new
        @@clothing_sort_button_text.font = QUICKSAND
        @@clothing_sort_button_text.character_size = 20
        @@clothing_sort_button_text.color = SF::Color::Blue
        @@clothing_sort_button_text.string = "Sort"


        @@clothing_right_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_right_arrow_sprite.fill_color = SF.color(161, 183, 208)

        @@necklace_tab = SF::RectangleShape.new(SF.vector2(100, 50))
        @@necklace_tab.fill_color = SF.color(141, 163, 188)

        @@necklace_tab_text = SF::Text.new
        @@necklace_tab_text.font = QUICKSAND
        @@necklace_tab_text.character_size = 20
        @@necklace_tab_text.color = SF::Color::Blue
        @@necklace_tab_text.string = "Necklaces"

        @@necklace_tab = SF::RectangleShape.new(SF.vector2(100, 50))
        @@necklace_tab.fill_color = SF.color(161, 183, 208)

        @@necklace_tab_text = SF::Text.new
        @@necklace_tab_text.font = QUICKSAND
        @@necklace_tab_text.character_size = 20
        @@necklace_tab_text.color = SF::Color::Blue
        @@necklace_tab_text.string = "Necklace"


        @@necklace_slot_01_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@necklace_slot_01_sprite.fill_color = SF.color(161, 183, 208)

        @@necklace_slot_01_text = SF::Text.new
        @@necklace_slot_01_text.font = QUICKSAND
        @@necklace_slot_01_text.character_size = 12
        @@necklace_slot_01_text.color = SF::Color::Blue

        @@necklace_slot_01_image_sprite = SF::Sprite.new


        @@necklace_slot_02_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@necklace_slot_02_sprite.fill_color = SF.color(161, 183, 208)

        @@necklace_slot_02_text = SF::Text.new
        @@necklace_slot_02_text.font = QUICKSAND
        @@necklace_slot_02_text.character_size = 12
        @@necklace_slot_02_text.color = SF::Color::Blue

        @@necklace_slot_02_image_sprite = SF::Sprite.new


        @@necklace_slot_03_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@necklace_slot_03_sprite.fill_color = SF.color(161, 183, 208)

        @@necklace_slot_03_text = SF::Text.new
        @@necklace_slot_03_text.font = QUICKSAND
        @@necklace_slot_03_text.character_size = 12
        @@necklace_slot_03_text.color = SF::Color::Blue

        @@necklace_slot_03_image_sprite = SF::Sprite.new


        @@necklace_slot_04_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@necklace_slot_04_sprite.fill_color = SF.color(161, 183, 208)

        @@necklace_slot_04_text = SF::Text.new
        @@necklace_slot_04_text.font = QUICKSAND
        @@necklace_slot_04_text.character_size = 12
        @@necklace_slot_04_text.color = SF::Color::Blue

        @@necklace_slot_04_image_sprite = SF::Sprite.new


        @@necklace_slot_05_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@necklace_slot_05_sprite.fill_color = SF.color(161, 183, 208)

        @@necklace_slot_05_text = SF::Text.new
        @@necklace_slot_05_text.font = QUICKSAND
        @@necklace_slot_05_text.character_size = 12
        @@necklace_slot_05_text.color = SF::Color::Blue

        @@necklace_slot_05_image_sprite = SF::Sprite.new


        @@necklace_slot_06_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@necklace_slot_06_sprite.fill_color = SF.color(161, 183, 208)

        @@necklace_slot_06_text = SF::Text.new
        @@necklace_slot_06_text.font = QUICKSAND
        @@necklace_slot_06_text.character_size = 12
        @@necklace_slot_06_text.color = SF::Color::Blue
        
        @@necklace_slot_06_image_sprite = SF::Sprite.new


        @@necklace_slot_07_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@necklace_slot_07_sprite.fill_color = SF.color(161, 183, 208)

        @@necklace_slot_07_text = SF::Text.new
        @@necklace_slot_07_text.font = QUICKSAND
        @@necklace_slot_07_text.character_size = 12
        @@necklace_slot_07_text.color = SF::Color::Blue

        @@necklace_slot_07_image_sprite = SF::Sprite.new


        @@necklace_slot_08_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@necklace_slot_08_sprite.fill_color = SF.color(161, 183, 208)

        @@necklace_slot_08_text = SF::Text.new
        @@necklace_slot_08_text.font = QUICKSAND
        @@necklace_slot_08_text.character_size = 12
        @@necklace_slot_08_text.color = SF::Color::Blue

        @@necklace_slot_08_image_sprite = SF::Sprite.new


        @@necklace_slot_09_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@necklace_slot_09_sprite.fill_color = SF.color(161, 183, 208)

        @@necklace_slot_09_text = SF::Text.new
        @@necklace_slot_09_text.font = QUICKSAND
        @@necklace_slot_09_text.character_size = 12
        @@necklace_slot_09_text.color = SF::Color::Blue

        @@necklace_slot_09_image_sprite = SF::Sprite.new


        @@necklace_slot_10_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@necklace_slot_10_sprite.fill_color = SF.color(161, 183, 208)

        @@necklace_slot_10_text = SF::Text.new
        @@necklace_slot_10_text.font = QUICKSAND
        @@necklace_slot_10_text.character_size = 12
        @@necklace_slot_10_text.color = SF::Color::Blue

        @@necklace_slot_10_image_sprite = SF::Sprite.new


        @@necklace_slot_11_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@necklace_slot_11_sprite.fill_color = SF.color(161, 183, 208)

        @@necklace_slot_11_text = SF::Text.new
        @@necklace_slot_11_text.font = QUICKSAND
        @@necklace_slot_11_text.character_size = 12
        @@necklace_slot_11_text.color = SF::Color::Blue

        @@necklace_slot_11_image_sprite = SF::Sprite.new


        @@necklace_slot_12_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@necklace_slot_12_sprite.fill_color = SF.color(161, 183, 208)

        @@necklace_slot_12_text = SF::Text.new
        @@necklace_slot_12_text.font = QUICKSAND
        @@necklace_slot_12_text.character_size = 12
        @@necklace_slot_12_text.color = SF::Color::Blue

        @@necklace_slot_12_image_sprite = SF::Sprite.new


        @@necklace_slot_13_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@necklace_slot_13_sprite.fill_color = SF.color(161, 183, 208)

        @@necklace_slot_13_text = SF::Text.new
        @@necklace_slot_13_text.font = QUICKSAND
        @@necklace_slot_13_text.character_size = 12
        @@necklace_slot_13_text.color = SF::Color::Blue

        @@necklace_slot_13_image_sprite = SF::Sprite.new


        @@necklace_slot_14_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@necklace_slot_14_sprite.fill_color = SF.color(161, 183, 208)

        @@necklace_slot_14_text = SF::Text.new
        @@necklace_slot_14_text.font = QUICKSAND
        @@necklace_slot_14_text.character_size = 12
        @@necklace_slot_14_text.color = SF::Color::Blue

        @@necklace_slot_14_image_sprite = SF::Sprite.new


        @@necklace_slot_15_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@necklace_slot_15_sprite.fill_color = SF.color(161, 183, 208)

        @@necklace_slot_15_text = SF::Text.new
        @@necklace_slot_15_text.font = QUICKSAND
        @@necklace_slot_15_text.character_size = 12
        @@necklace_slot_15_text.color = SF::Color::Blue

        @@necklace_slot_15_image_sprite = SF::Sprite.new

       #---------------------------------------------------------------------------------

       def initialize(is_open : Bool, page : Int32)
        @@is_open = is_open
        @@page = page
       end

       def ClothingTabNecklace.is_open
        @@is_open
       end

       def ClothingTabNecklace.page
        @@page
       end

       def ClothingTabNecklace.is_open=(this)
        @@is_open = this
       end

       def ClothingTabNecklace.page=(this)
        @@page = this
       end

       def ClothingTabNecklace.owned_necklace_array
        @@owned_necklace_array
       end

       def ClothingTabNecklace.owned_necklace_array=(this)
        @@owned_necklace_array = this
       end

       def ClothingTabNecklace.push_to_owned_necklace_array(this)
        @@owned_necklace_array.push(this)
       end

       def ClothingTabNecklace.change_necklace_sort_category
        case @@necklace_sorting_category
        when "Type"
            @@necklace_sorting_category = "Color"
        when "Color"
            @@necklace_sorting_category = "Type"
        end
       end

       def ClothingTabNecklace.get_necklace_category
        return @@necklace_sorting_category
       end

       def ClothingTabNecklace.organise_owned_necklace_array_by_type(window)
        temp_clothing_array_01 = [] of Clothing::Necklace
        @@owned_necklace_array.each { |necklace| if necklace.necklace_type.includes?("eye") == true
        temp_clothing_array_01.push(necklace)
        end}

        @@owned_necklace_array.each { |necklace| if necklace.necklace_type.includes?("cheek") == true
        temp_clothing_array_01.push(necklace)
        end}

        @@owned_necklace_array.each { |necklace| if necklace.necklace_type.includes?("lips") == true
        temp_clothing_array_01.push(necklace)
        end}

        @@owned_necklace_array.each { |necklace| if necklace.necklace_type.includes?("face") == true
        temp_clothing_array_01.push(necklace)
        end}

        @@owned_necklace_array.clear
        @@owned_necklace_array = temp_clothing_array_01
        @@owned_necklace_array.uniq!
        ClothingTabNecklace.assign_slot_textures(window)
       end

       def ClothingTabNecklace.initialize_clothing_tab(window)
        @@page = 1
        INVENTORY_BOX.position = SF.vector2(20, 40)  
       end

       def ClothingTabNecklace.assign_slot_textures(window)
        if @@page == nil
            @@page = 1
        end
        @@owned_necklace_array.uniq!
            t = (@@page.not_nil! - 1) * 15
            if t < @@owned_necklace_array.size 
             @@necklace_slot_01_image_sprite.texture = @@owned_necklace_array[t].texture
             @@necklace_slot_01_text.string = @@owned_necklace_array[t].name
             @@necklace_slot_01 = @@owned_necklace_array[t]
            else 
                @@necklace_slot_01_image_sprite.texture = NIL_TEXTURE
                @@necklace_slot_01_text.string = ""
                @@necklace_slot_01 = nil
            end
            t = (@@page.not_nil! - 1) * 15 + 1
            if t < @@owned_necklace_array.size 
             @@necklace_slot_02_image_sprite.texture = @@owned_necklace_array[t].texture
             @@necklace_slot_02_text.string = @@owned_necklace_array[t].name
             @@necklace_slot_02 = @@owned_necklace_array[t]
            else
                @@necklace_slot_02_image_sprite.texture = NIL_TEXTURE
                @@necklace_slot_02_text.string = ""
                @@necklace_slot_02 = nil
            end
            t = 2 + (@@page.not_nil! * 15) - 15
            if t < @@owned_necklace_array.size 
             @@necklace_slot_03_image_sprite.texture = @@owned_necklace_array[t].texture
             @@necklace_slot_03_text.string = @@owned_necklace_array[t].name
             @@necklace_slot_03 = @@owned_necklace_array[t]
            else
             @@necklace_slot_03_image_sprite.texture = NIL_TEXTURE
             @@necklace_slot_03_text.string = ""
             @@necklace_slot_03 = nil
            end
            t = 3 + (@@page.not_nil! * 15) - 15
            if t < @@owned_necklace_array.size
             @@necklace_slot_04_image_sprite.texture = @@owned_necklace_array[t].texture
             @@necklace_slot_04_text.string = @@owned_necklace_array[t].name
             @@necklace_slot_04 = @@owned_necklace_array[t]
            else
             @@necklace_slot_04_image_sprite.texture = NIL_TEXTURE
             @@necklace_slot_04_text.string = ""
             @@necklace_slot_04 = nil
            end
            t = 4 + (@@page.not_nil! * 15) - 15
            if t < @@owned_necklace_array.size
             @@necklace_slot_05_image_sprite.texture = @@owned_necklace_array[t].texture
             @@necklace_slot_05_text.string = @@owned_necklace_array[t].name
             @@necklace_slot_05 = @@owned_necklace_array[t]
            else
             @@necklace_slot_05_image_sprite.texture = NIL_TEXTURE
             @@necklace_slot_05_text.string = ""
             @@necklace_slot_05 = nil
            end
            t = 5 + (@@page.not_nil! * 15) - 15
            if t < @@owned_necklace_array.size
             @@necklace_slot_06_image_sprite.texture = @@owned_necklace_array[t].texture
             @@necklace_slot_06_text.string = @@owned_necklace_array[t].name
             @@necklace_slot_06 = @@owned_necklace_array[t]
            else
             @@necklace_slot_06_image_sprite.texture = NIL_TEXTURE
             @@necklace_slot_06_text.string = ""
             @@necklace_slot_06 = nil
            end
            t = 6 + (@@page.not_nil! * 15) - 15
            if t < @@owned_necklace_array.size
             @@necklace_slot_07_image_sprite.texture = @@owned_necklace_array[t].texture
             @@necklace_slot_07_text.string = @@owned_necklace_array[t].name
             @@necklace_slot_07 = @@owned_necklace_array[t]
            else
             @@necklace_slot_07_image_sprite.texture = NIL_TEXTURE
             @@necklace_slot_07_text.string = ""
             @@necklace_slot_07 = nil
            end
            t = 7 + (@@page.not_nil! * 15) - 15
            if t < @@owned_necklace_array.size
             @@necklace_slot_08_image_sprite.texture = @@owned_necklace_array[t].texture
             @@necklace_slot_08_text.string = @@owned_necklace_array[t].name
             @@necklace_slot_08 = @@owned_necklace_array[t]
            else
             @@necklace_slot_08_image_sprite.texture = NIL_TEXTURE
             @@necklace_slot_08_text.string = ""
             @@necklace_slot_08 = nil
            end
            t = 8 + (@@page.not_nil! * 15) - 15
            if t < @@owned_necklace_array.size
             @@necklace_slot_09_image_sprite.texture = @@owned_necklace_array[t].texture
             @@necklace_slot_09_text.string = @@owned_necklace_array[t].name
             @@necklace_slot_09 = @@owned_necklace_array[t]
            else
             @@necklace_slot_09_image_sprite.texture = NIL_TEXTURE
             @@necklace_slot_09_text.string = ""
             @@necklace_slot_09 = nil
            end
            t = 9 + (@@page.not_nil! * 15) - 15
            if t < @@owned_necklace_array.size
             @@necklace_slot_10_image_sprite.texture = @@owned_necklace_array[t].texture
             @@necklace_slot_10_text.string = @@owned_necklace_array[t].name
             @@necklace_slot_10 = @@owned_necklace_array[t]
            else
             @@necklace_slot_10_image_sprite.texture = NIL_TEXTURE
             @@necklace_slot_10_text.string = ""
             @@necklace_slot_10 = nil
            end
            t = 10 + (@@page.not_nil! * 15) - 15
            if t < @@owned_necklace_array.size
             @@necklace_slot_11_image_sprite.texture = @@owned_necklace_array[t].texture
             @@necklace_slot_11_text.string = @@owned_necklace_array[t].name
             @@necklace_slot_11 = @@owned_necklace_array[t]
            else
             @@necklace_slot_11_image_sprite.texture = NIL_TEXTURE
             @@necklace_slot_11_text.string = ""
             @@necklace_slot_11 = nil
            end
            t = 11 + (@@page.not_nil! * 15) - 15
            if t < @@owned_necklace_array.size
             @@necklace_slot_12_image_sprite.texture = @@owned_necklace_array[t].texture
             @@necklace_slot_12_text.string = @@owned_necklace_array[t].name
             @@necklace_slot_12 = @@owned_necklace_array[t]
            else
             @@necklace_slot_12_image_sprite.texture = NIL_TEXTURE
             @@necklace_slot_12_text.string = ""
             @@necklace_slot_12 = nil
            end
            t = 12 + (@@page.not_nil! * 15) - 15
            if t < @@owned_necklace_array.size
             @@necklace_slot_13_image_sprite.texture = @@owned_necklace_array[t].texture
             @@necklace_slot_13_text.string = @@owned_necklace_array[t].name
             @@necklace_slot_13 = @@owned_necklace_array[t]
            else
             @@necklace_slot_13_image_sprite.texture = NIL_TEXTURE
             @@necklace_slot_13_text.string = ""
             @@necklace_slot_13 = nil
            end
            t = 13 + (@@page.not_nil! * 15) - 15
            if t < @@owned_necklace_array.size
             @@necklace_slot_14_image_sprite.texture = @@owned_necklace_array[t].texture
             @@necklace_slot_14_text.string = @@owned_necklace_array[t].name
             @@necklace_slot_14 = @@owned_necklace_array[t]
            else
             @@necklace_slot_14_image_sprite.texture = NIL_TEXTURE
             @@necklace_slot_14_text.string = ""
             @@necklace_slot_14 = nil
            end
            t = 14 + (@@page.not_nil! * 15) - 15
            if t < @@owned_necklace_array.size
             @@necklace_slot_15_image_sprite.texture = @@owned_necklace_array[t].texture
             @@necklace_slot_15_text.string = @@owned_necklace_array[t].name
             @@necklace_slot_15 = @@owned_necklace_array[t]
            else
             @@necklace_slot_15_image_sprite.texture = NIL_TEXTURE
             @@necklace_slot_15_text.string = ""
             @@necklace_slot_15 = nil
            end
        @@owned_necklace_array.uniq!
       end
       

       def ClothingTabNecklace.draw_clothing_tab(window)
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


        @@necklace_slot_01_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 40 * max_scale)
        @@necklace_slot_01_sprite.scale = SF.vector2(1, 1)
        
        @@necklace_slot_01_image_sprite.position = @@necklace_slot_01_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@necklace_slot_01_image_sprite.scale = SF.vector2(2, 2)
        @@necklace_slot_01_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)

        @@necklace_slot_01_text.position = @@necklace_slot_01_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@necklace_slot_01_text)
        

        @@necklace_slot_02_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 40 * max_scale)
        @@necklace_slot_02_sprite.scale = SF.vector2(1, 1)
        
        @@necklace_slot_02_image_sprite.position = @@necklace_slot_02_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@necklace_slot_02_image_sprite.scale = SF.vector2(2, 2)
        @@necklace_slot_02_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)

        @@necklace_slot_02_text.position = @@necklace_slot_02_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@necklace_slot_02_text)
        

        @@necklace_slot_03_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 40 * max_scale)
        @@necklace_slot_03_sprite.scale = SF.vector2(1, 1)
        
        @@necklace_slot_03_image_sprite.position = @@necklace_slot_03_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@necklace_slot_03_image_sprite.scale = SF.vector2(2, 2)
        @@necklace_slot_03_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)

        @@necklace_slot_03_text.position = @@necklace_slot_03_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@necklace_slot_03_text)
        

        @@necklace_slot_04_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 40 * max_scale)
        @@necklace_slot_04_sprite.scale = SF.vector2(1, 1)

        @@necklace_slot_04_text.position = @@necklace_slot_04_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@necklace_slot_04_text)
        
        @@necklace_slot_04_image_sprite.position = @@necklace_slot_04_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@necklace_slot_04_image_sprite.scale = SF.vector2(2, 2)
        @@necklace_slot_04_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)


        @@necklace_slot_05_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 40 * max_scale)
        @@necklace_slot_05_sprite.scale = SF.vector2(1, 1)

        @@necklace_slot_05_text.position = @@necklace_slot_05_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@necklace_slot_05_text)
        
        @@necklace_slot_05_image_sprite.position = @@necklace_slot_05_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@necklace_slot_05_image_sprite.scale = SF.vector2(2, 2)
        @@necklace_slot_05_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)
        

        @@necklace_slot_06_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 120 * max_scale)
        @@necklace_slot_06_sprite.scale = SF.vector2(1, 1)

        @@necklace_slot_06_text.position = @@necklace_slot_06_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@necklace_slot_06_text)
        
        @@necklace_slot_06_image_sprite.position = @@necklace_slot_06_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@necklace_slot_06_image_sprite.scale = SF.vector2(2, 2)
        @@necklace_slot_06_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)
        

        @@necklace_slot_07_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 120 * max_scale)
        @@necklace_slot_07_sprite.scale = SF.vector2(1, 1)
        
        @@necklace_slot_07_text.position = @@necklace_slot_07_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@necklace_slot_07_text)
        
        @@necklace_slot_07_image_sprite.position = @@necklace_slot_07_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@necklace_slot_07_image_sprite.scale = SF.vector2(2, 2)
        @@necklace_slot_07_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)
        

        @@necklace_slot_08_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 120 * max_scale)
        @@necklace_slot_08_sprite.scale = SF.vector2(1, 1)
                
        @@necklace_slot_08_text.position = @@necklace_slot_08_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@necklace_slot_08_text)
        
        @@necklace_slot_08_image_sprite.position = @@necklace_slot_08_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@necklace_slot_08_image_sprite.scale = SF.vector2(2, 2)
        @@necklace_slot_08_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)
        

        @@necklace_slot_09_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 120 * max_scale)
        @@necklace_slot_09_sprite.scale = SF.vector2(1, 1)
                
        @@necklace_slot_09_text.position = @@necklace_slot_09_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@necklace_slot_09_text)
        
        @@necklace_slot_09_image_sprite.position = @@necklace_slot_09_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@necklace_slot_09_image_sprite.scale = SF.vector2(2, 2)
        @@necklace_slot_09_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)
        

        @@necklace_slot_10_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 120 * max_scale)
        @@necklace_slot_10_sprite.scale = SF.vector2(1, 1)
                        
        @@necklace_slot_10_text.position = @@necklace_slot_10_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@necklace_slot_10_text)
        
        @@necklace_slot_10_image_sprite.position = @@necklace_slot_10_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@necklace_slot_10_image_sprite.scale = SF.vector2(2, 2)
        @@necklace_slot_10_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)
        

        @@necklace_slot_11_sprite.position = INVENTORY_BOX.position + SF.vector2(10 * max_scale, 200 * max_scale)
        @@necklace_slot_11_sprite.scale = SF.vector2(1, 1)
                        
        @@necklace_slot_11_text.position = @@necklace_slot_11_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@necklace_slot_11_text)
        
        @@necklace_slot_11_image_sprite.position = @@necklace_slot_11_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@necklace_slot_11_image_sprite.scale = SF.vector2(2, 2)
        @@necklace_slot_11_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)
        

        @@necklace_slot_12_sprite.position = INVENTORY_BOX.position + SF.vector2(90 * max_scale, 200 * max_scale)
        @@necklace_slot_12_sprite.scale = SF.vector2(1, 1)
                        
        @@necklace_slot_12_text.position = @@necklace_slot_12_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@necklace_slot_12_text)
        
        @@necklace_slot_12_image_sprite.position = @@necklace_slot_12_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@necklace_slot_12_image_sprite.scale = SF.vector2(2, 2)
        @@necklace_slot_12_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)
        

        @@necklace_slot_13_sprite.position = INVENTORY_BOX.position + SF.vector2(170 * max_scale, 200 * max_scale)
        @@necklace_slot_13_sprite.scale = SF.vector2(1, 1)
        
        @@necklace_slot_13_text.position = @@necklace_slot_13_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@necklace_slot_13_text)
        
        @@necklace_slot_13_image_sprite.position = @@necklace_slot_13_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@necklace_slot_13_image_sprite.scale = SF.vector2(2, 2)
        @@necklace_slot_13_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)
        

        @@necklace_slot_14_sprite.position = INVENTORY_BOX.position + SF.vector2(250 * max_scale, 200 * max_scale)
        @@necklace_slot_14_sprite.scale = SF.vector2(1, 1)
                        
        @@necklace_slot_14_text.position = @@necklace_slot_14_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@necklace_slot_14_text)
        
        @@necklace_slot_14_image_sprite.position = @@necklace_slot_14_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@necklace_slot_14_image_sprite.scale = SF.vector2(2, 2)
        @@necklace_slot_14_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)
        

        @@necklace_slot_15_sprite.position = INVENTORY_BOX.position + SF.vector2(330 * max_scale, 200 * max_scale)
        @@necklace_slot_15_sprite.scale = SF.vector2(1, 1)
                        
        @@necklace_slot_15_text.position = @@necklace_slot_15_sprite.position + SF.vector2(25 * max_scale, 55 * max_scale)
        Utility::StringUtilities.center_text(@@necklace_slot_15_text)
        
        @@necklace_slot_15_image_sprite.position = @@necklace_slot_15_sprite.position - SF.vector2(40 * max_scale, 25 * max_scale)
        @@necklace_slot_15_image_sprite.scale = SF.vector2(2, 2)
        @@necklace_slot_15_image_sprite.texture_rect = SF.int_rect(288, 638, 96, 100)


        window.draw(@@necklace_slot_01_sprite)
        window.draw(@@necklace_slot_01_image_sprite)
        window.draw(@@necklace_slot_01_text)

        window.draw(@@necklace_slot_02_sprite)
        window.draw(@@necklace_slot_02_image_sprite)
        window.draw(@@necklace_slot_02_text)

        window.draw(@@necklace_slot_03_sprite)
        window.draw(@@necklace_slot_03_image_sprite)
        window.draw(@@necklace_slot_03_text)
        
        window.draw(@@necklace_slot_04_sprite)
        window.draw(@@necklace_slot_04_image_sprite)
        window.draw(@@necklace_slot_04_text)

        window.draw(@@necklace_slot_05_sprite)
        window.draw(@@necklace_slot_05_image_sprite)
        window.draw(@@necklace_slot_05_text)

        window.draw(@@necklace_slot_06_sprite)
        window.draw(@@necklace_slot_06_image_sprite)
        window.draw(@@necklace_slot_06_text)

        window.draw(@@necklace_slot_07_sprite)
        window.draw(@@necklace_slot_07_image_sprite)
        window.draw(@@necklace_slot_07_text)

        window.draw(@@necklace_slot_08_sprite)
        window.draw(@@necklace_slot_08_image_sprite)
        window.draw(@@necklace_slot_08_text)

        window.draw(@@necklace_slot_09_sprite)
        window.draw(@@necklace_slot_09_image_sprite)
        window.draw(@@necklace_slot_09_text)

        window.draw(@@necklace_slot_10_sprite)
        window.draw(@@necklace_slot_10_image_sprite)
        window.draw(@@necklace_slot_10_text)

        window.draw(@@necklace_slot_11_sprite)
        window.draw(@@necklace_slot_11_image_sprite)
        window.draw(@@necklace_slot_11_text)

        window.draw(@@necklace_slot_12_sprite)
        window.draw(@@necklace_slot_12_image_sprite)
        window.draw(@@necklace_slot_12_text)

        window.draw(@@necklace_slot_13_sprite)
        window.draw(@@necklace_slot_13_image_sprite)
        window.draw(@@necklace_slot_13_text)

        window.draw(@@necklace_slot_14_sprite)
        window.draw(@@necklace_slot_14_image_sprite)
        window.draw(@@necklace_slot_14_text)

        window.draw(@@necklace_slot_15_sprite)
        window.draw(@@necklace_slot_15_image_sprite)
        window.draw(@@necklace_slot_15_text)

        if SF::Mouse.button_pressed?(SF::Mouse::Left)
            ClothingTabNecklace.clothes_mouse_handling(window)
        end
       end

       def ClothingTabNecklace.clothes_mouse_handling(window)
        mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window))
        mouse_x = mouse_position.x
        mouse_y = mouse_position.y
        
    
        current_size = window.size
        original_width = 800 
        original_height = 600 

        scale_x = (current_size.x.to_f / original_width)
        scale_y = current_size.y.to_f / original_height
        

        #------------------------------------objects-------------------------------------------------

            slot_01_x = @@necklace_slot_01_sprite.position.x
            slot_01_y = @@necklace_slot_01_sprite.position.y
            slot_01_width = @@necklace_slot_01_sprite.size.x
            slot_01_height = @@necklace_slot_01_sprite.size.y

            slot_02_x = @@necklace_slot_02_sprite.position.x
            slot_02_y = @@necklace_slot_02_sprite.position.y
            slot_02_width = @@necklace_slot_02_sprite.size.x
            slot_02_height = @@necklace_slot_02_sprite.size.y

            slot_03_x = @@necklace_slot_03_sprite.position.x
            slot_03_y = @@necklace_slot_03_sprite.position.y
            slot_03_width = @@necklace_slot_03_sprite.size.x
            slot_03_height = @@necklace_slot_03_sprite.size.y

            slot_04_x = @@necklace_slot_04_sprite.position.x
            slot_04_y = @@necklace_slot_04_sprite.position.y
            slot_04_width = @@necklace_slot_04_sprite.size.x
            slot_04_height = @@necklace_slot_04_sprite.size.y

            slot_05_x = @@necklace_slot_05_sprite.position.x
            slot_05_y = @@necklace_slot_05_sprite.position.y
            slot_05_width = @@necklace_slot_05_sprite.size.x
            slot_05_height = @@necklace_slot_05_sprite.size.y

            slot_06_x = @@necklace_slot_06_sprite.position.x
            slot_06_y = @@necklace_slot_06_sprite.position.y
            slot_06_width = @@necklace_slot_06_sprite.size.x
            slot_06_height = @@necklace_slot_06_sprite.size.y

            slot_07_x = @@necklace_slot_07_sprite.position.x
            slot_07_y = @@necklace_slot_07_sprite.position.y
            slot_07_width = @@necklace_slot_07_sprite.size.x
            slot_07_height = @@necklace_slot_07_sprite.size.y

            slot_08_x = @@necklace_slot_08_sprite.position.x
            slot_08_y = @@necklace_slot_08_sprite.position.y
            slot_08_width = @@necklace_slot_08_sprite.size.x
            slot_08_height = @@necklace_slot_08_sprite.size.y

            slot_09_x = @@necklace_slot_09_sprite.position.x
            slot_09_y = @@necklace_slot_09_sprite.position.y
            slot_09_width = @@necklace_slot_09_sprite.size.x
            slot_09_height = @@necklace_slot_09_sprite.size.y

            slot_10_x = @@necklace_slot_10_sprite.position.x
            slot_10_y = @@necklace_slot_10_sprite.position.y
            slot_10_width = @@necklace_slot_10_sprite.size.x
            slot_10_height = @@necklace_slot_10_sprite.size.y

            slot_11_x = @@necklace_slot_11_sprite.position.x
            slot_11_y = @@necklace_slot_11_sprite.position.y
            slot_11_width = @@necklace_slot_11_sprite.size.x
            slot_11_height = @@necklace_slot_11_sprite.size.y

            slot_12_x = @@necklace_slot_12_sprite.position.x
            slot_12_y = @@necklace_slot_12_sprite.position.y
            slot_12_width = @@necklace_slot_12_sprite.size.x
            slot_12_height = @@necklace_slot_12_sprite.size.y

            slot_13_x = @@necklace_slot_13_sprite.position.x
            slot_13_y = @@necklace_slot_13_sprite.position.y
            slot_13_width = @@necklace_slot_13_sprite.size.x
            slot_13_height = @@necklace_slot_13_sprite.size.y

            slot_14_x = @@necklace_slot_14_sprite.position.x
            slot_14_y = @@necklace_slot_14_sprite.position.y
            slot_14_width = @@necklace_slot_14_sprite.size.x
            slot_14_height = @@necklace_slot_14_sprite.size.y

            slot_15_x = @@necklace_slot_15_sprite.position.x
            slot_15_y = @@necklace_slot_15_sprite.position.y
            slot_15_width = @@necklace_slot_15_sprite.size.x
            slot_15_height = @@necklace_slot_15_sprite.size.y
        #---------------------------------------------------------------------------------------------
        if @@page == nil
            @@page = 1
        end
        if (mouse_x >= slot_01_x && mouse_x <= slot_01_x + slot_01_width) &&
           (mouse_y >= slot_01_y && mouse_y <= slot_01_y + slot_01_height)
            if @@necklace_slot_01 != nil   
                t = 0 + (@@page.not_nil! * 15) - 15
                
                @@owned_necklace_array[t] = (Clothing::Necklace.get_necklace(Player::Appearance.get_clothing("necklace").not_nil!).not_nil!)
                Player::Appearance.change_necklace(@@necklace_slot_01.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabNecklace.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_02_x && mouse_x <= slot_02_x + slot_02_width) &&
           (mouse_y >= slot_02_y && mouse_y <= slot_02_y + slot_02_height)
           
            if @@necklace_slot_02 != nil
                t = 1 + (@@page.not_nil! * 15) - 15
                
                @@owned_necklace_array[t] = (Clothing::Necklace.get_necklace(Player::Appearance.get_clothing("necklace").not_nil!).not_nil!)
                Player::Appearance.change_necklace(@@necklace_slot_02.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabNecklace.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_03_x && mouse_x <= slot_03_x + slot_03_width) &&
           (mouse_y >= slot_03_y && mouse_y <= slot_03_y + slot_03_height)
           
            if @@necklace_slot_03 != nil
                t = 2 + (@@page.not_nil! * 15) - 15
                
                @@owned_necklace_array[t] = (Clothing::Necklace.get_necklace(Player::Appearance.get_clothing("necklace").not_nil!).not_nil!)
                Player::Appearance.change_necklace(@@necklace_slot_03.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabNecklace.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_04_x && mouse_x <= slot_04_x + slot_04_width) &&
           (mouse_y >= slot_04_y && mouse_y <= slot_04_y + slot_04_height)
           
            if @@necklace_slot_04 != nil
                t = 3 + (@@page.not_nil! * 15) - 15
                
                @@owned_necklace_array[t] = (Clothing::Necklace.get_necklace(Player::Appearance.get_clothing("necklace").not_nil!).not_nil!)
                Player::Appearance.change_necklace(@@necklace_slot_04.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabNecklace.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_05_x && mouse_x <= slot_05_x + slot_05_width) &&
           (mouse_y >= slot_05_y && mouse_y <= slot_05_y + slot_05_height)
           
            if @@necklace_slot_05 != nil
                t = 4 + (@@page.not_nil! * 15) - 15
                
                @@owned_necklace_array[t] = (Clothing::Necklace.get_necklace(Player::Appearance.get_clothing("necklace").not_nil!).not_nil!)
                Player::Appearance.change_necklace(@@necklace_slot_05.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabNecklace.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_06_x && mouse_x <= slot_06_x + slot_06_width) &&
           (mouse_y >= slot_06_y && mouse_y <= slot_06_y + slot_06_height)
           
            if @@necklace_slot_06 != nil
                t = 5 + (@@page.not_nil! * 15) - 15
                
                @@owned_necklace_array[t] = (Clothing::Necklace.get_necklace(Player::Appearance.get_clothing("necklace").not_nil!).not_nil!)
                Player::Appearance.change_necklace(@@necklace_slot_06.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabNecklace.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_07_x && mouse_x <= slot_07_x + slot_07_width) &&
           (mouse_y >= slot_07_y && mouse_y <= slot_07_y + slot_07_height)
           
            if @@necklace_slot_07 != nil
                t = 6 + (@@page.not_nil! * 15) - 15
                
                @@owned_necklace_array[t] = (Clothing::Necklace.get_necklace(Player::Appearance.get_clothing("necklace").not_nil!).not_nil!)
                Player::Appearance.change_necklace(@@necklace_slot_07.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabNecklace.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_08_x && mouse_x <= slot_08_x + slot_08_width) &&
           (mouse_y >= slot_08_y && mouse_y <= slot_08_y + slot_08_height)
           
            if @@necklace_slot_08 != nil
                t = 7 + (@@page.not_nil! * 15) - 15
                
                @@owned_necklace_array[t] = (Clothing::Necklace.get_necklace(Player::Appearance.get_clothing("necklace").not_nil!).not_nil!)
                Player::Appearance.change_necklace(@@necklace_slot_08.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabNecklace.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_09_x && mouse_x <= slot_09_x + slot_09_width) &&
           (mouse_y >= slot_09_y && mouse_y <= slot_09_y + slot_09_height)
           
            if @@necklace_slot_09 != nil
                t = 8 + (@@page.not_nil! * 15) - 15
                
                @@owned_necklace_array[t] = (Clothing::Necklace.get_necklace(Player::Appearance.get_clothing("necklace").not_nil!).not_nil!)
                Player::Appearance.change_necklace(@@necklace_slot_09.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabNecklace.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_10_x && mouse_x <= slot_10_x + slot_10_width) &&
           (mouse_y >= slot_10_y && mouse_y <= slot_10_y + slot_10_height)
           
            if @@necklace_slot_10 != nil
                t = 9 + (@@page.not_nil! * 15) - 15
                
                @@owned_necklace_array[t] = (Clothing::Necklace.get_necklace(Player::Appearance.get_clothing("necklace").not_nil!).not_nil!)
                Player::Appearance.change_necklace(@@necklace_slot_10.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabNecklace.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_11_x && mouse_x <= slot_11_x + slot_11_width) &&
           (mouse_y >= slot_11_y && mouse_y <= slot_11_y + slot_11_height)
           
            if @@necklace_slot_11 != nil
                t = 10 + (@@page.not_nil! * 15) - 15
                
                @@owned_necklace_array[t] = (Clothing::Necklace.get_necklace(Player::Appearance.get_clothing("necklace").not_nil!).not_nil!)
                Player::Appearance.change_necklace(@@necklace_slot_11.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabNecklace.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_12_x && mouse_x <= slot_12_x + slot_12_width) &&
           (mouse_y >= slot_12_y && mouse_y <= slot_12_y + slot_12_height)
           
            if @@necklace_slot_12 != nil
                t = 11 + (@@page.not_nil! * 15) - 15
                
                @@owned_necklace_array[t] = (Clothing::Necklace.get_necklace(Player::Appearance.get_clothing("necklace").not_nil!).not_nil!)
                Player::Appearance.change_necklace(@@necklace_slot_12.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabNecklace.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_13_x && mouse_x <= slot_13_x + slot_13_width) &&
           (mouse_y >= slot_13_y && mouse_y <= slot_13_y + slot_13_height)
           
            if @@necklace_slot_13 != nil
                t = 12 + (@@page.not_nil! * 15) - 15
                
                @@owned_necklace_array[t] = (Clothing::Necklace.get_necklace(Player::Appearance.get_clothing("necklace").not_nil!).not_nil!)
                Player::Appearance.change_necklace(@@necklace_slot_13.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabNecklace.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_14_x && mouse_x <= slot_14_x + slot_14_width) &&
           (mouse_y >= slot_14_y && mouse_y <= slot_14_y + slot_14_height)
           
            if @@necklace_slot_14 != nil
                t = 13 + (@@page.not_nil! * 15) - 15
                
                @@owned_necklace_array[t] = (Clothing::Necklace.get_necklace(Player::Appearance.get_clothing("necklace").not_nil!).not_nil!)
                Player::Appearance.change_necklace(@@necklace_slot_14.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabNecklace.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_15_x && mouse_x <= slot_15_x + slot_15_width) &&
           (mouse_y >= slot_15_y && mouse_y <= slot_15_y + slot_15_height)
           
            if @@necklace_slot_15 != nil
                t = 14 + (@@page.not_nil! * 15) - 15
                
                @@owned_necklace_array[t] = (Clothing::Necklace.get_necklace(Player::Appearance.get_clothing("necklace").not_nil!).not_nil!)
                Player::Appearance.change_necklace(@@necklace_slot_15.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTabNecklace.assign_slot_textures(window)
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
            #Note: Duplicates fuck this shit up. Under NO circumstances should duplicates be allowed
            @@owned_weapon_array.push(Equipment::Weapon.get_weapon("No Weapon").not_nil!)
            @@owned_weapon_array.push(Equipment::Weapon.get_weapon("Stick").not_nil!)
            @@owned_weapon_array.push(Equipment::Weapon.get_weapon("Wood Sword").not_nil!)
            @@owned_weapon_array.push(Equipment::Weapon.get_weapon("Kitchen Knife").not_nil!)
            @@owned_weapon_array.push(Equipment::Weapon.get_weapon("Broken Bottle").not_nil!)
            @@owned_weapon_array.push(Equipment::Weapon.get_weapon("BB Gun").not_nil!)
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


            #   @@weapon_info_box = SF::RectangleShape.new(SF.vector2(200, 200))
            #   @@weapon_info_box.fill_color = SF.color(200, 212, 219)
            #   @@weapon_info_box.outline_thickness = 10
            #   @@weapon_info_box.outline_color = SF.color(151, 179, 194)

            #   @@weapon_info_box_name_text = SF::Text.new
            #   @@weapon_info_box_name_text.font = QUICKSAND
            #   @@weapon_info_box_name_text.character_size = 14
            #   @@weapon_info_box_name_text.color = SF::Color::Blue

            #   @@weapon_info_box_attack_type_text = SF::Text.new
            #   @@weapon_info_box_attack_type_text.font = QUICKSAND
            #   @@weapon_info_box_attack_type_text.character_size = 14
            #   @@weapon_info_box_attack_type_text.color = SF::Color::Blue

            #   @@weapon_info_box_attack_strength_text = SF::Text.new
            #   @@weapon_info_box_attack_strength_text.font = QUICKSAND
            #   @@weapon_info_box_attack_strength_text.character_size = 14
            #   @@weapon_info_box_attack_strength_text.color = SF::Color::Blue

            #   @@weapon_info_box_minimum_strength_text = SF::Text.new
            #   @@weapon_info_box_minimum_strength_text.font = QUICKSAND
            #   @@weapon_info_box_minimum_strength_text.character_size = 14
            #   @@weapon_info_box_minimum_strength_text.color = SF::Color::Blue

            #   @@weapon_info_box_minimum_dexterity_text = SF::Text.new
            #   @@weapon_info_box_minimum_dexterity_text.font = QUICKSAND
            #   @@weapon_info_box_minimum_dexterity_text.character_size = 14
            #   @@weapon_info_box_minimum_dexterity_text.color = SF::Color::Blue

            #   @@weapon_info_box_minimum_intelligence_text = SF::Text.new
            #   @@weapon_info_box_minimum_intelligence_text.font = QUICKSAND
            #   @@weapon_info_box_minimum_intelligence_text.character_size = 14
            #   @@weapon_info_box_minimum_intelligence_text.color = SF::Color::Blue

            #   @@weapon_info_box_minimum_luck_text = SF::Text.new
            #   @@weapon_info_box_minimum_luck_text.font = QUICKSAND
            #   @@weapon_info_box_minimum_luck_text.character_size = 14
            #   @@weapon_info_box_minimum_luck_text.color = SF::Color::Blue

            #   @@weapon_info_box_minimum_status_effects_text = SF::Text.new
            #   @@weapon_info_box_minimum_status_effects_text.font = QUICKSAND
            #   @@weapon_info_box_minimum_status_effects_text.character_size = 14
            #   @@weapon_info_box_minimum_status_effects_text.color = SF::Color::Blue
      

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