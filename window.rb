# classe fille Window qui hérite de la classe Window de Gosu
class Window < Gosu::Window

  # constructeur de la classe Window
  def initialize(width, height)
    # appel au constructeur de la classe Gosu::Window
    super
    # nom de la fenetre
    @background_image = Gosu::Image.new("image/map.png")
    @player = Player.new(width/2, height/2)
    @jump = true
    @jumpy = 25
    @camera_x = @camera_y = 0
    self.caption = "First Time"
  end
  def update
      # FAIRE fonction SI indiceTouchePressée EST touche

      if Gosu::button_down?(Gosu::KbUp) and @jump
        @jump=false
        @player.jump(@jumpy)

      end
      # la fonction move est appelée dans tous les cas
      @player.update(@jumpy)
      # fermer la fenêtre si la touche pressée est Echap
    end
  def button_up(id)
      if id == Gosu::KbUp
        @jump = true
      end
      super
    end
  def draw
    # la méthode draw prend 3 paramètres :
    # - abcisse
    # - ordonnée
    # - profondur
    @background_image.draw(0, 0, ZOrder::Background)
    @player.draw

  end


end
