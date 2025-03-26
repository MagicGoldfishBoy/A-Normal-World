require "../src/textures.cr"
require "../src/sprites.cr"
require "../src/effects.cr"

module Player
  class Stats
     def initialize(name : String, money : Int32, max_hp : Float64, current_hp : Float64, buff_hp : Float64,
        max_mp : Float64, current_mp : Float64, buff_mp : Float64, lvl : Int32, exp : Float64, exp_cap : Float64, 
        defense : Float64, buff_defense : Float64, str : Float64, buff_str : Float64, dex : Float64, buff_dex : Float64,
        luk : Float64, buff_luk : Float64, int : Float64, buff_int : Float64, lvl_points : Int32, status_effects : Array(Effects_Base))
        @name = name
        @money = money

        @max_hp = max_hp
        @current_hp = current_hp
        @buff_hp = buff_hp

        @max_mp = max_mp
        @current_mp = current_mp
        @buff_mp = buff_mp

        @exp = exp
        @exp_cap = exp_cap
        @lvl = lvl

        @defense = defense
        @buff_defense = buff_defense

        @str = str
        @buff_str = buff_str

        @dex = dex
        @buff_dex = buff_dex

        @luk = luk
        @buff_luk = buff_luk

        @int = int
        @buff_int = buff_int

        @lvl_points = lvl_points

        @status_effects = status_effects
     end

     class_property name : String = "doll-3001"

     class_property money : Int32 = 0

     class_property current_hp : Float64 = 10
     class_property max_hp : Float64 = 10
     class_property buff_hp : Float64 = 0

     class_property current_mp : Float64 = 10
     class_property max_mp : Float64 = 10
     class_property buff_mp : Float64 = 0

     class_property lvl : Int32 = 1

     class_property exp : Float64 = 0
     class_property exp_cap : Float64 = 10

     class_property defense : Float64 = 5
     class_property buff_defense : Float64 = 0

     class_property str : Float64 = 5
     class_property buff_str : Float64 = 0

     class_property dex : Float64 = 5
     class_property buff_dex : Float64 = 0

     class_property luk : Float64 = 5
     class_property buff_luk : Float64 = 0

     class_property int : Float64 = 5
     class_property buff_int : Float64 = 0

     class_property lvl_points : Int32 = 0

     class_property status_effects : Array(Effects::Effects_Base) = [] of Effects::Effects_Base

     def self.check_status_effects(window)
        status_effects.each do |effect|
            if effect.is_active == true
                effect.apply
            end
        end
     end
 end

  class Movement
    def initialize(movement_state : String, movement_speed : Float64, movement_direction : String)
        @@movement_state = movement_state
        @@movement_speed = movement_speed
        @@movement_direction = movement_direction
    end

    def Movement.movement_state
        @@movement_state
    end

    def Movement.movement_speed
        @@movement_speed
    end

    def Movement.movement_direction
        @@movement_direction
    end

    def Movement.movement_state=(this)
        @@movement_state = this
    end

    def Movement.movement_speed=(this)
        @@movement_speed = this
    end

    def Movement.movement_direction=(this)
        @@movement_direction = this
    end

    def Movement.move_horizontal(window, direction)
        Movement.movement_direction = direction
        Stats.dex ||= 5
        Movement.movement_speed = Stats.dex.to_s.to_f? || 0.0
        Movement.movement_speed = Movement.movement_speed.not_nil! / 2
      
        if direction == "left"
          Sprites::Player.move_player_sprite(window, -Movement.movement_speed.not_nil!, 0)
        end
        if direction == "right"
          Sprites::Player.move_player_sprite(window, Movement.movement_speed.not_nil!, 0)
        end
      end
  end

  class Appearance
    def initialize(skin : String, hair : String, face : String, hat : String, glasses : String, earrings : String, shirt : String, gloves : String, pants : String, 
        shoes : String, socks : String, makeup : String, necklace : String, jacket : String, weapon : String)
        @skin = skin
        @@skin = skin
        @hair = hair
        @@hair = hair
        @face = face
        @@face = face
        @hat = hat
        @@hat = hat
        @glasses = glasses
        @@glasses = glasses
        @earrings = earrings
        @@earrings = earrings
        @shirt = shirt
        @@shirt = shirt
        @gloves = gloves
        @@gloves = gloves
        @pants = pants
        @@pants = pants
        @shoes = shoes
        @@shoes = shoes
        @socks = socks
        @@socks = socks
        @makeup = makeup
        @@makeup = makeup
        @necklace = necklace
        @@necklace = necklace
        @jacket = jacket
        @@jacket = jacket
        @weapon = weapon
        @@weapon = weapon
    end

    class_property skin : String = "pale_skin"

    class_property hair : String = "Black Shounen Hair"

    class_property face : String = "Blue Button Eyes"

    class_property hat : String = "No Hat"

    class_property glasses : String = "No Glasses"

    class_property earrings : String = "No Earrings"

    class_property shirt : String = "Yellow T-Shirt"

    class_property gloves : String = "No Gloves"

    class_property pants : String = "Blue Jeans"

    class_property shoes : String = "Red Rain Boots"

    class_property socks : String = "W/Socks"

    class_property makeup : String = "No Makeup"

    class_property necklace : String = "No Necklace"

    class_property jacket : String = "No Jacket"

    class_property weapon : String = "No Weapon"

    def Appearance.initialize_player_model
        @@skin = "pale_skin"
        @@hair = "Black Shounen Hair"
        @@face = "Pink Shounen Eyes"
        @@hat = "No Hat"
        @@earrings = "No Earrings"
        @@shirt = "White Tank Top"
        @@gloves = "No Gloves"
        @@pants = "White Jeans"
        @@shoes = "white Sneakers"
        @@socks = "W/Socks"
        @@makeup = "No Makeup"
        @@necklace = "No Necklace"
        @@glasses = "No Glasses"
        @@jacket = "No Jacket"
        @@weapon = "Stick"
    end

    def Appearance.get_clothing(this)
        case this
        when "skin"
            return @@skin
        when "hair"
            return @@hair
        when "face"
            return @@face
        when "hat"
            return @@hat
        when "earrings"
            return @@earrings
        when "shirt"
            return @@shirt
        when "gloves"
            return @@gloves
        when "pants"
            return @@pants
        when "shoes"
            return @@shoes
        when "socks"
            return @@socks
        when "glasses"
            return @@glasses
        when "makeup"
            return @@makeup
        when "necklace"
            return @@necklace
        when "jacket"
            return @@jacket
        when "weapon"
            return @@weapon
        end
    end

    def Appearance.change_skin(skin)
        @@skin = skin
    end

    def Appearance.change_hair(hair)
        @@hair = hair
    end

    def Appearance.change_face(face)
        @@face = face
    end

    def Appearance.change_hat(hat)
        @@hat = hat
    end

    def Appearance.change_glasses(glasses)
        @@glasses = glasses
    end

    def Appearance.change_makeup(makeup)
        @@makeup = makeup
    end

    def Appearance.change_necklace(necklace)
        @@necklace = necklace
    end

    def Appearance.change_jacket(jacket)
        @@jacket = jacket
    end

    def Appearance.change_earrings(earrings)
        @@earrings = earrings
    end

    def Appearance.change_shirt(shirt)
        @@shirt = shirt
    end

    def Appearance.change_pants(pants)
        @@pants = pants
    end

    def Appearance.change_shoes(shoes)
        @@shoes = shoes
    end

    def Appearance.change_socks(socks)
        @@socks = socks
    end

    def Appearance.change_weapon(weapon)
        @@weapon = weapon
    end

    def Appearance.change_gloves(gloves)
        @@gloves = gloves
    end
 end
end