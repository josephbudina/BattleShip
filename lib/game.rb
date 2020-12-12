class Game
    attr_reader :computer,
                :user

  def initialize
    @Computer = Computer.new
    @user = User.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def start
    puts "     Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
    print ">"
    play_game = gets.chomp.downcase

    if play_game == "p"
      # player places ships/ presented with messages
      @computer.place_ship("Cruiser", 3)
      @computer.place_ship("Submarine" 3)
    elsif play_game == "q"
    end
  end
end