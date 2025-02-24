require "crsfml"
require "../src/textures.cr"
require "../src/player.cr"

module Sprites
    include Player
    extend self
    CLOTHES_HASH = Hash(String, SF::Texture).new
    CLOTHES_HASH["pale_skin"] = SKIN_TEXTURE_01
    CLOTHES_HASH["white_shounen_hair"] = SHOUNEN_HAIR_WHITE_TEXTURE
    CLOTHES_HASH["black_shounen_hair"] = SHOUNEN_HAIR_BLACK_TEXTURE
    CLOTHES_HASH["blue_button_eyes"] = BUTTON_EYES_BLUE_TEXTURE
    
  class Player < Appearance

  @@player_character_model = SF::RenderTexture.new(672, 512)
  @@player_character_rendered_model = SF::Sprite.new(@@player_character_model.texture)

   def Player.refresh_player_sprite(window)
    @@player_character_model.clear(SF::Color::Transparent)
    
    this = "skin"
    skin = CLOTHES_HASH[Appearance.get_clothing(this)]
    current_skin = SF::Sprite.new(skin)
    @@player_character_model.draw(current_skin)

    this = "hair"
    hair = CLOTHES_HASH[Appearance.get_clothing(this)]
    current_hair = SF::Sprite.new(hair)
    @@player_character_model.draw(current_hair)

    this = "face"
    face = CLOTHES_HASH[Appearance.get_clothing(this)]
    current_face = SF::Sprite.new(face)
    @@player_character_model.draw(current_face)

    @@player_character_model.create(672, 1024, false)
    @@player_character_model.display
    @@player_character_rendered_model.texture_rect = SF.int_rect(0, 0, 96, 128)
    window.draw(@@player_character_rendered_model)
   end
   def Player.resize_player_sprite(window, x, y)
    @@player_character_rendered_model.scale = SF.vector2(x, y)
   end
   def Player.position_player_sprite(window, x, y)
    @@player_character_rendered_model.position = SF.vector2(x, y)
   end
 end
end