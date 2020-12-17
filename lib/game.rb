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
  
  def start
    puts "     Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
    print ">"
    play_game = gets.chomp.downcase
  
    if play_game == "q"
      puts "TERMINATING SESSION"
    else
      computer_places_ships
      puts "I have laid out my ships on the grid.\nYou now need to lay out your two ships.\nThe Cruiser is three units long and the Submarine is two units long."
      print "#{@user_board.render}"
      player_placement
    end
  end
  
  def play_game
    until @user.ships_health == 0 || @computer.ships_health == 0
      user_turn
      print " --- Enemy Board ---\n"
      print "#{@computer_board.render}"
      sleep(1)
      computer_turn
      print " ---  Your Board ---\n"
      print "#{@user_board.render(true)}"
      sleep(1)
    end
    declare_winner
  end

  def player_placement
    coords = placement_prompt(@user.cruiser)
    @user.place_ships(@user.cruiser, coords)

    print "#{@user_board.render(true)}"

    coords = placement_prompt(@user.submarine)
    @user.place_ships(@user.submarine, coords)

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

  def fired_upon_coordinate(coordinate)
    if @computer_board.cells[coordinate].fired_upon?
      print "ALREADY FIRED ON #{coordinate}\n"
    end
  end

  def user_turn
    print "Enter coordinate to fire on enemy!\n"
    print ">"
    coordinate = gets.chomp.upcase
    if @computer_board.valid_coordinate?(coordinate)
      fired_upon_coordinate(coordinate)
      @computer.apply_user_shot(coordinate)
      inform_player_shots(coordinate)
    elsif @computer_board.valid_coordinate?(coordinate) == false
      print "Invalid coordinate, try again!\n"
      user_turn
    end
  end

  def computer_turn
    print ">"
    comp_shot = @computer.take_random_shot
    @user.apply_enemy_shot(comp_shot)
    inform_computer_shots(comp_shot)
  end

  def declare_winner
    if @user.ships_health == 0
      print "Game Over! All your ships were sunk! Computer wins!\n\n"
    elsif @computer.ships_health == 0
      print "Game Over! All enemy ships sunk! You win!\n\n"
    end
    start
  end

  def computer_places_ships
    @computer.place_ship(@computer.cruiser)
    @computer.place_ship(@computer.submarine)
  end

  def inform_player_shots(coordinate)
    if @computer_board.cells[coordinate].render == "M"
      print "YOUR SHOT AT #{coordinate} WAS A MISS!\n"
    elsif @computer_board.cells[coordinate].render == "H"
      print "YOUR SHOT AT #{coordinate} WAS A HIT!\n"
    elsif @computer_board.cells[coordinate].render == "X"
      print "YOU SUNK THAT SHIP AT #{coordinate}!\n"
    end
  end

  def inform_computer_shots(coordinate)
    if @user_board.cells[coordinate].render == "M"
      print "COMPUTER SHOT AT #{coordinate} WAS A MISS!\n"
    elsif @user_board.cells[coordinate].render == "H"
      print "COMPUTER SHOT AT #{coordinate} WAS A HIT! Okay job.\n"
    elsif @user_board.cells[coordinate].render == "X"
      print "COMPUTER SUNK YOUR SHIP AT #{coordinate}!\n"
    end
  end
end
