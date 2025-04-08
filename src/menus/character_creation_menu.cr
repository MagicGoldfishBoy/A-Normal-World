require "crsfml"
require "../../src/textures.cr"
require "../../src/fonts.cr"
require "../../src/ui_elements.cr"
require "../../src/mouse.cr"
require "../../src/sprites.cr"
require "../menus/save_menu.cr"
require "../menus/main_menu.cr"

module CharacterCreationMenu
    class CharacterCreationMenuElements
        BACK_BUTTON = Ui_Elements::MenuBoxes.new("Back Button", "Main2", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(0, 100, 115, 40)), 115.0, 40.0, 1)
        BACK_BUTTON_TEXT = Ui_Elements::MenuText.new("Back Button Text", "Main2", SF::Text.new("Back", QUICKSAND, 28))

        NEXT_BUTTON = Ui_Elements::MenuBoxes.new("Next Button", "Main5", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(0, 140, 115, 40)), 115.0, 40.0, 1)
        NEXT_BUTTON_TEXT = Ui_Elements::MenuText.new("Next Button Text", "Main5", SF::Text.new("Next", QUICKSAND, 28))

        SKIN_BOX_LEFT = Ui_Elements::MenuBoxes.new("Skin Box Left", "SkinL1", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(0, 100, 115, 40)), 115.0, 40.0, 1)
        SKIN_BOX_LEFT_TEXT = Ui_Elements::MenuText.new("Skin Box Left Text", "SkinL1", SF::Text.new("Skin", QUICKSAND, 24))

        SKIN_BOX_RIGHT = Ui_Elements::MenuBoxes.new("Skin Box Right", "SkinR1", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(0, 140, 115, 40)), 115.0, 40.0, 1)
        SKIN_BOX_RIGHT_TEXT = Ui_Elements::MenuText.new("Skin Box Right Text", "SkinR1", SF::Text.new("Skin", QUICKSAND, 24))

        HAIR_BOX_LEFT = Ui_Elements::MenuBoxes.new("Hair Box Left", "HairL1", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(0, 100, 115, 40)), 115.0, 40.0, 1)
        HAIR_BOX_LEFT_TEXT = Ui_Elements::MenuText.new("Hair Box Left Text", "HairL1", SF::Text.new("Hair", QUICKSAND, 24))

        HAIR_BOX_RIGHT = Ui_Elements::MenuBoxes.new("Hair Box Right", "HairR1", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(0, 140, 115, 40)), 115.0, 40.0, 1)
        HAIR_BOX_RIGHT_TEXT = Ui_Elements::MenuText.new("Hair Box Right Text", "HairR1", SF::Text.new("Hair", QUICKSAND, 24))

        FACE_BOX_LEFT = Ui_Elements::MenuBoxes.new("Face Box Left", "FaceL1", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(0, 100, 115, 40)), 115.0, 40.0, 1)
        FACE_BOX_LEFT_TEXT = Ui_Elements::MenuText.new("Face Box Left Text", "FaceL1", SF::Text.new("Face", QUICKSAND, 24))

        FACE_BOX_RIGHT = Ui_Elements::MenuBoxes.new("Face Box Right", "FaceR1", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(0, 140, 115, 40)), 115.0, 40.0, 1)
        FACE_BOX_RIGHT_TEXT = Ui_Elements::MenuText.new("Face Box Right Text", "FaceR1", SF::Text.new("Face", QUICKSAND, 24))

        SHIRT_BOX_LEFT = Ui_Elements::MenuBoxes.new("Shirt Box Left", "ShirtL1", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(0, 100, 115, 40)), 115.0, 40.0, 1)
        SHIRT_BOX_LEFT_TEXT = Ui_Elements::MenuText.new("Shirt Box Left Text", "ShirtL1", SF::Text.new("Shirt", QUICKSAND, 24))

        SHIRT_BOX_RIGHT = Ui_Elements::MenuBoxes.new("Shirt Box Right", "ShirtR1", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(0, 140, 115, 40)), 115.0, 40.0, 1)
        SHIRT_BOX_RIGHT_TEXT = Ui_Elements::MenuText.new("Shirt Box Right Text", "ShirtR1", SF::Text.new("Shirt", QUICKSAND, 24))

        PANTS_BOX_LEFT = Ui_Elements::MenuBoxes.new("Pants Box Left", "PantsL1", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(0, 100, 115, 40)), 115.0, 40.0, 1)
        PANTS_BOX_LEFT_TEXT = Ui_Elements::MenuText.new("Pants Box Left Text", "PantsL1", SF::Text.new("Pants", QUICKSAND, 24))

        PANTS_BOX_RIGHT = Ui_Elements::MenuBoxes.new("Pants Box Right", "PantsR1", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(0, 140, 115, 40)), 115.0, 40.0, 1)
        PANTS_BOX_RIGHT_TEXT = Ui_Elements::MenuText.new("Pants Box Right Text", "PantsR1", SF::Text.new("Pants", QUICKSAND, 24))

        SHOES_BOX_LEFT = Ui_Elements::MenuBoxes.new("Shoes Box Left", "ShoesL1", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(0, 100, 115, 40)), 115.0, 40.0, 1)
        SHOES_BOX_LEFT_TEXT = Ui_Elements::MenuText.new("Shoes Box Left Text", "ShoesL1", SF::Text.new("Shoes", QUICKSAND, 24))

        SHOES_BOX_RIGHT = Ui_Elements::MenuBoxes.new("Shoes Box Right", "ShoesR1", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(0, 140, 115, 40)), 115.0, 40.0, 1)
        SHOES_BOX_RIGHT_TEXT = Ui_Elements::MenuText.new("Shoes Box Right Text", "ShoesR1", SF::Text.new("Shoes", QUICKSAND, 24))
    end
    class CharacterCreationMenuDisplay
        def self.initialize_character_creation_menu(window)
            Player::Appearance.initialize_player_model
            Sprites::Player.refresh_player_sprite(window)
            Sprites::Player.resize_player_sprite(window, 3, 3)
            Sprites::Player.position_player_sprite(window, 250, 50)
    
            current_size = window.size
            original_width = 800 
            original_height = 600
        
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
    
            CharacterCreationMenuElements::BACK_BUTTON.sprite.position = SF.vector2(scale_x + 20, scale_y + 540)
            CharacterCreationMenuElements::BACK_BUTTON_TEXT.text.position = CharacterCreationMenuElements::BACK_BUTTON.sprite.position + SF.vector2(28, 1)
    
            CharacterCreationMenuElements::SKIN_BOX_LEFT.sprite.position = SF.vector2(scale_x + 80, scale_y + 60)
            CharacterCreationMenuElements::SKIN_BOX_LEFT_TEXT.text.position = CharacterCreationMenuElements::SKIN_BOX_LEFT.sprite.position + SF.vector2(30, 1)
    
            CharacterCreationMenuElements::SKIN_BOX_RIGHT.sprite.position = SF.vector2(scale_x + 560, scale_y + 60)
            CharacterCreationMenuElements::SKIN_BOX_RIGHT_TEXT.text.position = CharacterCreationMenuElements::SKIN_BOX_RIGHT.sprite.position + SF.vector2(30, 1)
    
            CharacterCreationMenuElements::HAIR_BOX_LEFT.sprite.position = SF.vector2(scale_x + 80, scale_y + 130)
            CharacterCreationMenuElements::HAIR_BOX_LEFT_TEXT.text.position = CharacterCreationMenuElements::HAIR_BOX_LEFT.sprite.position + SF.vector2(30, 1)
    
            CharacterCreationMenuElements::HAIR_BOX_RIGHT.sprite.position = SF.vector2(scale_x + 560, scale_y + 130)
            CharacterCreationMenuElements::HAIR_BOX_RIGHT_TEXT.text.position = CharacterCreationMenuElements::HAIR_BOX_RIGHT.sprite.position + SF.vector2(30, 1)
    
            CharacterCreationMenuElements::FACE_BOX_LEFT.sprite.position = SF.vector2(scale_x + 80, scale_y + 200)
            CharacterCreationMenuElements::FACE_BOX_LEFT_TEXT.text.position = CharacterCreationMenuElements::FACE_BOX_LEFT.sprite.position + SF.vector2(30, 1)
    
            CharacterCreationMenuElements::FACE_BOX_RIGHT.sprite.position = SF.vector2(scale_x + 560, scale_y + 200)
            CharacterCreationMenuElements::FACE_BOX_RIGHT_TEXT.text.position = CharacterCreationMenuElements::FACE_BOX_RIGHT.sprite.position + SF.vector2(30, 1)
    
            CharacterCreationMenuElements::SHIRT_BOX_LEFT.sprite.position = SF.vector2(scale_x + 80, scale_y + 270)
            CharacterCreationMenuElements::SHIRT_BOX_LEFT_TEXT.text.position = CharacterCreationMenuElements::SHIRT_BOX_LEFT.sprite.position + SF.vector2(30, 1)
    
            CharacterCreationMenuElements::SHIRT_BOX_RIGHT.sprite.position = SF.vector2(scale_x + 560, scale_y + 270)
            CharacterCreationMenuElements::SHIRT_BOX_RIGHT_TEXT.text.position = CharacterCreationMenuElements::SHIRT_BOX_RIGHT.sprite.position + SF.vector2(30, 1)
    
            CharacterCreationMenuElements::PANTS_BOX_LEFT.sprite.position = SF.vector2(scale_x + 80, scale_y + 340)
            CharacterCreationMenuElements::PANTS_BOX_LEFT_TEXT.text.position = CharacterCreationMenuElements::PANTS_BOX_LEFT.sprite.position + SF.vector2(20, 1)
    
            CharacterCreationMenuElements::PANTS_BOX_RIGHT.sprite.position = SF.vector2(scale_x + 560, scale_y + 340)
            CharacterCreationMenuElements::PANTS_BOX_RIGHT_TEXT.text.position = CharacterCreationMenuElements::PANTS_BOX_RIGHT.sprite.position + SF.vector2(20, 1)
    
            CharacterCreationMenuElements::SHOES_BOX_LEFT.sprite.position = SF.vector2(scale_x + 80, scale_y + 410)
            CharacterCreationMenuElements::SHOES_BOX_LEFT_TEXT.text.position = CharacterCreationMenuElements::SHOES_BOX_LEFT.sprite.position + SF.vector2(20, 1)
    
            CharacterCreationMenuElements::SHOES_BOX_RIGHT.sprite.position = SF.vector2(scale_x + 560, scale_y + 410)
            CharacterCreationMenuElements::SHOES_BOX_RIGHT_TEXT.text.position = CharacterCreationMenuElements::SHOES_BOX_RIGHT.sprite.position + SF.vector2(20, 1)
    
            CharacterCreationMenuElements::NEXT_BUTTON.sprite.position = SF.vector2(scale_x + 660, scale_y + 540)
            CharacterCreationMenuElements::NEXT_BUTTON_TEXT.text.position = CharacterCreationMenuElements::NEXT_BUTTON.sprite.position + SF.vector2(15, 1)
    
            sleep 0.15.seconds
            #SystemMenus.system_menu=("character_creation_menu")
            MenuHandling::Menu.current_menu = "character_creation_menu"
            Sprites::Player.is_drawn=(true)
         end
         def self.draw_charater_creation_menu(window)
            window.draw(CharacterCreationMenuElements::BACK_BUTTON.sprite)
            window.draw(CharacterCreationMenuElements::SKIN_BOX_LEFT.sprite)
            window.draw(CharacterCreationMenuElements::SKIN_BOX_RIGHT.sprite)
            window.draw(CharacterCreationMenuElements::HAIR_BOX_LEFT.sprite)
            window.draw(CharacterCreationMenuElements::HAIR_BOX_RIGHT.sprite)
            window.draw(CharacterCreationMenuElements::FACE_BOX_LEFT.sprite)
            window.draw(CharacterCreationMenuElements::FACE_BOX_RIGHT.sprite)
            window.draw(CharacterCreationMenuElements::SHIRT_BOX_LEFT.sprite)
            window.draw(CharacterCreationMenuElements::SHIRT_BOX_RIGHT.sprite)
            window.draw(CharacterCreationMenuElements::PANTS_BOX_LEFT.sprite)
            window.draw(CharacterCreationMenuElements::PANTS_BOX_RIGHT.sprite)
            window.draw(CharacterCreationMenuElements::SHOES_BOX_LEFT.sprite)
            window.draw(CharacterCreationMenuElements::SHOES_BOX_RIGHT.sprite)
            window.draw(CharacterCreationMenuElements::NEXT_BUTTON.sprite)
    
            window.draw(CharacterCreationMenuElements::BACK_BUTTON_TEXT.text)
            window.draw(CharacterCreationMenuElements::SKIN_BOX_LEFT_TEXT.text)
            window.draw(CharacterCreationMenuElements::SKIN_BOX_RIGHT_TEXT.text)
            window.draw(CharacterCreationMenuElements::HAIR_BOX_LEFT_TEXT.text)
            window.draw(CharacterCreationMenuElements::HAIR_BOX_RIGHT_TEXT.text)
            window.draw(CharacterCreationMenuElements::FACE_BOX_LEFT_TEXT.text)
            window.draw(CharacterCreationMenuElements::FACE_BOX_RIGHT_TEXT.text)
            window.draw(CharacterCreationMenuElements::SHIRT_BOX_LEFT_TEXT.text)
            window.draw(CharacterCreationMenuElements::SHIRT_BOX_RIGHT_TEXT.text)
            window.draw(CharacterCreationMenuElements::PANTS_BOX_LEFT_TEXT.text)
            window.draw(CharacterCreationMenuElements::PANTS_BOX_RIGHT_TEXT.text)
            window.draw(CharacterCreationMenuElements::SHOES_BOX_LEFT_TEXT.text)
            window.draw(CharacterCreationMenuElements::SHOES_BOX_RIGHT_TEXT.text)
            window.draw(CharacterCreationMenuElements::NEXT_BUTTON_TEXT.text)
            if SF::Mouse.button_pressed?(SF::Mouse::Left)
                CharacterCreationMenuMouseHandling.character_creation_menu_mouse_handling(window)
            end
         end
    end
    class CharacterCreationMenuMouseHandling
        def self.character_creation_menu_mouse_handling(window)
            mouse_position = SF::Mouse.get_position(window)
            mouse_x = mouse_position.x
            mouse_y = mouse_position.y
    
            current_size = window.size
            original_width = 800
            original_height = 600
        
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
        
            scaled_mouse_x = mouse_x / scale_x
            scaled_mouse_y = mouse_y / scale_y

            if MouseHandling::ClickHandling.button_clicked?(CharacterCreationMenuElements::BACK_BUTTON.sprite, scaled_mouse_x, scaled_mouse_y)
                Sprites::Player.is_drawn=(false)
                MenuHandling::Menu.current_menu = "save_menu"
                sleep 0.15.seconds
            elsif MouseHandling::ClickHandling.button_clicked?(CharacterCreationMenuElements::NEXT_BUTTON.sprite, scaled_mouse_x, scaled_mouse_y)
                Sprites::Player.is_drawn=(true)
                MenuHandling::Menu.current_menu = "hud"
                Keyboard::Gameplay.gameplay_mode=("normal")
                Levels::PhysicsTest.initialize_platform_test(window)
                Sprites::Player.resize_player_sprite(window, 1, 1)
                Levels::LevelSelectionLogic.level=("physics_test")
            elsif MouseHandling::ClickHandling.button_clicked?(CharacterCreationMenuElements::SKIN_BOX_LEFT.sprite, scaled_mouse_x, scaled_mouse_y)
                Player::Appearance.change_skin(Sprites::Player.change_skin("character_creation", "left"))
                Sprites::Player.refresh_player_sprite(window)
                sleep 0.15.seconds 
            elsif MouseHandling::ClickHandling.button_clicked?(CharacterCreationMenuElements::SKIN_BOX_RIGHT.sprite, scaled_mouse_x, scaled_mouse_y)
                Player::Appearance.change_skin(Sprites::Player.change_skin("character_creation", "right"))
                Sprites::Player.refresh_player_sprite(window)
                sleep 0.15.seconds
            elsif MouseHandling::ClickHandling.button_clicked?(CharacterCreationMenuElements::HAIR_BOX_LEFT.sprite, scaled_mouse_x, scaled_mouse_y)
                Player::Appearance.change_hair(Sprites::Player.change_hair("character_creation", "left"))
                Sprites::Player.refresh_player_sprite(window)
                sleep 0.15.seconds
            elsif MouseHandling::ClickHandling.button_clicked?(CharacterCreationMenuElements::HAIR_BOX_RIGHT.sprite, scaled_mouse_x, scaled_mouse_y)
                Player::Appearance.change_hair(Sprites::Player.change_hair("character_creation", "right"))
                Sprites::Player.refresh_player_sprite(window)
                sleep 0.15.seconds
            elsif MouseHandling::ClickHandling.button_clicked?(CharacterCreationMenuElements::FACE_BOX_LEFT.sprite, scaled_mouse_x, scaled_mouse_y)
                Player::Appearance.change_face(Sprites::Player.change_face("character_creation", "left"))
                Sprites::Player.refresh_player_sprite(window)
                sleep 0.15.seconds
            elsif MouseHandling::ClickHandling.button_clicked?(CharacterCreationMenuElements::FACE_BOX_RIGHT.sprite, scaled_mouse_x, scaled_mouse_y)
                Player::Appearance.change_face(Sprites::Player.change_face("character_creation", "right"))
                Sprites::Player.refresh_player_sprite(window)
                sleep 0.15.seconds
            elsif MouseHandling::ClickHandling.button_clicked?(CharacterCreationMenuElements::SHIRT_BOX_LEFT.sprite, scaled_mouse_x, scaled_mouse_y)
                Player::Appearance.change_shirt(Sprites::Player.change_shirt("character_creation", "left"))
                Sprites::Player.refresh_player_sprite(window)
                sleep 0.15.seconds
            elsif MouseHandling::ClickHandling.button_clicked?(CharacterCreationMenuElements::SHIRT_BOX_RIGHT.sprite, scaled_mouse_x, scaled_mouse_y)
                Player::Appearance.change_shirt(Sprites::Player.change_shirt("character_creation", "right"))
                Sprites::Player.refresh_player_sprite(window)
                sleep 0.15.seconds
            elsif MouseHandling::ClickHandling.button_clicked?(CharacterCreationMenuElements::PANTS_BOX_LEFT.sprite, scaled_mouse_x, scaled_mouse_y)
                Player::Appearance.change_pants(Sprites::Player.change_pants("character_creation", "left"))
                Sprites::Player.refresh_player_sprite(window)
                sleep 0.15.seconds
            elsif MouseHandling::ClickHandling.button_clicked?(CharacterCreationMenuElements::PANTS_BOX_RIGHT.sprite, scaled_mouse_x, scaled_mouse_y)
                Player::Appearance.change_pants(Sprites::Player.change_pants("character_creation", "right"))
                Sprites::Player.refresh_player_sprite(window)
                sleep 0.15.seconds
            elsif MouseHandling::ClickHandling.button_clicked?(CharacterCreationMenuElements::SHOES_BOX_LEFT.sprite, scaled_mouse_x, scaled_mouse_y)
                Player::Appearance.change_shoes(Sprites::Player.change_shoes("character_creation", "left"))
                Sprites::Player.refresh_player_sprite(window)
                sleep 0.15.seconds
            elsif MouseHandling::ClickHandling.button_clicked?(CharacterCreationMenuElements::SHOES_BOX_RIGHT.sprite, scaled_mouse_x, scaled_mouse_y)
                Player::Appearance.change_shoes(Sprites::Player.change_shoes("character_creation", "right"))
                Sprites::Player.refresh_player_sprite(window)
                sleep 0.15.seconds
            end
         end
    end
end