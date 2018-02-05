# classe fille Window qui hérite de la classe Window de Gosu
class Window < Gosu::Window

  # constructeur de la classe Window
  def initialize(width, height)
    # appel au constructeur de la classe Gosu::Window
    super
    # nom de la fenetre
    @background_image = Gosu::Image.new("image/image.jpg")

    self.caption = "First Time"
  end
  def draw
    # la méthode draw prend 3 paramètres :
    # - abcisse
    # - ordonnée
    # - profondeur
    @background_image.draw(0, 0, 0)
  end
end
