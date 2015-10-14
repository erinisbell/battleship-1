class Grid
  attr_reader :ships

  def initialize
    @ships = []
  end

  def fire_at x, y
    return false if x > 10 || y > 10
    ship = has_ship_on? x, y
    if ship
      ship.fire_at(x, y)
    else
      false
    end
  end

  def has_ship_on? x, y
    @ships.find{|ship| ship.covers? x, y}
  end

  def sunk?
    return false if @ships.empty?
    @ships.select{|ship| ship.sunk?}.count == @ships.count
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

  def y_of str
    str[0].upcase.ord - 64
  end

  def x_of str
    str[1..-1].to_i
  end

  private

  def seperator
    "  -----------------------------------------"
  end

  def grid_line letter
    y = y_of(letter)
    slots = []
    (1..10).each do |x|
      ship = has_ship_on? x, y
      if ship
        hole = ship.covers? x, y
        slots << hole.to_s
      else
        slots << " "
      end
    end
    "#{letter} | #{slots.join(" | ")} |"
  end
end
