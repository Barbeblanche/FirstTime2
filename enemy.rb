class Enemy
  attr_reader :x, :y
  def initialize(map,type)
    @velocity = Gosu::random(5.5, 6.5)

    @map = map

    @image = Gosu::Image.new("image/o1.png")
    @oiseau2 = Gosu::Image.new("image/o2.png")
    @oiseau3 = Gosu::Image.new("image/o3.png")

    @x = Gosu::random(200.0,300.0)
    @y = Gosu::random(50.0,150.0)
    @pos_cour = @image
  end

  def update
    if @map.solid?(@x,@y)
      @x -= @velocity
    else
      @x += @velocity
    end
    @pos = (Gosu.milliseconds / 175 % 2 == 0) ? @oiseau2 : @oiseau3

  end
  def draw
    @pos_cour.draw(@x, @y,1.0,1.0)
  end

end
