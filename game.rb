class Game
  PIECES = [2, 3, 3, 4, 5]
  def initialize player1, player2
    @player1 = player1
    @player2 = player2
    @current_player = @player1
  end

  def welcome
    puts "Welcome, #{@player1.name} and #{@player2.name}!\nIt's time to play Battleship."
  end

  def place_ships
    @player1.place_ships PIECES
    @player2.place_ships PIECES
  end

  def display_status
    @current_player.shots_taken
    puts
    @current_player.your_board
  end
end
