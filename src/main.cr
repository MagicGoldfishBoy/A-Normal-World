require "crsfml"
require "../src/graphics.cr"

puts "A Normal World"

module GameLoop
  VERSION = "0.1.0"
  @[Link("GL")] # Use @[Link(framework: "OpenGL")] on Mac OSX
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

while window.open?
    while event = window.poll_event
      if event.is_a? SF::Event::Closed
        window.close
      end
    end
    window.clear(SF::Color::Black)
    window.display
  end
end