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
  end

  def test_it_exists
    assert_instance_of User, @user
    assert_instance_of Board, @user.board
  end
end