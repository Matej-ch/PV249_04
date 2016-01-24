require 'spec_helper.rb'

describe Player do
  before :each do
    @player = Player.new 'Stone', 'Name'
  end

  describe '#new' do
    it 'takes two parameters and returns a Player object' do
      @player.should be_an_instance_of Player
    end
  end

  describe '#name' do
    it 'returns correct name' do
      @player.name.should eql 'Name'
    end
  end

  describe '#stone' do
    it 'returns correct stone sign' do
      @player.stone.should eql 'Stone'
    end
  end
end
