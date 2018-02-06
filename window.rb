# classe fille Window qui hérite de la classe Window de Gosu
require_relative 'map'
require_relative 'player'
require_relative 'tiles'
WIDTH, HEIGHT = 900, 480
class Window < Gosu::Window

  # constructeur de la classe Window
  def initialize(width, height)
    super WIDTH, HEIGHT

    @background = Gosu::Image.new("image/space.png", :tileable => true)
    @map = Map.new("cptn_ruby_map.txt")
    @player = Player.new(@map, 400, 100)
    # The scrolling position is stored as top left corner of the screen.
    @camera_x = @camera_y = 0
  end

  def update
    move_x = 0
    move_x -= 5 if Gosu.button_down? Gosu::KB_LEFT
    move_x += 5 if Gosu.button_down? Gosu::KB_RIGHT
    #i = 1 if Gosu.button_down? Gosu::KB_DOWN

    @player.update(move_x)
  #  @cptn.collect_gems(@map.gems)
    # Scrolling follows player
    @camera_x = [[@player.x - WIDTH / 2, 0].max, @map.width * 50 - WIDTH].min
    @camera_y = [[@player.y - HEIGHT / 2, 0].max, @map.height * 50 - HEIGHT].min
  end

  def draw
    @background.draw 0, 0, 0
    Gosu.translate(-@camera_x, -@camera_y) do
      @map.draw
      @player.draw
    end

  end
  def button_down(id)
    case id
    when Gosu::KB_SPACE
      @player.try_to_jump

    when Gosu::KB_ESCAPE
      close
    else
      super
    end
  end

end
