require "../src/textures.cr"

Module Player
  Class Stats
     def initialize(name : String, max_hp : Float64, current_hp : Float64, max_mp : Float64, current_mp : Float64, exp : Float64, defense : Float64, str : Float64, dex : Float64, luk : Float64, int : Float64)
        @name = name
        @@name = name
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
     end

     def name
        @name
     end

     def max_hp 
        @max_hp
     end

     def current_hp
        @max_hp
     end

     def max_mp 
        @max_mp
     end

     def current_mp
        @current_mp
     end

     def exp
        @exp
     end

     def defense
        @defense
     end

     def str
        @str
     end
     
     def dex
        @dex
     end

     def luk
        @luk
     end

     def int
        @int
     end

     def Stats.name=(this)
        name = this
        @@name = this
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

 end
end