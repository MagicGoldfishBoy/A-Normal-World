require "log"
require "json"

abstract class OreDropTableBase
  include JSON::Serializable

  property id : String
  property drop_table : Array(Tuple(String, Float64))

  Log = ::Log.for("ore_drop_table")

  def initialize(@id : String, @drop_table : Array(Tuple(String, Float64)))
  end


  def save_to_file(path : String)
    File.write(path, self.to_pretty_json)
  end
end


class CommonOreTables < OreDropTableBase
  @@tables = [] of CommonOreTables

  def initialize(id : String, drop_table : Array(Tuple(String, Float64)))
    super(id, drop_table)
    @@tables << self
  end


  def self.all : Array(CommonOreTables)
    @@tables
  end


  def self.save_all(folder : String)
    Dir.mkdir_p(folder)
    all.each do |table|
      filename = File.join(folder, "#{table.id}.json")
      table.save_to_file(filename)
      Log.info &.emit("Created Drop Table", file: filename)
    end
  end
end


CommonOreTables.new("turquoise_ore_01",
  [ {"turquoise_ore", 100.0}, {"turquoise_ore", 5.0} ]
)

CommonOreTables.new("quartz_ore_01",
  [ {"quartz_ore", 100.0}, {"quartz_ore", 5.0} ]
)


CommonOreTables.save_all("generated_drop_tables")



# require "json"

# # --- same structs as before ---
# struct LootEntry
#   include JSON::Serializable
#   property type : String
#   property name : String
#   property weight : Int32
# end

# struct LootPool
#   include JSON::Serializable
#   property rolls : Int32
#   property entries : Array(LootEntry)
# end

# struct LootTable
#   include JSON::Serializable
#   property type : String
#   property pools : Array(LootPool)
# end

# # --- helper to read a JSON file ---
# def load_loot_table(path : String) : LootTable
#   content = File.read(path)
#   LootTable.from_json(content)
# end

# # --- example usage ---
# turquoise = load_loot_table("generated_loot_tables/turquoise_ore.json")

# puts "Loot table for #{turquoise.pools[0].entries[0].name}:"
# turquoise.pools[0].entries.each do |entry|
#   puts "- #{entry.name} (weight #{entry.weight})"
# end




# module OreDropTables
#   abstract class OreDropTableBase
#     include JSON::Serializable
#     Log = ::Log.for("ore_drop_table")

#     property id : String
#     property drop_table : Array(Tuple(String, Float64))

#     ORE_DROP_TABLES_ARRAY = [] of OreDropTableBase
#     ORE_DROP_TABLES_LIST = [] of Tuple(String, Float64)

#     def initialize(id : String, drop_table : Array(Tuple(String, Float64)))
#       @id = id
#       @drop_table = drop_table

#       ORE_DROP_TABLES_ARRAY << self

#       # drop_table.each do |(drop, chance)|
#       #   ORE_DROP_TABLES_LIST << {drop, chance}
#       # end

#       Log.info &.emit("Ore Drop Table Initialized", id: self.id, drop_table: self.drop_table)

#       save = SaveData.new(drop_table)
#       path = "#{id}.json"

#       Dir.mkdir_p(File.dirname(path))
#       File.write(path, save.to_json, mode: "w")
#       Log.info &.emit("Created Drop Table", file: path)
#     end
#   end

#   struct SaveData
#     include JSON::Serializable

#     property ore_drop_table : Array(Tuple(String, Float64))

#     def initialize(ore_drop_table : Array(Tuple(String, Float64)))
#       @ore_drop_table = ore_drop_table
#     end
#   end

#   class CommonOreTables < OreDropTableBase
#     def initialize(id : String, drop_table : Array(Tuple(String, Float64)))
#         super(id, drop_table)
#     end

#     @@turquoise_ore_drop_table = CommonOreTables.new("turquoise_ore_01", [{"turquoise_ore", 100.0}, {"turquoise_ore", 5.0}])
#     @@quartz_ore_drop_table = CommonOreTables.new("quartz_ore_01", [{"quartz_ore", 100.0}, {"quartz_ore", 5.0}])
#   end
# end

#-----NOTE: Might use this later

#   def self.define_table(
#     id : String,
#     drops : Array(String),
#     chances : Array(Float64),
#     quantities : Array(Tuple(Int32, Int32))? = nil
#   )
#     CommonOreTables.new(id, drops, chances, quantities)
#   end
# end

    # def self.load_from_file(file_path : String)
    #   json = File.read(file_path)
    #   save_data = SaveData.from_json(json)

    #   id = File.basename(file_path, ".json")
    #   drops = save_data.ore_drop_table.map(&.[0])
    #   chances = save_data.ore_drop_table.map(&.[1])

    #   CommonOreTables.new(id, drops, chances)
    #   Log.info &.emit("Loaded Drop Table", file: file_path)
    # end

#     def pick_drop
#       return nil if @drop_table.empty?

#       cumulative = [] of Float64
#       total = 0.0
#       @chance_table.each do |chance|
#         total += chance
#         cumulative << total
#       end

#       roll = Random.rand * total

#       @drop_table.each_with_index do |drop, i|
#         if roll <= cumulative[i]
#           min_qty, max_qty = @quantity_table[i]
#           qty = Random.rand(min_qty..max_qty)
#           return {drop, qty}
#         end
#       end

#       min_qty, max_qty = @quantity_table.last
#       { @drop_table.last, Random.rand(min_qty..max_qty) }
#     end

#     # Roll multiple independent drops
#     def pick_drops(count : Int = 1)
#       Array(Tuple(String, Int32)).new(count) { pick_drop }
#     end

#     # Roll a full vein with guaranteed min quantity
#     def pick_vein
#       results = {} of String => Int32

#       @drop_table.each_with_index do |drop, i|
#         min_qty, max_qty = @quantity_table[i]

#         # Add guaranteed minimum
#         results[drop] = min_qty

#         # Roll additional units (if max > min)
#         extra = max_qty - min_qty
#         extra.times do
#           roll = Random.rand * 100.0
#           if roll <= @chance_table[i]
#             results[drop] += 1
#           end
#         end
#       end

#       # Convert to array of tuples
#       results.map { |k, v| {k, v} }
#     end
#   end



# module OreDropTables
#   # Registry of all ore tables
#   @@tables = {} of String => OreDropTableBase

#   def self.tables
#     @@tables
#   end

#   # Helper to define and register a new ore table
#   def self.define_table(
#     id : String,
#     drops : Array(String),
#     chances : Array(Float64),
#     quantities : Array(Tuple(Int32, Int32))? = nil
#   )
#     table = CommonOreTables.new(id, drops, chances, quantities)
#     @@tables[id] = table
#     table
#   end

#   # Set a table as the current active table
#   def self.set_current(id : String)
#     if @@tables.key?(id)
#       OreDropTableBase.class_variable_set(:@@current_table, @@tables[id])
#     else
#       raise "OreDropTable '#{id}' not found!"
#     end
#   end

#   # Get the current active table
#   def self.current
#     OreDropTableBase.current
#   end
# end


# module OreDropTables
#   # Roll a vein directly by table ID
#   def self.roll_vein(id : String)
#     if @@tables.key?(id)
#       @@tables[id].pick_vein
#     else
#       raise "OreDropTable '#{id}' not found!"
#     end
#   end
# end


#   # Debug helper: roll a vein and print nicely
#   def self.debug_vein(id : String)
#     vein = roll_vein(id)
#     puts "=== Vein Roll for '#{id}' ==="
#     vein.each do |drop, qty|
#       puts "- #{drop}: #{qty}"
#     end
#     puts "=============================="
#     vein
#   end
# end




#might use


#require "json"

# One loot entry
# struct LootEntry
#   include JSON::Serializable

#   @[JSON::Field(key: "type")]
#   property type : String = "minecraft:item"

#   @[JSON::Field(key: "name")]
#   property name : String

#   @[JSON::Field(key: "weight")]
#   property weight : Int32
# end

# # A pool of entries
# struct LootPool
#   include JSON::Serializable

#   @[JSON::Field(key: "rolls")]
#   property rolls : Int32 = 1

#   @[JSON::Field(key: "entries")]
#   property entries : Array(LootEntry)
# end

# # Full loot table
# struct LootTable
#   include JSON::Serializable

#   @[JSON::Field(key: "type")]
#   property type : String = "minecraft:block"

#   @[JSON::Field(key: "pools")]
#   property pools : Array(LootPool)

#   def save_to_file(path : String)
#     File.write(path, self.to_pretty_json)
#   end
# end

# # Helper to build loot tables from your simpler syntax
# def make_loot_table(block_id : String, drops : Array(Tuple(String, Float64)))
#   entries = drops.map do |(item_id, weight)|
#     LootEntry.new(name: "minecraft:#{item_id}", weight: weight.to_i)
#   end

#   LootTable.new(
#     pools: [LootPool.new(entries: entries)]
#   )
# end

# # Example usage
# turquoise_table = make_loot_table("turquoise_ore", [
#   {"turquoise_ore", 100.0},
#   {"turquoise_ore", 5.0}
# ])

# quartz_table = make_loot_table("quartz_ore", [
#   {"quartz_ore", 100.0},
#   {"quartz_ore", 5.0}
# ])

# Dir.mkdir_p("generated_loot_tables")
# turquoise_table.save_to_file("generated_loot_tables/turquoise_ore.json")
# quartz_table.save_to_file("generated_loot_tables/quartz_ore.json")




# require "json"

# # One loot entry
# struct LootEntry
#   include JSON::Serializable

#   @[JSON::Field(key: "type")]
#   property type : String = "minecraft:item"

#   @[JSON::Field(key: "name")]
#   property name : String

#   @[JSON::Field(key: "weight")]
#   property weight : Int32
# end

# # A pool of entries
# struct LootPool
#   include JSON::Serializable

#   @[JSON::Field(key: "rolls")]
#   property rolls : Int32 = 1

#   @[JSON::Field(key: "entries")]
#   property entries : Array(LootEntry)
# end

# # Full loot table
# struct LootTable
#   include JSON::Serializable

#   @[JSON::Field(key: "type")]
#   property type : String = "minecraft:block"

#   @[JSON::Field(key: "pools")]
#   property pools : Array(LootPool)

#   def save_to_file(filename : String)
#     File.write(filename, self.to_pretty_json)
#   end
# end

# Ore registration class
# class CommonOreTables
#   @@tables = {} of String => LootTable

#   # register an ore + drops
#   def self.register(block_id : String, drops : Array(Tuple(String, Float64)))
#     entries = drops.map do |(item_id, weight)|
#       LootEntry.new(name: "minecraft:#{item_id}", weight: weight.to_i)
#     end
#     table = LootTable.new(pools: [LootPool.new(entries: entries)])
#     @@tables[block_id] = table
#   end

#   # save all loot tables to a folder, naming files after block_id
#   def self.save_all(folder : String)
#     Dir.mkdir_p(folder)
#     @@tables.each do |block_id, table|
#       filename = File.join(folder, "#{block_id}.json")
#       table.save_to_file(filename)
#     end
#   end
# end

# # --- register ores here ---
# CommonOreTables.register("turquoise_ore", [
#   {"turquoise_ore", 100.0},
#   {"turquoise_ore", 5.0}
# ])

# CommonOreTables.register("quartz_ore", [
#   {"quartz_ore", 100.0},
#   {"quartz_ore", 5.0}
# ])

# # --- generate json files ---
# CommonOreTables.save_all("generated_loot_tables")

