require "crsfml"
require "crsfml/audio"
require "../../../src/textures.cr"
require "../../../src/utility.cr"
require "../../../src/inventory/clothing/clothing.cr"
require "../../../graphics/color.cr"

module Shirt
    class ShirtBase < Clothing::ClothingBase
        include JSON::Serializable

        SHIRT_ARRAY = [] of ShirtBase
        OWNED_SHIRTS_ARRAY = [] of ShirtBase | Clothing::ClothingBase

        SHIRT_SPRITE_HASH = {} of String => SF::Sprite
        SHIRT_SFX_HASH = {} of String => SF::Sound

        DEFAULT_SHIRT_EQUIP_SFX = SFX::EquipSFX::FABRIC_EQUIP_01

        property name : String
        property id : String
        property is_owned : Bool
        property sprite : SF::Sprite?
        property color : String
        property sfx : SF::Sound?
        property sleeve_length : String

        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, color : String, sfx : SF::Sound, sleeve_length : String)
            @name = name
            @id = id
            @is_owned = is_owned
            @sprite = sprite
            @color = color
            @sfx = sfx
            @sleeve_length = sleeve_length

            SHIRT_ARRAY << self
            SHIRT_SPRITE_HASH[id] = sprite
            SHIRT_SFX_HASH[id] = sfx

            if self.is_owned && !OWNED_SHIRTS_ARRAY.any? { |owned_shirt| owned_shirt.id == self.id }
                OWNED_SHIRTS_ARRAY << self
                OWNED_SHIRTS_ARRAY.uniq!
            end
        end

        def self.swap_shirt(item : ShirtBase)
            if item.as(Shirt::ShirtBase).sfx != nil
                item.as(Shirt::ShirtBase).sfx.not_nil!.play
            else
                DEFAULT_SHIRT_EQUIP_SFX.play
            end
            
            if Player::Appearance.shirt != nil
                if Shirt::ShirtBase::OWNED_SHIRTS_ARRAY.none? { |owned_shirt| owned_shirt.id == Player::Appearance.shirt.as(Shirt::ShirtBase).id }
                    Shirt::ShirtBase::OWNED_SHIRTS_ARRAY << Player::Appearance.shirt.as(Shirt::ShirtBase)
                end
            end
            
            Player::Appearance.shirt = item.as(Shirt::ShirtBase)
            Shirt::ShirtBase::OWNED_SHIRTS_ARRAY.reject! { |owned_shirt| owned_shirt.id == item.as(Shirt::ShirtBase).id }
        end

        def self.swap_shirt_character_creation(direction : String, iterator : Int32)
            if ShirtBase::OWNED_SHIRTS_ARRAY.empty?
                return 0
            end
            if direction == "next"
                iterator += 1
            elsif direction == "previous"
                iterator -= 1
            end

            if iterator >= ShirtBase::OWNED_SHIRTS_ARRAY.size - 1
                iterator = 0
            elsif iterator < 0
                iterator = ShirtBase::OWNED_SHIRTS_ARRAY.size - 1
            end

            Player::Appearance.shirt = ShirtBase::OWNED_SHIRTS_ARRAY[iterator].as(ShirtBase)
            return iterator
        end

        def self.remove_current_shirt_from_inventory
            if Player::Appearance.shirt && Player::Appearance.shirt.as(Shirt::ShirtBase).id
                OWNED_SHIRTS_ARRAY.reject! { |owned_shirt| owned_shirt.id == Player::Appearance.shirt.as(Shirt::ShirtBase).id }
            end
        end
    end
    class TankTop < ShirtBase
        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, color : String, sfx : SF::Sound)
            super(name, id, is_owned, sprite, color, sfx, "very_short")
        end

        @@white_tank_top = TankTop.new("White Tank Top", "white_tank_top", true, SF::Sprite.new(TANK_TOP_WHITE_TEXTURE), "white", SFX::EquipSFX::FABRIC_EQUIP_01)

        @@grey_tank_top = TankTop.new("Grey Tank Top", "grey_tank_top", true, SF::Sprite.new(TANK_TOP_WHITE_TEXTURE), "grey", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@grey_tank_top.sprite.as(SF::Sprite).color = Color::ClothingColor::GREY

        @@black_tank_top = TankTop.new("Black Tank Top", "black_tank_top", true, SF::Sprite.new(TANK_TOP_WHITE_TEXTURE), "black", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@black_tank_top.sprite.as(SF::Sprite).color = Color::ClothingColor::BLACK

        @@tan_tank_top = TankTop.new("Tan Tank Top", "tan_tank_top", true, SF::Sprite.new(TANK_TOP_WHITE_TEXTURE), "tan", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@tan_tank_top.sprite.as(SF::Sprite).color = Color::ClothingColor::TAN

        @@brown_tank_top = TankTop.new("Brown Tank Top", "brown_tank_top", true, SF::Sprite.new(TANK_TOP_WHITE_TEXTURE), "brown", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@brown_tank_top.sprite.as(SF::Sprite).color = Color::ClothingColor::BROWN

        @@red_tank_top = TankTop.new("Red Tank Top", "red_tank_top", true, SF::Sprite.new(TANK_TOP_WHITE_TEXTURE), "red", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@red_tank_top.sprite.as(SF::Sprite).color = Color::ClothingColor::RED

        @@orange_tank_top = TankTop.new("Orange Tank Top", "orange_tank_top", true, SF::Sprite.new(TANK_TOP_WHITE_TEXTURE), "orange", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@orange_tank_top.sprite.as(SF::Sprite).color = Color::ClothingColor::ORANGE

        @@yellow_tank_top = TankTop.new("Yellow Tank Top", "yellow_tank_top", true, SF::Sprite.new(TANK_TOP_WHITE_TEXTURE), "yellow", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@yellow_tank_top.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW

        @@yellow_green_tank_top = TankTop.new("Yellow Green Tank Top", "yellow_green_tank_top", true, SF::Sprite.new(TANK_TOP_WHITE_TEXTURE), "yellow-green", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@yellow_green_tank_top.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW_GREEN

        @@green_tank_top = TankTop.new("Green Tank Top", "green_tank_top", true, SF::Sprite.new(TANK_TOP_WHITE_TEXTURE), "green", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@green_tank_top.sprite.as(SF::Sprite).color = Color::ClothingColor::GREEN

        @@turquoise_tank_top = TankTop.new("Turquoise Tank Top", "turquoise_tank_top", true, SF::Sprite.new(TANK_TOP_WHITE_TEXTURE), "turquoise", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@turquoise_tank_top.sprite.as(SF::Sprite).color = Color::ClothingColor::TURQUOISE

        @@light_blue_tank_top = TankTop.new("Light Blue Tank Top", "light_blue_tank_top", true, SF::Sprite.new(TANK_TOP_WHITE_TEXTURE), "light-blue", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@light_blue_tank_top.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_BLUE

        @@blue_tank_top = TankTop.new("Blue Tank Top", "blue_tank_top", true, SF::Sprite.new(TANK_TOP_WHITE_TEXTURE), "blue", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@blue_tank_top.sprite.as(SF::Sprite).color = Color::ClothingColor::BLUE

        @@indigo_tank_top = TankTop.new("Indigo Tank Top", "indigo_tank_top", true, SF::Sprite.new(TANK_TOP_WHITE_TEXTURE), "indigo", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@indigo_tank_top.sprite.as(SF::Sprite).color = Color::ClothingColor::INDIGO

        @@light_purple_tank_top = TankTop.new("Light Purple Tank Top", "light_purple_tank_top", true, SF::Sprite.new(TANK_TOP_WHITE_TEXTURE), "light-purple", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@light_purple_tank_top.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_PURPLE

        @@purple_tank_top = TankTop.new("Purple Tank Top", "purple_tank_top", true, SF::Sprite.new(TANK_TOP_WHITE_TEXTURE), "purple", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@purple_tank_top.sprite.as(SF::Sprite).color = Color::ClothingColor::PURPLE

        @@pink_tank_top = TankTop.new("Pink Tank Top", "pink_tank_top", true, SF::Sprite.new(TANK_TOP_WHITE_TEXTURE), "pink", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@pink_tank_top.sprite.as(SF::Sprite).color = Color::ClothingColor::PINK

        @@hot_pink_tank_top = TankTop.new("Hot Pink Tank Top", "hot_pink_tank_top", true, SF::Sprite.new(TANK_TOP_WHITE_TEXTURE), "hot-pink", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@hot_pink_tank_top.sprite.as(SF::Sprite).color = Color::ClothingColor::HOT_PINK

    end
    class T_Shirt < ShirtBase
        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, color : String, sfx : SF::Sound)
            super(name, id, is_owned, sprite, color, sfx, "short")
        end

        @@white_tshirt = T_Shirt.new("White T-Shirt", "white_tshirt", true, SF::Sprite.new(T_SHIRT_WHITE_TEXTURE), "white", SFX::EquipSFX::FABRIC_EQUIP_01)

        @@grey_tshirt = T_Shirt.new("Grey T-Shirt", "grey_tshirt", true, SF::Sprite.new(T_SHIRT_WHITE_TEXTURE), "grey", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@grey_tshirt.sprite.as(SF::Sprite).color = Color::ClothingColor::GREY

        @@black_tshirt = T_Shirt.new("Black T-Shirt", "black_tshirt", true, SF::Sprite.new(T_SHIRT_WHITE_TEXTURE), "black", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@black_tshirt.sprite.as(SF::Sprite).color = Color::ClothingColor::BLACK

        @@tan_tshirt = T_Shirt.new("Tan T-Shirt", "tan_tshirt", true, SF::Sprite.new(T_SHIRT_WHITE_TEXTURE), "tan", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@tan_tshirt.sprite.as(SF::Sprite).color = Color::ClothingColor::TAN

        @@brown_tshirt = T_Shirt.new("Brown T-Shirt", "brown_tshirt", true, SF::Sprite.new(T_SHIRT_WHITE_TEXTURE), "brown", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@brown_tshirt.sprite.as(SF::Sprite).color = Color::ClothingColor::BROWN

        @@red_tshirt = T_Shirt.new("Red T-Shirt", "red_tshirt", true, SF::Sprite.new(T_SHIRT_WHITE_TEXTURE), "red", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@red_tshirt.sprite.as(SF::Sprite).color = Color::ClothingColor::RED

        @@orange_tshirt = T_Shirt.new("Orange T-Shirt", "orange_tshirt", true, SF::Sprite.new(T_SHIRT_WHITE_TEXTURE), "orange", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@orange_tshirt.sprite.as(SF::Sprite).color = Color::ClothingColor::ORANGE

        @@yellow_tshirt = T_Shirt.new("Yellow T-Shirt", "yellow_tshirt", true, SF::Sprite.new(T_SHIRT_WHITE_TEXTURE), "yellow", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@yellow_tshirt.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW

        @@yellow_green_tshirt = T_Shirt.new("Yellow Green T-Shirt", "yellow_green_tshirt", true, SF::Sprite.new(T_SHIRT_WHITE_TEXTURE), "yellow-green", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@yellow_green_tshirt.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW_GREEN

        @@green_tshirt = T_Shirt.new("Green T-Shirt", "green_tshirt", true, SF::Sprite.new(T_SHIRT_WHITE_TEXTURE), "green", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@green_tshirt.sprite.as(SF::Sprite).color = Color::ClothingColor::GREEN

        @@turquoise_tshirt = T_Shirt.new("Turquoise T-Shirt", "turquoise_tshirt", true, SF::Sprite.new(T_SHIRT_WHITE_TEXTURE), "turquoise", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@turquoise_tshirt.sprite.as(SF::Sprite).color = Color::ClothingColor::TURQUOISE

        @@light_blue_tshirt = T_Shirt.new("Light Blue T-Shirt", "light_blue_tshirt", true, SF::Sprite.new(T_SHIRT_WHITE_TEXTURE), "light-blue", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@light_blue_tshirt.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_BLUE

        @@blue_tshirt = T_Shirt.new("Blue T-Shirt", "blue_tshirt", true, SF::Sprite.new(T_SHIRT_WHITE_TEXTURE), "blue", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@blue_tshirt.sprite.as(SF::Sprite).color = Color::ClothingColor::BLUE

        @@indigo_tshirt = T_Shirt.new("Indigo T-Shirt", "indigo_tshirt", true, SF::Sprite.new(T_SHIRT_WHITE_TEXTURE), "indigo", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@indigo_tshirt.sprite.as(SF::Sprite).color = Color::ClothingColor::INDIGO

        @@light_purple_tshirt = T_Shirt.new("Light Purple T-Shirt", "light_purple_tshirt", true, SF::Sprite.new(T_SHIRT_WHITE_TEXTURE), "light-purple", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@light_purple_tshirt.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_PURPLE

        @@purple_tshirt = T_Shirt.new("Purple T-Shirt", "purple_tshirt", true, SF::Sprite.new(T_SHIRT_WHITE_TEXTURE), "purple", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@purple_tshirt.sprite.as(SF::Sprite).color = Color::ClothingColor::PURPLE

        @@pink_tshirt = T_Shirt.new("Pink T-Shirt", "pink_tshirt", true, SF::Sprite.new(T_SHIRT_WHITE_TEXTURE), "pink", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@pink_tshirt.sprite.as(SF::Sprite).color = Color::ClothingColor::PINK

        @@hot_pink_tshirt = T_Shirt.new("Hot Pink T-Shirt", "hot_pink_tshirt", true, SF::Sprite.new(T_SHIRT_WHITE_TEXTURE), "hot-pink", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@hot_pink_tshirt.sprite.as(SF::Sprite).color = Color::ClothingColor::HOT_PINK
    end
    class TubeTop < ShirtBase
        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, color : String, sfx : SF::Sound)
            super(name, id, is_owned, sprite, color, sfx, "none")
        end

        @@white_tubetop = TubeTop.new("White Tube Top", "white_tubetop", true, SF::Sprite.new(WHITE_TUBE_TOP_TEXTURE), "white", SFX::EquipSFX::FABRIC_EQUIP_01)

        @@grey_tubetop = TubeTop.new("Grey Tube Top", "grey_tubetop", true, SF::Sprite.new(WHITE_TUBE_TOP_TEXTURE), "grey", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@grey_tubetop.sprite.as(SF::Sprite).color = Color::ClothingColor::GREY

        @@black_tubetop = TubeTop.new("Black Tube Top", "black_tubetop", true, SF::Sprite.new(WHITE_TUBE_TOP_TEXTURE), "black", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@black_tubetop.sprite.as(SF::Sprite).color = Color::ClothingColor::BLACK

        @@tan_tubetop = TubeTop.new("Tan Tube Top", "tan_tubetop", true, SF::Sprite.new(WHITE_TUBE_TOP_TEXTURE), "tan", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@tan_tubetop.sprite.as(SF::Sprite).color = Color::ClothingColor::TAN

        @@brown_tubetop = TubeTop.new("Brown Tube Top", "brown_tubetop", true, SF::Sprite.new(WHITE_TUBE_TOP_TEXTURE), "brown", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@brown_tubetop.sprite.as(SF::Sprite).color = Color::ClothingColor::BROWN

        @@red_tubetop = TubeTop.new("Red Tube Top", "red_tubetop", true, SF::Sprite.new(WHITE_TUBE_TOP_TEXTURE), "red", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@red_tubetop.sprite.as(SF::Sprite).color = Color::ClothingColor::RED

        @@orange_tubetop = TubeTop.new("Orange Tube Top", "orange_tubetop", true, SF::Sprite.new(WHITE_TUBE_TOP_TEXTURE), "orange", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@orange_tubetop.sprite.as(SF::Sprite).color = Color::ClothingColor::ORANGE

        @@yellow_tubetop = TubeTop.new("Yellow Tube Top", "yellow_tubetop", true, SF::Sprite.new(WHITE_TUBE_TOP_TEXTURE), "yellow", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@yellow_tubetop.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW

        @@yellow_green_tubetop = TubeTop.new("Yellow Green Tube Top", "yellow_green_tubetop", true, SF::Sprite.new(WHITE_TUBE_TOP_TEXTURE), "yellow-green", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@yellow_green_tubetop.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW_GREEN

        @@green_tubetop = TubeTop.new("Green Tube Top", "green_tubetop", true, SF::Sprite.new(WHITE_TUBE_TOP_TEXTURE), "green", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@green_tubetop.sprite.as(SF::Sprite).color = Color::ClothingColor::GREEN

        @@turquoise_tubetop = TubeTop.new("Turquoise Tube Top", "turquoise_tubetop", true, SF::Sprite.new(WHITE_TUBE_TOP_TEXTURE), "turquoise", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@turquoise_tubetop.sprite.as(SF::Sprite).color = Color::ClothingColor::TURQUOISE

        @@light_blue_tubetop = TubeTop.new("Light Blue Tube Top", "light_blue_tubetop", true, SF::Sprite.new(WHITE_TUBE_TOP_TEXTURE), "light-blue", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@light_blue_tubetop.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_BLUE

        @@blue_tubetop = TubeTop.new("Blue Tube Top", "blue_tubetop", true, SF::Sprite.new(WHITE_TUBE_TOP_TEXTURE), "blue", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@blue_tubetop.sprite.as(SF::Sprite).color = Color::ClothingColor::BLUE

        @@indigo_tubetop = TubeTop.new("Indigo Tube Top", "indigo_tubetop", true, SF::Sprite.new(WHITE_TUBE_TOP_TEXTURE), "indigo", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@indigo_tubetop.sprite.as(SF::Sprite).color = Color::ClothingColor::INDIGO

        @@light_purple_tubetop = TubeTop.new("Light Purple Tube Top", "light_purple_tubetop", true, SF::Sprite.new(WHITE_TUBE_TOP_TEXTURE), "light-purple", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@light_purple_tubetop.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_PURPLE

        @@purple_tubetop = TubeTop.new("Purple Tube Top", "purple_tubetop", true, SF::Sprite.new(WHITE_TUBE_TOP_TEXTURE), "purple", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@purple_tubetop.sprite.as(SF::Sprite).color = Color::ClothingColor::PURPLE

        @@pink_tubetop = TubeTop.new("Pink Tube Top", "pink_tubetop", true, SF::Sprite.new(WHITE_TUBE_TOP_TEXTURE), "pink", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@pink_tubetop.sprite.as(SF::Sprite).color = Color::ClothingColor::PINK

        @@hot_pink_tubetop = TubeTop.new("Hot Pink Tube Top", "hot_pink_tubetop", true, SF::Sprite.new(WHITE_TUBE_TOP_TEXTURE), "hot-pink", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@hot_pink_tubetop.sprite.as(SF::Sprite).color = Color::ClothingColor::HOT_PINK
    end
    class LayeredShirt < ShirtBase
        def initialize(name : String, id : String, is_owned : Bool, sprite : SF::Sprite, color : String, sfx : SF::Sound)
            super(name, id, is_owned, sprite, color, sfx, "long")
        end

        @@white_layered_shirt = LayeredShirt.new("White Layered Shirt", "white_layered_shirt", true, SF::Sprite.new(WHITE_LAYERED_SHIRT_TEXTURE), "white", SFX::EquipSFX::FABRIC_EQUIP_01)

        @@grey_layered_shirt = LayeredShirt.new("Grey Layered Shirt", "grey_layered_shirt", true, SF::Sprite.new(WHITE_LAYERED_SHIRT_TEXTURE), "grey", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@grey_layered_shirt.sprite.as(SF::Sprite).color = Color::ClothingColor::GREY

        @@black_layered_shirt = LayeredShirt.new("Black Layered Shirt", "black_layered_shirt", true, SF::Sprite.new(WHITE_LAYERED_SHIRT_TEXTURE), "black", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@black_layered_shirt.sprite.as(SF::Sprite).color = Color::ClothingColor::BLACK

        @@tan_layered_shirt = LayeredShirt.new("Tan Layered Shirt", "tan_layered_shirt", true, SF::Sprite.new(WHITE_LAYERED_SHIRT_TEXTURE), "tan", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@tan_layered_shirt.sprite.as(SF::Sprite).color = Color::ClothingColor::TAN

        @@brown_layered_shirt = LayeredShirt.new("Brown Layered Shirt", "brown_layered_shirt", true, SF::Sprite.new(WHITE_LAYERED_SHIRT_TEXTURE), "brown", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@brown_layered_shirt.sprite.as(SF::Sprite).color = Color::ClothingColor::BROWN

        @@red_layered_shirt = LayeredShirt.new("Red Layered Shirt", "red_layered_shirt", true, SF::Sprite.new(WHITE_LAYERED_SHIRT_TEXTURE), "red", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@red_layered_shirt.sprite.as(SF::Sprite).color = Color::ClothingColor::RED

        @@orange_layered_shirt = LayeredShirt.new("Orange Layered Shirt", "orange_layered_shirt", true, SF::Sprite.new(WHITE_LAYERED_SHIRT_TEXTURE), "orange", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@orange_layered_shirt.sprite.as(SF::Sprite).color = Color::ClothingColor::ORANGE

        @@yellow_layered_shirt = LayeredShirt.new("Yellow Layered Shirt", "yellow_layered_shirt", true, SF::Sprite.new(WHITE_LAYERED_SHIRT_TEXTURE), "yellow", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@yellow_layered_shirt.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW

        @@yellow_green_layered_shirt = LayeredShirt.new("Yellow Green Layered Shirt", "yellow_green_layered_shirt", true, SF::Sprite.new(WHITE_LAYERED_SHIRT_TEXTURE), "yellow-green", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@yellow_green_layered_shirt.sprite.as(SF::Sprite).color = Color::ClothingColor::YELLOW_GREEN

        @@green_layered_shirt = LayeredShirt.new("Green Layered Shirt", "green_layered_shirt", true, SF::Sprite.new(WHITE_LAYERED_SHIRT_TEXTURE), "green", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@green_layered_shirt.sprite.as(SF::Sprite).color = Color::ClothingColor::GREEN

        @@turquoise_layered_shirt = LayeredShirt.new("Turquoise Layered Shirt", "turquoise_layered_shirt", true, SF::Sprite.new(WHITE_LAYERED_SHIRT_TEXTURE), "turquoise", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@turquoise_layered_shirt.sprite.as(SF::Sprite).color = Color::ClothingColor::TURQUOISE

        @@light_blue_layered_shirt = LayeredShirt.new("Light Blue Layered Shirt", "light_blue_layered_shirt", true, SF::Sprite.new(WHITE_LAYERED_SHIRT_TEXTURE), "light-blue", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@light_blue_layered_shirt.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_BLUE

        @@blue_layered_shirt = LayeredShirt.new("Blue Layered Shirt", "blue_layered_shirt", true, SF::Sprite.new(WHITE_LAYERED_SHIRT_TEXTURE), "blue", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@blue_layered_shirt.sprite.as(SF::Sprite).color = Color::ClothingColor::BLUE

        @@indigo_layered_shirt = LayeredShirt.new("Indigo Layered Shirt", "indigo_layered_shirt", true, SF::Sprite.new(WHITE_LAYERED_SHIRT_TEXTURE), "indigo", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@indigo_layered_shirt.sprite.as(SF::Sprite).color = Color::ClothingColor::INDIGO

        @@light_purple_layered_shirt = LayeredShirt.new("Light Purple Layered Shirt", "light_purple_layered_shirt", true, SF::Sprite.new(WHITE_LAYERED_SHIRT_TEXTURE), "light-purple", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@light_purple_layered_shirt.sprite.as(SF::Sprite).color = Color::ClothingColor::LIGHT_PURPLE

        @@purple_layered_shirt = LayeredShirt.new("Purple Layered Shirt", "purple_layered_shirt", true, SF::Sprite.new(WHITE_LAYERED_SHIRT_TEXTURE), "purple", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@purple_layered_shirt.sprite.as(SF::Sprite).color = Color::ClothingColor::PURPLE

        @@pink_layered_shirt = LayeredShirt.new("Pink Layered Shirt", "pink_layered_shirt", true, SF::Sprite.new(WHITE_LAYERED_SHIRT_TEXTURE), "pink", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@pink_layered_shirt.sprite.as(SF::Sprite).color = Color::ClothingColor::PINK

        @@hot_pink_layered_shirt = LayeredShirt.new("Hot Pink Layered Shirt", "hot_pink_layered_shirt", true, SF::Sprite.new(WHITE_LAYERED_SHIRT_TEXTURE), "hot-pink", SFX::EquipSFX::FABRIC_EQUIP_01)
        @@hot_pink_layered_shirt.sprite.as(SF::Sprite).color = Color::ClothingColor::HOT_PINK
    end
end