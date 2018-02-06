class Enemy

def initialize(type)
  @velocity = Gosu::random(0.8, 3.3)



  @image = Gosu::Image.new("image/o1.png")
  @oiseau2 = Gosu::Image.new("image/o2.png")
  @oiseau3 = Gosu::Image.new("image/o3.png")

  @x = rand * (WindowWidth - @image.width)
  @y = rand * (WindowWidth - @image.height)

  @pos_cour = @image
end

def update
  @y += @velocity
end

def draw
  @image.draw(150, -150,1.0,1.0)

end

end
