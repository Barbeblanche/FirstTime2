
class Menu< Gosu::Window
  def initialize(widht, height)
    super WIDTH, HEIGHT
    @x=widht
    @y=height
    @background = Gosu::Image.new("image/fond.png", :tileable => true)
    @background1 = Gosu::Image.new("image/sky3.jpg", :tileable => true)
    @btnjouer = Gosu::Image.new("image/btnjouer.png")
    @btncommandes = Gosu::Image.new("image/btncommandes.png")
    @btncredits = Gosu::Image.new("image/btncredits.png")
    @cursor = Gosu::Image.new(self, 'image/curs.png')
  end


   def update

   end


   def draw
     @background.draw 0,0,1
     @background1.draw 0,0,0
    @cursor.draw self.mouse_x, self.mouse_y, 1
  end
end
