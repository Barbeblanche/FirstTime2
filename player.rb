require_relative 'map'
require 'gosu'

class Player
  attr_reader :x, :y
  # constructeur
  def initialize(map,x, y)
    # coordonnées
    @x = x
    @y = y
    #position de depart : orienté vers la gauche
    @dir = :left
    # vitesse (de base 0 : à l'arret)
    @vy = 0.0
    #image du personnage
    @debout = Gosu::Image.new("image/1.png")
    @marche1 = Gosu::Image.new("image/2.png")
    @marche2 = Gosu::Image.new("image/3.png")
    @jump = Gosu::Image.new("image/saut.png")
    #@gliss = Gosu::Image.new("image/glissade.png")
    @map = map
    @pos_dep = @debout
  end
  def update(move_x,i)
    # Select image depending on action
    if (move_x == 0)
      @pos_dep = @debout
    else
      @pos_dep = (Gosu.milliseconds / 175 % 2 == 0) ? @marche1 : @marche2
    end
    if (@vy > 0)
      @pos_dep = @jump
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

  def check_jump
    if @map.solid?(@x, @y + 1)
      @vy = -20 #hauteur du saut
    end
  end

  # Definit les collisions
  def hitbox(offs_x, offs_y)
    # Check at the center/top and center/bottom for map collisions
    not @map.solid?(@x + offs_x, @y + offs_y) and
      not @map.solid?(@x + offs_x, @y + offs_y - 45) and
        not @map.solid?(@x + offs_x + 15, @y + offs_y) and
          not @map.solid?(@x + offs_x - 15, @y + offs_y) and
            not @map.solid?(@x + offs_x - 15, @y + offs_y - 45) and
              not @map.solid?(@x + offs_x + 15, @y + offs_y - 45)
  end

  def draw
    # Flip vertically when facing to the left.
    if @dir == :left
      offs_x = -25 #-25 et 25 sont les espaces quand il se retourne (miroir)
      factor = 1.0
    else
      offs_x = 25
      factor = -1.0
    end
    @cur_image.draw(@x + offs_x, @y-42, 0, factor, 1.0)
  end
end
