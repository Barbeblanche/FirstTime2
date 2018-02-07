# classe fille Window qui hérite de la classe Window de Gosu
require_relative 'map'
require_relative 'player'
require_relative 'tiles'
require_relative 'enemy'
require_relative 'potion'
WIDTH, HEIGHT = 721, 1280
class Window < Gosu::Window

  # constructeur de la classe Window
  def initialize(width, height)
    super WIDTH, HEIGHT

    @background = Gosu::Image.new("image/sky3.jpg", :tileable => true)
    #creation d'un array pour stocker les noms des maps et faire un choix de level random
    @maps = ["maps/test.txt", "maps/test1.txt"]
    @item = @maps[rand(@maps.length)]
    @coeur = Gosu::Image.new("image/coeurplein.png")
    @coeurvide = Gosu::Image.new("image/coeur.png")
    @vie = 3
    @map = Map.new("maps/map.txt")
    @enemy = []
    100.times do
      @enemy.push(Enemy.new(@map,"oiseau"))
    end

    @player = Player.new(@map, 100, 99*50-1)


    @music = Gosu::Song.new("song/miami.mp3")
    @music.volume = 0.25
    @music.play(true)

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
    @enemy.each(&:update)
  end

  def draw
    @background.draw 0, 0, 0
    #if (@rect1[0] < @rect2[0] + @rect2[2] &&
    #   @rect1[0] + @rect1[2] >  @rect2[0] &&
    #   @rect1[1] < @rect2[1] +  @rect2[3] &&
    #   @rect1[3] + @rect1[1] > @rect2[1])
    #   @vie -=1
    #end
    if @vie==3
      @coeur.draw(0,0,0)
      @coeur.draw(50,0,0)
      @coeur.draw(100,0,0)
    elsif @vie ==2
      @coeur.draw(0,0,0)
      @coeur.draw(50,0,0)
      @coeurvide.draw(100,0,0)
    elsif @vie ==1
      @coeur.draw(0,0,0)
      @coeurvide.draw(50,0,0)
      @coeurvide.draw(100,0,0)
    elsif @vie ==0
      close
    end
    Gosu.translate(-@camera_x, -@camera_y) do
      @map.draw
      @player.draw
      @enemy.each(&:draw)
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
