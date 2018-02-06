require 'gosu_tiled'
require 'gosu'


require_relative 'window'
require_relative 'ZOrder'
require_relative 'player'

WindowWidth = 736
WindowHeight = 416

Window = Window.new(WindowWidth, WindowHeight)
Window.show
