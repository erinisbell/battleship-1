class Hole
  EMPTY = 0
  HIT = 1
  PLUS = 2
  MINUS = 3
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
    return false if hit?
    @state = HIT
  end

  def hit?
    @state == HIT
  end

  def plus!
    @state = PLUS
  end

  def minus!
    @state = MINUS
  end

  def to_s
    case @state
      when HIT
        return "X"
      when EMPTY
        return "O"
      when PLUS
        return "+"
      when MINUS
        return "-"
    end
  end
end
