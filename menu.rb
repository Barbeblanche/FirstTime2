WIDHT, HEIGHT = 640, 640
class Menu< Gosu::Window
  def initialize(widht, height)
    super WIDHT,HEIGHT
    @x=widht
    @y=height
    @background = Gosu::Image.new("image/menu.jpg")
  end


   def update

   end


   def draw

    @background.draw 0, 0, 0
  end

end
