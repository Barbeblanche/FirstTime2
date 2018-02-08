require_relative 'bouton'
require_relative 'window'
class Quit< Gosu::Window
  def initialize(widht, height,window)
    super WIDTH, HEIGHT

    self.caption = "Retro Climber"
    @x=widht
    @y=height
    @background = Gosu::Image.new("image/sky3.jpg", :tileable => true)
    @window = window
    @quitoupas = Gosu::Image.new("image/quitoupas.png")
    @btnretour = Gosu::Image.new("image/btnretour.png")
    @btnmenu = Gosu::Image.new("image/btnmp.png")
    @btnquit = Gosu::Image.new("image/btnquitter.png")

    @btnretour2 = Gosu::Image.new("image/btnretourclic.png")
    @btnmenu2 = Gosu::Image.new("image/btnmpclic.png")
    @btnquitter2 = Gosu::Image.new("image/quitterclic.png")

    #@cursor = Gosu::Image.new(self, 'image/curs.png')
    @quitoupas = Bouton.new(@quitoupas,180,270,365,60)
    @bout1 = Bouton.new(@btnretour,225,490,280,70)
    @bout2 = Bouton.new(@btnquitter,220,600,290,70)
    @bout3 = Bouton.new(@btnmenu,90,710,550,70)
  end


   def update
      case mouse_x
      when (225..505)
         case mouse_y
         when (490..560)
           @bout1 = Bouton.new(@btnretour2,225,490,280,70)
           if button_down?(Gosu::MsLeft)
             close!
             @window.show
           end
         else
           @bout1 = Bouton.new(@btnretour,225,490,280,70)
        end
       end
       case mouse_x
       when (220..510)
          case mouse_y
          when (600..670)
            @bout2 = Bouton.new(@btnquitter2,220,600,290,70)
            if button_down?(Gosu::MsLeft)
              close!
              abort("Fin du jeu")
            end

          else
            @bout2 = Bouton.new(@btnquit,220,600,290,70)
          end
        end
        case mouse_x
        when (90..640)
           case mouse_y
           when (710..780)
             @bout3 = Bouton.new(@btnmenu2,90,710,550,70)
             if button_down?(Gosu::MsLeft)
               close!
               @menu = Menu.new(WindowWidth, WindowHeight)
               @menu.show
             end
           else
             @bout3 = Bouton.new(@btnmenu,90,710,550,70)
           end
         end

   end
   def needs_cursor?
   true
 end
   def draw
     @background.draw 0,0,0
     @bout1.draw
     @bout2.draw
     @bout3.draw
     @quitoupas.draw
     #@cursor.draw self.mouse_x, self.mouse_y, 1
  end
end
