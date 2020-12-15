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
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @user_board = Board.new
    @computer_board = Board.new
    @computer = Computer.new(@computer_board)
    @user = User.new(@user_board)
  end

  def start
    puts "     Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
    print ">"
    play_game = gets.chomp.downcase

    if play_game == "p"
      @computer.place_ship(@cruiser)
      @computer.place_ship(@submarine)
      puts "I have laid out my ships on the grid.\nYou now need to lay out your two ships.\nThe Cruiser is three units long and the Submarine is two units long."
      print "#{@user_board.render(true)}"
      # @user.
      # print "#{@computer_board.render(true)}"
      print ">"
      player_ships = gets.chomp.capitalize
      # placement_coords =
      # player_ship_placer(player_ships)
      coords = gets.chomp.upcase
      if player_ships == "Cruiser"
        @user.place_ships(@cruiser, coords.split)
      elsif player_ships == "Submarine"
        @user.place_ships(@cruiser, gets.chomp.upcase)
      end
      print "#{@user_board.render(true)}"
    elsif play_game == "q"
    end
  end
end
