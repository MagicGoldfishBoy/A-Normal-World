require "crsfml"
require "../src/textures.cr"
require "../src/player.cr"

module Sprites
    include Player
    extend self
    CLOTHES_HASH = Hash(String, SF::Texture).new
    CLOTHES_HASH["nil"] = NIL_TEXTURE

    CLOTHES_HASH["pale_skin"] = PALE_SKIN_TEXTURE
    CLOTHES_HASH["tan_skin"] = SKIN_TEXTURE_02

    CLOTHES_HASH["white_shounen_hair"] = SHOUNEN_HAIR_WHITE_TEXTURE
    CLOTHES_HASH["black_shounen_hair"] = SHOUNEN_HAIR_BLACK_TEXTURE

    CLOTHES_HASH["blue_button_eyes"] = BUTTON_EYES_BLUE_TEXTURE
    CLOTHES_HASH["black_button_eyes"] = BUTTON_EYES_BLACK_TEXTURE

    CLOTHES_HASH["white_tank_top"] = TANK_TOP_WHITE_TEXTURE

    CLOTHES_HASH["white_fingerless_gloves"] = FINGERLESS_GLOVES_WHITE_TEXTURE

    CLOTHES_HASH["white_jeans"] = JEANS_WHITE_TEXTURE

    CLOTHES_HASH["white_rain_boots"] = RAIN_BOOTS_WHITE_TEXTURE

    CLOTHES_HASH["wooden_stick"] = WOODEN_STICK_TEXTURE
    
    
  class Player < Appearance

  STARTING_SKIN_ARRAY = ["pale_skin", "tan_skin"]
  STARTING_HAIR_ARRAY = ["black_shounen_hair", "white_shounen_hair"]
  STARTING_FACE_ARRAY = ["blue_button_eyes", "black_button_eyes"]
  @@current_array = STARTING_SKIN_ARRAY
  @@skin_iterator = 0
  @@hair_iterator = 0
  @@face_iterator = 0

  @@player_character_model = SF::RenderTexture.new(672, 512)
  @@player_character_rendered_model = SF::Sprite.new

   def Player.refresh_player_sprite(window)
    @@player_character_model.create(672, 1024, false)
    @@player_character_model.clear(SF::Color::Transparent)
    
    skin = CLOTHES_HASH[Appearance.get_clothing("skin")]
    current_skin = SF::Sprite.new(skin)

    this = "hair"
    hair = CLOTHES_HASH[Appearance.get_clothing(this)]
    current_hair = SF::Sprite.new(hair)

    this = "face"
    face = CLOTHES_HASH[Appearance.get_clothing(this)]
    current_face = SF::Sprite.new(face)

    this = "hat"
    hat = CLOTHES_HASH[Appearance.get_clothing(this)]
    current_hat = SF::Sprite.new(hat)

    this = "earrings"
    earrings = CLOTHES_HASH[Appearance.get_clothing(this)]
    current_earrings = SF::Sprite.new(earrings)

    this = "shirt"
    shirt = CLOTHES_HASH[Appearance.get_clothing(this)]
    current_shirt = SF::Sprite.new(shirt)

    this = "gloves"
    gloves = CLOTHES_HASH[Appearance.get_clothing(this)]
    current_gloves = SF::Sprite.new(gloves)

    this = "pants"
    pants = CLOTHES_HASH[Appearance.get_clothing(this)]
    current_pants = SF::Sprite.new(pants)

    this = "shoes"
    shoes = CLOTHES_HASH[Appearance.get_clothing(this)]
    current_shoes = SF::Sprite.new(shoes)

    this = "weapon"
    weapon = CLOTHES_HASH[Appearance.get_clothing(this)]
    current_weapon = SF::Sprite.new(weapon)

    @@player_character_model.clear(SF::Color::Transparent)
    @@player_character_model.draw(current_skin)
    @@player_character_model.draw(current_earrings)
    @@player_character_model.draw(current_hair)
    @@player_character_model.draw(current_face)
    @@player_character_model.draw(current_pants)
    @@player_character_model.draw(current_shirt)
    @@player_character_model.draw(current_shoes)
    @@player_character_model.draw(current_gloves)
    @@player_character_model.draw(current_weapon)

    
    @@player_character_rendered_model.texture_rect = SF.int_rect(0, 0, 96, 128)
    @@player_character_model.display
    @@player_character_rendered_model.texture = @@player_character_model.texture
    window.draw(@@player_character_rendered_model)
   end

   def Player.resize_player_sprite(window, x, y)
    @@player_character_rendered_model.scale = SF.vector2(x, y)
   end

   def Player.position_player_sprite(window, x, y)
    @@player_character_rendered_model.position = SF.vector2(x, y)
   end

   def Player.change_skin(context, direction)
    case context
    when "character_creation"

        @@current_array = STARTING_SKIN_ARRAY

    end
    if direction == "right" && @@skin_iterator < @@current_array.size - 1
        @@skin_iterator += 1
    elsif direction == "left" && @@skin_iterator > 0
        @@skin_iterator -= 1
    elsif @@skin_iterator == @@current_array.size - 1
        @@skin_iterator = 0
    else
        @@skin_iterator = @@current_array.size - 1
    end
    return @@current_array[@@skin_iterator]
   end

   def Player.change_hair(context, direction)
    case context
    when "character_creation"

        @@current_array = STARTING_HAIR_ARRAY

    end
    if direction == "right" && @@hair_iterator < @@current_array.size - 1
        @@hair_iterator += 1
    elsif direction == "left" && @@hair_iterator > 0
        @@hair_iterator -= 1
    elsif @@hair_iterator == @@current_array.size - 1
        @@hair_iterator = 0
    else
        @@hair_iterator = @@current_array.size - 1
    end
    return @@current_array[@@hair_iterator]
   end

   def Player.change_face(context, direction)
    case context
    when "character_creation"

        @@current_array = STARTING_FACE_ARRAY

    end
    if direction == "right" && @@face_iterator < @@current_array.size - 1
        @@face_iterator += 1
    elsif direction == "left" && @@face_iterator > 0
        @@face_iterator -= 1
    elsif @@face_iterator == @@current_array.size - 1
        @@face_iterator = 0
    else
        @@face_iterator = @@current_array.size - 1
    end
    return @@current_array[@@face_iterator]
   end
 end
end