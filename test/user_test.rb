require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/user'

class UserTest < Minitest::Test
  def setup
    @board = Board.new
    @user = User.new(@board)
    @cruiser    = Ship.new("Cruiser", 3)
    @submarine  = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of User, @user
    assert_instance_of Board, @user.board
  end

  def test_it_can_place_ships
    assert_equal ["A1", "B1", "C1"], @user.place_ships(@cruiser, ["A1", "B1", "C1"])
  end
end