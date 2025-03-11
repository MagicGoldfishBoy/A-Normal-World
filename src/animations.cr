
module Animations
    class Player
        @@idle_animation_timer = SF::Clock.new
        @@idle_animation_frame = 0

        @@walking_animation_timer = SF::Clock.new
        @@walking_animation_frame = 0

        @@attack_animation_timer = SF::Clock.new
        @@attack_animation_frame = 0

        @@idle_animation_left_array = [SF.int_rect(192, 384, 96, 128), SF.int_rect(288, 384, 96, 128), SF.int_rect(384, 384, 96, 128), 
        SF.int_rect(480, 384, 96, 128), SF.int_rect(576, 384, 96, 128)]

        @@idle_animation_right_array = [SF.int_rect(192, 256, 96, 128), SF.int_rect(288, 256, 96, 128), SF.int_rect(384, 256, 96, 128), 
        SF.int_rect(480, 256, 96, 128), SF.int_rect(576, 256, 96, 128)]

        @@walking_animation_left_array = [SF.int_rect(96, 128, 96, 128), SF.int_rect(192, 128, 96, 128), SF.int_rect(288, 128, 96, 128),
        SF.int_rect(384, 128, 96, 128), SF.int_rect(480, 128, 96, 128), SF.int_rect(576, 128, 96, 128)]

        @@walking_animation_right_array = [SF.int_rect(96, 0, 96, 128), SF.int_rect(192, 0, 96, 128), SF.int_rect(288, 0, 96, 128),
        SF.int_rect(384, 0, 96, 128), SF.int_rect(480, 0, 96, 128), SF.int_rect(576, 0, 96, 128)]

        @@attack_animation_left_array = [SF.int_rect(0, 768, 96, 128), SF.int_rect(96, 768, 96, 128), SF.int_rect(192, 768, 96, 128), SF.int_rect(288, 768, 96, 128)]

        @@attack_animation_right_array = [SF.int_rect(0, 512, 96, 128), SF.int_rect(96, 512, 96, 128), SF.int_rect(192, 512, 96, 128), SF.int_rect(288, 512, 96, 128)]

        def Player.attack_animation_left
            if @@attack_animation_timer.elapsed_time >= SF.seconds(0.08) 
                if @@attack_animation_frame < @@attack_animation_left_array.size - 1
                @@attack_animation_frame += 1
                else @@attack_animation_frame = 0
                end
                @@attack_animation_timer.restart
                return @@attack_animation_left_array[@@attack_animation_frame]
            end
                return @@attack_animation_left_array[@@attack_animation_frame]
        end

        def Player.attack_animation_right
            if @@attack_animation_timer.elapsed_time >= SF.seconds(0.08) 
                if @@attack_animation_frame < @@attack_animation_right_array.size - 1
                @@attack_animation_frame += 1
                else @@attack_animation_frame = 0
                end
                @@attack_animation_timer.restart
                return @@attack_animation_right_array[@@attack_animation_frame]
            end
                return @@attack_animation_right_array[@@attack_animation_frame]
        end

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

        def Player.idle_animation_right
            if @@idle_animation_timer.elapsed_time >= SF.seconds(0.35) 
                if @@idle_animation_frame < @@idle_animation_right_array.size - 1
                @@idle_animation_frame += 1
                else @@idle_animation_frame = 0
                end
                @@idle_animation_timer.restart
                return @@idle_animation_right_array[@@idle_animation_frame]
            end
                return @@idle_animation_right_array[@@idle_animation_frame]
        end

        def Player.walking_animation_left
            if @@walking_animation_timer.elapsed_time >= SF.seconds(0.15) 
                if @@walking_animation_frame < @@walking_animation_left_array.size - 1
                @@walking_animation_frame += 1
                else @@walking_animation_frame = 0
                end
                @@walking_animation_timer.restart
                return @@walking_animation_left_array[@@walking_animation_frame]
            end
                return @@walking_animation_left_array[@@walking_animation_frame]
        end

        def Player.walking_animation_right
            if @@walking_animation_timer.elapsed_time >= SF.seconds(0.15) 
                if @@walking_animation_frame < @@walking_animation_right_array.size - 1
                @@walking_animation_frame += 1
                else @@walking_animation_frame = 0
                end
                @@walking_animation_timer.restart
                return @@walking_animation_right_array[@@walking_animation_frame]
            end
                return @@walking_animation_right_array[@@walking_animation_frame]
        end
    end
end