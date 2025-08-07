require "crsfml"
require "crsfml/audio"
require "../../src/textures.cr"
require "../../src/utility.cr"
require "../../src/inventory/clothing/clothing.cr"
require "../../src/window/inventory_window.cr"
require "../inventory/inventory.cr"
require "../../src/equipment.cr"

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
        end

        def self.draw_equipment_tabs(window)
            EquipmentInventoryElements.position_equipment_category_elements(window)
            EQUIPMENT_BOX_ARRAY.each{ |box| window.draw(box.sprite) }
            EQUIPMENT_TEXT_ARRAY.each{ |text| window.draw(text.text) }
        end
    end
    class EquipmentInventoryBase < Inventory::InventoryBase
        EQUIPMENT_INVENTORY_ARRAY = [] of EquipmentInventoryBase
        def initialize(name : String, id : String, max_page_count : Int32, page : Int32, tab : String, sort_type : String, array : Array(Equipment::Weapon))
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
        property array : Array(Equipment::Weapon)

        #TODO: complete these when possible
        def draw(window)
        end

        def self.return_current_page
            return 1
        end
        def self.return_max_page_count
            return 1
        end
    end
end