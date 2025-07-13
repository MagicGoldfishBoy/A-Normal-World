require "crsfml"
require "../sound/music.cr"

module MusicHandling

    class MenuMusic
        def initialize(volume : Int32)
            @volume = volume
        end
        
        class_property volume : Int32 = 100

        def self.stop_all_menu_music
            Music::MenuThemes::MAIN_THEME.stop
            Music::MenuThemes::CHAR_CREATE_THEME.stop
        end

        def self.play_menu_music(music)
         self.stop_all_menu_music
         MapMusic.stop_all_map_music
          case music
           when "main_menu"
            #Music::MenuThemes::MAIN_THEME.volume = MenuMusic.volume
            Music::MenuThemes::MAIN_THEME.play
           when "character_creation_menu"
            #Music::MenuThemes::CHAR_CREATE_THEME.volume = MenuMusic.volume
            Music::MenuThemes::CHAR_CREATE_THEME.play
          end
        end
    end
    class MapMusic
        def initialize(volume : Int32)
            @volume = volume
        end

        class_property volume : Int32 = 100

        def self.stop_all_map_music
            Music::ChitonCityThemes::CHITON_CITY_DUMP_THEME.stop
        end

        def self.play_map_music(music)
            MenuMusic.stop_all_menu_music
            self.stop_all_map_music
            case music
            when "chitòn_dump"
                #Music::ChitonCityThemes::CHITON_CITY_DUMP_THEME.volume = MapMusic.volume
                Music::ChitonCityThemes::CHITON_CITY_DUMP_THEME.play
            end
        end
    end
end