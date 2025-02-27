
require "json"

module Serialization
  class SaveFile
    include JSON::Serializable

    @@stat_save_hash = Hash(String, Float64 | Nil | String).new
    if Player::Stats.max_hp == nil
    Player::Stats.initialize_player_stats  #it doesn't get the right values without this, but it makes me nervous
    Player::Appearance.initialize_player_model
    end
    @@stat_save_hash["name"] = Player::Stats.name 
    @@stat_save_hash["max_hp"] = Player::Stats.max_hp 
    @@stat_save_hash["current_hp"] = Player::Stats.current_hp 
    @@stat_save_hash["max_mp"] = Player::Stats.max_mp 
    @@stat_save_hash["current_mp"] = Player::Stats.current_mp 
    @@stat_save_hash["exp"] = Player::Stats.exp 
    @@stat_save_hash["defense"] = Player::Stats.defense 
    @@stat_save_hash["str"] = Player::Stats.str 
    @@stat_save_hash["dex"] = Player::Stats.dex 
    @@stat_save_hash["luk"] = Player::Stats.luk 
    @@stat_save_hash["int"] = Player::Stats.int 
    @@stat_save_hash["skin"] = Player::Appearance.get_clothing("skin")
    @@stat_save_hash["hair"] = Player::Appearance.get_clothing("hair")
    @@stat_save_hash["face"] = Player::Appearance.get_clothing("face")
    @@stat_save_hash["hat"] = Player::Appearance.get_clothing("hat")
    @@stat_save_hash["earrings"] = Player::Appearance.get_clothing("earrings")
    @@stat_save_hash["shirt"] = Player::Appearance.get_clothing("shirt")
    @@stat_save_hash["gloves"] = Player::Appearance.get_clothing("gloves")
    @@stat_save_hash["pants"] = Player::Appearance.get_clothing("pants")
    @@stat_save_hash["shoes"] = Player::Appearance.get_clothing("shoes")
    @@stat_save_hash["weapon"] = Player::Appearance.get_clothing("weapon")

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

    def SaveFile.retrieve_data(file, data)
        json = File.read(file)
        player_stats = Hash(String, JSON::Any).from_json(json)
        case data
        when "name"
        return "#{player_stats["name"].as_s}"
        when "max_hp"
        return "#{player_stats["max_hp"].as_s}"
        end
    end

    def SaveFile.initial_save(file)
      path = "src/saves/" + file
      Dir.mkdir_p(File.dirname(path))
      stats = @@stat_save_hash.to_json
      File.write(path, stats)
      #SaveFile.save_check(path, stats)
    end

    def SaveFile.save_check(path1, key)
        json = File.read(path1)
        player_stats = Hash(String, JSON::Any).from_json(json)
        puts player_stats
        puts "name: #{player_stats["name"].as_s}"
    end
  end
end

