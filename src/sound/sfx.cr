require "crsfml"
require "../sound/music.cr"
require "../../src/game_settings.cr"

module SFX
    class SFX_Base
        def initialize
            self.volume = Settings::GameSettings.sound_volume
        end
    end
    class CombatSFX < SFX_Base

        BB_GUN_SFX_01 = SF::Sound.new(SF::SoundBuffer.from_file("../sound/sfx/bb_gun_01.ogg"))

        SWORD_SWING_SFX_01 = SF::Sound.new(SF::SoundBuffer.from_file("../sound/sfx/sword_01.ogg"))

        KNIFE_STAB_SFX_01 = SF::Sound.new(SF::SoundBuffer.from_file("../sound/sfx/stab_01.ogg"))

        BLUNT_SWING_SFX_01 = SF::Sound.new(SF::SoundBuffer.from_file("../sound/sfx/swing_01.ogg"))
    end

    class WhackeableSFX < SFX_Base

        FABRIC_HIT_01 = SF::Sound.new(SF::SoundBuffer.from_file("../sound/sfx/fabric_hit_01.ogg"))

        ROCK_HIT_01 = SF::Sound.new(SF::SoundBuffer.from_file("../sound/sfx/rock_hit_01.ogg"))
    end

    class EquipSFX < SFX_Base

        FABRIC_EQUIP_01 = SF::Sound.new(SF::SoundBuffer.from_file("../sound/sfx/fabric_equip_01.ogg"))

        GLASSES_EQUIP_01 = SF::Sound.new(SF::SoundBuffer.from_file("../sound/sfx/glasses_equip_01.ogg"))

        MAKEUP_EQUIP_01 = SF::Sound.new(SF::SoundBuffer.from_file("../sound/sfx/apply_makeup_01.ogg"))
    end
end