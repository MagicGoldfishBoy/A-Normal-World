
require "json"
require "../src/level_elements.cr"

module Serialization
  class SaveFile
    include JSON::Serializable

    @@stat_save_hash = Hash(String, Float64 | Nil | String | Int32).new
    if Player::Stats.max_hp == nil
    Player::Appearance.initialize_player_model
    end
    @@stat_save_hash["name"] = Player::Stats.name 
    @@stat_save_hash["money"] = Player::Stats.money 
    @@stat_save_hash["lvl_points"] = Player::Stats.lvl_points 
    @@stat_save_hash["max_hp"] = Player::Stats.max_hp 
    @@stat_save_hash["current_hp"] = Player::Stats.current_hp 
    @@stat_save_hash["max_mp"] = Player::Stats.max_mp 
    @@stat_save_hash["current_mp"] = Player::Stats.current_mp 
    @@stat_save_hash["exp"] = Player::Stats.exp 
    @@stat_save_hash["exp_cap"] = Player::Stats.exp_cap 
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
    @@stat_save_hash["makeup"] = Player::Appearance.get_clothing("makeup")
    @@stat_save_hash["necklace"] = Player::Appearance.get_clothing("necklace")
    @@stat_save_hash["glasses"] = Player::Appearance.get_clothing("glasses")
    @@stat_save_hash["jacket"] = Player::Appearance.get_clothing("jacket")
    @@stat_save_hash["socks"] = Player::Appearance.get_clothing("socks")
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

    def SaveFile.load_game(file)
        json = File.read(file)
        player_stats = Hash(String, JSON::Any).from_json(json)
        Player::Stats.name = player_stats["name"].to_s
        Player::Stats.money = player_stats["money"].to_s.to_i
        Player::Stats.lvl_points = player_stats["lvl_points"].to_s.to_i
        Player::Stats.max_hp = player_stats["max_hp"].to_s.to_f64
        Player::Stats.current_hp = player_stats["current_hp"].to_s.to_f64
        Player::Stats.max_mp = player_stats["max_mp"].to_s.to_f64
        Player::Stats.current_mp = player_stats["current_mp"].to_s.to_f64
        Player::Stats.exp = player_stats["exp"].to_s.to_f64
        Player::Stats.exp_cap = player_stats["exp_cap"].to_s.to_f64
        Player::Stats.defense = player_stats["defense"].to_s.to_f64
        Player::Stats.str = player_stats["str"].to_s.to_f64
        Player::Stats.dex = player_stats["dex"].to_s.to_f64
        Player::Stats.luk = player_stats["luk"].to_s.to_f64
        Player::Stats.int = player_stats["int"].to_s.to_f64
        Player::Appearance.change_skin(player_stats["skin"].to_s)
        Player::Appearance.change_hair(player_stats["hair"].to_s)
        Player::Appearance.change_face(player_stats["face"].to_s) 
        Player::Appearance.change_shirt(player_stats["shirt"].to_s) 
        Player::Appearance.change_hat(player_stats["hat"].to_s) 
        Player::Appearance.change_earrings(player_stats["earrings"].to_s) 
        Player::Appearance.change_pants(player_stats["pants"].to_s) 
        Player::Appearance.change_gloves(player_stats["gloves"].to_s) 
        Player::Appearance.change_shoes(player_stats["shoes"].to_s) 
        Player::Appearance.change_makeup(player_stats["makeup"].to_s) 
        Player::Appearance.change_necklace(player_stats["necklace"].to_s) 
        Player::Appearance.change_glasses(player_stats["glasses"].to_s) 
        Player::Appearance.change_jacket(player_stats["jacket"].to_s) 
        Player::Appearance.change_socks(player_stats["socks"].to_s) 
        Player::Appearance.change_weapon(player_stats["weapon"].to_s) 
    end

    def SaveFile.initial_save(file)
      SaveFile.save_file=(file)
      path = "src/saves/" + file
      Dir.mkdir_p(File.dirname(path))
      stats = @@stat_save_hash.to_json
      File.write(path, stats)
    end

    def SaveFile.update_stats_hash
        @@stat_save_hash.clear
        @@stat_save_hash["name"] = Player::Stats.name 
        @@stat_save_hash["money"] = Player::Stats.money 
        @@stat_save_hash["max_hp"] = Player::Stats.max_hp 
        @@stat_save_hash["current_hp"] = Player::Stats.current_hp 
        @@stat_save_hash["max_mp"] = Player::Stats.max_mp 
        @@stat_save_hash["current_mp"] = Player::Stats.current_mp 
        @@stat_save_hash["exp"] = Player::Stats.exp 
        @@stat_save_hash["exp_cap"] = Player::Stats.exp_cap 
        @@stat_save_hash["lvl"] = Player::Stats.lvl 
        @@stat_save_hash["defense"] = Player::Stats.defense 
        @@stat_save_hash["str"] = Player::Stats.str 
        @@stat_save_hash["dex"] = Player::Stats.dex 
        @@stat_save_hash["luk"] = Player::Stats.luk 
        @@stat_save_hash["int"] = Player::Stats.int 
        @@stat_save_hash["lvl_points"] = Player::Stats.lvl_points 
        @@stat_save_hash["skin"] = Player::Appearance.get_clothing("skin")
        @@stat_save_hash["hair"] = Player::Appearance.get_clothing("hair")
        @@stat_save_hash["face"] = Player::Appearance.get_clothing("face")
        @@stat_save_hash["hat"] = Player::Appearance.get_clothing("hat")
        @@stat_save_hash["earrings"] = Player::Appearance.get_clothing("earrings")
        @@stat_save_hash["shirt"] = Player::Appearance.get_clothing("shirt")
        @@stat_save_hash["gloves"] = Player::Appearance.get_clothing("gloves")
        @@stat_save_hash["pants"] = Player::Appearance.get_clothing("pants")
        @@stat_save_hash["shoes"] = Player::Appearance.get_clothing("shoes")
        @@stat_save_hash["makeup"] = Player::Appearance.get_clothing("makeup")
        @@stat_save_hash["necklace"] = Player::Appearance.get_clothing("necklace")
        @@stat_save_hash["glasses"] = Player::Appearance.get_clothing("glasses")
        @@stat_save_hash["jacket"] = Player::Appearance.get_clothing("jacket")
        @@stat_save_hash["socks"] = Player::Appearance.get_clothing("socks")
        @@stat_save_hash["weapon"] = Player::Appearance.get_clothing("weapon")
    end

    def SaveFile.normal_save
        SaveFile.update_stats_hash
        path = "src/saves/" + @@save_file.not_nil! # SaveFile.save_file.not_nil!
        File.delete?(path)
        Dir.mkdir_p(File.dirname(path))
        stats = @@stat_save_hash.to_json
        File.write(path, stats, mode: "w")
    end

    def SaveFile.save_check(path1, key)
        json = File.read(path1)
        player_stats = Hash(String, JSON::Any).from_json(json)
        puts player_stats
        puts "name: #{player_stats["name"].as_s}"
    end
  end

  class LevelFile
    def self.save_level(file : String)
      platforms = LevelEditor::LevelEditorLogic.spawned_platform_array
  #this is ugly as fuck, but I HATE serialization too much to care
      json_data = JSON.build do |json|
        json.object do
        json.field "level" do
        json.object do
        json.field "platforms" do
        json.array do
        platforms.each do |platform|
        json.object do
        json.field "name", platform.name
        json.field "id", platform.id
        json.field "x", platform.x
        json.field "y", platform.y
        json.field "can_jump_down", platform.can_jump_down
        end
        end
        end
        end
        end
        end
        end
        end
  
      sanitized_file = file.gsub(/[^\w\-.]/, "_")
      path = "levels/#{sanitized_file}"
  
      Dir.mkdir_p(File.dirname(path))
      File.write(path, json_data)
    end
    def self.load_level(file : String)
        path = "levels/#{file}"
        return nil unless File.exists?(path)
    
        json_data = File.read(path)
        parsed = JSON.parse(json_data)

        LevelEditor::LevelEditorLogic.spawned_platform_array.clear
    
        platforms = parsed["level"]["platforms"].as_a.map do |platform_json|
          name = platform_json["name"].as_s
          id = platform_json["id"].as_s
          x = platform_json["x"].as_f32
          y = platform_json["y"].as_f32
          can_jump_down = platform_json["can_jump_down"].as_bool
          sprite = LevelElements::PlatformBase::PLATFORM_SPRITE_HASH[id].dup
          LevelEditor::LevelEditorLogic.spawned_platform_array << LevelElements::PlatformBase.new(name, id, x, y, sprite, can_jump_down)
          puts "Loaded platform: #{name}, ID: #{id}, X: #{x}, Y: #{y}, Can Jump Down: #{can_jump_down}"
        end
        Platforms::PlatformMethods.platform_number = LevelEditor::LevelEditorLogic.spawned_platform_array.size
    
        platforms
       end
    end
end

