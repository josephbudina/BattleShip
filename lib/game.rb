class Game

  def start
    puts "     Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
    print ">"
    play_game = gets.chomp.upcase

    if play_game == "p"
      
    elsif play_game == "q"
    end
  end
end