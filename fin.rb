require_relative 'bouton'
require_relative 'window'
class Fin < Gosu::Window
  def initialize(widht, height)
    super WIDTH, HEIGHT
    self.caption = "Retro Climber"
    @x=widht
    @y=height
    @background = Gosu::Image.new("image/sky3.jpg", :tileable => true)
    @rejouer = Gosu::Image.new("image/rejouer.png")
    @rejouer2 = Gosu::Image.new("image/rejouerclic.png")
    @btnmenu = Gosu::Image.new("image/btnmp.png")
    @btnmenu2 = Gosu::Image.new("image/btnmpclic.png")
    @btnquit = Gosu::Image.new("image/btnquitter.png")
    @btnquitter2 = Gosu::Image.new("image/quitterclic.png")
    @window = Window.new(WIDTH, HEIGHT)
    @bout1 = Bouton.new(@rejouer,207,500,309,67)
    @bout3 = Bouton.new(@btnmenu,90,710,550,70)
    @bout2 = Bouton.new(@btnquitter,220,600,290,70)
  end

  def update
    case mouse_x
    when (207..516)
        case mouse_y
        when (500..567)
         @bout1 = Bouton.new(@rejouer2,207,500,309,67)
          if button_down?(Gosu::MsLeft)
           @window.show
          end
        else
         @bout1 = Bouton.new(@rejouer,207,500,309,67)
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
 end
 def needs_cursor?
   true
end
  def draw
  @background.draw 0,0,0
  @bout1.draw
  @bout2.draw
  @bout3.draw
 end
end
