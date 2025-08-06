require "crsfml"

module MouseHandling
    class ClickHandling

            class_property mouse_position : SF::Vector2i = SF::Vector2i.new(0, 0)
            class_property mouse_x : Float64 = 0.0
            class_property mouse_y : Float64 = 0.0

            class_property current_size : SF::Vector2u = SF::Vector2u.new(800, 600)
            class_property original_width : Int32 = 800
            class_property original_height : Int32 = 600

            class_property scale_x : Float64 = 1.0
            class_property scale_y : Float64 = 1.0
            class_property scale_ratio : Float64 = 1.0
            class_property max_scale : Float64 = 1.5
            class_property clamped_scale : Float64 = 1.0

            class_property scaled_mouse_x : Float64 = 0.0
            class_property scaled_mouse_y : Float64 = 0.0

        def self.update_mouse_position(window : SF::RenderWindow)
            ClickHandling.mouse_position = SF::Mouse.get_position(window)
            ClickHandling.mouse_x = mouse_position.x
            ClickHandling.mouse_y = mouse_position.y

            ClickHandling.current_size = window.size
            ClickHandling.original_width = 800
            ClickHandling.original_height = 600

            ClickHandling.scale_x = ClickHandling.current_size.x.to_f / ClickHandling.original_width
            ClickHandling.scale_y = ClickHandling.current_size.y.to_f / ClickHandling.original_height

            ClickHandling.scaled_mouse_x = ClickHandling.mouse_x / ClickHandling.scale_x
            ClickHandling.scaled_mouse_y = ClickHandling.mouse_y / ClickHandling.scale_y

            ClickHandling.scale_ratio = [ClickHandling.scale_x, ClickHandling.scale_y].min
            ClickHandling.max_scale = 1.5
            ClickHandling.clamped_scale = [ClickHandling.scale_ratio, ClickHandling.max_scale].min
        end

        def self.was_button_clicked?(button : SF::Sprite, window : SF::RenderWindow)
            update_mouse_position(window)
            bounds = button.global_bounds
            # puts "mouse: #{mouse_position}"
            # puts "button: #{button.global_bounds}"
            bounds.contains?(scaled_mouse_x, scaled_mouse_y)
        end

        def self.button_clicked?(button : SF::Sprite, mouse_x : Float64, mouse_y : Float64) : Bool
            bounds = button.global_bounds
            bounds.contains?(mouse_x, mouse_y)
         end
    end
end