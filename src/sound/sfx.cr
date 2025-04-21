require "crsfml"
require "../sound/music.cr"

module SFX
    class CombatSFX
       # BB_GUN_SFX_01_BUFFER = SF::SoundBuffer.from_file("../sound/sfx/bb_gun_01.ogg")
        BB_GUN_SFX_01 = SF::Sound.new(SF::SoundBuffer.from_file("../sound/sfx/bb_gun_01.ogg"))

        SWORD_SWING_SFX_01 = SF::Sound.new(SF::SoundBuffer.from_file("../sound/sfx/sword_01.ogg"))
    end
end