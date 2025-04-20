require "crsfml"
require "../src/textures.cr"
require "../src/keyboard.cr"
require "../src/player.cr"
require "../src/ui_elements.cr"
require "../src/menus/menu_handling.cr"
require "../src/locations/location_selection.cr"
#require "../src/sound/music.cr"
require "../src/sound/music_handling.cr"

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
Sprites::Player.is_drawn = false
Keyboard::Gameplay.gameplay_mode=("none")
Ui_Elements::MenuThemes.apply_theme
MusicHandling::MenuMusic.play_menu_music("main_menu")

while window.open?
    while event = window.poll_event
      if event.is_a? SF::Event::Closed
        window.close
      end
    end
    window.clear(SF::Color::Black)
    if LocationSelection::Region.current_region != "none"
     Maps::MapBase.draw_elements(window)
    end

    #LocationSelection::Region.select_region(window)

    Sprites::Player.draw_sprite(window)
    Keyboard::Gameplay.determine_gameplay_controls(window)
    Player::Stats.check_status_effects(window)

    if MenuHandling::Menu.current_menu != "none"
     MenuHandling::Menu.draw_menu(window)
    end

    if MenuHandling::Gui.current_gui != "none"
      MenuHandling::Gui.draw_gui(window)
    end

    MenuHandling::Window.draw_window(window)

    Inventory::InventoryManager.draw_inventory(window)
    window.display
  end
end