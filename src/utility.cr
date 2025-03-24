require "crsfml"
require "../src/textures.cr"
require "../src/clothing.cr"
require "../src/equipment.cr"

module Utility
    class StringUtilities

        def StringUtilities.center_text(this)
            base_size = 16
            min_size = 11
            max_size = 16
        
            this.character_size = (base_size - (this.string.size / 2)).to_i
            this.character_size = this.character_size.clamp(min_size, max_size)
        
            text_width = this.string.size * this.character_size / 2
            x = this.position.x - (text_width / 2)
            y = this.position.y
        
            this.position = SF.vector2(x, y)
        end

    end

    class ArrayUtilities

        def ArrayUtilities.organise_array_by_length_short_to_long(window, array : Array(T), tab)forall T
            none_array = [] of T
            very_short_array = [] of T
            short_array = [] of T
            long_array = [] of T            


            array.each do |item|
                case item.length
                when "none"        then none_array << item
                when "very_short"  then very_short_array << item
                when "short"       then short_array << item
                when "long"        then long_array << item
                end
              end
    
            array.clear
            array.concat(none_array)
            array.concat(very_short_array)
            array.concat(short_array)
            array.concat(long_array)
            array.uniq!
            tab.assign_slot_textures(window)
        end

        def ArrayUtilities.organise_array_by_color(window, array : Array(T), tab)forall T
            white_array = [] of T
            gray_array = [] of T
            black_array = [] of T
            brown_array = [] of T
            red_array = [] of T
            orange_array = [] of T            
            yellow_array = [] of T            
            green_array = [] of T            
            blue_array = [] of T            
            purple_array = [] of T            
            pink_array = [] of T            


            array.each do |item|
                case item.color
                when "white"    then white_array << item
                when "gray"    then gray_array << item
                when "black"    then black_array << item
                when "brown"    then brown_array << item
                when "red"      then red_array << item
                when "orange"   then orange_array << item
                when "yellow"   then yellow_array << item
                when "green"    then green_array << item
                when "blue"     then blue_array << item
                when "purple"   then purple_array << item
                when "pink"     then pink_array << item
                end
              end
    
            array.clear
            array.concat(white_array)
            array.concat(gray_array)
            array.concat(black_array)
            array.concat(brown_array)
            array.concat(red_array)
            array.concat(orange_array)
            array.concat(yellow_array)
            array.concat(green_array)
            array.concat(blue_array)
            array.concat(purple_array)
            array.concat(pink_array)
            array.uniq!
            tab.assign_slot_textures(window)
        end

    end

    class ClickUtilities
        class_property last_click_time : Time = Time.utc - 1.second
        class_property is_clicking : Bool = false

          
        def ClickUtilities.handle_click(window)
            return unless SF::Mouse.button_pressed?(SF::Mouse::Left)
            return if is_clicking
        
            self.is_clicking = true
        
            current_time = Time.utc
            self.last_click_time = current_time
        
            sleep 0.15.seconds
        
            self.is_clicking = false
          end
    end

end