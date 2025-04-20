require "crsfml/audio"

MAIN_THEME = SF::Music.from_file("../sound/music/a_normal_world_main_theme.ogg")
MAIN_THEME.loop = true

CHAR_CREATE_THEME = SF::Music.from_file("../sound/music/a_normal_world_character_creation_theme.ogg")
CHAR_CREATE_THEME.loop = true