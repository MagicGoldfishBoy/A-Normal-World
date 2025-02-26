
require "json"

module Serialization
  class SaveFile
    include JSON::Serializable

    @@stat_save_hash = Hash(String, Float64 | Nil).new
    @@stat_save_hash["max_hp"] = Player::Stats.max_hp 

    def initialize(save_file : String)
        @@save_file = save_file
    end

    def SaveFile.save_file
        @@save_file
    end

    def SaveFile.save_file=(file)
        @@save_file = file
    end

    def SaveFile.initial_save(file)
      path = "src/saves/" + file
      Dir.mkdir_p(File.dirname(path))
      stats = @@stat_save_hash.to_json
      File.write(path, stats)
    end
  end
end

require "json"

# # Define your data as a hash
# data = {
#   "name" => "Crystal",
#   "version" => "1.11.2",
#   "features" => ["Fast", "Static Typing", "Ruby-like Syntax"]
# }

# # Convert hash to JSON string
# json_string = data.to_json

# # Write JSON string to a file
# File.write("output.json", json_string)

# puts "JSON file created successfully!"
