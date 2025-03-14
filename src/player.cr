require "../src/textures.cr"
require "../src/sprites.cr"

module Player
  class Stats
     def initialize(name : String, money : Int32, max_hp : Float64, current_hp : Float64, max_mp : Float64, current_mp : Float64, lvl : Int32, 
        exp : Float64, exp_cap : Float64, defense : Float64, str : Float64, dex : Float64, luk : Float64, int : Float64, lvl_points : Int32)
        @name = name
        @@name = name
        @money = money
        @@money = money
        @max_hp = max_hp
        @@max_hp = max_hp
        @current_hp = current_hp
        @@current_hp = current_hp
        @max_mp = max_mp
        @@max_mp = max_mp
        @current_mp = current_mp
        @@current_mp = current_mp
        @exp = exp
        @@exp = exp
        @exp_cap = exp_cap
        @@exp_cap = exp_cap
        @lvl = lvl
        @@lvl = lvl
        @defense = defense
        @@defense = defense
        @str = str
        @@str = str
        @dex = dex
        @@dex = dex
        @luk = luk
        @@luk = luk
        @int = int
        @@int = int
        @lvl_points = lvl_points
        @@lvl_points = lvl_points
     end

     def Stats.name
        @@name
     end

     def Stats.money
        @@money
     end

     def Stats.max_hp 
        @@max_hp
     end

     def Stats.current_hp
        @@current_hp
     end

     def Stats.max_mp 
        @@max_mp
     end

     def Stats.current_mp
        @@current_mp
     end

     def Stats.exp
        @@exp
     end

     def Stats.exp_cap
        @@exp_cap
     end

     def Stats.lvl
        @@lvl
     end

     def Stats.defense
        @@defense
     end

     def Stats.str
        @@str
     end
     
     def Stats.dex
        @@dex
     end

     def Stats.luk
        @@luk
     end

     def Stats.int
        @@int
     end

     def Stats.lvl_points
        @@lvl_points
     end

     def Stats.name=(this)
        name = this
        @@name = this
     end

     def Stats.money=(this)
        money = this
        @@money = this
     end

     def Stats.max_hp=(this)
       max_hp = this
       @@max_hp = this
     end

     def Stats.current_hp=(this)
       current_hp = this
       @@current_hp = this
     end

     def Stats.max_mp=(this)
       max_mp = this
       @@max_mp = this
     end

     def Stats.current_mp=(this)
       current_mp = this
       @@current_mp = this
     end

     def Stats.exp=(this)
       exp = this
       @@exp = this
     end

     def Stats.exp_cap=(this)
        exp_cap = this
       @@exp_cap = this
     end

     def Stats.lvl=(this)
        lvl = this
       @@lvl = this
     end

     def Stats.defense=(this)
       defense = this
       @@defense = this
     end

     def Stats.str=(this)
       str = this
       @@str = this
     end

     def Stats.dex=(this)
       dex = this
       @@dex = this
     end

     def Stats.luk=(this)
       luk = this
       @@luk = this
     end

     def Stats.int=(this)
       int = this
       @@int = this
     end

     def Stats.lvl_points=(this)
        lvl_points = this
       @@lvl_points = this
     end

     def Stats.initialize_player_stats
        Stats.name=("doll-3001")
        Stats.money=(0)
        Stats.max_hp=(10)
        Stats.current_hp=(10)
        Stats.max_mp=(7)
        Stats.current_mp=(7)
        Stats.lvl=(1)
        Stats.exp=(0)
        Stats.exp_cap=(10)
        Stats.defense=(5)
        Stats.str=(5)
        Stats.dex=(5)
        Stats.luk=(5)
        Stats.int=(5)
        Stats.lvl_points=(0)
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
        shoes : String, makeup : String, weapon : String)
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
        @makeup = makeup
        @@makeup = makeup
        @weapon = weapon
        @@weapon = weapon
    end

    def skin
        @skin
    end

    def hair
        @hair
    end

    def face
        @face
    end

    def hat
        @hat
    end

    def glasses
        @glasses
    end

    def earrings
        @earrings
    end

    def shirt
        @shirt
    end

    def gloves
        @gloves
    end

    def pants
        @pants
    end

    def shoes
        @shoes
    end

    def makeup
        @makeup
    end

    def weapon
        @weapon
    end

    def Appearance.initialize_player_model
        @@skin = "pale_skin"
        @@hair = "black_shounen_hair"
        @@face = "Blue Shounen Eyes"
        @@hat = "No Hat"
        @@earrings = "nil"
        @@shirt = "White Tank Top"
        @@gloves = "nil"
        @@pants = "White Jeans"
        @@shoes = "white Sneakers"
        @@makeup = "No Makeup"
        @@glasses = "No Glasses"
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
        when "glasses"
            return @@glasses
        when "makeup"
            return @@makeup
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

    def Appearance.change_weapon(weapon)
        @@weapon = weapon
    end

    def Appearance.change_gloves(gloves)
        @@gloves = gloves
    end
 end
end