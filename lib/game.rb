require './lib/computer'
require './lib/user'

class Game
    attr_reader :computer,
                :computer_board,
                :user,
                :user_board

  def initialize
    @user_board = Board.new
    @computer_board = Board.new
    @computer = Computer.new(@computer_board)
    @user = User.new(@user_board)
  end

  def player_place_ship
    puts "You have the choice of placing two ships: a cruiser and a submarine. Which would you like to place first?"
    player_ship_type = gets.chomp.capitalize
    coords = gets.chomp.upcase
    if player_ship_type == "Cruiser"
      @user.place_ships(Ship.new("Cruiser", 3), coords.split)
    elsif player_ship_type == "Submarine"
      @user.place_ships(Ship.new("Submarine", 2), coords.split)
    elsif place_ships(Ship.new("Submarine", 2), coords.split) == "Not Valid Ship Placement"
        @user.place_ships(Ship.new("Submarine", 2), coords.split)
    end
    print "#{@user_board.render(true)}"
  end

  def player_placement
    cruiser   = Ship.new("cruiser", 3)
    submarine = Ship.new("submarine", 2)
    # need a valid coords check?
    coords = placement_prompt(cruiser)
    @user.place_ships(cruiser, coords)

    print "#{@user_board.render(true)}"

    coords = placement_prompt(submarine)
    @user.place_ships(submarine, coords)

    print "#{@user_board.render(true)}"
  end

  def placement_prompt(ship)
    puts "Enter coordinates to place your #{ship.name} (#{ship.length} spaces): "
    print "> "
    coords = (gets.chomp.upcase).split
    if @user.place_ships(ship, coords) == false
      puts "Invalid coordinates, try again... "
      placement_prompt(ship)
    else
      coords
    end
  end

  def start
    puts "     Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
    print ">"
    play_game = gets.chomp.downcase

    if play_game == "p"
      @computer.place_ship(Ship.new("Cruiser", 3))
      @computer.place_ship(Ship.new("Submarine", 2))
      puts "I have laid out my ships on the grid.\nYou now need to lay out your two ships.\nThe Cruiser is three units long and the Submarine is two units long."
      print "#{@user_board.render}"
      player_placement
    elsif play_game == "q"
      puts "TERMINATING SESSION"
    end
  end
end
