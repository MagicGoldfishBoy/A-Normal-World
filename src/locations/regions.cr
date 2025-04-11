
#regions are like continents or islands, they can contain multiple levels which themselves are like countries, 
#large cities, etc
module Regions
    class Region_Base
        def initialize(name :String, id : String, recommended_lvl : Int32, levels : Array(String))
            @name = name
            @id = id
            @recommended_lvl = recommended_lvl
            @levels = levels
        end
        property name : String
        property id : String
        property recommended_lvl : Int32
        property levels : Array(String)
    end
    class Chitòn_City < Region_Base
        def initialize
            super("Chitòn City", "chitòn_city", 1, ["chitòn_city_dump, chitòn_city"])
        end
    end
end