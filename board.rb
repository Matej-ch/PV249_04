# board
class Board
  attr_accessor :board
  def initialize
    @board = { 1 => '_', 2 => '_', 3 => '_', 4 => '_', 5 => '_',
               6 => '_', 7 => '_', 8 => '_', 9 => '_', 10 => '_',
               11 => '_', 12 => '_', 13 => '_', 14 => '_', 15 => '_',
               16 => '_', 17 => '_', 18 => '_', 19 => '_', 20 => '_' }
  end

  # print game board to screen
  def game_board_print
    board_string = ''
    @board.each { |_key, value| board_string += value + '|' }
    board_string.to_s
  end

  def clean_board
    @board.each { |key, _value| @board[key] = '_' }
  end

  def place_stone?(stone, location)
    if @board[location] == '_'
      @board[location] = stone
      true
    else
      false
    end
  end

  def check_status
    (1..20).each do |i|
      return @board[i] if @board[i] == @board[i + 1] &&
                          @board[i] == @board[i + 2]
    end
  end
end
