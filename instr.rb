require_relative 'bouton'
require_relative 'window'
class Instr< Gosu::Window
  def initialize(widht, height,window)
    super WIDTH, HEIGHT
    @x=widht
    @y=height
    @window = window
    @background = Gosu::Image.new("image/instr.png", :tileable => true)

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
                close
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
     #@cursor.draw self.mouse_x, self.mouse_y, 1
  end
end
