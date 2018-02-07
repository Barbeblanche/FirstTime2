class Porte
  attr_reader :x, :y
  def initialize(image, x, y)
    @image = image
    @x, @y = x, y
  end

  def draw
    @image.draw(@x,@y,1.0,1.0)
  end
end
