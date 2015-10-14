class Hole
  EMPTY = 0
  HIT = 1
  MISS = 2
  attr_reader :x, :y
  def initialize vector
    @x = vector[0]
    @y = vector[1]
    @state = EMPTY
  end

  def + vector
    @x += vector[0]
    @y += vector[1]
    self
  end

  def hit!
    @state = HIT
  end

  def hit?
    @state == HIT
  end
end
