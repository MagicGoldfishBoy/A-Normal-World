
module Animations
    class Player
        @@idle_animation_timer = SF::Clock.new
        @@idle_animation_frame = 0
        @@idle_animation_left_array = [SF.int_rect(192, 384, 96, 128), SF.int_rect(288, 384, 96, 128), SF.int_rect(384, 384, 96, 128), 
        SF.int_rect(480, 384, 96, 128), SF.int_rect(576, 384, 96, 128)]

        def Player.idle_animation_left
            if @@idle_animation_timer.elapsed_time >= SF.seconds(0.35) 
                if @@idle_animation_frame < @@idle_animation_left_array.size - 1
                @@idle_animation_frame += 1
                else @@idle_animation_frame = 0
                end
                @@idle_animation_timer.restart
                return @@idle_animation_left_array[@@idle_animation_frame]
            end
                return @@idle_animation_left_array[@@idle_animation_frame]
        end
    end
end