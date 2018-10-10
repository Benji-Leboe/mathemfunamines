require_relative "player"
require_relative "game"
require_relative "question"

class Turnloop

  def initialize(player1 = "Player 1", player2 = "Player 2")

    @player1 = Player.new(player1)
    @player2 = Player.new(player2)
    @question = Question.new
    @game = Game.new
    @turn = 0
    
  end

  
  def new_turn
    @game.new_turn_msg(@player1, @player2)
    @turn += 1
  end

  def turn_loop

    def pick_player(player1, player2)
      first_player = (rand(0..1) > 1) ? player1 : player2
    
      next_player = (first_player == player1) ? player2 : player1

      puts "#{first_player.name} is going first. Better luck next time, #{next_player.name}!\n"  
      
      return first_player
    end

    current_player = pick_player(@player1, @player2)

    while current_player.get_lives? do
      
      new_turn

      @question.ask_question(current_player)

      @question.check_answer? ? 
         @question.correct_answer(current_player) :
        (@question.incorrect_answer(current_player); current_player.lose_life)

      current_player = current_player == @player1 ? @player2 : @player1

    end
  
    unless current_player.get_lives?
      @game.game_over_msg(@player1, @player2)
    end

  end

end

def game_init

  puts "\nPlayer 1, enter your name:\n"
  p1 = gets.chomp
  puts "Player 2, enter your name:\n"
  p2 = gets.chomp
  puts "\nGood luck!\n"

  new_game = Turnloop.new(p1, p2)
  new_game.turn_loop

end

game_init