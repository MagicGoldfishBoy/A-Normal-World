require "log"
require "json"

module OreDropTables
  abstract class OreDropTableBase
    include JSON::Serializable
    Log = ::Log.for("ore_drop_table")

    property id : String
    property drop_table : Array(String)
    property chance_table : Array(Float64)

    ORE_DROP_TABLES_ARRAY = [] of OreDropTableBase
    ORE_DROP_TABLES_LIST = [] of Tuple(String, Float64)

    def initialize(id : String, drop_table : Array(String), chance_table : Array(Float64))
      @id = id
      @drop_table = drop_table
      @chance_table = chance_table

      ORE_DROP_TABLES_ARRAY << self

      drop_table.zip(chance_table).each do |drop, chance|
        ORE_DROP_TABLES_LIST << {drop, chance}
      end

      Log.info &.emit("Ore Drop Table Initialized", id: self.id, drop_table: self.drop_table)

      save = SaveData.new(drop_table.zip(chance_table))
      path = "#{id}.json"

      Dir.mkdir_p(File.dirname(path))
      File.write(path, save.to_json, mode: "w")
      Log.info &.emit("Created Drop Table", file: path)
    end
  end

  struct SaveData
    include JSON::Serializable

    property ore_drop_table : Array(Tuple(String, Float64))

    def initialize(ore_drop_table : Array(Tuple(String, Float64)))
      @ore_drop_table = ore_drop_table
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
