require './battleship'
puts "What is your name?"
name = gets.chomp
Game.new(HumanPlayer.new(name), ComputerPlayer.new).play
