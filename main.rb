require 'gosu'


require_relative 'window'
require_relative 'tiles'
require_relative 'player'
require_relative 'map'
WindowWidth = 900
WindowHeight = 400

Window = Window.new(WindowWidth, WindowHeight)
Window.show
