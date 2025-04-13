require "crsfml"
require "json"
#ò
module LocationSelection
 class Region
  def initialize(current_region : String)
   @current_region = current_region
  end

  class_property current_region : String = "none"

  def self.select_region(window)
    puts "Current Region: #{self.current_region}"
    case self.current_region
     when "none"
     when "chitòn_region"
        Area.select_level_chitòn(window)
     else
      puts "#{self.current_region} is not a valid region!"
      self.current_region = "chitòn_region"
    end
  end
 end

 class Area
  def initialize(current_area : String)
     @current_area = current_area
  end

    class_property current_area : String = "chitòn_dump"

  def self.select_level_chitòn(window)
    case self.current_area
     when "chitòn_city"
     when "chitòn_dump"
        Map.select_map_chitòn_dump(window)
    else
      puts "#{self.current_area} is not a valid area!"
      self.current_area = "chitòn_dump"
    end
  end
 end

 class Map
  def initialize(current_map : String)
    @current_map = current_map
  end

  class_property current_map : String = "chitòn_dump_map_1"

  def self.select_map_chitòn_dump(window)
    case self.current_map
     when "chitòn_dump_map_1"
        Serialization::LevelFile.load_map("../src/locations/regions/chitòn_region/chitòn_dump/maps/chitòn_dump_map_1")
        #Serialization::LevelFile.load_map("src/locations/regions/chitòn_region/chitòn_dump/maps/chitòn_dump_map_1")
    else
      puts "#{self.current_map} is not a valid map!"
      self.current_map = "chitòn_dump_map_1"
    end
  end
 end
end