require './player.rb'
# human
class HumanPlayer < Player
  def initialize(name, stone)
    super(stone, name)
  end
end
