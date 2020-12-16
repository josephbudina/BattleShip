require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

game = Game.new

game.start
game.user_turn
game.play_game