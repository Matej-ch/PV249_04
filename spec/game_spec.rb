require 'spec_helper'

describe Game do
  describe '#new' do
    it 'takes two players and returns a Game object' do
      player1 = Player.new 'X', 'Matej'
      player2 = Player.new 'O', 'Comp'
      game = Game.new player1, player2
      game.should be_an_instance_of Game
    end
  end

  describe '#menu_select' do
    it 'should get correct choice and request player name' do
      player1 = Player.new 'X', 'Matej'
      player2 = Player.new 'O', 'Comp'
      game = Game.new player1, player2
      called = false
      game.stub(:gets).and_return('1')
      game.stub(:request_player_name) { called = true }
      game.menu_select
      expect(called).to eq(true)
    end
  end

  describe '#menu_select' do
    it 'should get choice to end game from player' do
      player1 = Player.new 'X', 'Matej'
      player2 = Player.new 'O', 'Comp'
      game = Game.new player1, player2
      game.stub(:gets).and_return('2')
      expect { game.menu_select }.to raise_exception(SystemExit)
    end
  end

  describe '#menu_select' do
    it 'should get wrong choice' do
      player1 = Player.new 'X', 'Matej'
      player2 = Player.new 'O', 'Comp'
      game = Game.new player1, player2
      game.stub(:gets).and_return('3')
      called = false
      game.stub(:menu_select) { called = true }
      game.menu_select
      expect(called).to eq(true)
    end
  end

  describe '#request_player_name' do
    it 'request player name from user' do
      player1 = Player.new 'X', 'Matej'
      player2 = Player.new 'O', 'Comp'
      game = Game.new player1, player2
      game.stub(:gets).and_return('Matej')
      game.request_player_name
    end
  end

  describe '#swap_player' do
    it 'should return Player object' do
      player1 = Player.new 'X', 'Matej'
      player2 = Player.new 'O', 'Comp'
      game = Game.new player1, player2
      game.swap_player(player1).should be_an_instance_of(Player)
    end
  end

  describe '#swap_player' do
    it 'should return other player' do
      player1 = Player.new 'X', 'Matej'
      player2 = Player.new 'O', 'Comp'
      game = Game.new player1, player2
      game.swap_player(player1).should eql(player2)
    end
  end

  describe '#check_more_turns' do
    it 'checks that winning conditions are not met' do
      player1 = Player.new 'X', 'Matej'
      player2 = Player.new 'O', 'Comp'
      game = Game.new player1, player2
      game.check_more_turns.should be_equal false
    end
  end

  describe '#check_more_turns' do
    it 'checks that winning conditions are met' do
      player1 = Player.new 'X', 'Matej'
      player2 = Player.new 'O', 'Comp'
      game = Game.new player1, player2
      game.status[:turns] = 2
      game.check_more_turns.should be_equal false
    end
  end

  describe '#check_draw' do
    it 'should return false conditions not met' do
      player1 = Player.new 'X', 'Matej'
      player2 = Player.new 'O', 'Comp'
      game = Game.new player1, player2
      game.check_draw.should be_equal(false)
    end
  end

  describe '#check_draw' do
    it 'should return true conditions are met' do
      player1 = Player.new 'X', 'Matej'
      player2 = Player.new 'O', 'Comp'
      game = Game.new player1, player2
      game.status[:turns] = 20
      game.status[:round_done] = false
      game.check_draw.should be_equal(true)
    end
  end
end
