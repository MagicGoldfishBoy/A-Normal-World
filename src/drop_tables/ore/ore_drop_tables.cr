require "log"
require "json"
# require "crsfml"
# require "crsfml/audio"

module OreDropTables
   abstract class OreDropTableBase
       include JSON::Serializable
       Log = ::Log.for("ore_drop_table")

       property id : String
       property drop_table : Array(String)
       property chance_table : Array(Float64)

       ORE_DROP_TABLES_ARRAY = [] of OreDropTableBase

       def initialize(id : String, drop_table : Array(String), chance_table : Array(Float64))
           @id = id
           @drop_table = drop_table
           @chance_table = chance_table

           ORE_DROP_TABLES_ARRAY << self
           Log.info &.emit("Ore Drop Table Initialized", id: self.id, drop_table: self.drop_table)
       end
    end
    class CommonOreTables < OreDropTableBase
        def initialize(id : String, drop_table : Array(String), chance_table : Array(Float64))
            super(id, drop_table, chance_table)
        end

        @@turquoise_ore_drop_table = CommonOreTables.new("turquoise_ore_01", ["turquoise_ore", "turquoise_ore"], [100.0, 5.0])
        @@quartz_ore_drop_table = CommonOreTables.new("quartz_ore_01", ["quartz_ore", "quartz_ore"], [100.0, 5.0])
    end
end