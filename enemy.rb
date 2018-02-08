require_relative 'player'
class Enemy
  attr_accessor :x, :y
  TPS = 500
  def initialize(map,type,player)
    @velocity = Gosu::random(3.5, 5.0)
    @tps_ecoule = 0
    @map = map
    @player = player
    @image = Gosu::Image.new("image/o1.png")
    @oiseau2 = Gosu::Image.new("image/o2.png")
    @oiseau3 = Gosu::Image.new("image/o3.png")
    @oiseau2r = Gosu::Image.new("image/o2r.png")
    @oiseau3r = Gosu::Image.new("image/o3r.png")
    @bruit_hit = Gosu::Sample.new('song/bruit_hit.wav')
    @test = "droit"
    @x = Gosu::random(51.0,849.0)
    @y = Gosu::random(51.0,4900.0)
    @pos_cour = @image
    @size_x = 36
    @size_y = 30
    for i in -36..36
        if @map.solid?(@x+i, @y+i)||@map.solid?(@x+i,@y) ||@map.solid?(@x,@y+i)||@map.solid?(@x-i,@y+i) ||@map.solid?(@x+i,@y-i)
          @x = Gosu::random(51.0,849.0)
          @y = Gosu::random(51.0,4500.0)
        end
    end

  end

  def update
    if @map.solid?(@x+36,@y) || @map.solid?(@x+36,@y+30) || @test == "gauche"
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
  def collision(x,y)
    @rect1 = [x,y-15,36,36]
  @rect2 = [@x+(@size_x/2),@y+(@size_y/2),@size_x,@size_y]
  if (@rect1[0] < @rect2[0] + @rect2[2] and
     @rect1[0] + @rect1[2] >  @rect2[0] and
     @rect1[1] < @rect2[1] +  @rect2[3] and
     @rect1[3] + @rect1[1] > @rect2[1])
     if Gosu.milliseconds-@tps_ecoule >= TPS
       @player.vie -=1
       @player.set_vie(@player.vie)
       @bruit_hit.play(1,1,false)
       @tps_ecoule = Gosu.milliseconds
     end
  end
 end
end
