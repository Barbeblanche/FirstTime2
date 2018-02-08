require_relative 'bouton'
require_relative 'window'
require_relative 'menu'
class Credit< Gosu::Window
  def initialize(widht, height)
    super WIDTH, HEIGHT
    @x=widht
    @y=height
    @background = Gosu::Image.new("image/credits.png", :tileable => true)
    @menu = Menu.new(WindowWidth, WindowHeight)
    @btnquitter = Gosu::Image.new("image/btnquitter.png")
    @btnquitter2 = Gosu::Image.new("image/quitterclic.png")

    @bout4 = Bouton.new(@btnquitter,220,1180,290,80)
  end


   def update

         case mouse_x
         when (220..510)
            case mouse_y
            when (1180..1260)
              @bout4 = Bouton.new(@btnquitter2,220,1180,290,80)
              if button_down?(Gosu::MsLeft)
                close!
                @menu = Menu.new(WIDTH, HEIGHT)
                @menu.show
              end
            else
              @bout4 = Bouton.new(@btnquitter,220,1180,290,80)
            end
          end
          close if Gosu.button_down? Gosu::KB_ESCAPE
   end
   def needs_cursor?
   true
 end
   def draw
     @background.draw 0,0,0

     @bout4.draw
     
  end
end
