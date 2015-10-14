class Grid
  def has_ship_on? x, y
    false
  end

  def display
    puts "    1   2   3   4   5   6   7   8   9   10"
    puts seperator
    ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"].each do |ltr|
      puts grid_line(ltr)
    end
    puts seperator
  end

  private

  def seperator
    "  -----------------------------------------"
  end

  def grid_line letter
    "#{letter} |   |   |   |   |   |   |   |   |   |   |"
  end
end
