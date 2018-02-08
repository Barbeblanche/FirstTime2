require_relative 'enemy'
require_relative 'potion'
require_relative 'porte'
require_relative 'clef'
class Map
  attr_reader :width, :height, :potion, :porte, :clef

  def initialize(filename)

    @tileset = Gosu::Image.load_tiles("image/tile4.png", 50, 50, :tileable => true)
    @potion_img = Gosu::Image.new("image/potion.png")
    @porte_img = Gosu::Image.new("image/porte.png")
    @potion = []
    @clef_img = Gosu::Image.new("image/clef.png")
    @clef = []
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
         @porte.push(Porte.new(@porte_img, x * 50 + 25, y * 50 ))

         nil
       when 'c'
        @clef.push(Clef.new(@clef_img, x *50+20, y *50+10))
        nil
        else
          nil
        end
      end
    end
  end

  def draw

    @height.times do |y|
      @width.times do |x|
        tile = @tiles[x][y]
        if tile

          @tileset[tile].draw(x * 50 - 5, y * 50 - 5, 0)
        end
      end
    end
    @potion.each { |c| c.draw }
    @porte.each { |c| c.draw }
    @clef.each { |c| c.draw }
  end

  def solid?(x, y)
    y < 0 || @tiles[x / 50][y / 50]

  end
end
