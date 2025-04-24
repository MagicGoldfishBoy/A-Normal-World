
module Animations
    class Player
        @@idle_animation_timer = SF::Clock.new
        @@idle_animation_frame = 0

        @@walking_animation_timer = SF::Clock.new
        @@walking_animation_frame = 0

        @@attack_animation_timer = SF::Clock.new
        @@attack_animation_frame = 0

        @@stab_animation_timer = SF::Clock.new
        @@stab_animation_frame = 0

        @@shoot_animation_timer = SF::Clock.new
        @@shoot_animation_frame = 0

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


        @@stab_animation_left_array = [SF.int_rect(384, 768, 96, 128), SF.int_rect(480, 768, 96, 128), SF.int_rect(578, 768, 96, 128)]

        @@stab_animation_right_array = [SF.int_rect(384, 512, 96, 128), SF.int_rect(480, 512, 96, 128), SF.int_rect(578, 512, 96, 128)]


        @@shoot_animation_left_array = [SF.int_rect(0, 896, 96, 128), SF.int_rect(96, 896, 96, 128), SF.int_rect(192, 896, 96, 128)]

        @@shoot_animation_right_array = [SF.int_rect(0, 640, 96, 128), SF.int_rect(96, 640, 96, 128), SF.int_rect(192, 640, 96, 128)]


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

        def Player.stab_animation_right
            if @@stab_animation_timer.elapsed_time >= SF.seconds(0.08) 
                if @@stab_animation_frame < @@stab_animation_right_array.size - 1
                @@stab_animation_frame += 1
                else @@stab_animation_frame = 0
                end
                @@stab_animation_timer.restart
                return @@stab_animation_right_array[@@stab_animation_frame]
            end
                return @@stab_animation_right_array[@@stab_animation_frame]
        end

        def Player.stab_animation_left
            if @@stab_animation_timer.elapsed_time >= SF.seconds(0.05) 
                if @@stab_animation_frame < @@stab_animation_left_array.size - 1
                @@stab_animation_frame += 1
                else @@stab_animation_frame = 0
                end
                @@stab_animation_timer.restart
                return @@stab_animation_left_array[@@stab_animation_frame]
            end
                return @@stab_animation_left_array[@@stab_animation_frame]
        end

        def Player.shoot_animation_left
            if @@shoot_animation_timer.elapsed_time >= SF.seconds(0.1) 
                if @@shoot_animation_frame < @@shoot_animation_left_array.size - 1
                @@shoot_animation_frame += 1
                else @@shoot_animation_frame = 0
                end
                @@shoot_animation_timer.restart
                return @@shoot_animation_left_array[@@shoot_animation_frame]
            end
                return @@shoot_animation_left_array[@@shoot_animation_frame]
        end

        def Player.shoot_animation_right
            if @@shoot_animation_timer.elapsed_time >= SF.seconds(0.1) 
                if @@shoot_animation_frame < @@shoot_animation_right_array.size - 1
                @@shoot_animation_frame += 1
                else @@shoot_animation_frame = 0
                end
                @@shoot_animation_timer.restart
                return @@shoot_animation_right_array[@@shoot_animation_frame]
            end
                return @@shoot_animation_right_array[@@shoot_animation_frame]
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
    class Portal
        @@portal_animation_timer = SF::Clock.new
        @@portal_animation_frame = 0

        @@portal_animation_array = [SF.int_rect(0, 0, 40, 100), SF.int_rect(40, 0, 40, 100), 
        SF.int_rect(80, 0, 40, 100), SF.int_rect(120, 0, 40, 100)]

        def self.portal_animation
            if @@portal_animation_timer.elapsed_time >= SF.seconds(0.15) 
                if @@portal_animation_frame < @@portal_animation_array.size - 1
                @@portal_animation_frame += 1
                else @@portal_animation_frame = 0
                end
                @@portal_animation_timer.restart
                return @@portal_animation_array[@@portal_animation_frame]
            end
                return @@portal_animation_array[@@portal_animation_frame]
        end
    end
    class Whackeable

        @@forty_by_80_whackeable_animation_timer = SF::Clock.new
        @@forty_by_80_whackeable_animation_frame = 0

        @@forty_by_80_whackeable_full_health_hit_left_animation_array = [SF.int_rect(0, 0, 40, 80), SF.int_rect(40, 0, 40, 80),
        SF.int_rect(80, 0, 40, 80), SF.int_rect(0, 0, 40, 80)]

        @@forty_by_80_whackeable_full_health_hit_right_animation_array = [SF.int_rect(120, 0, 40, 80), SF.int_rect(160, 0, 40, 80),
        SF.int_rect(200, 0, 40, 80), SF.int_rect(120, 0, 40, 80)]
 

        @@forty_by_80_whackeable_medium_health_hit_left_animation_array = [SF.int_rect(0, 80, 40, 80), SF.int_rect(40, 80, 40, 80),
        SF.int_rect(80, 80, 40, 80), SF.int_rect(0, 80, 40, 80)]

        @@forty_by_80_whackeable_medium_health_hit_right_animation_array = [SF.int_rect(120, 80, 40, 80), SF.int_rect(160, 80, 40, 80),
        SF.int_rect(200, 80, 40, 80), SF.int_rect(0, 80, 40, 80)]


        @@forty_by_80_whackeable_low_health_hit_left_animation_array = [SF.int_rect(0, 160, 40, 80), SF.int_rect(40, 160, 40, 80),
        SF.int_rect(80, 160, 40, 80), SF.int_rect(120, 160, 40, 80)]

        @@forty_by_80_whackeable_low_health_hit_right_animation_array = [SF.int_rect(160, 160, 40, 80), SF.int_rect(200, 160, 40, 80),
        SF.int_rect(240, 160, 40, 80), SF.int_rect(0, 160, 40, 80)]


        @@forty_by_80_whackeable_lethal_hit_left_animation_array = [SF.int_rect(0, 240, 40, 80), SF.int_rect(40, 240, 40, 80),
        SF.int_rect(80, 240, 40, 80), SF.int_rect(80, 240, 40, 80)]

        def self.forty_by_80_whackeable_animation_left
            if @@forty_by_80_whackeable_animation_timer.elapsed_time >= SF.seconds(0.15) 
                if @@forty_by_80_whackeable_animation_frame < @@forty_by_80_whackeable_full_health_hit_left_animation_array.size - 1
                @@forty_by_80_whackeable_animation_frame += 1
                else @@forty_by_80_whackeable_animation_frame = 0
                end
                @@forty_by_80_whackeable_animation_timer.restart
                return @@forty_by_80_whackeable_full_health_hit_left_animation_array[@@forty_by_80_whackeable_animation_frame]
            end
                return @@forty_by_80_whackeable_full_health_hit_left_animation_array[@@forty_by_80_whackeable_animation_frame]
        end

        def self.forty_by_80_whackeable_animation_right
            if @@forty_by_80_whackeable_animation_timer.elapsed_time >= SF.seconds(0.15) 
                if @@forty_by_80_whackeable_animation_frame < @@forty_by_80_whackeable_full_health_hit_right_animation_array.size - 1
                @@forty_by_80_whackeable_animation_frame += 1
                else @@forty_by_80_whackeable_animation_frame = 0
                end
                @@forty_by_80_whackeable_animation_timer.restart
                return @@forty_by_80_whackeable_full_health_hit_right_animation_array[@@forty_by_80_whackeable_animation_frame]
            end
                return @@forty_by_80_whackeable_full_health_hit_right_animation_array[@@forty_by_80_whackeable_animation_frame]
        end

        def self.forty_by_80_whackeable_animation_left_medium
            if @@forty_by_80_whackeable_animation_timer.elapsed_time >= SF.seconds(0.15) 
                if @@forty_by_80_whackeable_animation_frame < @@forty_by_80_whackeable_medium_health_hit_left_animation_array.size - 1
                @@forty_by_80_whackeable_animation_frame += 1
                else @@forty_by_80_whackeable_animation_frame = 0
                end
                @@forty_by_80_whackeable_animation_timer.restart
                return @@forty_by_80_whackeable_medium_health_hit_left_animation_array[@@forty_by_80_whackeable_animation_frame]
            end
                return @@forty_by_80_whackeable_medium_health_hit_left_animation_array[@@forty_by_80_whackeable_animation_frame]
        end

        def self.forty_by_80_whackeable_animation_right_medium
            if @@forty_by_80_whackeable_animation_timer.elapsed_time >= SF.seconds(0.15) 
                if @@forty_by_80_whackeable_animation_frame < @@forty_by_80_whackeable_medium_health_hit_right_animation_array.size - 1
                @@forty_by_80_whackeable_animation_frame += 1
                else @@forty_by_80_whackeable_animation_frame = 0
                end
                @@forty_by_80_whackeable_animation_timer.restart
                return @@forty_by_80_whackeable_medium_health_hit_right_animation_array[@@forty_by_80_whackeable_animation_frame]
            end
                return @@forty_by_80_whackeable_medium_health_hit_right_animation_array[@@forty_by_80_whackeable_animation_frame]
        end

        def self.forty_by_80_whackeable_animation_left_low
            if @@forty_by_80_whackeable_animation_timer.elapsed_time >= SF.seconds(0.15) 
                if @@forty_by_80_whackeable_animation_frame < @@forty_by_80_whackeable_low_health_hit_left_animation_array.size - 1
                @@forty_by_80_whackeable_animation_frame += 1
                else @@forty_by_80_whackeable_animation_frame = 0
                end
                @@forty_by_80_whackeable_animation_timer.restart
                return @@forty_by_80_whackeable_low_health_hit_left_animation_array[@@forty_by_80_whackeable_animation_frame]
            end
                return @@forty_by_80_whackeable_low_health_hit_left_animation_array[@@forty_by_80_whackeable_animation_frame]
        end

        def self.forty_by_80_whackeable_animation_right_low
            if @@forty_by_80_whackeable_animation_timer.elapsed_time >= SF.seconds(0.15) 
                if @@forty_by_80_whackeable_animation_frame < @@forty_by_80_whackeable_low_health_hit_right_animation_array.size - 1
                @@forty_by_80_whackeable_animation_frame += 1
                else @@forty_by_80_whackeable_animation_frame = 0
                end
                @@forty_by_80_whackeable_animation_timer.restart
                return @@forty_by_80_whackeable_low_health_hit_right_animation_array[@@forty_by_80_whackeable_animation_frame]
            end
                return @@forty_by_80_whackeable_low_health_hit_right_animation_array[@@forty_by_80_whackeable_animation_frame]
        end

        def self.forty_by_80_whackeable_animation_dying
            if @@forty_by_80_whackeable_animation_timer.elapsed_time >= SF.seconds(0.15) 
                if @@forty_by_80_whackeable_animation_frame < @@forty_by_80_whackeable_lethal_hit_left_animation_array.size - 1
                @@forty_by_80_whackeable_animation_frame += 1
                else @@forty_by_80_whackeable_animation_frame = 0
                end
                @@forty_by_80_whackeable_animation_timer.restart
                return @@forty_by_80_whackeable_lethal_hit_left_animation_array[@@forty_by_80_whackeable_animation_frame]
            end
                return @@forty_by_80_whackeable_lethal_hit_left_animation_array[@@forty_by_80_whackeable_animation_frame]
        end
    end
end