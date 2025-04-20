require "crsfml"
require "../sound/music.cr"

module MusicHandling

    class MenuMusic
        def initialize(volume : Int32)
            @volume = volume
        end
        
        class_property volume : Int32 = 100

        def self.play_main_menu_music
            MAIN_THEME.volume = MenuMusic.volume
            MAIN_THEME.play
        end
    end
end