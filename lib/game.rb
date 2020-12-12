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
    @computer = Computer.new(@computer_board)
    @computer_board = Board.new
    @user = User.new(@user_board)
    @user_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  # def start
  #   puts "     Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
  #   print ">"
  #   play_game = gets.chomp.downcase

  #   if play_game == "p"
  #     # player places ships/ presented with messages
  #     @computer.place_ship(@cruiser)
  #     @computer.place_ship(@submarine)
  #     puts "I have laid out my ships on the grid.\nYou now need to lay out your two ships.\nThe Cruiser is three units long and the Submarine is two units long."
  #   elsif play_game == "q"
  #   end
  # end
end