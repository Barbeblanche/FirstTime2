class Enemy
  attr_reader :x, :y
  def initialize(map,type)
    @velocity = Gosu::random(3.5, 5.0)

    @map = map

    @image = Gosu::Image.new("image/o1.png")
    @oiseau2 = Gosu::Image.new("image/o2.png")
    @oiseau3 = Gosu::Image.new("image/o3.png")

    @oiseau2r = Gosu::Image.new("image/o2r.png")
    @oiseau3r = Gosu::Image.new("image/o3r.png")
    @test = "droit"
    @x = Gosu::random(51.0,849.0)
    @y = Gosu::random(51.0,4900.0)
    @pos_cour = @image
  end

  def update
    if @map.solid?(@x+36,@y) || @test == "gauche"
      @x -= @velocity
      @test = "gauche"
      @pos_cour = (Gosu.milliseconds / 175 % 2 == 0) ? @oiseau3r : @oiseau2r
    end
    if @map.solid?(@x,@y) || @test=="droit"
      @x += @velocity
      @test="droit"
      @pos_cour = (Gosu.milliseconds / 175 % 2 == 0) ? @oiseau2 : @oiseau3
    end


  end
  def draw
    @pos_cour.draw(@x, @y,1.0,1.0)
  end

end
