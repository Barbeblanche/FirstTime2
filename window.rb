# classe fille Window qui hérite de la classe Window de Gosu
class Window < Gosu::Window

  # constructeur de la classe Window
  def initialize(width, height)
    # appel au constructeur de la classe Gosu::Window
    super
    # nom de la fenetre
    self.caption = "First Time"
    @background_image = Gosu::Image.new("image/image.jpg")
    @player = Player.new(width/2,height/2)
    @song = Gosu::Song.new("song/qadc.mp3")
    @song.volume = 0.25
    @song.play(true)

  end

  def update
      # FAIRE fonction SI indiceTouchePressée EST touche
      @player.go_left if Gosu::button_down?(Gosu::KbLeft)
      @player.go_right if Gosu::button_down?(Gosu::KbRight)
      @player.go_up if Gosu::button_down?(Gosu::KbUp)
      @player.go_down if Gosu::button_down?(Gosu::KbDown)
      # la fonction move est appelée dans tous les cas
      @player.move
      # fermer la fenêtre si la touche pressée est Echap
      close if Gosu::button_down?(Gosu::KbEscape)
    end

  def draw
    # la méthode draw prend 3 paramètres :
    # - abcisse
    # - ordonnée
    # - profondur
    @background_image.draw(0, 0, 0)
    @player.draw


  end


end
