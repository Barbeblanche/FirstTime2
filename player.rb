class Player

  # constructeur
  def initialize(x, y)
    # coordonnées
    @x = x
    @y = y
    # vitesse (de base 0 : à l'arret)
    @velocityX = 0.0
    @velocityY = 0.0
    @down_y =0.0
    #image du personnage
<<<<<<< HEAD
    @image = Gosu::Image.new("image/perso3.png")
    @allow = true
=======
    @image = Gosu::Image.new("image/sss.png")
>>>>>>> 0bbb2b2da634b54578d005c8ae5637e049a05957
  end
  def update (jump_max)
    go_left if Gosu::button_down?(Gosu::KbLeft)
    go_right if Gosu::button_down?(Gosu::KbRight)
    if @velocityY > 0
      @allow = false
      @velocityY.times do
      @y-=0.5
      end
      @velocityY-=1
    end

    #Jump DOWN
    if @velocityY < 0
      (@velocityY*-1).times do
        @y+=0.5
      end
      @velocityY+=1
    end
    check_jump
  end
  def jump(original)
     @velocityY = original
     @down_y = original * -1

  end
  def check_jump
    if @velocityY == 0 and @allow == false
        @velocityY = @down_y
        @down_y = 0
        @allow = true
      end
  end


  # vitesse en x diminue (équivaut à un déplacement vers la gauche)
  def go_left
    @allow = true
    @x-= 5
    @image = Gosu::Image.new("image/perso3r.png")
  end

  # vitesse en x augmente (équivaut à un déplacement vers la droite)
  def go_right
    @allow = true
    @x += 5
    @image = Gosu::Image.new("image/perso3.png")
  end

  # vitesse en y diminue (équivaut à un déplacement vers le haut)

  # vitesse en y augmente (équivaut à un déplacement vers le bas)

  # modification des coordonées du héros
  def move
    @x += @velocityX
    @x %= 736
    @y += @velocityY
    @y %= 416
    @velocityX *= 0
    @velocityY *= 0
  end
  def draw
    @image.draw(@x, @y, ZOrder::Player)
  end
end
