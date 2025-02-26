require "crsfml"
require "../src/textures.cr"
require "../src/menus.cr"

puts "A Normal World"

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
Player::Stats.initialize_player_stats

while window.open?
    while event = window.poll_event
      if event.is_a? SF::Event::Closed
        window.close
      end
    end
    window.clear(SF::Color::Black)
    Menus::SystemMenus.draw_system_menu(window)
    Sprites::Player.draw_sprite(window)
    window.display
  end
end