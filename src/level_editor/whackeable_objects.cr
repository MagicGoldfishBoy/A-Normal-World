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
        sfx : SF::Sound, is_wiggling : Bool, max_wiggle_iterator : Int32, current_wiggle_iterator : Int32, is_dead : Bool)
        @name = name
        @id = id
        @x = x
        @y = y
        @sprite = sprite
        @max_hp = max_hp
        @current_hp = current_hp
        @sfx = sfx
        @is_wiggling = is_wiggling
        @max_wiggle_iterator = max_wiggle_iterator
        @current_wiggle_iterator = current_wiggle_iterator
        @is_dead = is_dead
     end

     property name : String
     property id : String
     property x : Float32
     property y : Float32
     property sprite : SF::Sprite
     property max_hp : Float64
     property current_hp : Float64
     property sfx : SF::Sound
     property is_wiggling : Bool
     property max_wiggle_iterator : Int32
     property current_wiggle_iterator : Int32
     property is_dead : Bool

     class_property animation_clock = SF::Clock.new

     def open_menu(window)
        puts "⛔ Whackeables don't have a menu"
     end

     def react_to_impact(window, attack_strength)
        self.current_hp -= attack_strength
        self.sfx.play
        if self.is_wiggling == false
            self.is_wiggling = true
        end
     end
    end
    class WhackeableObjectsMethods

     class_property whackeable_object_number : Int32 = 1
     class_property current_whackeable_object_index : Int32 = 0
     class_property spawned_whackeable_object_index : Int32 = 0
     class_property spawned_whackeable_object_array : Array(WhackeableObject::WhackeableObjectBase) = [] of WhackeableObject::WhackeableObjectBase

     def self.animate_whackeables(window)
        return unless WhackeableObjectBase.animation_clock.elapsed_time >= SF.seconds(0.15)
      
        self.spawned_whackeable_object_array.each do |whackeable|
          next unless whackeable.is_wiggling
      
          if whackeable.current_wiggle_iterator > 0
            player_x = Sprites::Player.retrieve_sprite.position.x
            whack_x = whackeable.sprite.position.x

            self.determine_animation_method(whackeable)
      
            whackeable.current_wiggle_iterator -= 1
          else
            whackeable.is_wiggling = false
            whackeable.current_wiggle_iterator = whackeable.max_wiggle_iterator
            self.determine_default_frame(whackeable)
          end
        end
      
        WhackeableObjectBase.animation_clock.restart
      end

     def self.determine_default_frame(whackeable)

        if whackeable.current_hp <= (whackeable.max_hp / 3) && whackeable.current_hp > 0
        whackeable.sprite.texture_rect = SF.int_rect(0, 160, 40, 80)

        elsif whackeable.current_hp <= (whackeable.max_hp / 3) * 2 && whackeable.current_hp > 0
            whackeable.sprite.texture_rect = SF.int_rect(0, 80, 40, 80) 

        elsif whackeable.current_hp > 0 && whackeable.is_dead == false 
            whackeable.sprite.texture_rect = SF.int_rect(0, 0, 40, 80)

        else
            SF.int_rect(120, 240, 40, 80)
            
        end
     end

     def self.determine_animation_method(whackeable)

        whack_x = whackeable.sprite.position.x

        if whackeable.current_hp <= (whackeable.max_hp / 3) && whackeable.current_hp > 0
        whackeable.sprite.texture_rect =
        Sprites::Player.retrieve_sprite.position.x <= whack_x ?
          Animations::Whackeable.forty_by_80_whackeable_animation_left_low :
          Animations::Whackeable.forty_by_80_whackeable_animation_right_low

        elsif whackeable.current_hp <= (whackeable.max_hp / 3) * 2 && whackeable.current_hp > 0
        whackeable.sprite.texture_rect =
        Sprites::Player.retrieve_sprite.position.x <= whack_x ?
          Animations::Whackeable.forty_by_80_whackeable_animation_left_medium :
          Animations::Whackeable.forty_by_80_whackeable_animation_right_medium

        elsif whackeable.current_hp > 0
        whackeable.sprite.texture_rect =
        Sprites::Player.retrieve_sprite.position.x <= whack_x ?
          Animations::Whackeable.forty_by_80_whackeable_animation_left :
          Animations::Whackeable.forty_by_80_whackeable_animation_right

        elsif whackeable.is_dead == false
        whackeable.sprite.texture_rect =
          Animations::Whackeable.forty_by_80_whackeable_animation_dying
          if whackeable.current_wiggle_iterator >= whackeable.max_wiggle_iterator
           whackeable.is_dead = true
          end
        else
            whackeable.sprite.texture_rect = SF.int_rect(120, 240, 40, 80)
        end
     end

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
            sfx,
            current_whackeable_object.is_wiggling,
            current_whackeable_object.max_wiggle_iterator,
            current_whackeable_object.current_wiggle_iterator,
            false
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
            json.field "is_wiggling", whackeable.is_wiggling
            json.field "max_wiggle_iterator", whackeable.max_wiggle_iterator
            json.field "current_wiggle_iterator", whackeable.current_wiggle_iterator
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
            current_hp = whackeable_object_json["max_hp"]?.try(&.as_f?) || 10.0_f64#= whackeable_object_json["current_hp"]?.try(&.as_f?) || 10.0f64

            sfx = WhackeableObject::WhackeableObjectBase::WHACKEABLE_SFX_HASH[id]?.try(&.dup)
            unless sfx
                puts "⚠️  Sprite not found for whackeable object ID: #{id}, skipping."
                next
            end

            is_wiggling             = whackeable_object_json["is_wiggling"]?.try(&.as_bool?) || false
            max_wiggle_iterator     = whackeable_object_json["max_wiggle_iterator"]?.try(&.as_i?) || 1
            current_wiggle_iterator = whackeable_object_json["max_wiggle_iterator"]?.try(&.as_i?) || 1#= whackeable_object_json["current_wiggle_iterator"]?.try(&.as_i?) || 1
            is_dead                 = false

            whackeable_object = WhackeableObject::WhackeableObjectBase.new(name, id, x, y, sprite, max_hp, current_hp, sfx, is_wiggling, 
            max_wiggle_iterator, current_wiggle_iterator, is_dead)
            WhackeableObject::WhackeableObjectsMethods.spawned_whackeable_object_array << whackeable_object
            Combat::PlayerMethods::TARGET_ARRAY << whackeable_object
            puts "✅ Loaded whackeable: #{name}, ID: #{id}, X: #{x}, Y: #{y}, Max_Hp: #{max_hp}, Current_Hp: #{current_hp}"
            whackeable_object
        end
     end
    end
    class TrainingDummy < WhackeableObjectBase

        @@training_dummy_01 = TrainingDummy.new("Cloth Training Dummy", "training_dummy_01", 0, 0, 
        SF::Sprite.new(TRAINIING_DUMMY_TEXTURE_01, SF::Rect.new(0, 0, 40, 80)), 500.0, 500.0, SFX::WhackeableSFX::FABRIC_HIT_01, false, 5, 5, false)
        WHACKEABLE_SPRITE_HASH[@@training_dummy_01.id] = @@training_dummy_01.sprite
        WHACKEABLE_SFX_HASH[@@training_dummy_01.id] = @@training_dummy_01.sfx
        WhackeableObjectBase::WHACKEABLE_TEMPLATE_ARRAY << @@training_dummy_01
    end

    class Ore < WhackeableObjectBase

        @@fire_agate_ore_01 = Ore.new("Fire Agate Ore", "fire_agate_ore_01", 0, 0,
        SF::Sprite.new(FIRE_AGATE_ORE_01, SF::Rect.new(0, 0, 40, 80)), 500.0, 500.0, SFX::WhackeableSFX::ROCK_HIT_01, false, 5, 5, false)
        WHACKEABLE_SPRITE_HASH[@@fire_agate_ore_01.id] = @@fire_agate_ore_01.sprite
        WHACKEABLE_SFX_HASH[@@fire_agate_ore_01.id] = @@fire_agate_ore_01.sfx
        WhackeableObjectBase::WHACKEABLE_TEMPLATE_ARRAY << @@fire_agate_ore_01

        @@turquoise_ore_01 = Ore.new("Turquoise Ore", "turquoise_ore_01", 0, 0, SF::Sprite.new(TURQUOISE_ORE_01, SF::Rect.new(0, 0, 40, 80)),
        500.0, 500.0, SFX::WhackeableSFX::ROCK_HIT_01, false, 5, 5, false)
        WHACKEABLE_SPRITE_HASH[@@turquoise_ore_01.id] = @@turquoise_ore_01.sprite
        WHACKEABLE_SFX_HASH[@@turquoise_ore_01.id] = @@turquoise_ore_01.sfx
        WhackeableObjectBase::WHACKEABLE_TEMPLATE_ARRAY << @@turquoise_ore_01

        @@topaz_ore_01 = Ore.new("Topaz Ore", "topaz_ore_01", 0, 0, SF::Sprite.new(Topaz_ORE_01, SF::Rect.new(0, 0, 40, 80)),
        500.0, 500.0, SFX::WhackeableSFX::ROCK_HIT_01, false, 5, 5, false)
        WHACKEABLE_SPRITE_HASH[@@topaz_ore_01.id] = @@topaz_ore_01.sprite
        WHACKEABLE_SFX_HASH[@@topaz_ore_01.id] = @@topaz_ore_01.sfx
        WhackeableObjectBase::WHACKEABLE_TEMPLATE_ARRAY << @@topaz_ore_01
    end
end