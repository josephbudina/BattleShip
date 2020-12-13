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
    return false unless ship.length == coordinates.length
    return false unless horizontal_or_vertical?(coordinates)
    overlap?(coordinates)
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

  def horizontal_or_vertical?(coordinates)
    letters = split_letters(coordinates)
    numbers = split_numbers(coordinates)
    horizontal?(letters, numbers) || vertical?(letters, numbers)
  end

  def horizontal?(letters, numbers)
    init_letter = letters[0]
    init_num    = numbers[0]

    return false if numbers.uniq.length < numbers.length

    return false unless letters.all? do |letter|
      letter == init_letter
    end

    numbers.all? do |num|
      num == init_num + (numbers.index(num))
    end
  end

  def vertical?(letters, numbers)
    init_letter = letters[0]
    init_num    = numbers[0]

    return false if letters.uniq.length < letters.length

    return false unless letters.all? do |letter|
      letter.ord == (init_letter.ord + (letters.index(letter)))
    end

    numbers.all? do |num|
      num == init_num
    end
  end

  def place(ship, coordinates)
    coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end

  def overlap?(coordinates)
    coordinates.all? do |cell|
      @cells[cell].empty?
    end
  end

  def render(ship_reveal = false)
    x_axis = [1, 2, 3, 4]
    board = "  "
    x_axis.each do |number|
      board += number.to_s + ' '
    end
    y_axis = ["A", "B", "C", "D"]
    y_axis.each do |letter|
      board += "\n#{letter} "
      x_axis.each do |number|
        board += "#{@cells["#{letter}#{number}"].render(ship_reveal)} "
      end
    end
    board + "\n"
  end
end
