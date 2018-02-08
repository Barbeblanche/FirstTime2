require_relative 'map'
require 'gosu'
require_relative 'clef'
class Player
  attr_accessor :x, :y, :vie
  DistanceOfCollision =5
  def initialize(map, x, y)
    @x, @y = x, y
    @dir = :left
    @vy = 0
    @map = map
    @vie = 3

    @debout = Gosu::Image.new("image/1.png")
    @marche1 = Gosu::Image.new("image/2.png")
    @marche2 = Gosu::Image.new("image/3.png")
    @jump = Gosu::Image.new("image/saut.png")
  end
  def set_vie(vie)
    @vie = vie
  end
  def draw

    if @dir == :left
      offs_x = -25
      factor = 1.0
    else
      offs_x = 25
      factor = -1.0
    end

    @pos_cour.draw(@x + offs_x, @y-42, 2, factor, 1.0)
  end

  def would_fit(offs_x, offs_y)
    not @map.solid?(@x + offs_x, @y + offs_y) and
      not @map.solid?(@x + offs_x, @y + offs_y - 40) and
        not @map.solid?(@x + offs_x + 10, @y + offs_y) and
          not @map.solid?(@x + offs_x -10, @y + offs_y) and
            not @map.solid?(@x + offs_x +10, @y + offs_y - 40) and
              not @map.solid?(@x + offs_x-10, @y + offs_y - 40) #and
  end


  def update(move_x)

    if (move_x == 0)
      @pos_cour = @debout
    else
      @pos_cour = (Gosu.milliseconds / 175 % 2 == 0) ? @marche1 : @marche2
    end
    if (@vy > 0)
      @pos_cour = @jump
    end

    if move_x > 0
      @dir = :left
      move_x.times { if would_fit(1, 0) then @x += 1 end }
    end
    if move_x < 0
      @dir = :right
      (-move_x).times { if would_fit(-1, 0) then @x -= 1 end }
    end


    @vy += 1

    if @vy > 0
      @vy.times { if would_fit(0, 1) then @y += 1 else @vy = 0 end } # @vy mettre -5 => oiseau
    end
    if @vy < 0
      (-@vy).times { if would_fit(0, -1) then @y -= 1 else @vy = 0 end }
    end
  end

  def try_to_jump
    if @map.solid?(@x+8, @y + 1) || @map.solid?(@x-8, @y + 1)
      @vy = -20
    end
  end

  def collect_potion(potion)

    potion.reject! do |c|
     (c.x - @x).abs < 50 and (c.y - @y).abs < 50
    end
  end
  def collect_porte(porte)

    porte.reject! do |c|
     (c.x - @x+50).abs < 25 and (c.y - @y+25).abs < 100
    end

  end
  def collect_clef(clef)
      clef.reject! do |c|
       (c.x - @x).abs < 50 and (c.y - @y).abs < 50
      end
    end


end
