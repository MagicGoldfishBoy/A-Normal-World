
require "json"

module Serialization
  class SaveFile
    include JSON::Serializable

    @@stat_save_hash = Hash(String, Float64 | Nil).new
    Player::Stats.initialize_player_stats  #it doesn't get the right values without this, but it makes me nervous
    @@stat_save_hash["max_hp"] = Player::Stats.max_hp 
    @@stat_save_hash["current_hp"] = Player::Stats.current_hp 
    @@stat_save_hash["max_mp"] = Player::Stats.max_mp 
    @@stat_save_hash["current_mp"] = Player::Stats.current_mp 

    @[JSON::Field(key: "max_hp")]
    property max_hp : Float64

    def initialize(save_file : String, max_hp : Float64)
        @@save_file = save_file
        @@max_hp = max_hp
        @max_hp = max_hp
    end

    def max_hp
        @@max_hp
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
      stats = @@stat_save_hash#.to_json
      File.write(path, stats)
      SaveFile.save_check(path, stats)
    end

    def SaveFile.save_check(path1, key)
        json = File.open(path1)
        puts key["max_hp"]
        puts Player::Stats.max_hp 
        # JSON.parse(key)
        # puts JSON.parse(key["max_hp"])
    end
  end
end

