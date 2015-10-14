class ComputerPlayer < Player
  def initialize
    super("HAL 9000")
  end

  def place_ships lengths
    lengths.each do |length|
      until place_random_ship(length) do; end
    end
    puts "HAL 9000 has placed its ships."
  end

  def place_random_ship length
    rnd = Random.new
    x = rnd.rand(10) + 1
    y = rnd.rand(10) + 1
    horizontal = rnd.rand(2) == 0
    grid.place_ship Ship.new(length), x, y, horizontal
  end

  def call_shot
    rnd = Random.new
    x = (rnd.rand(10) + 65).chr
    y = rnd.rand(10) + 1
    x.to_s + y.to_s
  end
end
