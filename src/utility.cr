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
end