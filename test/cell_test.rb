require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test

  def setup
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_cell_exists_with_attributes
    assert_instance_of Cell, @cell
    assert_equal 'B4', @cell.coordinate
    assert_nil @cell.ship 
  end


end
