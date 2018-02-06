class Player

  # constructeur
  def initialize(x, y)
    # coordonnées
    @x = x
    @y = y
    # vitesse (de base 0 : à l'arret)
    @velocityX = 0.0
    @velocityY = 0.0
    #image du personnage
    @stand = Gosu::Image.new("image/1.png")
    @w1 = Gosu::Image.new("image/2.png")
    @w2 = Gosu::Image.new("image/3.png")
    @jump = Gosu::Image.new("image/saut.png")

    @image=@stand
  end

  def draw
    @image.draw(@x, @y, ZOrder::Player)
  end

  # vitesse en x diminue (équivaut à un déplacement vers la gauche)
  def go_left
    @velocityX -= 5

  end

  # vitesse en x augmente (équivaut à un déplacement vers la droite)
  def go_right
    @velocityX += 5

  end

  # vitesse en y diminue (équivaut à un déplacement vers le haut)
  def go_up
    @velocityY -= 5
  end

  # vitesse en y augmente (équivaut à un déplacement vers le bas)
  def go_down
    @velocityY += 5
  end

  # modification des coordonées du héros
  def move
    @x += @velocityX
    @x %= 1024
    @y += @velocityY
    @y %= 720
    @velocityX *= 0
    @velocityY *= 0
  end

end
