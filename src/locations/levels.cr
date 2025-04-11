require "crsfml"
require "json"
require "../src/regions_levels_maps/regions.cr"
module Levels
    class LevelBase
        def initialize(name :String, id : String, region : Region_Base, maps : Array(String), recommended_lvl : Int32)
            @name = name
            @id = id
            @region = region
            @maps = maps
            @recommended_lvl = recommended_lvl
        end
    end
    class ChitònCityDump < LevelBase
        def initialize
            super("Chitòn City Dump", "chitòn_city_dump", Regions::Chitòn_City.new, ["chitòn_city_dump"], 1)
        end
    end
    class ChitònCity < LevelBase
        def initialize
            super("Chitòn City", "chitòn_city", Regions::Chitòn_City.new, ["chitòn_city"], 1)
        end
    end
end