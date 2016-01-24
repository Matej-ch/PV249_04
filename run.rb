require './game.rb'
game = Game.new(HumanPlayer.new('Human', 'O'),
                ComputerPlayer.new('Computer', 'X'))
game.start_game
