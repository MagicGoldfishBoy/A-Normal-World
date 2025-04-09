require "crsfml"
require "../src/textures.cr"
require "../src/menus.cr"
require "../src/keyboard.cr"
require "../src/levels.cr"
require "../src/player.cr"
require "../src/ui_elements.cr"
require "../src/menus/menu_handling.cr"

puts "A Normal World"

#  ___
# (. .)  < This rude ass bitch refused to believe me when I told her where the cheese is, then bitched at me because she couldn't find it
#(  *  )   
#((___))
# 0   0
#TODO: add screaming trees lol
#5005
module GameLoop
  VERSION = "0.1.0"
  @[Link("GL")]
lib GL
  fun enable = glEnable(cap : Int32)
    fun viewport = glViewport(x : Int32, y : Int32, width : Int32, height : Int32)
      fun clear = glClear(mask : Int32)
      TEXTURE_2D       =  3553
      COLOR_BUFFER_BIT = 16384
      DEPTH_BUFFER_BIT =   256
      
 end

window = SF::RenderWindow.new(SF::VideoMode.new(800, 600), "A Normal World", SF::Style::Default)
window.vertical_sync_enabled = true
this = "main_menu"
Menus::SystemMenus.system_menu=(this)
Sprites::Player.is_drawn=(false)
Keyboard::Gameplay.gameplay_mode=("none")
Levels::LevelSelectionLogic.level=("none")
Ui_Elements::MenuThemes.apply_theme

while window.open?
    while event = window.poll_event
      if event.is_a? SF::Event::Closed
        window.close
      end
    end
    window.clear(SF::Color::Black)
    Levels::LevelSelectionLogic.current_area(window)
    Sprites::Player.draw_sprite(window)
    Keyboard::Gameplay.determine_gameplay_controls(window)
    Player::Stats.check_status_effects(window)

    if MenuHandling::Menu.current_menu != "none"
     MenuHandling::Menu.draw_menu(window)
    end

    if MenuHandling::Gui.current_gui != "none"
      MenuHandling::Gui.draw_gui(window)
    end

    if MenuHandling::Window.is_hud_menu_open == true
      MenuHandling::Window.draw_window(window)
    end

    #Menus::Windows.update_open_views(window)
    Inventory::InventoryManager.draw_inventory(window)
    window.display
  end
end