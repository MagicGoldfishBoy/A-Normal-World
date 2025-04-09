require "crsfml"
require "../../src/textures.cr"
require "../../src/fonts.cr"
require "../../src/ui_elements.cr"
require "../menus/menu_handling.cr"

module LevelEditorGui
    class LevelEditorGuiElements

        MAIN_LEVEL_EDITOR_BOX = Ui_Elements::MenuBoxes.new("Main Hud Box", "HUD1", SF::Sprite.new(
        BLANK_TEXTURE, SF::Rect.new(0, 200, 1000, 500)), 1000.0, 100.0, 4)


        CURRENT_TEMPLATE_BOX = Ui_Elements::MenuBoxes.new("Current Template Box", "LevEdMen1", 
        SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(900, 0, 160, 40)), 160.0, 40.0, 1)
        CURRENT_TEMPLATE_BOX_TEXT = Ui_Elements::MenuText.new("Current Template Box Text", "LevEdMen2", 
        SF::Text.new("Current Template", QUICKSAND, 12))

        CURRENT_TEMPLATE_LEFT_ARROW = Ui_Elements::MenuBoxes.new("Current Template Left Arrow", "LevEdMen3", 
        SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(900, 50, 50, 40)), 50.0, 40.0, 2)

        CURRENT_TEMPLATE_RIGHT_ARROW = Ui_Elements::MenuBoxes.new("Current Template Right Arrow", "LevEdMen4", 
        SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(950, 50, 50, 40)), 50.0, 40.0, 2)



        CURRENT_ELEMENT_BOX = Ui_Elements::MenuBoxes.new("Current Element Box", "LevEdMen5", 
        SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(900, 0, 160, 40)), 160.0, 40.0, 1)
        CURRENT_ELEMENT_BOX_TEXT = Ui_Elements::MenuText.new("Current Element Text", "LevEdMen2", 
        SF::Text.new("", QUICKSAND, 12))

        CURRENT_LEFT_ARROW = Ui_Elements::MenuBoxes.new("Selected Level Left Arrow", "LevEdMen6", 
        SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(900, 50, 50, 40)), 50.0, 40.0, 2)

        CURRENT_RIGHT_ARROW = Ui_Elements::MenuBoxes.new("Selected Level Right Arrow", "LevEdMen7", 
        SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(950, 50, 50, 40)), 50.0, 40.0, 2)



        CURRENT_TEMPLATE_CATEGORY_MENU = Ui_Elements::MenuBoxes.new("Level Element Type Menu", "LevEdMen7", 
        SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(900, 0, 160, 40)), 160.0, 40.0, 1)
        CURRENT_TEMPLATE_CATEGORY_TEXT = Ui_Elements::MenuText.new("Level Element Type Text", "LevEdMen3", 
        SF::Text.new("", QUICKSAND, 24))

        CURRENT_TEMPLATE_CATEGORY_LEFT_ARROW = Ui_Elements::MenuBoxes.new("Level Element Left Arrow", "LevEdMen8", 
        SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(900, 50, 50, 40)), 50.0, 40.0, 2)

        CURRENT_TEMPLATE_CATEGORY_RIGHT_ARROW = Ui_Elements::MenuBoxes.new("Level Element Right Arrow", "LevEdMen9", 
        SF::Sprite.new(BLANK_TEXTURE, SF::Rect.new(950, 50, 50, 40)), 50.0, 40.0, 2)
    end
    class LevelEditorGuiDisplay
        def self.draw_level_editor_ui(window)
            if SF::Event::Resized
                current_size = window.size
                original_width = 800 
                original_height = 600
                scale_x = current_size.x.to_f / original_width
                scale_y = current_size.y.to_f / original_height
                scale_ratio = [scale_x, scale_y].min
                max_scale = 1.5
                clamped_scale = [scale_ratio, max_scale].min
                
                LevelEditorGuiElements::MAIN_LEVEL_EDITOR_BOX.sprite.scale = SF.vector2(scale_x, scale_y / 5)
                LevelEditorGuiElements::MAIN_LEVEL_EDITOR_BOX.sprite.position = SF.vector2(0_f32, current_size.y.to_f32 - LevelEditorGuiElements::MAIN_LEVEL_EDITOR_BOX.sprite.global_bounds.height)
        

                LevelEditorGuiElements::CURRENT_TEMPLATE_BOX.sprite.scale = SF.vector2(scale_x, scale_y)
                LevelEditorGuiElements::CURRENT_TEMPLATE_BOX.sprite.position = LevelEditorGuiElements::MAIN_LEVEL_EDITOR_BOX.sprite.position + SF.vector2(55 * scale_x, 55 * scale_y)
    
                LevelEditorGuiElements::CURRENT_TEMPLATE_BOX_TEXT.text.scale = SF.vector2(scale_x, scale_y)
                LevelEditorGuiElements::CURRENT_TEMPLATE_BOX_TEXT.text.position = LevelEditorGuiElements::CURRENT_TEMPLATE_BOX.sprite.position + SF.vector2(75 * clamped_scale, 12 * scale_ratio)
                LevelEditorGuiElements::CURRENT_TEMPLATE_BOX_TEXT.text.string = ""
                if !LevelEditor::LevelEditorLogic.current_element_array.empty?
                    LevelEditorGuiElements::CURRENT_TEMPLATE_BOX_TEXT.text.string = LevelEditor::LevelEditorLogic.current_element_array[LevelEditor::LevelEditorLogic.current_index].name 
                end
    
                LevelEditorGuiElements::CURRENT_TEMPLATE_LEFT_ARROW.sprite.scale = SF.vector2(scale_x, scale_y)
                LevelEditorGuiElements::CURRENT_TEMPLATE_LEFT_ARROW.sprite.position = LevelEditorGuiElements::CURRENT_TEMPLATE_BOX.sprite.position - SF.vector2(50 * scale_x, 0)
    
                LevelEditorGuiElements::CURRENT_TEMPLATE_RIGHT_ARROW.sprite.scale = SF.vector2(scale_x, scale_y)
                LevelEditorGuiElements::CURRENT_TEMPLATE_RIGHT_ARROW.sprite.position = LevelEditorGuiElements::CURRENT_TEMPLATE_BOX.sprite.position + 
                SF.vector2(LevelEditorGuiElements::CURRENT_TEMPLATE_BOX.sprite.global_bounds.width, 0)
    
    
                LevelEditorGuiElements::CURRENT_ELEMENT_BOX.sprite.scale = SF.vector2(scale_x, scale_y)
                LevelEditorGuiElements::CURRENT_ELEMENT_BOX.sprite.position = LevelEditorGuiElements::MAIN_LEVEL_EDITOR_BOX.sprite.position + SF.vector2(55 * scale_x, 5 * scale_y)
    
                LevelEditorGuiElements::CURRENT_ELEMENT_BOX_TEXT.text.scale = SF.vector2(scale_x, scale_y)
                LevelEditorGuiElements::CURRENT_ELEMENT_BOX_TEXT.text.position = LevelEditorGuiElements::CURRENT_ELEMENT_BOX.sprite.position + SF.vector2(75 * clamped_scale, 12 * scale_ratio)
                LevelEditorGuiElements::CURRENT_ELEMENT_BOX_TEXT.text.string = LevelEditor::LevelDisplay.current_element.name
    
                # LevelEditorGuiElements::SELECTED_LEVEL_LEFT_ARROW.sprite.scale = SF.vector2(scale_x, scale_y)
                # LevelEditorGuiElements::SELECTED_LEVEL_LEFT_ARROW.sprite.position = LevelEditorGuiElements::SELECTED_LEVEL_ELEMENT_BOX.sprite.position - SF.vector2(50 * scale_x, 0)
                # LevelEditorGuiElements::SELECTED_LEVEL_RIGHT_ARROW.sprite.scale = SF.vector2(scale_x, scale_y)
    
                # LevelEditorGuiElements::SELECTED_LEVEL_RIGHT_ARROW.sprite.scale = SF.vector2(scale_x, scale_y)
                # LevelEditorGuiElements::SELECTED_LEVEL_RIGHT_ARROW.sprite.position = LevelEditorGuiElements::SELECTED_LEVEL_ELEMENT_BOX.sprite.position +
                # SF.vector2(LevelEditorGuiElements::SELECTED_LEVEL_ELEMENT_BOX.sprite.global_bounds.width, 0)
    
    
                # LevelEditorGuiElements::LEVEL_ELEMENT_TYPE_MENU.sprite.scale = SF.vector2(scale_x, scale_y)
                # LevelEditorGuiElements::LEVEL_ELEMENT_TYPE_MENU.sprite.position = LevelEditorGuiElements::MAIN_LEVEL_EDITOR_BOX.sprite.position + SF.vector2(325 * scale_x, 55 * scale_y)
    
                # LevelEditorGuiElements::LEVEL_ELEMENT_TYPE_TEXT.text.scale = SF.vector2(scale_x, scale_y)
                # LevelEditorGuiElements::LEVEL_ELEMENT_TYPE_TEXT.text.position = LevelEditorGuiElements::LEVEL_ELEMENT_TYPE_MENU.sprite.position + SF.vector2(75 * clamped_scale, 12 * scale_ratio)
                # LevelEditorGuiElements::LEVEL_ELEMENT_TYPE_TEXT.text.string = LevelEditor::LevelEditorLogic.current_element_type
                # Utility::StringUtilities.center_text(LevelEditorGuiElements::LEVEL_ELEMENT_TYPE_TEXT.text)
    
                # LevelEditorGuiElements::LEVEL_ELEMENT_LEFT_ARROW.sprite.scale = SF.vector2(scale_x, scale_y)
                # LevelEditorGuiElements::LEVEL_ELEMENT_LEFT_ARROW.sprite.position = LevelEditorGuiElements::LEVEL_ELEMENT_TYPE_MENU.sprite.position - SF.vector2(50 * scale_x, 0)
                # LevelEditorGuiElements::LEVEL_ELEMENT_LEFT_ARROW.sprite.scale = SF.vector2(scale_x, scale_y)
    
                # LevelEditorGuiElements::LEVEL_ELEMENT_RIGHT_ARROW.sprite.scale = SF.vector2(scale_x, scale_y)
                # LevelEditorGuiElements::LEVEL_ELEMENT_RIGHT_ARROW.sprite.position = LevelEditorGuiElements::LEVEL_ELEMENT_TYPE_MENU.sprite.position +
                # SF.vector2(LevelEditorGuiElements::LEVEL_ELEMENT_TYPE_MENU.sprite.global_bounds.width, 0)
            end
            LevelEditor::LevelDisplay.draw_level(window)
            window_size = window.size
            hud_view = SF::View.new(SF::FloatRect.new(0_f32, window_size.y.to_f32 / 2_f32, window_size.x.to_f32, window_size.y.to_f32 / 2_f32))
            hud_view.viewport = SF::FloatRect.new(0_f32, 0.5_f32, 1_f32, 0.5_f32)
            window.view = hud_view
    
            Utility::StringUtilities.center_text(LevelEditorGuiElements::CURRENT_TEMPLATE_BOX_TEXT.text)
            Utility::StringUtilities.center_text(LevelEditorGuiElements::CURRENT_ELEMENT_BOX_TEXT.text)
    
            window.draw(LevelEditorGuiElements::MAIN_LEVEL_EDITOR_BOX.sprite)
    
            window.draw(LevelEditorGuiElements::CURRENT_TEMPLATE_BOX.sprite)
            window.draw(LevelEditorGuiElements::CURRENT_TEMPLATE_BOX_TEXT.text)
            window.draw(LevelEditorGuiElements::CURRENT_TEMPLATE_LEFT_ARROW.sprite)
            window.draw(LevelEditorGuiElements::CURRENT_TEMPLATE_RIGHT_ARROW.sprite)
    
            window.draw(LevelEditorGuiElements::CURRENT_ELEMENT_BOX.sprite)
            window.draw(LevelEditorGuiElements::CURRENT_ELEMENT_BOX_TEXT.text)
            # window.draw(LevelEditorGuiElements::SELECTED_LEVEL_LEFT_ARROW.sprite)
            # window.draw(LevelEditorGuiElements::SELECTED_LEVEL_RIGHT_ARROW.sprite)
    
            # window.draw(LevelEditorGuiElements::LEVEL_ELEMENT_TYPE_MENU.sprite)
            # window.draw(LevelEditorGuiElements::LEVEL_ELEMENT_TYPE_TEXT.text)
            # window.draw(LevelEditorGuiElements::LEVEL_ELEMENT_LEFT_ARROW.sprite)
            # window.draw(LevelEditorGuiElements::LEVEL_ELEMENT_RIGHT_ARROW.sprite)
            if SF::Mouse.button_pressed?(SF::Mouse::Left)
                LevelEditorGuiMouseHandling.level_editor_ui_mouse_handling(window)
            end
        end
    end
    class LevelEditorGuiMouseHandling
        def self.level_editor_ui_mouse_handling(window)
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


            if MouseHandling::ClickHandling.button_clicked?(LevelEditorGuiElements::CURRENT_TEMPLATE_LEFT_ARROW.sprite, scaled_mouse_x, scaled_mouse_y)
                LevelEditor::LevelEditorLogic.current_index = Utility::ArrayUtilities.navigate_array("backward", LevelEditor::LevelEditorLogic.current_element_array, 
                LevelEditor::LevelEditorLogic.current_index)
    
                sleep 0.15.seconds

            elsif MouseHandling::ClickHandling.button_clicked?(LevelEditorGuiElements::CURRENT_TEMPLATE_RIGHT_ARROW.sprite, scaled_mouse_x, scaled_mouse_y)
                LevelEditor::LevelEditorLogic.current_index = Utility::ArrayUtilities.navigate_array("forward", LevelEditor::LevelEditorLogic.current_element_array, 
                LevelEditor::LevelEditorLogic.current_index)
    
                sleep 0.15.seconds

            elsif MouseHandling::ClickHandling.button_clicked?(LevelEditorGuiElements::CURRENT_TEMPLATE_BOX.sprite, scaled_mouse_x, scaled_mouse_y)
                LevelEditor::LevelEditorLogic.spawn_element(window)
                LevelEditor::LevelEditorLogic.update_spawned_element_array

                sleep 0.15.seconds
            end
            # if (scaled_mouse_x >= menu_box_5_x / scale_x && scaled_mouse_x <= menu_box_5_x + Ui_Elements::MenuBoxes::SELECTED_LEVEL_LEFT_ARROW.width / scale_x) && 
            #     (scaled_mouse_y >= menu_box_5_y / scale_y && scaled_mouse_y <= menu_box_5_y / scale_y + Ui_Elements::MenuBoxes::SELECTED_LEVEL_LEFT_ARROW.height / scale_y)
    
            #     LevelEditor::LevelEditorLogic.spawned_element_index = Utility::ArrayUtilities.navigate_array("backward", LevelEditor::LevelEditorLogic.spawned_element_array, 
            #     LevelEditor::LevelEditorLogic.spawned_element_index)
    
            #     if LevelEditor::LevelEditorLogic.spawned_element_array.size > 0
            #         LevelEditor::LevelDisplay.current_element = LevelEditor::LevelEditorLogic.spawned_element_array[LevelEditor::LevelEditorLogic.spawned_element_index]
            #     end
            #   sleep 0.15.seconds
            # end
            # if (scaled_mouse_x >= menu_box_6_x / scale_x && scaled_mouse_x <= menu_box_6_x + Ui_Elements::MenuBoxes::SELECTED_LEVEL_RIGHT_ARROW.width / scale_x) && 
            #     (scaled_mouse_y >= menu_box_6_y / scale_y && scaled_mouse_y <= menu_box_6_y / scale_y + Ui_Elements::MenuBoxes::SELECTED_LEVEL_RIGHT_ARROW.height / scale_y)
            #     LevelEditor::LevelEditorLogic.spawned_element_index = Utility::ArrayUtilities.navigate_array("forward", LevelEditor::LevelEditorLogic.spawned_element_array, 
            #     LevelEditor::LevelEditorLogic.spawned_element_index)
    
            #     if LevelEditor::LevelEditorLogic.spawned_element_array.size > 0
            #         LevelEditor::LevelDisplay.current_element = LevelEditor::LevelEditorLogic.spawned_element_array[LevelEditor::LevelEditorLogic.spawned_element_index]
            #     end
            #   sleep 0.15.seconds
            # end
            # if (scaled_mouse_x >= menu_box_7_x / scale_x && scaled_mouse_x <= menu_box_7_x + Ui_Elements::MenuBoxes::SELECTED_LEVEL_RIGHT_ARROW.width / scale_x) && 
            #     (scaled_mouse_y >= menu_box_7_y / scale_y && scaled_mouse_y <= menu_box_7_y / scale_y + Ui_Elements::MenuBoxes::SELECTED_LEVEL_RIGHT_ARROW.height / scale_y)
            #     LevelEditor::LevelEditorLogic.current_element_index = Utility::ArrayUtilities.navigate_array("backward", LevelEditor::LevelEditorLogic.element_array, LevelEditor::LevelEditorLogic.current_element_index)
            #     LevelEditor::LevelEditorLogic.current_element_type = LevelEditor::LevelEditorLogic.element_array[LevelEditor::LevelEditorLogic.current_element_index]
            #     LevelEditor::LevelEditorLogic.set_current_index
            #     LevelEditor::LevelEditorLogic.set_current_array
            #     sleep 0.15.seconds
            # end
            # if (scaled_mouse_x >= menu_box_8_x / scale_x && scaled_mouse_x <= menu_box_8_x + Ui_Elements::MenuBoxes::SELECTED_LEVEL_RIGHT_ARROW.width / scale_x) && 
            #     (scaled_mouse_y >= menu_box_8_y / scale_y && scaled_mouse_y <= menu_box_8_y / scale_y + Ui_Elements::MenuBoxes::SELECTED_LEVEL_RIGHT_ARROW.height / scale_y)
            #     LevelEditor::LevelEditorLogic.current_element_index = Utility::ArrayUtilities.navigate_array("forward", LevelEditor::LevelEditorLogic.element_array, LevelEditor::LevelEditorLogic.current_element_index)
            #     LevelEditor::LevelEditorLogic.current_element_type = LevelEditor::LevelEditorLogic.element_array[LevelEditor::LevelEditorLogic.current_element_index]
            #     LevelEditor::LevelEditorLogic.set_current_index
            #     LevelEditor::LevelEditorLogic.set_current_array
            #     sleep 0.15.seconds
            # end
         end
    end
end