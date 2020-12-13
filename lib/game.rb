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
      @computer.place_ships(@cruiser)
      @computer.place_ships(@submarine)
      puts "I have laid out my ships on the grid.\nYou now need to lay out your two ships.\nThe Cruiser is three units long and the Submarine is two units long."
      print "#{@user_board.render(true)}"
      print ">"
      player_ships = gets.chomp.capitalize
      
      if player_ships == "Cruiser"
        @user.player_ships(@cruiser)
      elsif player_ships == "Submarine"
    elsif play_game == "q"
    end
  end
end