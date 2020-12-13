class Computer
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def random_coordinates(ship, length)
    coordinates = [@board.cells.keys.sample]
    until @board.valid_placement?(ship, coordinates)
      new_coordinates = @board.cells.keys.sample(length)
      coordinates = new_coordinates
    end
   coordinates
  end
    # new_coords = [@board.cells.keys.sample]
    # possible_valid = []
    # longer_possible = []
    # require 'pry'; binding.pry
    # @board.cells.each do |coord, cell|
    #   possible_valid << coord if @board.consecutive_letters_and_numbers?([new_coords, coord]) && @board.diagonal_letters_and_numbers?([new_coords, coord])
    # end
    # possible_valid << new_coords

    # @board.cells.each do |coord, cell|
    #   longer_possible << coord if @board.consecutive_letters_and_numbers?(possible_valid.flatten) && @board.diagonal_letters_and_numbers?(possible_valid.flatten)
    # end

    # until new_coords.length == ship.length
    #   shuffle = @board.cells.keys.select do |key|
    #     @board.consecutive_letters_and_numbers?([new_coords, key])
    #   end
    #   new_coords << shuffle
    # end
    # new_coords

  def get_random_placement_zone
    valid_arrays = [["A1", "B1", "C1", "D1"], ["A2", "B2", "C2", "D2"], ["A3", "B3", "C3", "D3"], ["A4", "B4", "C4", "D4"], ["A1", "A2", "A3", "A4"], ["B1", "B2", "B3", "B4"], ["C1", "C2", "C3", "C4"], ["D1", "D2", "D3", "D4"]]
    valid_arrays.sample
  end

  def get_start_index(ship)
    (0..(4 - (ship.length))).to_a.sample
  end

  def get_placement_coordinates(ship)
    start_index = get_start_index(ship)
    get_random_placement_zone[start_index..(start_index + (ship.length - 1))]
  end

  def place_ships(ship)
    coordinates = get_placement_coordinates(ship)
    @board.place(ship, coordinates)
  end
end
