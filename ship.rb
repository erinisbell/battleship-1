require 'matrix'
class Ship
  attr_reader :length
  def initialize length
    @length = length
  end

  def place x, y, horizontal
    return false if @origin
    @horizontal = horizontal
    @origin = Vector[x, y]
    true
  end

  def covers? x, y
    x_itr = @origin[0]
    y_itr = @origin[1]

    @length.times do
      return true if x_itr == x && y_itr == y
      if @horizontal
        x_itr += 1
      else
        y_itr += 1
      end
    end
    false
  end

  def overlaps_with? ship
    positions.find { |pos| ship.covers? pos[0], pos[1] }
  end

  private

  def positions
    list = []
    delta = Vector[@horizontal ? 1 : 0, @horizontal ? 0 : 1]
    accumulator = @origin
    @length.times do
      list << accumulator
      accumulator += delta
    end
    list
  end
end
