
module Maps
    class MapBase
        def initialize(name : String, id : String, level : String, region : String, recommended_lvl : Int32)
            @name = name
            @id = id
            @level = level
            @region = region
            @recommended_lvl = recommended_lvl
        end

        property name : String
        property id : String
        property level : String
        property region : String
        property recommended_lvl : Int32
    end

    class ChitònCityDump < MapBase
        def initialize
            super("Chitòn City Dump", "chitòn_city_dump", "Chitòn City Dump", "Chitòn City", 1)
        end
    end

    class ChitònCity < MapBase
        def initialize
            super("Chitòn City", "chitòn_city", "Chitòn City", "Chitòn City", 1)
        end
    end
end