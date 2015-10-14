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
    positions.find { |pos| pos[0] == x && pos[1] == y}
  end

  def overlaps_with? ship
    positions.find { |pos| ship.covers? pos[0], pos[1] }
  end

  private

  def positions
    return @positions if @positions
    @positions = []
    delta = Vector[@horizontal ? 1 : 0, @horizontal ? 0 : 1]
    accumulator = @origin
    @length.times do
      @positions << accumulator
      accumulator += delta
    end
    @positions
  end
end
