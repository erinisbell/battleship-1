def get_user_input
  gets.chomp
end

class Player
  attr_reader :name, :grid
  def initialize name
    @name = name
    @grid = Grid.new
  end

  def place_ships lengths
    lengths.each do |length|
      until place_ship length
        puts "Unfortunately, that ship overlaps with one of your other ships.  Please try again."
      end
    end
  end

  def place_ship length
    puts "#{@name}, where would you like to place a ship of length #{length}?"
    coord = get_user_input
    puts "Across or Down?"
    direction = get_user_input
    if direction == "Across"
      horizontal = true
    else
      horizontal = false
    end
    x = grid.x_of coord
    y = grid.y_of coord
    grid.place_ship Ship.new(length), x, y, horizontal
  end

  def ships
    grid.ships
  end
end
