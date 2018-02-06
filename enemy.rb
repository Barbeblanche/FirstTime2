class Enemy

  def initialize(type)
    @velocity = Gosu::random(0.8, 3.3)



    @image = Gosu::Image.new("image/o1.png")
    @oiseau2 = Gosu::Image.new("image/o2.png")
    @oiseau3 = Gosu::Image.new("image/o3.png")

    @x = Gosu::random(100.0,200.0)
    @y = Gosu::random(100.0,200.0)

    @pos_cour = @image
  end

  def update
    @y += @velocity
  end
  def solid?(x, y)
    y < 0 || @tiles[x / 50][y / 50]
  end
  def draw
    @image.draw(@x, @y,1.0,1.0)

  end

end
