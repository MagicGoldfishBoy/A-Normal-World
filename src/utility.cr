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

    end

end