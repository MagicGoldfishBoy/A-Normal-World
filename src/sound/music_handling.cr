require "crsfml"
require "../sound/music.cr"

module MusicHandling

    class MenuMusic
        def initialize(volume : Int32)
            @volume = volume
        end
        
        class_property volume : Int32 = 100

        def self.stop_all_menu_music
            MAIN_THEME.stop
            CHAR_CREATE_THEME.stop
        end

        def self.play_menu_music(music)
         self.stop_all_menu_music
          case music
           when "main_menu"
            MAIN_THEME.volume = MenuMusic.volume
            MAIN_THEME.play
           when "character_creation_menu"
            CHAR_CREATE_THEME.volume = MenuMusic.volume
            CHAR_CREATE_THEME.play
          end
        end
    end
    class MapMusic
    end
end