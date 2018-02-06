class Enemy
  def initialize(type)
  @image=Gosu::Image.new("")
  @velocity = Gosu::random(0.8, 3.3)

  @x = rand * (WindowWidth - @image.width)
  @y = rand * (WindowWidth - @image.height)
end

def update
  @y += @velocity
end

def draw
  @image.draw(@x, @y,0)
end

end
