require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

class GameTest < Minitest::Test
  def setup
    @game = Game.new
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Game, @game
    assert_instance_of Computer, @game.computer
    assert_instance_of Board, @game.computer_board
    assert_instance_of User, @game.user
    assert_instance_of Board, @game.user_board
    assert_instance_of Ship, @game.cruiser
    assert_instance_of Ship, @game.submarine
  end
end