class Game
  PIECES = [2, 3, 3, 4, 5]
  def initialize player1, player2
    @players = [player1, player2]
    @current_player = 0
  end

  def welcome
    puts "Welcome, #{@players[0].name} and #{@players[1].name}!\nIt's time to play Battleship."
  end

  def take_turn
    shot = current_player.call_shot
    fire = other_player.grid.fire_at Grid.x_of(shot), Grid.y_of(shot)
    if fire
      puts "Hit!"
    else
      puts "Miss!"
    end
    @current_player = (@current_player + 1) % 2
  end

  def place_ships
    @players.each do |p|
      p.place_ships PIECES
    end
  end

  def display_status
    current_player.shots_taken
    puts
    current_player.your_board
  end

  def current_player
    @players[@current_player]
  end

  def other_player
    @players[(@current_player + 1) % 2]
  end
end
