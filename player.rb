# Player parent class
class Player
  attr_reader :stone
  attr_accessor :name
  def initialize(stone, name)
    @stone = stone
    @name = name
  end
end
