require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test

  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists_with_attributes
    assert_instance_of Ship, @cruiser

    assert_equal "Cruiser", @cruiser.name
    assert_equal 3, @cruiser.length
    assert_equal 3, @cruiser.health
  end

end
