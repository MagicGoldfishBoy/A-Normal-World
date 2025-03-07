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

        @@clothing_slot_01 : Clothing::Shirt? = nil
        @@clothing_slot_02 : Clothing::Shirt? = nil
        @@clothing_slot_03 : Clothing::Shirt? = nil
        @@clothing_slot_04 : Clothing::Shirt? = nil
        @@clothing_slot_05 : Clothing::Shirt? = nil
        @@clothing_slot_06 : Clothing::Shirt? = nil
        @@clothing_slot_07 : Clothing::Shirt? = nil
        @@clothing_slot_08 : Clothing::Shirt? = nil
        @@clothing_slot_09 : Clothing::Shirt? = nil
        @@clothing_slot_10 : Clothing::Shirt? = nil
        @@clothing_slot_11 : Clothing::Shirt? = nil
        @@clothing_slot_12 : Clothing::Shirt? = nil
        @@clothing_slot_13 : Clothing::Shirt? = nil
        @@clothing_slot_14 : Clothing::Shirt? = nil
        @@clothing_slot_15 : Clothing::Shirt? = nil

        @@owned_clothing_array.push(Clothing::Shirt.get_shirt("White Tank Top").not_nil!)
        @@owned_clothing_array.push(Clothing::Shirt.get_shirt("Black Tank Top").not_nil!)
        @@owned_clothing_array.push(Clothing::Shirt.get_shirt("Red Tank Top").not_nil!)
        @@owned_clothing_array.push(Clothing::Shirt.get_shirt("Orange Tank Top").not_nil!)
        @@owned_clothing_array.push(Clothing::Shirt.get_shirt("Yellow Tank Top").not_nil!)
        @@owned_clothing_array.push(Clothing::Shirt.get_shirt("Green Tank Top").not_nil!)
        @@owned_clothing_array.push(Clothing::Shirt.get_shirt("Blue Tank Top").not_nil!)
        @@owned_clothing_array.push(Clothing::Shirt.get_shirt("Purple Tank Top").not_nil!)
        @@owned_clothing_array.push(Clothing::Shirt.get_shirt("Pink Tank Top").not_nil!)

        @@owned_clothing_array.push(Clothing::Shirt.get_shirt("White_T-Shirt").not_nil!)
        @@owned_clothing_array.push(Clothing::Shirt.get_shirt("Black_T-Shirt").not_nil!)
        @@owned_clothing_array.push(Clothing::Shirt.get_shirt("Red_T-Shirt").not_nil!)
        @@owned_clothing_array.push(Clothing::Shirt.get_shirt("Orange_T-Shirt").not_nil!)
        @@owned_clothing_array.push(Clothing::Shirt.get_shirt("Yellow_T-Shirt").not_nil!)
        @@owned_clothing_array.push(Clothing::Shirt.get_shirt("Green_T-Shirt").not_nil!)
        @@owned_clothing_array.push(Clothing::Shirt.get_shirt("Blue_T-Shirt").not_nil!)
        @@owned_clothing_array.push(Clothing::Shirt.get_shirt("Purple T-Shirt").not_nil!)
        @@owned_clothing_array.push(Clothing::Shirt.get_shirt("Pink T-Shirt").not_nil!)

        @@owned_clothing_array.push(Clothing::Shirt.get_shirt("White Tube-Top").not_nil!)
        @@owned_clothing_array.push(Clothing::Shirt.get_shirt("Black Tube-Top").not_nil!)
        @@owned_clothing_array.push(Clothing::Shirt.get_shirt("Red Tube-Top").not_nil!)
        @@owned_clothing_array.push(Clothing::Shirt.get_shirt("Orange Tube-Top").not_nil!)
        @@owned_clothing_array.push(Clothing::Shirt.get_shirt("Yellow Tube-Top").not_nil!)
        @@owned_clothing_array.push(Clothing::Shirt.get_shirt("Green Tube-Top").not_nil!)
        @@owned_clothing_array.push(Clothing::Shirt.get_shirt("Blue Tube-Top").not_nil!)
        @@owned_clothing_array.push(Clothing::Shirt.get_shirt("Purple Tube-Top").not_nil!)
        @@owned_clothing_array.push(Clothing::Shirt.get_shirt("Pink Tube-Top").not_nil!)
        
        @@clothing_box_sprite = SF::RectangleShape.new(SF.vector2(610, 420))
        @@clothing_box_sprite.fill_color = SF.color( 137, 170, 208 )

        
        @@clothing_left_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_left_arrow_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_right_arrow_sprite = SF::RectangleShape.new(SF.vector2(50, 25))
        @@clothing_right_arrow_sprite.fill_color = SF.color(161, 183, 208)


        @@clothing_slot_01_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@clothing_slot_01_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_slot_01_text = SF::Text.new
        @@clothing_slot_01_text.font = QUICKSAND
        @@clothing_slot_01_text.character_size = 12
        @@clothing_slot_01_text.color = SF::Color::Blue

        @@clothing_slot_01_image_sprite = SF::Sprite.new


        @@clothing_slot_02_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@clothing_slot_02_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_slot_02_text = SF::Text.new
        @@clothing_slot_02_text.font = QUICKSAND
        @@clothing_slot_02_text.character_size = 12
        @@clothing_slot_02_text.color = SF::Color::Blue

        @@clothing_slot_02_image_sprite = SF::Sprite.new


        @@clothing_slot_03_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@clothing_slot_03_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_slot_03_text = SF::Text.new
        @@clothing_slot_03_text.font = QUICKSAND
        @@clothing_slot_03_text.character_size = 12
        @@clothing_slot_03_text.color = SF::Color::Blue

        @@clothing_slot_03_image_sprite = SF::Sprite.new


        @@clothing_slot_04_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@clothing_slot_04_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_slot_04_text = SF::Text.new
        @@clothing_slot_04_text.font = QUICKSAND
        @@clothing_slot_04_text.character_size = 12
        @@clothing_slot_04_text.color = SF::Color::Blue

        @@clothing_slot_04_image_sprite = SF::Sprite.new


        @@clothing_slot_05_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@clothing_slot_05_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_slot_05_text = SF::Text.new
        @@clothing_slot_05_text.font = QUICKSAND
        @@clothing_slot_05_text.character_size = 12
        @@clothing_slot_05_text.color = SF::Color::Blue

        @@clothing_slot_05_image_sprite = SF::Sprite.new


        @@clothing_slot_06_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@clothing_slot_06_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_slot_06_text = SF::Text.new
        @@clothing_slot_06_text.font = QUICKSAND
        @@clothing_slot_06_text.character_size = 12
        @@clothing_slot_06_text.color = SF::Color::Blue
        
        @@clothing_slot_06_image_sprite = SF::Sprite.new


        @@clothing_slot_07_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@clothing_slot_07_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_slot_07_text = SF::Text.new
        @@clothing_slot_07_text.font = QUICKSAND
        @@clothing_slot_07_text.character_size = 12
        @@clothing_slot_07_text.color = SF::Color::Blue

        @@clothing_slot_07_image_sprite = SF::Sprite.new


        @@clothing_slot_08_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@clothing_slot_08_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_slot_08_text = SF::Text.new
        @@clothing_slot_08_text.font = QUICKSAND
        @@clothing_slot_08_text.character_size = 12
        @@clothing_slot_08_text.color = SF::Color::Blue

        @@clothing_slot_08_image_sprite = SF::Sprite.new


        @@clothing_slot_09_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@clothing_slot_09_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_slot_09_text = SF::Text.new
        @@clothing_slot_09_text.font = QUICKSAND
        @@clothing_slot_09_text.character_size = 12
        @@clothing_slot_09_text.color = SF::Color::Blue

        @@clothing_slot_09_image_sprite = SF::Sprite.new


        @@clothing_slot_10_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@clothing_slot_10_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_slot_10_text = SF::Text.new
        @@clothing_slot_10_text.font = QUICKSAND
        @@clothing_slot_10_text.character_size = 12
        @@clothing_slot_10_text.color = SF::Color::Blue

        @@clothing_slot_10_image_sprite = SF::Sprite.new


        @@clothing_slot_11_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@clothing_slot_11_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_slot_11_text = SF::Text.new
        @@clothing_slot_11_text.font = QUICKSAND
        @@clothing_slot_11_text.character_size = 12
        @@clothing_slot_11_text.color = SF::Color::Blue

        @@clothing_slot_11_image_sprite = SF::Sprite.new


        @@clothing_slot_12_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@clothing_slot_12_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_slot_12_text = SF::Text.new
        @@clothing_slot_12_text.font = QUICKSAND
        @@clothing_slot_12_text.character_size = 12
        @@clothing_slot_12_text.color = SF::Color::Blue

        @@clothing_slot_12_image_sprite = SF::Sprite.new


        @@clothing_slot_13_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@clothing_slot_13_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_slot_13_text = SF::Text.new
        @@clothing_slot_13_text.font = QUICKSAND
        @@clothing_slot_13_text.character_size = 12
        @@clothing_slot_13_text.color = SF::Color::Blue

        @@clothing_slot_13_image_sprite = SF::Sprite.new


        @@clothing_slot_14_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@clothing_slot_14_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_slot_14_text = SF::Text.new
        @@clothing_slot_14_text.font = QUICKSAND
        @@clothing_slot_14_text.character_size = 12
        @@clothing_slot_14_text.color = SF::Color::Blue

        @@clothing_slot_14_image_sprite = SF::Sprite.new


        @@clothing_slot_15_sprite = SF::RectangleShape.new(SF.vector2(100, 100))
        @@clothing_slot_15_sprite.fill_color = SF.color(161, 183, 208)

        @@clothing_slot_15_text = SF::Text.new
        @@clothing_slot_15_text.font = QUICKSAND
        @@clothing_slot_15_text.character_size = 12
        @@clothing_slot_15_text.color = SF::Color::Blue

        @@clothing_slot_15_image_sprite = SF::Sprite.new


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

       def ClothingTab.center_clothing_text(this)
        if this.string.size > 5 && this.string.size < 10
            x = this.position.x - (this.string.size + 5)
            this.position = SF.vector2(x, this.position.y)

        elsif this.string.size >= 15
            this.character_size = 11

            x = this.position.x - (this.string.size - 12)
            this.position = SF.vector2(x, this.position.y)
        end
     end

       def ClothingTab.initialize_clothing_tab(window)
        @@page == 1
        @@clothing_box_sprite.position = SF.vector2(20, 40)  
       end

       def ClothingTab.assign_slot_textures(window)
        if @@page == nil
            @@page = 1
        end
        if @@owned_clothing_array.size > 0
            t = 0 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_clothing_array.size - 1
             @@clothing_slot_01_image_sprite.texture = @@owned_clothing_array[t].texture
             @@clothing_slot_01_text.string = @@owned_clothing_array[t].name
             @@clothing_slot_01 = @@owned_clothing_array[t]
            else
                @@clothing_slot_01_image_sprite.texture = NIL_TEXTURE
                @@clothing_slot_01_text.string = ""
                @@clothing_slot_01 = nil
            end
        end
        if @@owned_clothing_array.size > 1
            t = 1 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_clothing_array.size - 1
             @@clothing_slot_02_image_sprite.texture = @@owned_clothing_array[t].texture
             @@clothing_slot_02_text.string = @@owned_clothing_array[t].name
             @@clothing_slot_02 = @@owned_clothing_array[t]
            else
                @@clothing_slot_02_image_sprite.texture = NIL_TEXTURE
                @@clothing_slot_02_text.string = ""
                @@clothing_slot_02 = nil
            end
        end
        if @@owned_clothing_array.size > 2
            t = 2 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_clothing_array.size - 1
             @@clothing_slot_03_image_sprite.texture = @@owned_clothing_array[t].texture
             @@clothing_slot_03_text.string = @@owned_clothing_array[t].name
             @@clothing_slot_03 = @@owned_clothing_array[t]
            else
                @@clothing_slot_03_image_sprite.texture = NIL_TEXTURE
                @@clothing_slot_03_text.string = ""
                @@clothing_slot_03 = nil
            end
        end
        if @@owned_clothing_array.size > 3
            t = 3 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_clothing_array.size - 1
             @@clothing_slot_04_image_sprite.texture = @@owned_clothing_array[t].texture
             @@clothing_slot_04_text.string = @@owned_clothing_array[t].name
             @@clothing_slot_04 = @@owned_clothing_array[t]
            else
                @@clothing_slot_04_image_sprite.texture = NIL_TEXTURE
                @@clothing_slot_04_text.string = ""
                @@clothing_slot_04 = nil
            end
        end
        if @@owned_clothing_array.size > 4
            t = 4 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_clothing_array.size - 1
             @@clothing_slot_05_image_sprite.texture = @@owned_clothing_array[t].texture
             @@clothing_slot_05_text.string = @@owned_clothing_array[t].name
             @@clothing_slot_05 = @@owned_clothing_array[t]
            else
                @@clothing_slot_05_image_sprite.texture = NIL_TEXTURE
                @@clothing_slot_05_text.string = ""
                @@clothing_slot_05 = nil
            end
        end
        if @@owned_clothing_array.size > 5
            t = 5 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_clothing_array.size - 1
             @@clothing_slot_06_image_sprite.texture = @@owned_clothing_array[t].texture
             @@clothing_slot_06_text.string = @@owned_clothing_array[t].name
             @@clothing_slot_06 = @@owned_clothing_array[t]
            else
                @@clothing_slot_06_image_sprite.texture = NIL_TEXTURE
                @@clothing_slot_06_text.string = ""
                @@clothing_slot_06 = nil
            end
        end
        if @@owned_clothing_array.size > 6
            t = 6 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_clothing_array.size - 1
             @@clothing_slot_07_image_sprite.texture = @@owned_clothing_array[t].texture
             @@clothing_slot_07_text.string = @@owned_clothing_array[t].name
             @@clothing_slot_07 = @@owned_clothing_array[t]
            else
                @@clothing_slot_07_image_sprite.texture = NIL_TEXTURE
                @@clothing_slot_07_text.string = ""
                @@clothing_slot_07 = nil
            end
        end
        if @@owned_clothing_array.size > 7
            t = 7 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_clothing_array.size - 1
             @@clothing_slot_08_image_sprite.texture = @@owned_clothing_array[t].texture
             @@clothing_slot_08_text.string = @@owned_clothing_array[t].name
             @@clothing_slot_08 = @@owned_clothing_array[t]
            else
                @@clothing_slot_08_image_sprite.texture = NIL_TEXTURE
                @@clothing_slot_08_text.string = ""
                @@clothing_slot_08 = nil
            end
        end
        if @@owned_clothing_array.size > 8
            t = 8 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_clothing_array.size - 1
             @@clothing_slot_09_image_sprite.texture = @@owned_clothing_array[t].texture
             @@clothing_slot_09_text.string = @@owned_clothing_array[t].name
             @@clothing_slot_09 = @@owned_clothing_array[t]
            else
                @@clothing_slot_09_image_sprite.texture = NIL_TEXTURE
                @@clothing_slot_09_text.string = ""
                @@clothing_slot_09 = nil
            end
        end
        if @@owned_clothing_array.size > 9
            t = 9 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_clothing_array.size - 1
             @@clothing_slot_10_image_sprite.texture = @@owned_clothing_array[t].texture
             @@clothing_slot_10_text.string = @@owned_clothing_array[t].name
             @@clothing_slot_10 = @@owned_clothing_array[t]
            else
                @@clothing_slot_10_image_sprite.texture = NIL_TEXTURE
                @@clothing_slot_10_text.string = ""
                @@clothing_slot_10 = nil
            end
        end
        if @@owned_clothing_array.size > 10
            t = 10 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_clothing_array.size - 1
             @@clothing_slot_11_image_sprite.texture = @@owned_clothing_array[t].texture
             @@clothing_slot_11_text.string = @@owned_clothing_array[t].name
             @@clothing_slot_11 = @@owned_clothing_array[t]
            else
                @@clothing_slot_11_image_sprite.texture = NIL_TEXTURE
                @@clothing_slot_11_text.string = ""
                @@clothing_slot_11 = nil
            end
        end
        if @@owned_clothing_array.size > 11
            t = 11 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_clothing_array.size - 1
             @@clothing_slot_12_image_sprite.texture = @@owned_clothing_array[t].texture
             @@clothing_slot_12_text.string = @@owned_clothing_array[t].name
             @@clothing_slot_12 = @@owned_clothing_array[t]
            else
                @@clothing_slot_12_image_sprite.texture = NIL_TEXTURE
                @@clothing_slot_12_text.string = ""
                @@clothing_slot_12 = nil
            end
        end
        if @@owned_clothing_array.size > 12
            t = 12 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_clothing_array.size - 1
             @@clothing_slot_13_image_sprite.texture = @@owned_clothing_array[t].texture
             @@clothing_slot_13_text.string = @@owned_clothing_array[t].name
             @@clothing_slot_13 = @@owned_clothing_array[t]
            else
                @@clothing_slot_13_image_sprite.texture = NIL_TEXTURE
                @@clothing_slot_13_text.string = ""
                @@clothing_slot_13 = nil
            end
        end
        if @@owned_clothing_array.size > 13
            t = 13 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_clothing_array.size - 1
             @@clothing_slot_14_image_sprite.texture = @@owned_clothing_array[t].texture
             @@clothing_slot_14_text.string = @@owned_clothing_array[t].name
             @@clothing_slot_14 = @@owned_clothing_array[t]
            else
                @@clothing_slot_14_image_sprite.texture = NIL_TEXTURE
                @@clothing_slot_14_text.string = ""
                @@clothing_slot_14 = nil
            end
        end
        if @@owned_clothing_array.size > 14
            t = 14 + (@@page.not_nil! * 15) - 15
            if t <= @@owned_clothing_array.size - 1
             @@clothing_slot_15_image_sprite.texture = @@owned_clothing_array[t].texture
             @@clothing_slot_15_text.string = @@owned_clothing_array[t].name
             @@clothing_slot_15 = @@owned_clothing_array[t]
            else
                @@clothing_slot_15_image_sprite.texture = NIL_TEXTURE
                @@clothing_slot_15_text.string = ""
                @@clothing_slot_15 = nil
            end
        end
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

        window.view = window.default_view #for shirts the second frame of the walk cycle should be used for display

        @@clothing_box_sprite.position = SF.vector2(80 * max_scale, 40 * max_scale)
        @@clothing_box_sprite.scale = SF.vector2(1, 1)

        @@clothing_left_arrow_sprite.position = @@clothing_box_sprite.position + SF.vector2(200 * max_scale, 15 * max_scale)
        @@clothing_left_arrow_sprite.scale = SF.vector2(1, 1)

        @@clothing_right_arrow_sprite.position = @@clothing_left_arrow_sprite.position + SF.vector2(50 * max_scale, 1 * max_scale)
        @@clothing_right_arrow_sprite.scale = SF.vector2(1, 1)

        
        @@clothing_slot_01_sprite.position = @@clothing_box_sprite.position + SF.vector2(10 * max_scale, 40 * max_scale)
        @@clothing_slot_01_sprite.scale = SF.vector2(1, 1)
        
        @@clothing_slot_01_image_sprite.position = @@clothing_slot_01_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@clothing_slot_01_image_sprite.scale = SF.vector2(2, 2)
        @@clothing_slot_01_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 

        @@clothing_slot_01_text.position = @@clothing_slot_01_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTab.center_clothing_text(@@clothing_slot_01_text)
        

        @@clothing_slot_02_sprite.position = @@clothing_box_sprite.position + SF.vector2(90 * max_scale, 40 * max_scale)
        @@clothing_slot_02_sprite.scale = SF.vector2(1, 1)
        
        @@clothing_slot_02_image_sprite.position = @@clothing_slot_02_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@clothing_slot_02_image_sprite.scale = SF.vector2(2, 2)
        @@clothing_slot_02_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 

        @@clothing_slot_02_text.position = @@clothing_slot_02_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTab.center_clothing_text(@@clothing_slot_02_text)
        

        @@clothing_slot_03_sprite.position = @@clothing_box_sprite.position + SF.vector2(170 * max_scale, 40 * max_scale)
        @@clothing_slot_03_sprite.scale = SF.vector2(1, 1)
        
        @@clothing_slot_03_image_sprite.position = @@clothing_slot_03_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@clothing_slot_03_image_sprite.scale = SF.vector2(2, 2)
        @@clothing_slot_03_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 

        @@clothing_slot_03_text.position = @@clothing_slot_03_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTab.center_clothing_text(@@clothing_slot_03_text)
        

        @@clothing_slot_04_sprite.position = @@clothing_box_sprite.position + SF.vector2(250 * max_scale, 40 * max_scale)
        @@clothing_slot_04_sprite.scale = SF.vector2(1, 1)

        @@clothing_slot_04_text.position = @@clothing_slot_04_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTab.center_clothing_text(@@clothing_slot_04_text)
        
        @@clothing_slot_04_image_sprite.position = @@clothing_slot_04_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@clothing_slot_04_image_sprite.scale = SF.vector2(2, 2)
        @@clothing_slot_04_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 


        @@clothing_slot_05_sprite.position = @@clothing_box_sprite.position + SF.vector2(330 * max_scale, 40 * max_scale)
        @@clothing_slot_05_sprite.scale = SF.vector2(1, 1)

        @@clothing_slot_05_text.position = @@clothing_slot_05_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTab.center_clothing_text(@@clothing_slot_05_text)
        
        @@clothing_slot_05_image_sprite.position = @@clothing_slot_05_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@clothing_slot_05_image_sprite.scale = SF.vector2(2, 2)
        @@clothing_slot_05_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@clothing_slot_06_sprite.position = @@clothing_box_sprite.position + SF.vector2(10 * max_scale, 120 * max_scale)
        @@clothing_slot_06_sprite.scale = SF.vector2(1, 1)

        @@clothing_slot_06_text.position = @@clothing_slot_06_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTab.center_clothing_text(@@clothing_slot_06_text)
        
        @@clothing_slot_06_image_sprite.position = @@clothing_slot_06_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@clothing_slot_06_image_sprite.scale = SF.vector2(2, 2)
        @@clothing_slot_06_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@clothing_slot_07_sprite.position = @@clothing_box_sprite.position + SF.vector2(90 * max_scale, 120 * max_scale)
        @@clothing_slot_07_sprite.scale = SF.vector2(1, 1)
        
        @@clothing_slot_07_text.position = @@clothing_slot_07_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTab.center_clothing_text(@@clothing_slot_07_text)
        
        @@clothing_slot_07_image_sprite.position = @@clothing_slot_07_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@clothing_slot_07_image_sprite.scale = SF.vector2(2, 2)
        @@clothing_slot_07_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@clothing_slot_08_sprite.position = @@clothing_box_sprite.position + SF.vector2(170 * max_scale, 120 * max_scale)
        @@clothing_slot_08_sprite.scale = SF.vector2(1, 1)
                
        @@clothing_slot_08_text.position = @@clothing_slot_08_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTab.center_clothing_text(@@clothing_slot_08_text)
        
        @@clothing_slot_08_image_sprite.position = @@clothing_slot_08_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@clothing_slot_08_image_sprite.scale = SF.vector2(2, 2)
        @@clothing_slot_08_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@clothing_slot_09_sprite.position = @@clothing_box_sprite.position + SF.vector2(250 * max_scale, 120 * max_scale)
        @@clothing_slot_09_sprite.scale = SF.vector2(1, 1)
                
        @@clothing_slot_09_text.position = @@clothing_slot_09_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTab.center_clothing_text(@@clothing_slot_09_text)
        
        @@clothing_slot_09_image_sprite.position = @@clothing_slot_09_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@clothing_slot_09_image_sprite.scale = SF.vector2(2, 2)
        @@clothing_slot_09_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@clothing_slot_10_sprite.position = @@clothing_box_sprite.position + SF.vector2(330 * max_scale, 120 * max_scale)
        @@clothing_slot_10_sprite.scale = SF.vector2(1, 1)
                        
        @@clothing_slot_10_text.position = @@clothing_slot_10_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTab.center_clothing_text(@@clothing_slot_10_text)
        
        @@clothing_slot_10_image_sprite.position = @@clothing_slot_10_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@clothing_slot_10_image_sprite.scale = SF.vector2(2, 2)
        @@clothing_slot_10_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@clothing_slot_11_sprite.position = @@clothing_box_sprite.position + SF.vector2(10 * max_scale, 200 * max_scale)
        @@clothing_slot_11_sprite.scale = SF.vector2(1, 1)
                        
        @@clothing_slot_11_text.position = @@clothing_slot_11_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTab.center_clothing_text(@@clothing_slot_11_text)
        
        @@clothing_slot_11_image_sprite.position = @@clothing_slot_11_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@clothing_slot_11_image_sprite.scale = SF.vector2(2, 2)
        @@clothing_slot_11_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@clothing_slot_12_sprite.position = @@clothing_box_sprite.position + SF.vector2(90 * max_scale, 200 * max_scale)
        @@clothing_slot_12_sprite.scale = SF.vector2(1, 1)
                        
        @@clothing_slot_12_text.position = @@clothing_slot_12_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTab.center_clothing_text(@@clothing_slot_12_text)
        
        @@clothing_slot_12_image_sprite.position = @@clothing_slot_12_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@clothing_slot_12_image_sprite.scale = SF.vector2(2, 2)
        @@clothing_slot_12_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@clothing_slot_13_sprite.position = @@clothing_box_sprite.position + SF.vector2(170 * max_scale, 200 * max_scale)
        @@clothing_slot_13_sprite.scale = SF.vector2(1, 1)
                        
        @@clothing_slot_13_text.position = @@clothing_slot_13_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTab.center_clothing_text(@@clothing_slot_13_text)
        
        @@clothing_slot_13_image_sprite.position = @@clothing_slot_13_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@clothing_slot_13_image_sprite.scale = SF.vector2(2, 2)
        @@clothing_slot_13_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@clothing_slot_14_sprite.position = @@clothing_box_sprite.position + SF.vector2(250 * max_scale, 200 * max_scale)
        @@clothing_slot_14_sprite.scale = SF.vector2(1, 1)
                        
        @@clothing_slot_14_text.position = @@clothing_slot_14_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTab.center_clothing_text(@@clothing_slot_14_text)
        
        @@clothing_slot_14_image_sprite.position = @@clothing_slot_14_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@clothing_slot_14_image_sprite.scale = SF.vector2(2, 2)
        @@clothing_slot_14_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 
        

        @@clothing_slot_15_sprite.position = @@clothing_box_sprite.position + SF.vector2(330 * max_scale, 200 * max_scale)
        @@clothing_slot_15_sprite.scale = SF.vector2(1, 1)
                        
        @@clothing_slot_15_text.position = @@clothing_slot_15_sprite.position + SF.vector2(4 * max_scale, 55 * max_scale)
        ClothingTab.center_clothing_text(@@clothing_slot_15_text)
        
        @@clothing_slot_15_image_sprite.position = @@clothing_slot_15_sprite.position - SF.vector2(30 * max_scale, 65 * max_scale)
        @@clothing_slot_15_image_sprite.scale = SF.vector2(2, 2)
        @@clothing_slot_15_image_sprite.texture_rect = SF.int_rect(192, 0, 96, 128) 

        window.draw(@@clothing_box_sprite)
        window.draw(@@clothing_left_arrow_sprite)
        window.draw(@@clothing_right_arrow_sprite)

        window.draw(@@clothing_slot_01_sprite)
        window.draw(@@clothing_slot_01_image_sprite)
        window.draw(@@clothing_slot_01_text)

        window.draw(@@clothing_slot_02_sprite)
        window.draw(@@clothing_slot_02_image_sprite)
        window.draw(@@clothing_slot_02_text)

        window.draw(@@clothing_slot_03_sprite)
        window.draw(@@clothing_slot_03_image_sprite)
        window.draw(@@clothing_slot_03_text)
        
        window.draw(@@clothing_slot_04_sprite)
        window.draw(@@clothing_slot_04_image_sprite)
        window.draw(@@clothing_slot_04_text)

        window.draw(@@clothing_slot_05_sprite)
        window.draw(@@clothing_slot_05_image_sprite)
        window.draw(@@clothing_slot_05_text)

        window.draw(@@clothing_slot_06_sprite)
        window.draw(@@clothing_slot_06_image_sprite)
        window.draw(@@clothing_slot_06_text)

        window.draw(@@clothing_slot_07_sprite)
        window.draw(@@clothing_slot_07_image_sprite)
        window.draw(@@clothing_slot_07_text)

        window.draw(@@clothing_slot_08_sprite)
        window.draw(@@clothing_slot_08_image_sprite)
        window.draw(@@clothing_slot_08_text)

        window.draw(@@clothing_slot_09_sprite)
        window.draw(@@clothing_slot_09_image_sprite)
        window.draw(@@clothing_slot_09_text)

        window.draw(@@clothing_slot_10_sprite)
        window.draw(@@clothing_slot_10_image_sprite)
        window.draw(@@clothing_slot_10_text)

        window.draw(@@clothing_slot_11_sprite)
        window.draw(@@clothing_slot_11_image_sprite)
        window.draw(@@clothing_slot_11_text)

        window.draw(@@clothing_slot_12_sprite)
        window.draw(@@clothing_slot_12_image_sprite)
        window.draw(@@clothing_slot_12_text)

        window.draw(@@clothing_slot_13_sprite)
        window.draw(@@clothing_slot_13_image_sprite)
        window.draw(@@clothing_slot_13_text)

        window.draw(@@clothing_slot_14_sprite)
        window.draw(@@clothing_slot_14_image_sprite)
        window.draw(@@clothing_slot_14_text)

        window.draw(@@clothing_slot_15_sprite)
        window.draw(@@clothing_slot_15_image_sprite)
        window.draw(@@clothing_slot_15_text)

        if SF::Mouse.button_pressed?(SF::Mouse::Left)
            ClothingTab.clothes_mouse_handling(window)
        end
       end

       def ClothingTab.clothes_mouse_handling(window)
        mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window))
        mouse_x = mouse_position.x
        mouse_y = mouse_position.y
        
    
        current_size = window.size
        original_width = 800 
        original_height = 600 

        scale_x = (current_size.x.to_f / original_width)
        scale_y = current_size.y.to_f / original_height

        #------------------------------------objects-------------------------------------------------
            arrow_left_x = @@clothing_left_arrow_sprite.position.x
            arrow_left_y = @@clothing_left_arrow_sprite.position.y
            arrow_left_width = @@clothing_left_arrow_sprite.size.x
            arrow_left_height = @@clothing_left_arrow_sprite.size.y

            arrow_right_x = @@clothing_right_arrow_sprite.position.x
            arrow_right_y = @@clothing_right_arrow_sprite.position.y
            arrow_right_width = @@clothing_right_arrow_sprite.size.x
            arrow_right_height = @@clothing_right_arrow_sprite.size.y

            slot_01_x = @@clothing_slot_01_sprite.position.x
            slot_01_y = @@clothing_slot_01_sprite.position.y
            slot_01_width = @@clothing_slot_01_sprite.size.x
            slot_01_height = @@clothing_slot_01_sprite.size.y

            slot_02_x = @@clothing_slot_02_sprite.position.x
            slot_02_y = @@clothing_slot_02_sprite.position.y
            slot_02_width = @@clothing_slot_02_sprite.size.x
            slot_02_height = @@clothing_slot_02_sprite.size.y

            slot_03_x = @@clothing_slot_03_sprite.position.x
            slot_03_y = @@clothing_slot_03_sprite.position.y
            slot_03_width = @@clothing_slot_03_sprite.size.x
            slot_03_height = @@clothing_slot_03_sprite.size.y

            slot_04_x = @@clothing_slot_04_sprite.position.x
            slot_04_y = @@clothing_slot_04_sprite.position.y
            slot_04_width = @@clothing_slot_04_sprite.size.x
            slot_04_height = @@clothing_slot_04_sprite.size.y

            slot_05_x = @@clothing_slot_05_sprite.position.x
            slot_05_y = @@clothing_slot_05_sprite.position.y
            slot_05_width = @@clothing_slot_05_sprite.size.x
            slot_05_height = @@clothing_slot_05_sprite.size.y

            slot_06_x = @@clothing_slot_06_sprite.position.x
            slot_06_y = @@clothing_slot_06_sprite.position.y
            slot_06_width = @@clothing_slot_06_sprite.size.x
            slot_06_height = @@clothing_slot_06_sprite.size.y

            slot_07_x = @@clothing_slot_07_sprite.position.x
            slot_07_y = @@clothing_slot_07_sprite.position.y
            slot_07_width = @@clothing_slot_07_sprite.size.x
            slot_07_height = @@clothing_slot_07_sprite.size.y

            slot_08_x = @@clothing_slot_08_sprite.position.x
            slot_08_y = @@clothing_slot_08_sprite.position.y
            slot_08_width = @@clothing_slot_08_sprite.size.x
            slot_08_height = @@clothing_slot_08_sprite.size.y

            slot_09_x = @@clothing_slot_09_sprite.position.x
            slot_09_y = @@clothing_slot_09_sprite.position.y
            slot_09_width = @@clothing_slot_09_sprite.size.x
            slot_09_height = @@clothing_slot_09_sprite.size.y

            slot_10_x = @@clothing_slot_10_sprite.position.x
            slot_10_y = @@clothing_slot_10_sprite.position.y
            slot_10_width = @@clothing_slot_10_sprite.size.x
            slot_10_height = @@clothing_slot_10_sprite.size.y

            slot_11_x = @@clothing_slot_11_sprite.position.x
            slot_11_y = @@clothing_slot_11_sprite.position.y
            slot_11_width = @@clothing_slot_11_sprite.size.x
            slot_11_height = @@clothing_slot_11_sprite.size.y

            slot_12_x = @@clothing_slot_12_sprite.position.x
            slot_12_y = @@clothing_slot_12_sprite.position.y
            slot_12_width = @@clothing_slot_12_sprite.size.x
            slot_12_height = @@clothing_slot_12_sprite.size.y

            slot_13_x = @@clothing_slot_13_sprite.position.x
            slot_13_y = @@clothing_slot_13_sprite.position.y
            slot_13_width = @@clothing_slot_13_sprite.size.x
            slot_13_height = @@clothing_slot_13_sprite.size.y

            slot_14_x = @@clothing_slot_14_sprite.position.x
            slot_14_y = @@clothing_slot_14_sprite.position.y
            slot_14_width = @@clothing_slot_14_sprite.size.x
            slot_14_height = @@clothing_slot_14_sprite.size.y

            slot_15_x = @@clothing_slot_15_sprite.position.x
            slot_15_y = @@clothing_slot_15_sprite.position.y
            slot_15_width = @@clothing_slot_15_sprite.size.x
            slot_15_height = @@clothing_slot_15_sprite.size.y
        #---------------------------------------------------------------------------------------------
        
        if (mouse_x >= arrow_left_x && mouse_x <= arrow_left_x + arrow_left_width) &&
           (mouse_y >= arrow_left_y && mouse_y <= arrow_left_y + arrow_left_height)
           
            if @@page.not_nil! > 1
                @@page = @@page.not_nil! - 1
            end
            ClothingTab.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= arrow_right_x && mouse_x <= arrow_right_x + arrow_right_width) &&
           (mouse_y >= arrow_right_y && mouse_y <= arrow_right_y + arrow_right_height)
           
            if @@page.not_nil! <= 5
                @@page = @@page.not_nil! + 1
            end
            ClothingTab.assign_slot_textures(window)
            sleep 0.15.seconds
        end

        
        if (mouse_x >= slot_01_x && mouse_x <= slot_01_x + slot_01_width) &&
           (mouse_y >= slot_01_y && mouse_y <= slot_01_y + slot_01_height)
           
            if @@clothing_slot_01 != nil   
                t = 0 + (@@page.not_nil! * 15) - 15
                
                @@owned_clothing_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@clothing_slot_01.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTab.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_02_x && mouse_x <= slot_02_x + slot_02_width) &&
           (mouse_y >= slot_02_y && mouse_y <= slot_02_y + slot_02_height)
           
            if @@clothing_slot_02 != nil
                t = 1 + (@@page.not_nil! * 15) - 15
                
                @@owned_clothing_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@clothing_slot_02.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTab.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_03_x && mouse_x <= slot_03_x + slot_03_width) &&
           (mouse_y >= slot_03_y && mouse_y <= slot_03_y + slot_03_height)
           
            if @@clothing_slot_03 != nil
                t = 2 + (@@page.not_nil! * 15) - 15
                
                @@owned_clothing_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@clothing_slot_03.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTab.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_04_x && mouse_x <= slot_04_x + slot_04_width) &&
           (mouse_y >= slot_04_y && mouse_y <= slot_04_y + slot_04_height)
           
            if @@clothing_slot_04 != nil
                t = 3 + (@@page.not_nil! * 15) - 15
                
                @@owned_clothing_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@clothing_slot_04.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTab.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_05_x && mouse_x <= slot_05_x + slot_05_width) &&
           (mouse_y >= slot_05_y && mouse_y <= slot_05_y + slot_05_height)
           
            if @@clothing_slot_05 != nil
                t = 4 + (@@page.not_nil! * 15) - 15
                
                @@owned_clothing_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@clothing_slot_05.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTab.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_06_x && mouse_x <= slot_06_x + slot_06_width) &&
           (mouse_y >= slot_06_y && mouse_y <= slot_06_y + slot_06_height)
           
            if @@clothing_slot_06 != nil
                t = 5 + (@@page.not_nil! * 15) - 15
                
                @@owned_clothing_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@clothing_slot_06.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTab.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_07_x && mouse_x <= slot_07_x + slot_07_width) &&
           (mouse_y >= slot_07_y && mouse_y <= slot_07_y + slot_07_height)
           
            if @@clothing_slot_07 != nil
                t = 6 + (@@page.not_nil! * 15) - 15
                
                @@owned_clothing_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@clothing_slot_07.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTab.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_08_x && mouse_x <= slot_08_x + slot_08_width) &&
           (mouse_y >= slot_08_y && mouse_y <= slot_08_y + slot_08_height)
           
            if @@clothing_slot_08 != nil
                t = 7 + (@@page.not_nil! * 15) - 15
                
                @@owned_clothing_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@clothing_slot_08.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTab.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_09_x && mouse_x <= slot_09_x + slot_09_width) &&
           (mouse_y >= slot_09_y && mouse_y <= slot_09_y + slot_09_height)
           
            if @@clothing_slot_09 != nil
                t = 8 + (@@page.not_nil! * 15) - 15
                
                @@owned_clothing_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@clothing_slot_09.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTab.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_10_x && mouse_x <= slot_10_x + slot_10_width) &&
           (mouse_y >= slot_10_y && mouse_y <= slot_10_y + slot_10_height)
           
            if @@clothing_slot_10 != nil
                t = 9 + (@@page.not_nil! * 15) - 15
                
                @@owned_clothing_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@clothing_slot_10.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTab.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_11_x && mouse_x <= slot_11_x + slot_11_width) &&
           (mouse_y >= slot_11_y && mouse_y <= slot_11_y + slot_11_height)
           
            if @@clothing_slot_11 != nil
                t = 10 + (@@page.not_nil! * 15) - 15
                
                @@owned_clothing_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@clothing_slot_11.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTab.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_12_x && mouse_x <= slot_12_x + slot_12_width) &&
           (mouse_y >= slot_12_y && mouse_y <= slot_12_y + slot_12_height)
           
            if @@clothing_slot_12 != nil
                t = 11 + (@@page.not_nil! * 15) - 15
                
                @@owned_clothing_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@clothing_slot_12.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTab.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_13_x && mouse_x <= slot_13_x + slot_13_width) &&
           (mouse_y >= slot_13_y && mouse_y <= slot_13_y + slot_13_height)
           
            if @@clothing_slot_13 != nil
                t = 12 + (@@page.not_nil! * 15) - 15
                
                @@owned_clothing_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@clothing_slot_13.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTab.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_14_x && mouse_x <= slot_14_x + slot_14_width) &&
           (mouse_y >= slot_14_y && mouse_y <= slot_14_y + slot_14_height)
           
            if @@clothing_slot_14 != nil
                t = 13 + (@@page.not_nil! * 15) - 15
                
                @@owned_clothing_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@clothing_slot_14.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTab.assign_slot_textures(window)
            sleep 0.15.seconds
        end
        
        if (mouse_x >= slot_15_x && mouse_x <= slot_15_x + slot_15_width) &&
           (mouse_y >= slot_15_y && mouse_y <= slot_15_y + slot_15_height)
           
            if @@clothing_slot_15 != nil
                t = 14 + (@@page.not_nil! * 15) - 15
                
                @@owned_clothing_array[t] = (Clothing::Shirt.get_shirt(Player::Appearance.get_clothing("shirt").not_nil!).not_nil!)
                Player::Appearance.change_shirt(@@clothing_slot_15.not_nil!.name)
                Sprites::Player.refresh_player_sprite(window)
            end
            ClothingTab.assign_slot_textures(window)
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