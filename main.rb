require 'gosu'


require_relative 'window'
require_relative 'tiles'
require_relative 'player'
require_relative 'map'
require_relative 'enemy'
require_relative 'menu'
require_relative 'porte'
require_relative 'potion'
WindowWidth = 721
WindowHeight = 1280

Men = Menu.new(WindowWidth, WindowHeight)

Men.show
