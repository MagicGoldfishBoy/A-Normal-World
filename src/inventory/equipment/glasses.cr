require "crsfml"
require "crsfml/audio"
require "../../../src/textures.cr"
require "../../../src/utility.cr"
require "../../../src/inventory/equipment/clothing.cr"

module Glasses 

    class GlassesBase < Clothing::ClothingBase
    include JSON::Serializable

    GLASSES_ARRAY = [] of Glasses
    end
end