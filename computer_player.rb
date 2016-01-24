require './player.rb'
# computer
class ComputerPlayer < Player
  def initialize(name, stone)
    super(stone, name)
  end
end
