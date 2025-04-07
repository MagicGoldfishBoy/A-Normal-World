require "crsfml"

module MouseHandling
    class ClickHandling
        def self.button_clicked?(button : SF::Sprite, mouse_x : Float64, mouse_y : Float64) : Bool
            bounds = button.global_bounds
            bounds.contains?(mouse_x, mouse_y)
         end
    end
end