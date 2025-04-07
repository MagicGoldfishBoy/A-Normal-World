require "crsfml"
require "../src/textures.cr"
require "../src/player.cr"
require "../src/animations.cr"
require "../src/clothing.cr"
require "../src/body.cr"
require "../src/equipment.cr"

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
    
  class Player 

  def initialize(is_drawn : Bool, movement_state : String, direction : String)
    @@is_drawn = is_drawn
    @@movement_state = movement_state
    @@direction = direction
  end

  def Player.is_drawn
    @@is_drawn
  end

  def Player.is_drawn=(this)
    @@is_drawn = this
  end

  def Player.movement_state
    @@movement_state
  end

  def Player.movement_state=(this)
    @@movement_state = this
  end

  def Player.direction
    @@direction
  end

  def Player.direction=(this)
    @@direction = this
  end

  STARTING_SKIN_ARRAY = ["pale_skin", "tan_skin", "dark_skin", "ghostly_skin", "jaundiced_skin", "blue_skin", "pink_skin", "green_skin", "purple_skin", "red_skin"]

  STARTING_HAIR_ARRAY = ["Black Shounen Hair", "White Shounen Hair", "Blond Shounen Hair", "Light Blond Shounen Hair", "Brown Shounen Hair", "Orange Shounen Hair", "Red Shounen Hair", 
  "Blue Shounen Hair", "Pink Shounen Hair", "Green Shounen Hair", "Purple Shounen Hair", "White Ponytail Hair", "Black Ponytail Hair", "Blonde Ponytail Hair", "Light Blonde Ponytail Hair", 
  "Brown Ponytail Hair", "Orange Ponytail Hair", "Red Ponytail Hair", "Blue Ponytail Hair", "Pink Ponytail Hair", "Green Ponytail Hair", "Purple Ponytail Hair"]

  STARTING_FACE_ARRAY = ["Blue Button Eyes", "Black Button Eyes", "Brown Button Eyes", "Green Button Eyes", "Yellow Button Eyes", "Red Button Eyes", "Pink Button Eyes", "Purple Button Eyes", 
  "White Button Eyes", "Grey Button Eyes", "Pink Shounen Face", "Purple Shounen Face"]

  STARTING_SHIRT_ARRAY = ["White Tank Top", "Black Tank Top", "Red Tank Top", "Orange Tank Top", "Yellow Tank Top", "Green Tank Top", "Blue Tank Top", "Purple Tank Top", "Pink Tank Top",
   "White T-Shirt", "Black T-Shirt", "Red T-Shirt", "Orange T-Shirt", "Yellow T-Shirt", "Green T-Shirt", "Blue T-Shirt"]

  STARTING_PANTS_ARRAY = ["White Jeans", "Black Jeans"]

  STARTING_SHOES_ARRAY = ["White Rain Boots", "Black Rain Boots"]

  @@current_array = STARTING_SKIN_ARRAY
  @@skin_iterator = 0
  @@hair_iterator = 0
  @@face_iterator = 0
  @@shirt_iterator = 0
  @@pants_iterator = 0
  @@shoes_iterator = 0

  @@player_character_model = SF::RenderTexture.new(672, 512)
  @@player_character_rendered_model = SF::Sprite.new
  @@player_feet_hitbox = SF::RectangleShape.new(SF.vector2(25, 15))
  #@@player_feet_hitbox.fill_color = SF.color(100, 250, 50)

  

   def Player.draw_sprite(window)
    if @@is_drawn == true
        @@player_feet_hitbox.position = @@player_character_rendered_model.position + SF.vector2(35, 110)
        window.draw(@@player_character_rendered_model)
        #window.draw(@@player_feet_hitbox)
        if @@movement_state == nil
            @@movement_state = "idle"
        end
        if @@direction == nil
            @@direction = "left"
        end
        Player.animate_sprite(Player.movement_state, Player.direction)
    end
   end

   def Player.refresh_player_sprite(window)
    @@player_character_model.create(672, 1024, false)
    @@player_character_model.clear(SF::Color::Transparent)
    
    skin = CLOTHES_HASH[Appearance.get_clothing("skin")]
    current_skin = SF::Sprite.new(skin)

    current_hair = if hair = Body::Hair.get_hair(Appearance.get_clothing("hair"))

    hat = Appearance.get_clothing("hat")

        if hat.nil?
           return SF::Sprite.new
        elsif hat == "No Hat" || Clothing::Hat.get_hat(Appearance.get_clothing("hat")).try(&.length) != "full"
            SF::Sprite.new(hair.texture)
        else 
            i = "#{hair.name} Hat"
            texture = Body::Hair.get_hair(i).try(&.texture) || SF::Texture.new(NIL_TEXTURE)
            SF::Sprite.new(texture)
        end
        else
            SF::Sprite.new
        end

    current_face = if face = Body::Face.get_face(Appearance.get_clothing("face"))
        SF::Sprite.new(face.texture)
    else
        SF::Sprite.new
    end

    current_shirt = if shirt = Clothing::Shirt.get_shirt(Appearance.get_clothing("shirt"))
        SF::Sprite.new(shirt.texture)
    else
        SF::Sprite.new
    end

    current_pants = if pants = Clothing::Pants.get_pants(Appearance.get_clothing("pants"))
        SF::Sprite.new(pants.texture)
    else
        SF::Sprite.new
    end

    current_shoes = if shoes = Clothing::Shoes.get_shoes(Appearance.get_clothing("shoes"))
        SF::Sprite.new(shoes.texture)
    else
        SF::Sprite.new
    end

    current_socks = if socks = Clothing::Socks.get_socks(Appearance.get_clothing("socks"))
        SF::Sprite.new(socks.texture)
    else
        SF::Sprite.new
    end

    current_gloves = if gloves = Clothing::Gloves.get_gloves(Appearance.get_clothing("gloves"))
        SF::Sprite.new(gloves.texture)
    else
        SF::Sprite.new
    end

    current_earrings = if earrings = Clothing::Earrings.get_earrings(Appearance.get_clothing("earrings"))
        SF::Sprite.new(earrings.texture)
    else
        SF::Sprite.new
    end

    current_hat = if hat = Clothing::Hat.get_hat(Appearance.get_clothing("hat"))
        SF::Sprite.new(hat.texture)
    else
        SF::Sprite.new
    end

    current_glasses = if glasses = Clothing::Glasses.get_glasses(Appearance.get_clothing("glasses"))
        SF::Sprite.new(glasses.texture)
    else
        SF::Sprite.new
    end

    current_jacket_front = if jacket = Clothing::Jacket.get_jacket(Appearance.get_clothing("jacket"))
        SF::Sprite.new(jacket.front_texture)
    else
        SF::Sprite.new
    end

    current_jacket_back = if jacket = Clothing::Jacket.get_jacket(Appearance.get_clothing("jacket"))
        SF::Sprite.new(jacket.back_texture)
    else
        SF::Sprite.new
    end

    current_necklace = if necklace = Clothing::Necklace.get_necklace(Appearance.get_clothing("necklace"))
        SF::Sprite.new(necklace.texture)
    else
        SF::Sprite.new
    end

    makeup = Clothing::Makeup.get_makeup(Appearance.get_clothing("makeup"))

        current_makeup = if makeup
          face = Appearance.get_clothing("face")
          if face.nil?
            return SF::Sprite.new
          end
        
          face_name = Body::Face.get_face(face).try(&.name) || ""
        
          if face_name.includes?("Button") && !face_name.includes?("Shounen")
            i = "#{makeup.name} Button"
            texture = Clothing::Makeup.get_makeup_texture(i) || SF::Texture.new(NIL_TEXTURE)
            SF::Sprite.new(texture)
          elsif face_name.includes?("Shounen")
            i = "#{makeup.name} Shounen"
            texture = Clothing::Makeup.get_makeup_texture(i) || SF::Texture.new(NIL_TEXTURE)
            SF::Sprite.new(texture)
          else
            i = makeup.name
            texture = Clothing::Makeup.get_makeup_texture(i) || SF::Texture.new(NIL_TEXTURE)
            SF::Sprite.new(texture)
          end    
        else
          SF::Sprite.new
        end

    current_weapon = if weapon = Equipment::Weapon.get_weapon(Appearance.get_clothing("weapon"))
        SF::Sprite.new(weapon.texture)
    else
        SF::Sprite.new
    end

    if Player.direction == "left"
        @@player_character_model.clear(SF::Color::Transparent)
        @@player_character_model.draw(current_weapon)
        @@player_character_model.draw(current_skin)
        @@player_character_model.draw(current_jacket_back)
        @@player_character_model.draw(current_face)
        @@player_character_model.draw(current_makeup)
        @@player_character_model.draw(current_earrings)
        @@player_character_model.draw(current_glasses)
        @@player_character_model.draw(current_hair)
        @@player_character_model.draw(current_hat)
        @@player_character_model.draw(current_socks)
        @@player_character_model.draw(current_pants)
        @@player_character_model.draw(current_shirt)
        @@player_character_model.draw(current_necklace)
        @@player_character_model.draw(current_shoes)
        @@player_character_model.draw(current_gloves)
        @@player_character_model.draw(current_jacket_front)
    else
        @@player_character_model.clear(SF::Color::Transparent)
        @@player_character_model.draw(current_skin)
        @@player_character_model.draw(current_jacket_back)
        @@player_character_model.draw(current_face)
        @@player_character_model.draw(current_makeup)
        @@player_character_model.draw(current_earrings)
        @@player_character_model.draw(current_glasses)
        @@player_character_model.draw(current_hair)
        @@player_character_model.draw(current_hat)
        @@player_character_model.draw(current_socks)
        @@player_character_model.draw(current_pants)
        @@player_character_model.draw(current_shirt)
        @@player_character_model.draw(current_necklace)
        @@player_character_model.draw(current_shoes)
        @@player_character_model.draw(current_gloves)
        @@player_character_model.draw(current_jacket_front)
        @@player_character_model.draw(current_weapon)
    end

    @@player_character_model.display
    @@player_character_rendered_model.texture = @@player_character_model.texture
   end

   def Player.retrieve_sprite
    return @@player_character_rendered_model
   end

   def Player.resize_player_sprite(window, x, y)
    @@player_character_rendered_model.scale = SF.vector2(x, y)
   end

   def Player.position_player_sprite(window, x, y)
    @@player_character_rendered_model.position = SF.vector2(x, y)
   end

   def Player.check_sprite_collision(window, object)
    bounding_box = @@player_character_rendered_model.global_bounds
    if bounding_box.intersects? object.global_bounds
        return true
    else 
        return false
    end
    end

   def Player.check_feet_collision(window, object)
    bounding_box = @@player_feet_hitbox.global_bounds
    if bounding_box.intersects? object.global_bounds
        return true
    else 
        return false
    end
   end

   def Player.move_player_sprite(window, x, y)
    @@player_character_rendered_model.move(SF.vector2(x.not_nil!, y.not_nil!))
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

   def Player.animate_sprite(state, direction) #the stab animations are fucking stupid and I love it lol XD
    weapon = Equipment::Weapon.get_weapon(Appearance.get_clothing("weapon"))
    if state == "idle" && direction == "right"
        @@player_character_rendered_model.texture_rect = Animations::Player.idle_animation_right
    elsif state == "idle" && direction == "left"
        @@player_character_rendered_model.texture_rect = Animations::Player.idle_animation_left
    end

    if state == "walking" && direction == "right"
        @@player_character_rendered_model.texture_rect = Animations::Player.walking_animation_right
    elsif state == "walking" && direction == "left"
        @@player_character_rendered_model.texture_rect = Animations::Player.walking_animation_left
    end

    if state == "attacking" && direction == "right"
        if weapon.try(&.attack_type) == "swing"
         @@player_character_rendered_model.texture_rect = Animations::Player.attack_animation_right
        elsif weapon.try(&.attack_type) == "stab"
         @@player_character_rendered_model.texture_rect = Animations::Player.stab_animation_right
        elsif weapon.try(&.attack_type) == "shoot"
         @@player_character_rendered_model.texture_rect = Animations::Player.shoot_animation_right
        end
    elsif state == "attacking" && direction == "left"
        if weapon.try(&.attack_type) == "swing"
         @@player_character_rendered_model.texture_rect = Animations::Player.attack_animation_left
        elsif weapon.try(&.attack_type) == "stab"
         @@player_character_rendered_model.texture_rect = Animations::Player.stab_animation_left
        elsif weapon.try(&.attack_type) == "shoot"
         @@player_character_rendered_model.texture_rect = Animations::Player.shoot_animation_left
        end
    end
   end

 end
end
#Appearance.get_clothing(weapon)