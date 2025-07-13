require "crsfml/audio"
require "../../src/game_settings.cr"

module Music
    class Music_Base
        def initialize
            self.volume = Settings::GameSettings.music_volume
        end
    end
    class MenuThemes < Music_Base
        MAIN_THEME = SF::Music.from_file("../sound/music/a_normal_world_main_theme.ogg")
        MAIN_THEME.loop = true
        
        CHAR_CREATE_THEME = SF::Music.from_file("../sound/music/a_normal_world_character_creation_theme.ogg")
        CHAR_CREATE_THEME.loop = true
    end
    class ChitonCityThemes < Music_Base
        CHITON_CITY_DUMP_THEME = SF::Music.from_file("../sound/music/a_normal_world_chitòn_dump.ogg")
        CHITON_CITY_DUMP_THEME.loop = true
    end
end

