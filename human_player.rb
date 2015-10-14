def get_user_input
  gets.chomp
end

class HumanPlayer < Player
  def initialize name = "Dave"
    super(name)
  end

  def call_shot
    puts "#{name}, please enter the coordinates for your next shot (e.g. 'B10'):"
    get_user_input
  end
end
