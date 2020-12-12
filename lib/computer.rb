class Computer
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def random_coordinates(ship, length)
    coordinates = []
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

  def place_ships(ship, coordinates)
    if @board.valid_placement?(ship, coordinates)
      @board.place(ship, coordinates)
    end
  end
end
