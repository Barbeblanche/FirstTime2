require 'gosu'

require_relative 'window'
require_relative 'ZOrder'
require_relative 'player'

WindowWidth = 1024
WindowHeight = 720

Window = Window.new(WindowWidth, WindowHeight)
Window.show
