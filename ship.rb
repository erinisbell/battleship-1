require 'matrix'
require './hole'
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
    positions.find { |pos| pos.x == x && pos.y == y}
  end

  def overlaps_with? ship
    positions.find { |pos| ship.covers? pos.x, pos.y }
  end

  def fire_at x, y
    hole = covers? x, y
    return false unless hole
    hole.hit!
  end

  def sunk?
    return false unless @origin
    positions.select{|h| h.hit? }.count == @length
  end

  private

  def positions
    return @positions if @positions
    @positions = []
    delta = Vector[@horizontal ? 1 : 0, @horizontal ? 0 : 1]
    accumulator = Hole.new(@origin)
    @length.times do
      @positions << accumulator
      accumulator = accumulator.clone + delta
    end
    @positions
  end
end
