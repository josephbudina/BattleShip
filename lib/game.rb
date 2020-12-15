require './lib/computer'
require './lib/user'

class Game
    attr_reader :computer,
                :computer_board,
                :user,
                :user_board,
                :cruiser,
                :submarine

  def initialize
    # @cruiser = Ship.new("Cruiser", 3)
    # @submarine = Ship.new("Submarine", 2)
    @user_board = Board.new
    @computer_board = Board.new
    @computer = Computer.new(@computer_board)
    @user = User.new(@user_board)
  end

  def player_place_ship
    puts "You have the choice of using two a cruiser and a submarine which do would you like to place first?"
    player_ship_type = gets.chomp.capitalize
    coords = gets.chomp.upcase
    if player_ship_type == "Cruiser"
      puts "Enter 3 coordinates for placement"
      @user.place_ships(Ship.new("Cruiser", 3), coords.split)
    elsif player_ship_type == "Submarine"
      puts "Enter 2 coordinates for placement"
      @user.place_ships(Ship.new("Submarine", 2), coords.split)
    end
    print "#{@user_board.render(true)}"
  end

  def start
    puts "     Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
    print ">"
    play_game = gets.chomp.downcase

    if play_game == "p"
      @computer.place_ship(Ship.new("Cruiser", 3))
      @computer.place_ship(Ship.new("Submarine", 2))
      puts "I have laid out my ships on the grid.\nYou now need to lay out your two ships.\nThe Cruiser is three units long and the Submarine is two units long."
      print "#{@user_board.render(true)}"
      print ">"

      player_place_ship
    elsif play_game == "q"
    end
  end
end
