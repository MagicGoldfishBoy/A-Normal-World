require "crsfml"
require "crsfml/audio"
require "../../src/textures.cr"
require "../../src/level_elements.cr"
require "../../src/sound/sfx.cr"

module WhackeableObject
    class WhackeableObjectBase < LevelElements::LevelElementBase
        WHACKEABLE_TEMPLATE_ARRAY = [] of WhackeableObjectBase
        WHACKEABLE_SPRITE_HASH = {} of String => SF::Sprite
        WHACKEABLE_SFX_HASH = {} of String => SF::Sound
     def initialize(name : String, id : String, x : Float32, y : Float32, sprite : SF::Sprite, max_hp : Float64, current_hp : Float64,
        sfx : SF::Sound)
        @name = name
        @id = id
        @x = x
        @y = y
        @sprite = sprite
        @max_hp = max_hp
        @current_hp = current_hp
        @sfx = sfx
     end

     property name : String
     property id : String
     property x : Float32
     property y : Float32
     property sprite : SF::Sprite
     property max_hp : Float64
     property current_hp : Float64
     property sfx : SF::Sound

     def open_menu(window)
        puts "⛔ Whackeables don't have a menu"
     end

     def react_to_impact(window, attack_strength)
        self.current_hp -= attack_strength
        self.sfx.play
        if Sprites::Player.retrieve_sprite.position.x <= self.sprite.position.x
         self.sprite.texture_rect = Animations::Whackeable.forty_by_80_whackeable_animation_left
        else
         self.sprite.texture_rect = Animations::Whackeable.forty_by_80_whackeable_animation_right
        end
     end
    end
    class WhackeableObjectsMethods

     class_property whackeable_object_number : Int32 = 1
     class_property current_whackeable_object_index : Int32 = 0
     class_property spawned_whackeable_object_index : Int32 = 0
     class_property spawned_whackeable_object_array : Array(WhackeableObject::WhackeableObjectBase) = [] of WhackeableObject::WhackeableObjectBase

     
     def self.spawn_whackeable(window)
        if LevelEditor::LevelEditorLogic.current_index >= WhackeableObject::WhackeableObjectBase::WHACKEABLE_TEMPLATE_ARRAY.size
            puts "Error: No WhackableObject available to spawn. Index was '#{LevelEditor::LevelEditorLogic.current_index}'"
            if WhackeableObject::WhackeableObjectBase::WHACKEABLE_TEMPLATE_ARRAY.empty?
                puts "WackeableObject array is empty"
            end
            return
        end
        current_whackeable_object = WhackeableObject::WhackeableObjectBase::WHACKEABLE_TEMPLATE_ARRAY[LevelEditor::LevelEditorLogic.current_index]
        name = "#{current_whackeable_object.name} #{whackeable_object_number}"
        sprite = WhackeableObject::WhackeableObjectBase::WHACKEABLE_SPRITE_HASH[current_whackeable_object.id]?.try(&.dup) || SF::Sprite.new
        sfx = WhackeableObject::WhackeableObjectBase::WHACKEABLE_SFX_HASH[current_whackeable_object.id]
        
        whackeable_object = WhackeableObject::WhackeableObjectBase.new(
            name,
            current_whackeable_object.id,
            current_whackeable_object.x,
            current_whackeable_object.y,
            sprite,
            current_whackeable_object.max_hp,
            current_whackeable_object.current_hp,
            sfx
        )
        
        whackeable_object.sprite.position = SF::Vector2f.new(whackeable_object.x, whackeable_object.y)
        self.spawned_whackeable_object_array << whackeable_object
        LevelEditor::LevelDisplay.current_element = whackeable_object
        self.whackeable_object_number += 1
     end
     def WhackeableObjectsMethods.save(json)
        whackeable = self.spawned_whackeable_object_array
        whackeable.each do |whackeable|
            json.object do
            json.field "name", whackeable.name
            json.field "id", whackeable.id
            json.field "x", whackeable.x
            json.field "y", whackeable.y
            json.field "max_hp", whackeable.max_hp
            json.field "current_hp", whackeable.current_hp
            end
        end
     end
     def self.load_whackeable_object(path, json_data, parsed)
        WhackeableObject::WhackeableObjectsMethods.spawned_whackeable_object_array.clear

        whackeable_object_json = parsed["level"]?.try &.["whackeables"]?.try &.as_a? || [] of JSON::Any

        whackeable_object_data = whackeable_object_json.compact_map do |whackeable_object_json|
            name  = whackeable_object_json["name"]?.try(&.as_s?) || "unknown"
            id    = whackeable_object_json["id"]?.try(&.as_s?) || "missing_id"
            x     = whackeable_object_json["x"]?.try(&.as_f32?) || 0.0_f32
            y     = whackeable_object_json["y"]?.try(&.as_f32?) || 0.0_f32

            sprite = WhackeableObject::WhackeableObjectBase::WHACKEABLE_SPRITE_HASH[id]?.try(&.dup)
            unless sprite
                puts "⚠️  Sprite not found for whackeable object ID: #{id}, skipping."
                next
            end

            max_hp     = whackeable_object_json["max_hp"]?.try(&.as_f?) || 10.0_f64
            current_hp = whackeable_object_json["current_hp"]?.try(&.as_f?) || 10.0f64

            sfx = WhackeableObject::WhackeableObjectBase::WHACKEABLE_SFX_HASH[id]?.try(&.dup)
            unless sfx
                puts "⚠️  Sprite not found for whackeable object ID: #{id}, skipping."
                next
            end
            whackeable_object = WhackeableObject::WhackeableObjectBase.new(name, id, x, y, sprite, max_hp, current_hp, sfx)
            WhackeableObject::WhackeableObjectsMethods.spawned_whackeable_object_array << whackeable_object
            Combat::PlayerMethods::TARGET_ARRAY << whackeable_object
            puts "✅ Loaded whackeable: #{name}, ID: #{id}, X: #{x}, Y: #{y}, Max_Hp: #{max_hp}, Current_Hp: #{current_hp}"
            whackeable_object
        end
     end
    end
    class TrainingDummy < WhackeableObjectBase

        @@training_dummy_01 = TrainingDummy.new("Cloth Training Dummy", "training_dummy_01", 0, 0, 
        SF::Sprite.new(TRAINIING_DUMMY_TEXTURE_01, SF::Rect.new(0, 0, 40, 80)), 10.0, 10.0, SFX::CombatSFX::SWORD_SWING_SFX_01)
        WHACKEABLE_SPRITE_HASH[@@training_dummy_01.id] = @@training_dummy_01.sprite
        WHACKEABLE_SFX_HASH[@@training_dummy_01.id] = @@training_dummy_01.sfx
        WhackeableObjectBase::WHACKEABLE_TEMPLATE_ARRAY << @@training_dummy_01
    end
end