require './human_player.rb'
require './computer_player.rb'
require './player.rb'
require './board.rb'
# game
class Game
  attr_accessor :status
  attr_accessor :board
  attr_accessor :o_player
  attr_accessor :x_player

  def initialize(o_player, x_player)
    @o_player = o_player
    @x_player = x_player
    @status = { turns_played: 0, turns: 0, drawn: 0, round_done: false }
    @board = Board.new
  end

  # select option from menu
  def menu_select
    print "1D Piskvorky\n------------\n1 - Nova hra\n2 - Koniec\n------------\n"
    choice = gets.chomp
    if choice == '1'
      request_player_name
    elsif choice == '2'
      abort('Zvolili ste si ukoncit hru, Dovidenia')
    else
      print "Nespravna volba\n"
      menu_select
    end
  end

  def request_player_name
    print "Zadaj meno: \n"
    @o_player.name = gets.chomp
    print "Ahoj #{@o_player.name}, Si 'O' Hrac\n"
  end

  # run game and loop
  def start_game
    menu_select
    basic_var_setup
    print @board.game_board_print
    @active_player = if @status[:turns_played].odd?
                       @x_player
                     else
                       @o_player
                     end

    until @status[:round_done]
      functions_to_run
      @active_player = swap_player(@active_player)
    end
  end

  def swap_player(active)
    if active == @o_player
      @x_player
    else
      @o_player
    end
  end

  # because rubocop
  def functions_to_run
    @status[:turns] += 1
    valid_input = false
    check_valid_input(@active_player, valid_input)
    print @board.game_board_print
    if check_more_turns
      puts "#{@active_player.name} Vyhral!"
      abort('GAME OVER')
    end
    puts 'REMIZA' if check_draw
  end

  def basic_var_setup
    @status[:drawn] = 0
    @status[:turns] = 0
    @status[:round_done] = false
  end

  def check_more_turns
    if @status[:turns] > 2 && (@board.check_status == @x_player.stone ||
       @board.check_status == @o_player.stone)
      @status[:round_done] = true
    else
      @status[:round_done] = false
    end
  end

  def check_draw
    if @status[:turns] == 20 && @status[:round_done] == false
      @status[:drawn] += 1
      @status[:round_done] = true
    else
      @status[:round_done] = false
    end
  end

  def check_valid_input(player, input)
    until input
      print "#{player.name} Vyber poziciu (1-20)\n"
      location = gets.chomp
      if location.to_i.between?(1, 20)
        input = true
        input = false unless @board.place_stone?(player.stone, location.to_i)
      else
        print "#{location} je nespravna pozicia\n"
      end
    end
  end
end
