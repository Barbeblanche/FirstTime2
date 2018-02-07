require_relative 'bouton'
require_relative 'window'
require_relative 'instr'
class Menu< Gosu::Window
  def initialize(widht, height,window)
    super WIDTH, HEIGHT
    @x=widht
    @y=height
    @window = window
    @background = Gosu::Image.new("image/sky3.jpg", :tileable => true)
    @btnjouer = Gosu::Image.new("image/btnjouer.png")
    @btncommandes = Gosu::Image.new("image/btncommandes.png")
    @btncredits = Gosu::Image.new("image/btncredits.png")
    @btnquitter = Gosu::Image.new("image/btnquitter.png")
    @btnjouer2 = Gosu::Image.new("image/jouerclic.png")
    @btncommandes2 = Gosu::Image.new("image/commandesclic.png")
    @btncredits2 = Gosu::Image.new("image/creditsclic.png")
    @btnquitter2 = Gosu::Image.new("image/quitterclic.png")

    @cursor = Gosu::Image.new(self, 'image/curs.png')
    @bout1 = Bouton.new(@btnjouer,250,480,250,60)
    @bout2 = Bouton.new(@btncommandes,130,580,580,90)
    @bout3 = Bouton.new(@btncredits,220,680,290,70)
    @bout4 = Bouton.new(@btnquitter,220,780,290,80)
  end


   def update
      case mouse_x
      when (250..500)
         case mouse_y
         when (480..540)
           @bout1 = Bouton.new(@btnjouer2,250,480,250,60)
           if button_down?(Gosu::MsLeft)
             close!
             @window.show
           end
         else
           @bout1 = Bouton.new(@btnjouer,250,480,250,60)
        end
       end
       case mouse_x
       when (130..710)
          case mouse_y
          when (580..670)
            @bout2 = Bouton.new(@btncommandes2,130,580,580,90)
            if button_down?(Gosu::MsLeft)
              @instr = Instr.new(WIDTH,HEIGHT,Menu)
              @instr.show
            end
          else
            @bout2 = Bouton.new(@btncommandes,130,580,580,90)
          end
        end
        case mouse_x
        when (220..510)
           case mouse_y
           when (680..750)
             @bout3 = Bouton.new(@btncredits2,220,680,290,70)
             if button_down?(Gosu::MsLeft)
             end
           else
             @bout3 = Bouton.new(@btncredits,220,680,290,70)
           end
         end
         case mouse_x
         when (220..510)
            case mouse_y
            when (780..860)
              @bout4 = Bouton.new(@btnquitter2,220,780,290,80)
              if button_down?(Gosu::MsLeft)
                close
              end
            else
              @bout4 = Bouton.new(@btnquitter,220,780,290,80)
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
     @bout4.draw
     #@cursor.draw self.mouse_x, self.mouse_y, 1
  end
end
