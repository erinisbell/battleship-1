class Grid
  def initialize
    @ships = []
  end

  def has_ship_on? x, y
    @ships.find{|ship| ship.covers? x, y}
  end

  def display
    puts "    1   2   3   4   5   6   7   8   9   10"
    puts seperator
    ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"].each do |ltr|
      puts grid_line(ltr)
    end
    puts seperator
  end

  def place_ship ship, x, y, horizontal
    ship.place(x, y, horizontal)
    if @ships.find {|grid_ship| grid_ship.overlaps_with? ship}
      false
    else
      @ships << ship
    end
  end

  private

  def seperator
    "  -----------------------------------------"
  end

  def grid_line letter
    y = letter_to_y(letter)
    slots = []
    (1..10).each do |x|
      if has_ship_on? x, y
        slots << "O"
      else
        slots << " "
      end
    end
    "#{letter} | #{slots.join(" | ")} |"
  end

  def letter_to_y ltr
    ltr.upcase.ord - 64
  end
end
