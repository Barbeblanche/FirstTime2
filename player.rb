require_relative 'map'
require 'gosu'

class Player
  attr_reader :x, :y
  DistanceOfCollision =5
  def initialize(oiseau,map, x, y)
    @x, @y = x, y
    @dir = :left
    @vy = 0 # Vertical velocity
    @map = map
    @oiseau = oiseau
    # Load all animation frames
    @debout = Gosu::Image.new("image/1.png")
    @marche1 = Gosu::Image.new("image/2.png")
    @marche2 = Gosu::Image.new("image/3.png")
    @jump = Gosu::Image.new("image/saut.png")
    #@walk3d = Gosu::Image.new("media/4.png")
    #@walk4d = Gosu::Image.new("media/5.png")
    # This always points to the frame that is currently drawn.
    # This is set in update, and used in draw.
    @pos_cour = @debout
  end

  def draw
    # Flip vertically when facing to the left.
    if @dir == :left
      offs_x = -25
      factor = 1.0
    else
      offs_x = 25
      factor = -1.0
    end

    @pos_cour.draw(@x + offs_x, @y-42, 0, factor, 1.0)
  end

  # Could the object be placed at x + offs_x/y + offs_y without being stuck?
  def would_fit(offs_x, offs_y)
    # Check at the center/top and center/bottom for map collisions
    not @map.solid?(@x + offs_x, @y + offs_y) and
      not @map.solid?(@x + offs_x, @y + offs_y - 45) and
        not @map.solid?(@x + offs_x + 15, @y + offs_y) and
          not @map.solid?(@x + offs_x - 15, @y + offs_y) and
            not @map.solid?(@x + offs_x - 15, @y + offs_y - 45) and
              not @map.solid?(@x + offs_x + 15, @y + offs_y - 45) and
                 not collide?(@oiseau.x, @oiseau.y) and
                    not collide?(@oiseau.x+36, @oiseau.y) and
                      not collide?(@oiseau.x, @oiseau.y+30) and
                        not collide?(@oiseau.x+36, @oiseau.y+30)
  end


  def update(move_x)
    # Select image depending on action
    if (move_x == 0)
      @pos_cour = @debout
    else
      @pos_cour = (Gosu.milliseconds / 175 % 2 == 0) ? @marche1 : @marche2
    end
    if (@vy > 0)
      @pos_cour = @jump
    end
    #if (i==1)
    #  @cur_image = @gliss
  #  else
    #  @cur_image = @standing
  #  end



    # Directional walking, horizontal movement
    if move_x > 0
      @dir = :left
      move_x.times { if would_fit(1, 0) then @x += 1 end }
    end
    if move_x < 0
      @dir = :right
      (-move_x).times { if would_fit(-1, 0) then @x -= 1 end }
    end

    # Acceleration/gravity
    # By adding 1 each frame, and (ideally) adding vy to y, the player's
    # jumping curve will be the parabole we want it to be.
    @vy += 1
    # Vertical movement
    if @vy > 0
      @vy.times { if would_fit(0, 1) then @y += 1 else @vy = 0 end } # @vy mettre -5 => oiseau
    end
    if @vy < 0
      (-@vy).times { if would_fit(0, -1) then @y -= 1 else @vy = 0 end }
    end
  end

  def try_to_jump
    if @map.solid?(@x, @y + 1) 
      @vy = -20 #hauteur du saut
    end

  end
  def collide?(x,y)
  distance = Gosu::distance(@x, @y,
                            x, y)
  distance < DistanceOfCollision
  end

  #def glissade(i)

    #  if i == 1



# end

#  def collect_gems(gems)
    # Same as in the tutorial game.
  #  gems.reject! do |c|
  #    (c.x - @x).abs < 50 and (c.y - @y).abs < 50
  #  end
#  end
end
