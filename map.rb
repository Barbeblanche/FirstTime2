require_relative 'enemy'
require_relative 'potion'
require_relative 'porte'
class Map
  attr_reader :width, :height, :potion, :porte

  def initialize(filename)
    # Load 60x60 tiles, 5px overlap in all four directions.
    @tileset = Gosu::Image.load_tiles("image/tile4.png", 50, 50, :tileable => true)
    @potion_img = Gosu::Image.new("image/potion.png")
    @porte_img = Gosu::Image.new("image/porte.png")
    @potion = []

    @porte = []
    lines = File.readlines(filename).map { |line| line.chomp }
    @height = lines.size
    @width = lines[0].size
    @tiles = Array.new(@width) do |x|
      Array.new(@height) do |y|
        case lines[y][x, 1]
        when '"'
          Tiles::Grass
        when '#'
          Tiles::Earth
        when 'x'
          @potion.push(Potion.new(@potion_img, x * 50 + 25, y * 50 + 25))
          nil
        when 'p'
         @porte.push(Porte.new(@porte_img, x * 50 + 25, y * 50 + 25))
         puts "testporte"
         nil
        else
          nil
        end
      end
    end
  end

  def draw
    # Very primitive drawing function:
    # Draws all the tiles, some off-screen, some on-screen.
    @height.times do |y|
      @width.times do |x|
        tile = @tiles[x][y]
        if tile
          # Draw the tile with an offset (tile images have some overlap)
          # Scrolling is implemented here just as in the game objects.
          @tileset[tile].draw(x * 50 - 5, y * 50 - 5, 0)
        end
      end
    end
    @potion.each { |c| c.draw }
    @porte.each { |c| c.draw }

  end

  # Solid at a given pixel position?
  def solid?(x, y)
    y < 0 || @tiles[x / 50][y / 50]

  end
end
