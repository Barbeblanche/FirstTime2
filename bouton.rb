
class Bouton
  attr_reader :x, :y
  def initialize(image,x,y,width,height)
    @image = image
    @x = x
    @y = y
    @width = width
    @height = height
  end
  def draw
    @image.draw(@x,@y,1.0,1.0)
  end
end
