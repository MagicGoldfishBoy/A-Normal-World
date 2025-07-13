require "crsfml"
require "../sound/music.cr"

module SFX
    class CombatSFX

        BB_GUN_SFX_01 = SF::Sound.new(SF::SoundBuffer.from_file("../sound/sfx/bb_gun_01.ogg"))

        SWORD_SWING_SFX_01 = SF::Sound.new(SF::SoundBuffer.from_file("../sound/sfx/sword_01.ogg"))

        KNIFE_STAB_SFX_01 = SF::Sound.new(SF::SoundBuffer.from_file("../sound/sfx/stab_01.ogg"))

        BLUNT_SWING_SFX_01 = SF::Sound.new(SF::SoundBuffer.from_file("../sound/sfx/swing_01.ogg"))
    end

    class WhackeableSFX

        FABRIC_HIT_01 = SF::Sound.new(SF::SoundBuffer.from_file("../sound/sfx/fabric_hit_01.ogg"))

        ROCK_HIT_01 = SF::Sound.new(SF::SoundBuffer.from_file("../sound/sfx/rock_hit_01.ogg"))
    end

    class EquipSFX

        FABRIC_EQUIP_01 = SF::Sound.new(SF::SoundBuffer.from_file("../sound/sfx/fabric_equip_01.ogg"))

        GLASSES_EQUIP_01 = SF::Sound.new(SF::SoundBuffer.from_file("../sound/sfx/glasses_equip_01.ogg"))

        MAKEUP_EQUIP_01 = SF::Sound.new(SF::SoundBuffer.from_file("../sound/sfx/apply_makeup_01.ogg"))
    end
end