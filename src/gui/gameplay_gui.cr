require "crsfml"
require "../../src/textures.cr"
require "../../src/fonts.cr"
require "../../src/ui_elements.cr"
require "../menus/menu_handling.cr"
require "../window/hud_window"

module GameplayGui
    class GameplayGuiElements
        MAIN_HUD_BOX = Ui_Elements::MenuBoxes.new("Main Hud Box", "HUD1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(
        0, 200, 1000, 500)), 1000.0, 100.0, 4)

        LEVEL_BOX = Ui_Elements::MenuBoxes.new("Level Box", "Stats1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(
        400, 0, 115, 40)), 115.0, 40.0, 1)
        LEVEL_BOX_TEXT = Ui_Elements::MenuText.new("Level Box Text", "Stats1", SF::Text.new("Level", QUICKSAND, 34))

        MENU_BOX = Ui_Elements::MenuBoxes.new("Menu Box", "HudMen1", SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(
        400, 0, 115, 40)), 115.0, 40.0, 1)
        MENU_BOX_TEXT = Ui_Elements::MenuText.new("Menu Box Text", "HudMen1", SF::Text.new("Menu", QUICKSAND, 24))

        HP_BAR = SF::RectangleShape.new(SF.vector2(300, 15))
        HP_COLOR_BAR = SF::RectangleShape.new(SF.vector2(300, 15))
        HP_COLOR_BAR.fill_color = SF.color( 122, 14, 14 )

        MP_BAR = SF::RectangleShape.new(SF.vector2(300, 15))
        MP_COLOR_BAR = SF::RectangleShape.new(SF.vector2(300, 15))
        MP_COLOR_BAR.fill_color = SF.color( 23, 81, 159 )

        EXP_BAR = SF::RectangleShape.new(SF.vector2(300, 15))
        EXP_COLOR_BAR = SF::RectangleShape.new(SF.vector2(300, 15))
        EXP_COLOR_BAR.fill_color = SF.color( 170, 183, 38 )
    end
    class GameplayGuiDisplay
        def self.initialize_hud(window)
            Sprites::Player.refresh_player_sprite(window)
            Sprites::Player.resize_player_sprite(window, 1, 1)
            Sprites::Player.position_player_sprite(window, 250, 50)
    
            current_size = window.size
            original_width = 800 
            original_height = 600
        
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height

            GameplayGuiElements::MAIN_HUD_BOX.sprite.scale = SF.vector2(scale_x, scale_y / 5)
            GameplayGuiElements::MAIN_HUD_BOX.sprite.position = SF.vector2(0_f32, current_size.y.to_f32 - GameplayGuiElements::MAIN_HUD_BOX.height)
            GameplayGuiElements::LEVEL_BOX.sprite.scale = SF.vector2(scale_x, scale_y)
    
            GameplayGuiElements::MENU_BOX.sprite.position = SF.vector2(GameplayGuiElements::MAIN_HUD_BOX.sprite.position.x + 550, 
            current_size.y.to_f32 - GameplayGuiElements::MENU_BOX.height - 10)
            GameplayGuiElements::MENU_BOX.sprite.scale = SF.vector2(scale_x, scale_y)
    
            GameplayGuiElements::LEVEL_BOX_TEXT.text.position = GameplayGuiElements::LEVEL_BOX.sprite.position + SF.vector2(50 - Player::Stats.lvl.to_s.size, 1)
    
            GameplayGuiElements::LEVEL_BOX_TEXT.text.string = Player::Stats.lvl.to_s
            GameplayGuiElements::LEVEL_BOX_TEXT.text.scale = SF.vector2(scale_x, scale_y)
    
            GameplayGuiElements::MENU_BOX_TEXT.text.scale = SF.vector2(scale_x, scale_y)
    
            GameplayGuiElements::HP_BAR.position = SF.vector2(GameplayGuiElements::MAIN_HUD_BOX.sprite.position.x + 190, current_size.y.to_f32 - GameplayGuiElements::LEVEL_BOX.height - 10)
            GameplayGuiElements::MP_BAR.position = SF.vector2(GameplayGuiElements::MAIN_HUD_BOX.sprite.position.x + 190, current_size.y.to_f32 - GameplayGuiElements::LEVEL_BOX.height - 20)
            
         end
    
         def self.draw_hud(window) 
          if SF::Event::Resized #the HUD will never scale correctly without this
            current_size = window.size
            original_width = 800 
            original_height = 600
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
            GameplayGuiElements::MAIN_HUD_BOX.sprite.scale = SF.vector2(scale_x, scale_y / 5)
            GameplayGuiElements::MAIN_HUD_BOX.sprite.position = SF.vector2(0_f32, current_size.y.to_f32 - GameplayGuiElements::MAIN_HUD_BOX.sprite.global_bounds.height)
    
            scale_ratio = [scale_x, scale_y].min
            GameplayGuiElements::LEVEL_BOX.sprite.scale = SF.vector2(scale_x, scale_y)
            GameplayGuiElements::LEVEL_BOX.sprite.position = SF.vector2(30_f32 * scale_x, 
            GameplayGuiElements::MAIN_HUD_BOX.sprite.position.y - GameplayGuiElements::LEVEL_BOX.height + 70 * scale_y)
    
            GameplayGuiElements::LEVEL_BOX_TEXT.text.scale = SF.vector2(scale_ratio, scale_ratio)
            GameplayGuiElements::LEVEL_BOX_TEXT.text.position = GameplayGuiElements::LEVEL_BOX.sprite.position + SF.vector2((50 - Player::Stats.lvl.to_s.size) * scale_x, 1 * scale_y)
    
            GameplayGuiElements::MENU_BOX.sprite.scale = SF.vector2(scale_x, scale_y)
            GameplayGuiElements::MENU_BOX.sprite.position = SF.vector2(650_f32 * scale_x, GameplayGuiElements::MAIN_HUD_BOX.sprite.position.y - GameplayGuiElements::LEVEL_BOX.height + 70 * scale_y)
    
            GameplayGuiElements::MENU_BOX_TEXT.text.scale = SF.vector2(scale_ratio, scale_ratio)
            GameplayGuiElements::MENU_BOX_TEXT.text.position = GameplayGuiElements::MENU_BOX.sprite.position + SF.vector2(28 + scale_x, scale_y)
    
            #so much math lol
    
            GameplayGuiElements::HP_BAR.position = SF.vector2(GameplayGuiElements::MAIN_HUD_BOX.sprite.position.x + 190 * scale_x, GameplayGuiElements::MAIN_HUD_BOX.sprite.position.y - GameplayGuiElements::LEVEL_BOX.height + 65 * scale_y)
            GameplayGuiElements::HP_BAR.scale = SF.vector2(scale_ratio, scale_ratio)
    
            GameplayGuiElements::HP_COLOR_BAR.position = SF.vector2(GameplayGuiElements::MAIN_HUD_BOX.sprite.position.x + 190 * scale_x, GameplayGuiElements::MAIN_HUD_BOX.sprite.position.y - GameplayGuiElements::LEVEL_BOX.height + 65 * scale_y)
            GameplayGuiElements::HP_COLOR_BAR.scale = SF.vector2((Player::Stats.current_hp.not_nil! / Player::Stats.max_hp.not_nil!) * scale_ratio, scale_ratio) 
    
            GameplayGuiElements::MP_BAR.position = SF.vector2(GameplayGuiElements::MAIN_HUD_BOX.sprite.position.x + 190 * scale_x, GameplayGuiElements::MAIN_HUD_BOX.sprite.position.y - GameplayGuiElements::LEVEL_BOX.height + 85 * scale_y)
            GameplayGuiElements::MP_BAR.scale = SF.vector2(scale_ratio, scale_ratio)
    
            GameplayGuiElements::MP_COLOR_BAR.position = SF.vector2(GameplayGuiElements::MAIN_HUD_BOX.sprite.position.x + 190 * scale_x, GameplayGuiElements::MAIN_HUD_BOX.sprite.position.y - GameplayGuiElements::LEVEL_BOX.height + 85 * scale_y)
            GameplayGuiElements::MP_COLOR_BAR.scale = SF.vector2((Player::Stats.current_mp.not_nil! / Player::Stats.max_mp.not_nil!) * scale_ratio, scale_ratio) 
    
            GameplayGuiElements::EXP_BAR.position = SF.vector2(GameplayGuiElements::MAIN_HUD_BOX.sprite.position.x + 190 * scale_x, GameplayGuiElements::MAIN_HUD_BOX.sprite.position.y - GameplayGuiElements::LEVEL_BOX.height + 105 * scale_y)
            GameplayGuiElements::EXP_BAR.scale = SF.vector2(scale_ratio, scale_ratio)
    
            GameplayGuiElements::EXP_COLOR_BAR.position = SF.vector2(GameplayGuiElements::MAIN_HUD_BOX.sprite.position.x + 190 * scale_x, GameplayGuiElements::MAIN_HUD_BOX.sprite.position.y - GameplayGuiElements::LEVEL_BOX.height + 105 * scale_y)
            GameplayGuiElements::EXP_COLOR_BAR.scale = SF.vector2((Player::Stats.exp.not_nil! / Player::Stats.exp_cap.not_nil!) * scale_ratio, scale_ratio) 
          end
            window_size = window.size
            hud_view = SF::View.new(SF::FloatRect.new(0_f32, window_size.y.to_f32 / 2_f32, window_size.x.to_f32, window_size.y.to_f32 / 2_f32))
            hud_view.viewport = SF::FloatRect.new(0_f32, 0.5_f32, 1_f32, 0.5_f32)
            window.view = hud_view
            window.draw(GameplayGuiElements::MAIN_HUD_BOX.sprite)
            window.draw(GameplayGuiElements::LEVEL_BOX.sprite)
            window.draw(GameplayGuiElements::LEVEL_BOX_TEXT.text)
            window.draw(GameplayGuiElements::MENU_BOX.sprite)
            window.draw(GameplayGuiElements::MENU_BOX_TEXT.text)
            window.draw(GameplayGuiElements::HP_BAR)
            window.draw(GameplayGuiElements::HP_COLOR_BAR)
            window.draw(GameplayGuiElements::MP_BAR)
            window.draw(GameplayGuiElements::MP_COLOR_BAR)
            window.draw(GameplayGuiElements::EXP_BAR)
            window.draw(GameplayGuiElements::EXP_COLOR_BAR)
            window.view = window.default_view
            if SF::Mouse.button_pressed?(SF::Mouse::Left)
                GameplayGuiMouseHandling.hud_mouse_handling(window)
            end
         end
    end
    class GameplayGuiMouseHandling
        def self.hud_mouse_handling(window)
            window_size = window.size
            hud_view = SF::View.new(SF::FloatRect.new(0_f32, window_size.y.to_f32 / 2_f32, window_size.x.to_f32, window_size.y.to_f32 / 2_f32))
            hud_view.viewport = SF::FloatRect.new(0_f32, 0.5_f32, 1_f32, 0.5_f32)
            window.view = hud_view
            mouse_position = window.map_pixel_to_coords(SF::Mouse.get_position(window), window.view)

            mouse_x = mouse_position.x
            mouse_y = mouse_position.y

            current_size = window.size
            original_width = 800
            original_height = 600
        
            scale_x = current_size.x.to_f / original_width
            scale_y = current_size.y.to_f / original_height
        
            scaled_mouse_x = mouse_x / scale_x
            scaled_mouse_y = mouse_y / scale_y
            
            if MouseHandling::ClickHandling.button_clicked?(GameplayGuiElements::MENU_BOX.sprite, scaled_mouse_x, scaled_mouse_y)
               HudWindow::HudWindowElements.position_hud_window_elements(window)
               MenuHandling::Window.is_hud_window_open = !MenuHandling::Window.is_hud_window_open
                sleep 0.25.seconds
            end
        end
    end
end