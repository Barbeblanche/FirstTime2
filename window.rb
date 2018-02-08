# classe fille Window qui hérite de la classe Window de Gosu
require_relative 'map'
require_relative 'player'
require_relative 'tiles'
require_relative 'enemy'
require_relative 'potion'
require_relative 'porte'
require_relative 'quit'
require_relative 'menu'
require_relative 'clef'
require_relative 'fin'
WIDTH, HEIGHT = 721, 1280
class Window < Gosu::Window

  # constructeur de la classe Window
  def initialize(width, height)
    super WIDTH, HEIGHT
    self.caption = "Retro Climber"
    @background = Gosu::Image.new("image/sky3.jpg", :tileable => true)
    #creation d'un array pour stocker les noms des maps et faire un choix de level random
    @maps = ["maps/map.txt","maps/map1.txt","maps/map2.txt","maps/map3.txt","maps/mapT.txt","maps/test.txt", "maps/test1.txt"]
    @item = @maps[rand(@maps.length)]
    @coeur = Gosu::Image.new("image/coeurplein.png")
    @coeurvide = Gosu::Image.new("image/coeur.png")
    @map = Map.new(@item)
    @player = Player.new(@map, 100, 99*50-1)
    @enemy = []
    @window = self
    @i = @map.potion.length - 1
    @nbPotion = @map.potion.length
    20.times do
      @enemy.push(Enemy.new(@map,"oiseau",@player))
    end
    @music = Gosu::Song.new("song/miami.mp3")
    @music.volume = 1
    @music.play(true)
    @i2 = 0
    @bruit_fiole = Gosu::Sample.new('song/bruit_fiole.wav')


    # The scrolling position is stored as top left corner of the screen.
    @camera_x = @camera_y = 0
  end



  def update
    move_x = 0
    move_x -= 5 if Gosu.button_down? Gosu::KB_LEFT
    move_x += 5 if Gosu.button_down? Gosu::KB_RIGHT
    #i = 1 if Gosu.button_down? Gosu::KB_DOWN


    @player.update(move_x)
    @player.collect_potion(@map.potion)
    if @map.clef.length == 0
      @player.collect_porte(@map.porte)
      close!
      @fin = Fin.new(WIDTH,HEIGHT)
      @fin.show
    end
    if @i2 == 1
      @bruit_fiole.play(1,1,false)
      @i2 -= 1
    end

    @player.collect_clef(@map.clef)

    @camera_x = [[@player.x - WIDTH / 2, 0].max, @map.width * 50 - WIDTH].min
    @camera_y = [[@player.y - HEIGHT / 2, 0].max, @map.height * 50 - HEIGHT].min
    @enemy.each(&:update)
    if @player.vie == 0
      close!
      @fin = Fin.new(WIDTH,HEIGHT)
      @fin.show
    end
  end

  def draw

    @background.draw 0, 0, 0
    if @map.porte.length == 0
      close!
    end
    if @map.potion.length == @i
      @nbPotion -=1
    end
    if @nbPotion == @i && @player.vie == 3
      @i -= 1
      @i2 += 1
    elsif @nbPotion == @i && @player.vie == 2
      @player.set_vie(3)
      @i -= 1
      @i2 += 1
    elsif @nbPotion == @i && @player.vie == 1
      @player.set_vie(2)
      @i -= 1
      @i2 += 1
    end
    @enemy.each{|enemy| enemy.collision(@player.x,@player.y)}
    if @player.vie==3
      @coeur.draw(0,0,1)
      @coeur.draw(50,0,1)
      @coeur.draw(100,0,1)
    elsif @player.vie ==2
      @coeur.draw(0,0,1)
      @coeur.draw(50,0,1)
      @coeurvide.draw(100,0,1)
    elsif @player.vie ==1
      @coeur.draw(0,0,1)
      @coeurvide.draw(50,0,1)
      @coeurvide.draw(100,0,1)
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
      @quitter = Quit.new(WIDTH,HEIGHT)
      @quitter.show
    else
      super
    end
  end




end
