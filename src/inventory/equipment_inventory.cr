require "crsfml"
require "crsfml/audio"
require "../../src/textures.cr"
require "../../src/utility.cr"
require "../../src/inventory/clothing/clothing.cr"
require "../../src/window/inventory_window.cr"
require "../inventory/inventory.cr"
require "../../src/inventory/equipment/equipment.cr"
require "../../src/inventory/equipment/weapon/weapon.cr"
require "../../src/inventory/equipment/weapon/blunt_weapon.cr"
require "../../src/inventory/equipment/soul_orb/soul_jewel.cr"
require "../../src/inventory/equipment/soul_orb/soul_orb.cr"

module EquipmentInventory
    class EquipmentInventoryManager
        class_property current_tab : String = "weapon"
    end
    class EquipmentInventoryElements
        EQUIPMENT_BOX_ARRAY = [] of Ui_Elements::Ui_BoxBase
        EQUIPMENT_TEXT_ARRAY = [] of Ui_Elements::Ui_TextBase

        WEAPON_TAB_BOX = Ui_Elements::Ui_BoxBase.new("Weapons", "EquBox01", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1001, 800, 100, 34)), 100.0, 34.0, 3)
        EQUIPMENT_BOX_ARRAY << WEAPON_TAB_BOX

        WEAPON_TAB_TEXT = Ui_Elements::Ui_TextBase.new("Weapons", "EquText01", SF::Text.new(WEAPON_TAB_BOX.name, QUICKSAND, 18))
        EQUIPMENT_TEXT_ARRAY << WEAPON_TAB_TEXT

        SOUL_ORB_TAB_BOX = Ui_Elements::Ui_BoxBase.new("Soul Orbs", "EquBox02", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1001, 800, 100, 34)), 100.0, 34.0, 3)
        EQUIPMENT_BOX_ARRAY << SOUL_ORB_TAB_BOX

        SOUL_ORB_TAB_TEXT = Ui_Elements::Ui_TextBase.new("Soul Orbs", "EquText02", SF::Text.new(SOUL_ORB_TAB_BOX.name, QUICKSAND, 18))
        EQUIPMENT_TEXT_ARRAY << SOUL_ORB_TAB_TEXT

        SOUL_JEWEL_TAB_BOX = Ui_Elements::Ui_BoxBase.new("Soul Jewels", "EquBox03", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(1001, 800, 100, 34)), 100.0, 34.0, 3)
        EQUIPMENT_BOX_ARRAY << SOUL_JEWEL_TAB_BOX

        SOUL_JEWEL_TAB_TEXT = Ui_Elements::Ui_TextBase.new("Soul Jewels", "EquText03", SF::Text.new(SOUL_JEWEL_TAB_BOX.name, QUICKSAND, 16))
        EQUIPMENT_TEXT_ARRAY << SOUL_JEWEL_TAB_TEXT

        def self.position_equipment_category_elements(window)
            current_size = window.size
            original_width = 800 
            original_height = 600
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
    
            scale_ratio = [scale_x, scale_y].min
            max_scale = 1.5
            clamped_scale = [scale_ratio, max_scale].min

            window.view = window.default_view

         WEAPON_TAB_BOX.sprite.position = InventoryWindow::InventoryWindowElements::INVENTORY_BOX.sprite.position - SF.vector2(65 * max_scale, -8 * max_scale)
         WEAPON_TAB_TEXT.text.position = WEAPON_TAB_BOX.sprite.position + SF.vector2(8 * max_scale, 4 * max_scale)

         SOUL_ORB_TAB_BOX.sprite.position = WEAPON_TAB_BOX.sprite.position + SF.vector2(0, 26 * max_scale)
         SOUL_ORB_TAB_TEXT.text.position = SOUL_ORB_TAB_BOX.sprite.position + SF.vector2(6 * max_scale, 4 * max_scale)

         SOUL_JEWEL_TAB_BOX.sprite.position = SOUL_ORB_TAB_BOX.sprite.position + SF.vector2(0, 26 * max_scale)
         SOUL_JEWEL_TAB_TEXT.text.position = SOUL_JEWEL_TAB_BOX.sprite.position + SF.vector2(3 * max_scale, 4 * max_scale)
        end

        def self.draw_equipment_tabs(window)
            EquipmentInventoryElements.position_equipment_category_elements(window)
            EQUIPMENT_BOX_ARRAY.each{ |box| window.draw(box.sprite) }
            EQUIPMENT_TEXT_ARRAY.each{ |text| window.draw(text.text) }

            EquipmentInventoryBase.draw_equipment_items(window, EquipmentInventoryManager.current_tab)

            if SF::Mouse.button_pressed?(SF::Mouse::Left)
                self.equipment_elements_mouse_handling(window)
            end
        end

        def self.equipment_elements_mouse_handling(window)
            if MouseHandling::ClickHandling.was_button_clicked?(WEAPON_TAB_BOX.sprite, window)
                EquipmentInventoryManager.current_tab = "weapon"
            elsif MouseHandling::ClickHandling.was_button_clicked?(SOUL_ORB_TAB_BOX.sprite, window)
                EquipmentInventoryManager.current_tab = "soul_orb"
            elsif MouseHandling::ClickHandling.was_button_clicked?(SOUL_JEWEL_TAB_BOX.sprite, window)
                EquipmentInventoryManager.current_tab = "soul_jewel"
            end
        end
    end
    class EquipmentInventoryBase < Inventory::InventoryBase
        EQUIPMENT_INVENTORY_ARRAY = [] of EquipmentInventoryBase
        def initialize(name : String, id : String, max_page_count : Int32, page : Int32, tab : String, sort_type : String, array : Array(Equipment::EquipmentBase))
            super(name, id, max_page_count, page, tab, sort_type)
            @max_page_count = ((array.size / 15) + (array.size % 15 == 0 ? 0 : 1)).to_i
            @array = array
            EQUIPMENT_INVENTORY_ARRAY << self
        end

        property name : String
        property id : String
        property max_page_count : Int32
        property page : Int32
        property tab : String
        property sort_type : String
        property array : Array(Equipment::EquipmentBase)

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
        
            # If the start_index exceeds the array size, kick that shit out
            return if start_index >= self.array.size
        
            items_per_row = 5
            spacing_x = 13 * max_scale
            spacing_y = 17 * max_scale
        
            base_position = InventoryWindow::InventoryWindowElements::INVENTORY_SLOT_01.sprite.as(SF::Sprite).position + SF.vector2(spacing_x, spacing_y)
        
            current_pos = SF.vector2(base_position.x, base_position.y)
            self.array.each{ |item| item.sprite.as(SF::Sprite).position = SF.vector2(-1000, -1000)}
            self.array[start_index..end_index].each_with_index do |item, index|

            item.sprite.as(SF::Sprite).position = current_pos

            if EquipmentInventoryManager.current_tab == "weapon"
                item.sprite.as(SF::Sprite).texture_rect = SF::Rect.new(300, 690, 70, 50)
            end
            if EquipmentInventoryManager.current_tab == "soul_orb"
                item.sprite.as(SF::Sprite).position = current_pos - SF.vector2(10, 15)
            end
            if EquipmentInventoryManager.current_tab == "soul_jewel"
                item.sprite.as(SF::Sprite).scale = SF.vector2(2.0, 2.0)
                item.sprite.as(SF::Sprite).position = current_pos - SF.vector2(10, 15)
            end

            window.draw(item.sprite.as(SF::Sprite))
        
                # Next column
                current_pos.x += spacing_x * 5.85
        
                # Next Row
                if (index + 1) % items_per_row == 0
                    current_pos.x = base_position.x
                    current_pos.y += spacing_y * 4.5
                end
            end
            if SF::Mouse.button_pressed?(SF::Mouse::Left)
                self.mouse_handling(window)
            end
        end

        def mouse_handling(window)
            self.array.each do |item|
                if MouseHandling::ClickHandling.was_button_clicked?(item.sprite.as(SF::Sprite), window)
                    if item.is_a?(Weapon::WeaponBase)
                    Weapon::WeaponBase.swap_weapon(item.as(Weapon::WeaponBase))
                    Weapon::WeaponBase::OWNED_WEAPON_ARRAY.reject! item
                    end
                    if item.is_a?(SoulOrb::SoulOrbBase)
                        SoulOrb::SoulOrbBase.swap_soul_orb(item.as(SoulOrb::SoulOrbBase))
                        SoulOrb::SoulOrbBase::OWNED_SOUL_ORB_ARRAY.reject! item
                    end
                    Sprites::Player.refresh_player_sprite(window)
                    break
                end
            end
            if MouseHandling::ClickHandling.was_button_clicked?(InventoryWindow::InventoryWindowElements::LEFT_ARROW.sprite, window)
                self.page = (self.page - 1) < 0 ? 0 : self.page - 1
            elsif MouseHandling::ClickHandling.was_button_clicked?(InventoryWindow::InventoryWindowElements::RIGHT_ARROW.sprite, window)
                self.page = (self.page + 1) >= self.max_page_count ? self.max_page_count - 1 : self.page + 1
            end
        end

        def self.draw_equipment_items(window, tab)
            case tab
            when "weapon"
                @@weapon_inventory.draw(window)
            when "soul_orb"
                @@soul_orb_inventory.draw(window)
            when "soul_jewel"
                @@soul_jewel_inventory.draw(window)
            end
        end

        def self.return_current_page
            case EquipmentInventoryManager.current_tab
            when "weapon"
                return @@weapon_inventory.page
            when "soul_orb"
                return @@soul_orb_inventory.page
            when "soul_jewel"
                return @@soul_jewel_inventory.page
            else
                return 0
            end
        end
        def self.return_max_page_count
            case EquipmentInventoryManager.current_tab
            when "weapon"
                return @@weapon_inventory.max_page_count
            when "soul_orb"
                return @@soul_orb_inventory.max_page_count
            when "soul_jewel"
                return @@soul_jewel_inventory.max_page_count
            else
                return 0
            end
        end

        @@weapon_inventory = EquipmentInventoryBase.new("Weapon Inventory", "weapon_inventory", 1, 0, "weapon", "default", Weapon::WeaponBase::OWNED_WEAPON_ARRAY)  

        @@soul_jewel_inventory = EquipmentInventoryBase.new("Soul Jewel Inventory", "soul_jewel_inventory", 1, 0, "soul_jewel", "default", SoulJewel::SoulJewelBase::OWNED_SOUL_JEWEL_ARRAY)

        @@soul_orb_inventory = EquipmentInventoryBase.new("Soul Orb Inventory", "soul_orb_inventory", 1, 0, "soul_orb", "default", SoulOrb::SoulOrbBase::OWNED_SOUL_ORB_ARRAY)
    end

    
end