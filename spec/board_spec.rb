require 'spec_helper'

describe Board do
  before :each do
    @board = Board.new
  end

  describe '#new' do
    it 'returns board object' do
      @board.should be_an_instance_of Board
    end
  end

  describe '#game_board_print' do
    it 'prints board' do
      string = '_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|'
      @board.game_board_print.should eq(string)
    end
  end

  describe '#clean_board' do
    it 'removes stones from board' do
      @board.clean_board.should eq(1 => '_', 2 => '_', 3 => '_',
                                   4 => '_', 5 => '_', 6 => '_',
                                   7 => '_', 8 => '_', 9 => '_',
                                   10 => '_', 11 => '_', 12 => '_',
                                   13 => '_', 14 => '_', 15 => '_',
                                   16 => '_', 17 => '_', 18 => '_',
                                   19 => '_', 20 => '_')
    end
  end

  describe '#place_stone?' do
    it 'places stone on bad position on board' do
      @board.place_stone?('X', 21).should be false
    end
  end

  describe '#place_stone?' do
    it 'places stone on correct on board' do
      @board.place_stone?('O', 5).should be true
    end
  end

  describe '#check_status' do
    it 'returns stone on board if there are 3 same stones' do
      @board.check_status.should eq('_')
    end
  end
end
