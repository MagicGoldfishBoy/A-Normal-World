require "log"
require "crsfml"
require "crsfml/audio"
require "../../../../src/game_settings.cr"
require "../../../../src/textures.cr"
require "../../../../src/utility.cr"
require "../../../../src/inventory/equipment/equipment.cr"
require "../../../../src/player.cr"
require "../../../../graphics/color.cr"

module SoulJewel
    class SoulJewelBase < Equipment::EquipmentBase
        include JSON::Serializable

        Log = ::Log.for("soul_jewel")

        SOUL_JEWEL_ARRAY = [] of SoulJewelBase
        OWNED_SOUL_JEWEL_ARRAY = [] of SoulJewelBase | Equipment::EquipmentBase

        SOUL_JEWEL_SPRITE_HASH = {} of String => SF::Sprite
        SOUL_JEWEL_SFX_HASH = {} of String => SF::Sound

        DEFAULT_SOUL_JEWEL_EQUIP_SFX = SFX::EquipSFX::SOUL_JEWEL_EQUIP_01

        property name : String
        property id : String
        property is_owned : Bool
        property sprite : SF::Sprite?
        property sfx : SF::Sound?
        property description : String
        property tier : Int8
        property base_monetary_value : Int64
        property required_lvl : Int32

        property jewel_type : String

        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, description : String, sfx : SF::Sound, tier : Int8, base_monetary_value : Int64, required_lvl : Int32, jewel_type : String)
            @name = name
            @id = id
            @is_owned = Settings::GameSettings.is_debug_mode ? true : is_owned
            @sprite = sprite
            @sfx = sfx
            @description = description
            @tier = tier
            @base_monetary_value = base_monetary_value
            @required_lvl = required_lvl
            @jewel_type = jewel_type

            if self.is_owned
                OWNED_SOUL_JEWEL_ARRAY << self
            end

            SOUL_JEWEL_SPRITE_HASH[id] = sprite
            SOUL_JEWEL_SFX_HASH[id] = sfx

            Log.info &.emit("Soul Jewel Initialized", jewel_name: self.name, jewel_id: self.id, is_owned: self.is_owned)
        end
    end

    class StatBuffingSoulJewel < SoulJewelBase
        property buff_type : Float64
        property buff_value : Float64

        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, description : String, sfx : SF::Sound, tier : Int8, base_monetary_value : Int64, required_lvl : Int32, jewel_type : String, buff_type : Float64, buff_value : Float64)
            super(name, id, is_owned, sprite, description, sfx, tier, base_monetary_value, required_lvl, jewel_type)
            @buff_type = buff_type
            @buff_value = buff_value
        end

        def buff_stat
            self.buff_type + self.buff_value
        end

        @@soul_dull_topaz = StatBuffingSoulJewel.new("Soul Dull Topaz", "soul_dull_topaz", false, SF::Sprite.new(SOUL_JEWEL_TEXTURE, SF::Rect.new(0, 0, 40, 40)), "A dull topaz jewel with little time left.", SoulJewelBase::DEFAULT_SOUL_JEWEL_EQUIP_SFX, 1_i8, 100_i64, 1, "topaz", Player::Stats.buff_int, 5.0)

        @@soul_topaz = StatBuffingSoulJewel.new("Soul Topaz", "soul_topaz", false, SF::Sprite.new(SOUL_JEWEL_TEXTURE, SF::Rect.new(0, 40, 40, 40)), "A topaz jewel imbued with a mediocre soul.", SoulJewelBase::DEFAULT_SOUL_JEWEL_EQUIP_SFX, 2_i8, 200_i64, 1, "topaz", Player::Stats.buff_int, 10.0)

        @@sparkling_soul_topaz = StatBuffingSoulJewel.new("Sparkling Soul Topaz", "sparkling_soul_topaz", false, SF::Sprite.new(SOUL_JEWEL_TEXTURE, SF::Rect.new(0, 80, 40, 40)), "A sparkling topaz jewel with a strong soul.", SoulJewelBase::DEFAULT_SOUL_JEWEL_EQUIP_SFX, 3_i8, 300_i64, 1, "topaz", Player::Stats.buff_int, 15.0)

        @@glowing_soul_topaz = StatBuffingSoulJewel.new("Glowing Soul Topaz", "glowing_soul_topaz", false, SF::Sprite.new(SOUL_JEWEL_TEXTURE, SF::Rect.new(0, 120, 40, 40)), "A glowing topaz jewel with a powerful soul.", SoulJewelBase::DEFAULT_SOUL_JEWEL_EQUIP_SFX, 4_i8, 400_i64, 1, "topaz", Player::Stats.buff_int, 20.0)


        @@soul_dull_peridot = StatBuffingSoulJewel.new("Soul Dull Peridot", "soul_dull_peridot", false, SF::Sprite.new(SOUL_JEWEL_TEXTURE, SF::Rect.new(120, 0, 40, 40)), "A dull peridot jewel with little time left.", SoulJewelBase::DEFAULT_SOUL_JEWEL_EQUIP_SFX, 1_i8, 100_i64, 1, "peridot", Player::Stats.buff_luk, 5.0)

        @@soul_peridot = StatBuffingSoulJewel.new("Soul Peridot", "soul_peridot", false, SF::Sprite.new(SOUL_JEWEL_TEXTURE, SF::Rect.new(120, 40, 40, 40)), "A peridot jewel imbued with a mediocre soul.", SoulJewelBase::DEFAULT_SOUL_JEWEL_EQUIP_SFX, 2_i8, 200_i64, 1, "peridot", Player::Stats.buff_luk, 10.0)

        @@sparkling_soul_peridot = StatBuffingSoulJewel.new("Sparkling Soul Peridot", "sparkling_soul_peridot", false, SF::Sprite.new(SOUL_JEWEL_TEXTURE, SF::Rect.new(120, 80, 40, 40)), "A sparkling peridot jewel with a strong soul.", SoulJewelBase::DEFAULT_SOUL_JEWEL_EQUIP_SFX, 3_i8, 300_i64, 1, "peridot", Player::Stats.buff_luk, 15.0)

        @@glowing_soul_peridot = StatBuffingSoulJewel.new("Glowing Soul Peridot", "glowing_soul_peridot", false, SF::Sprite.new(SOUL_JEWEL_TEXTURE, SF::Rect.new(120, 120, 40, 40)), "A glowing peridot jewel with a powerful soul.", SoulJewelBase::DEFAULT_SOUL_JEWEL_EQUIP_SFX, 4_i8, 400_i64, 1, "peridot", Player::Stats.buff_luk, 20.0)
    end
    class ProtectiveSoulJewel < SoulJewelBase
        property protection_type : String
        property protection_value : Float64

        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, description : String, sfx : SF::Sound, tier : Int8, base_monetary_value : Int64, required_lvl : Int32, jewel_type : String, protection_type : String, protection_value : Float64)
            super(name, id, is_owned, sprite, description, sfx, tier, base_monetary_value, required_lvl, jewel_type)
            @protection_type = protection_type
            @protection_value = protection_value
        end

        @@soul_dull_turquoise = ProtectiveSoulJewel.new("Soul Dull Turquoise", "soul_dull_turquoise", false, SF::Sprite.new(SOUL_JEWEL_TEXTURE, SF::Rect.new(40, 0, 40, 40)), "A dull turquoise jewel with little time left.", SoulJewelBase::DEFAULT_SOUL_JEWEL_EQUIP_SFX, 1_i8, 100_i64, 1, "turquoise", "physical", 5.0)

        @@soul_turquoise = ProtectiveSoulJewel.new("Soul Turquoise", "soul_turquoise", false, SF::Sprite.new(SOUL_JEWEL_TEXTURE, SF::Rect.new(40, 40, 40, 40)), "A turquoise jewel imbued with a mediocre soul.", SoulJewelBase::DEFAULT_SOUL_JEWEL_EQUIP_SFX, 2_i8, 200_i64, 1, "turquoise", "physical", 10.0)

        @@sparkling_soul_turquoise = ProtectiveSoulJewel.new("Sparkling Soul Turquoise", "sparkling_soul_turquoise", false, SF::Sprite.new(SOUL_JEWEL_TEXTURE, SF::Rect.new(40, 80, 40, 40)), "A sparkling turquoise jewel with a strong soul.", SoulJewelBase::DEFAULT_SOUL_JEWEL_EQUIP_SFX, 3_i8, 300_i64, 1, "turquoise", "physical", 15.0)

        @@glowing_soul_turquoise = ProtectiveSoulJewel.new("Glowing Soul Turquoise", "glowing_soul_turquoise", false, SF::Sprite.new(SOUL_JEWEL_TEXTURE, SF::Rect.new(40, 120, 40, 40)), "A glowing turquoise jewel with a powerful soul.", SoulJewelBase::DEFAULT_SOUL_JEWEL_EQUIP_SFX, 4_i8, 400_i64, 1, "turquoise", "physical", 20.0)
    end
    class ElementalSoulJewel < SoulJewelBase
        property element_type : String
        property element_value : Float64

        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, description : String, sfx : SF::Sound, tier : Int8, base_monetary_value : Int64, required_lvl : Int32, jewel_type : String, element_type : String, element_value : Float64)
            super(name, id, is_owned, sprite, description, sfx, tier, base_monetary_value, required_lvl, jewel_type)
            @element_type = element_type
            @element_value = element_value
        end

        @@soul_dull_fire_agate = ElementalSoulJewel.new("Soul Dull Fire Agate", "soul_dull_fire_agate", false, SF::Sprite.new(SOUL_JEWEL_TEXTURE, SF::Rect.new(80, 0, 40, 40)), "A dull fire agate jewel with little time left.", SoulJewelBase::DEFAULT_SOUL_JEWEL_EQUIP_SFX, 1_i8, 100_i64, 1, "fire_agate", "fire", 5.0)

        @@soul_fire_agate = ElementalSoulJewel.new("Soul Fire Agate", "soul_fire_agate", false, SF::Sprite.new(SOUL_JEWEL_TEXTURE, SF::Rect.new(80, 40, 40, 40)), "A fire agate jewel imbued with a mediocre soul.", SoulJewelBase::DEFAULT_SOUL_JEWEL_EQUIP_SFX, 2_i8, 200_i64, 1, "fire_agate", "fire", 10.0)

        @@sparkling_soul_fire_agate = ElementalSoulJewel.new("Sparkling Soul Fire Agate", "sparkling_soul_fire_agate", false, SF::Sprite.new(SOUL_JEWEL_TEXTURE, SF::Rect.new(80, 80, 40, 40)), "A sparkling fire agate jewel with a strong soul.", SoulJewelBase::DEFAULT_SOUL_JEWEL_EQUIP_SFX, 3_i8, 300_i64, 1, "fire_agate", "fire", 15.0)

        @@glowing_soul_fire_agate = ElementalSoulJewel.new("Glowing Soul Fire Agate", "glowing_soul_fire_agate", false, SF::Sprite.new(SOUL_JEWEL_TEXTURE, SF::Rect.new(80, 120, 40, 40)), "A glowing fire agate jewel with a powerful soul.", SoulJewelBase::DEFAULT_SOUL_JEWEL_EQUIP_SFX, 4_i8, 400_i64, 1, "fire_agate", "fire", 20.0)
    end
end