class Board
  attr_reader :cells

  def initialize
    @cells ={
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("B5"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
        }
  end

  def valid_coordinate?(coordinate)
    @cells.key?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    ship.length == coordinates.length &&
    consecutive_letters_and_numbers?(coordinates) &&
    diagonal_letters_and_numbers?(coordinates) == false
  end

  def split_letters(coordinates)
    coordinates.map do |coordinate|
      coordinate[0].ord
    end
  end

  def split_numbers(coordinates)
    coordinates.map do |coordinate|
      coordinate[1].to_i
    end
  end

  def consecutive_letters?(coordinates)
    split_letters(coordinates).each_cons(2).all? do |letter1, letter2|
      letter1 == letter2 || (letter1 + 1) == letter2
    end
  end

  def consecutive_numbers?(coordinates)
    split_numbers(coordinates).each_cons(2).all? do |number1, number2|
      number1 == number2 || (number1 + 1) == number2
    end
  end

  def consecutive_letters_and_numbers?(coordinates)
    consecutive_letters?(coordinates) &&
    consecutive_numbers?(coordinates)
  end

  # Begin Diagonal Methods ------------

  def diagonal_letters?(coordinates)
    split_letters(coordinates).each_cons(2).all? do |letter1, letter2|
      (letter1 + 1) == letter2
    end
  end

  def diagonal_numbers?(coordinates)
    split_numbers(coordinates).each_cons(2).all? do |number1, number2|
      (number1 + 1) == number2
    end
  end

  def diagonal_letters_and_numbers?(coordinates)
    diagonal_letters?(coordinates) &&
    diagonal_numbers?(coordinates)
  end
end
