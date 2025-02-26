require "crsfml"
require "../src/textures.cr"
require "../src/player.cr"

module Sprites
    include Player
    extend self
    CLOTHES_HASH = Hash(String, SF::Texture).new
    CLOTHES_HASH["nil"] = NIL_TEXTURE

    CLOTHES_HASH["pale_skin"] = PALE_SKIN_TEXTURE
    CLOTHES_HASH["tan_skin"] = TAN_SKIN_TEXTURE
    CLOTHES_HASH["dark_skin"] = DARK_SKIN_TEXTURE
    CLOTHES_HASH["ghostly_skin"] = GHOSTLY_SKIN_TEXTURE
    CLOTHES_HASH["jaundiced_skin"] = JAUNDICED_SKIN_TEXTURE
    CLOTHES_HASH["blue_skin"] = BLUE_SKIN_TEXTURE
    CLOTHES_HASH["pink_skin"] = PINK_SKIN_TEXTURE
    CLOTHES_HASH["green_skin"] = GREEN_SKIN_TEXTURE
    CLOTHES_HASH["purple_skin"] = PURPLE_SKIN_TEXTURE
    CLOTHES_HASH["red_skin"] = RED_SKIN_TEXTURE


    CLOTHES_HASH["white_shounen_hair"] = SHOUNEN_HAIR_WHITE_TEXTURE
    CLOTHES_HASH["black_shounen_hair"] = SHOUNEN_HAIR_BLACK_TEXTURE
    CLOTHES_HASH["blond_shounen_hair"] = SHOUNEN_HAIR_BLOND_TEXTURE
    CLOTHES_HASH["light_blond_shounen_hair"] = SHOUNEN_HAIR_LIGHT_BLOND_TEXTURE
    CLOTHES_HASH["brown_shounen_hair"] = SHOUNEN_HAIR_BROWN_TEXTURE
    CLOTHES_HASH["orange_shounen_hair"] = SHOUNEN_HAIR_ORANGE_TEXTURE
    CLOTHES_HASH["red_shounen_hair"] = SHOUNEN_HAIR_RED_TEXTURE
    CLOTHES_HASH["blue_shounen_hair"] = SHOUNEN_HAIR_BLUE_TEXTURE
    CLOTHES_HASH["pink_shounen_hair"] = SHOUNEN_HAIR_PINK_TEXTURE
    CLOTHES_HASH["green_shounen_hair"] = SHOUNEN_HAIR_GREEN_TEXTURE
    CLOTHES_HASH["purple_shounen_hair"] = SHOUNEN_HAIR_PURPLE_TEXTURE

    CLOTHES_HASH["White_Ponytail_Hair"] = PONYTAIL_HAIR_WHITE_TEXTURE
    CLOTHES_HASH["Black_Ponytail_Hair"] = PONYTAIL_HAIR_BLACK_TEXTURE
    CLOTHES_HASH["Blonde_Ponytail_Hair"] = PONYTAIL_HAIR_BLONDE_TEXTURE
    CLOTHES_HASH["Light_blonde_Ponytail_Hair"] = PONYTAIL_HAIR_LIGHT_BLONDE_TEXTURE
    CLOTHES_HASH["Brown_Ponytail_Hair"] = PONYTAIL_HAIR_BROWN_TEXTURE
    CLOTHES_HASH["Orange_Ponytail_Hair"] = PONYTAIL_HAIR_ORANGE_TEXTURE
    CLOTHES_HASH["Red_Ponytail_Hair"] = PONYTAIL_HAIR_RED_TEXTURE
    CLOTHES_HASH["Blue_Ponytail_Hair"] = PONYTAIL_HAIR_BLUE_TEXTURE
    CLOTHES_HASH["Pink_Ponytail_Hair"] = PONYTAIL_HAIR_PINK_TEXTURE
    CLOTHES_HASH["Green_Ponytail_Hair"] = PONYTAIL_HAIR_GREEN_TEXTURE
    CLOTHES_HASH["Purple_Ponytail_Hair"] = PONYTAIL_HAIR_PURPLE_TEXTURE


    CLOTHES_HASH["blue_button_eyes"] = BUTTON_EYES_BLUE_TEXTURE
    CLOTHES_HASH["black_button_eyes"] = BUTTON_EYES_BLACK_TEXTURE
    CLOTHES_HASH["brown_button_eyes"] = BUTTON_EYES_BROWN_TEXTURE
    CLOTHES_HASH["green_button_eyes"] = BUTTON_EYES_GREEN_TEXTURE
    CLOTHES_HASH["yellow_button_eyes"] = BUTTON_EYES_YELLOW_TEXTURE
    CLOTHES_HASH["red_button_eyes"] = BUTTON_EYES_RED_TEXTURE
    CLOTHES_HASH["pink_button_eyes"] = BUTTON_EYES_PINK_TEXTURE
    CLOTHES_HASH["purple_button_eyes"] = BUTTON_EYES_PURPLE_TEXTURE
    CLOTHES_HASH["white_button_eyes"] = BUTTON_EYES_WHITE_TEXTURE


    CLOTHES_HASH["white_tank_top"] = TANK_TOP_WHITE_TEXTURE
    CLOTHES_HASH["Black_tank_top"] = TANK_TOP_BLACK_TEXTURE
    CLOTHES_HASH["Orange_tank_top"] = TANK_TOP_ORANGE_TEXTURE


    CLOTHES_HASH["white_fingerless_gloves"] = FINGERLESS_GLOVES_WHITE_TEXTURE


    CLOTHES_HASH["white_jeans"] = JEANS_WHITE_TEXTURE
    CLOTHES_HASH["black_jeans"] = JEANS_BLACK_TEXTURE


    CLOTHES_HASH["white_rain_boots"] = RAIN_BOOTS_WHITE_TEXTURE
    CLOTHES_HASH["black_rain_boots"] = RAIN_BOOTS_BLACK_TEXTURE


    CLOTHES_HASH["wooden_stick"] = WOODEN_STICK_TEXTURE
    
    
  class Player < Appearance

  STARTING_SKIN_ARRAY = ["pale_skin", "tan_skin", "dark_skin", "ghostly_skin", "jaundiced_skin", "blue_skin", "pink_skin", "green_skin", "purple_skin", "red_skin"]

  STARTING_HAIR_ARRAY = ["black_shounen_hair", "white_shounen_hair", "blond_shounen_hair", "light_blond_shounen_hair", "brown_shounen_hair", "orange_shounen_hair", "red_shounen_hair", 
  "blue_shounen_hair", "pink_shounen_hair", "green_shounen_hair", "purple_shounen_hair", "White_Ponytail_Hair", "Black_Ponytail_Hair", "Blonde_Ponytail_Hair", "Light_blonde_Ponytail_Hair", 
  "Brown_Ponytail_Hair", "Orange_Ponytail_Hair", "Red_Ponytail_Hair", "Blue_Ponytail_Hair", "Pink_Ponytail_Hair", "Green_Ponytail_Hair", "Purple_Ponytail_Hair"]

  STARTING_FACE_ARRAY = ["blue_button_eyes", "black_button_eyes", "brown_button_eyes", "green_button_eyes", "yellow_button_eyes", "red_button_eyes", "pink_button_eyes", "purple_button_eyes", 
  "white_button_eyes"]

  STARTING_SHIRT_ARRAY = ["white_tank_top", "Black_tank_top", "Orange_tank_top"]

  STARTING_PANTS_ARRAY = ["white_jeans", "black_jeans"]

  STARTING_SHOES_ARRAY = ["white_rain_boots", "black_rain_boots"]

  @@current_array = STARTING_SKIN_ARRAY
  @@skin_iterator = 0
  @@hair_iterator = 0
  @@face_iterator = 0
  @@shirt_iterator = 0
  @@pants_iterator = 0
  @@shoes_iterator = 0

  @@player_character_model = SF::RenderTexture.new(672, 512)
  @@player_character_rendered_model = SF::Sprite.new

   def Player.refresh_player_sprite(window)
    @@player_character_model.create(672, 1024, false)
    @@player_character_model.clear(SF::Color::Transparent)
    
    skin = CLOTHES_HASH[Appearance.get_clothing("skin")]
    current_skin = SF::Sprite.new(skin)

    current_hair = SF::Sprite.new(CLOTHES_HASH[Appearance.get_clothing("hair")])

    current_face = SF::Sprite.new(CLOTHES_HASH[Appearance.get_clothing("face")])

    current_hat = SF::Sprite.new(CLOTHES_HASH[Appearance.get_clothing("hat")])

    current_earrings = SF::Sprite.new(CLOTHES_HASH[Appearance.get_clothing("earrings")])

    current_shirt = SF::Sprite.new(CLOTHES_HASH[Appearance.get_clothing("shirt")])

    current_gloves = SF::Sprite.new(CLOTHES_HASH[Appearance.get_clothing("gloves")])

    current_pants = SF::Sprite.new(CLOTHES_HASH[Appearance.get_clothing("pants")])

    current_shoes = SF::Sprite.new(CLOTHES_HASH[Appearance.get_clothing("shoes")])

    current_weapon = SF::Sprite.new(CLOTHES_HASH[Appearance.get_clothing("weapon")])

    @@player_character_model.clear(SF::Color::Transparent)
    @@player_character_model.draw(current_skin)
    @@player_character_model.draw(current_earrings)
    @@player_character_model.draw(current_face)
    @@player_character_model.draw(current_hair)
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


   def Player.change_shirt(context, direction)
    case context
    when "character_creation"

        @@current_array = STARTING_SHIRT_ARRAY

    end
    if direction == "right" && @@shirt_iterator < @@current_array.size - 1
        @@shirt_iterator += 1
    elsif direction == "left" && @@shirt_iterator > 0
        @@shirt_iterator -= 1
    elsif @@shirt_iterator == @@current_array.size - 1
        @@shirt_iterator = 0
    else
        @@shirt_iterator = @@current_array.size - 1
    end
    return @@current_array[@@shirt_iterator]
   end


   def Player.change_pants(context, direction)
    case context
    when "character_creation"

        @@current_array = STARTING_PANTS_ARRAY

    end
    if direction == "right" && @@pants_iterator < @@current_array.size - 1
        @@pants_iterator += 1
    elsif direction == "left" && @@pants_iterator > 0
        @@pants_iterator -= 1
    elsif @@pants_iterator == @@current_array.size - 1
        @@pants_iterator = 0
    else
        @@pants_iterator = @@current_array.size - 1
    end
    return @@current_array[@@pants_iterator]
   end


   def Player.change_shoes(context, direction)
    case context
    when "character_creation"

        @@current_array = STARTING_SHOES_ARRAY

    end
    if direction == "right" && @@shoes_iterator < @@current_array.size - 1
        @@shoes_iterator += 1
    elsif direction == "left" && @@shoes_iterator > 0
        @@shoes_iterator -= 1
    elsif @@shoes_iterator == @@current_array.size - 1
        @@shoes_iterator = 0
    else
        @@shoes_iterator = @@current_array.size - 1
    end
    return @@current_array[@@shoes_iterator]
   end

 end
end