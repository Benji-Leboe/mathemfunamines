require_relative "player"
require_relative "game"
require_relative "question"

class Gameloop

  def initialize(player1 = "Player 1", player2 = "Player 2")

    @player1 = Player.new(player1)
    @player2 = Player.new(player2)
    @game = Game.new
    @turn = 0
    
  end
  
  def new_turn
    @turn += 1
    puts @game.new_turn_msg(@player1, @player2)
  end

  def answer?
    gets.chomp.upcase
  end

  def check_answer?(num1, num2)
    (num1 + num2).to_s(16).upcase
  end

  def verify?(check, response)
    check == response
  end

  def init_game

    def pick_player(player1, player2)
      first_player = (rand(0..1) < 1) ? player1 : player2
    
      next_player = (first_player == player1) ? player2 : player1

      puts "#{first_player.name} is going first. Better luck next time, #{next_player.name}!\n"  
      
      first_player
    end

    current_player = pick_player(@player1, @player2)

    while current_player.alive? do
      q = Question.new

      new_turn

      check = check_answer?(q.num1, q.num2)

      puts q.ask_question(current_player, q.num1, q.num2)

      response = answer?

      verify?(check, response) ? 
        (puts @game.correct_answer(current_player)) :
        (puts @game.incorrect_answer(check, current_player); current_player.lose_life)

      current_player = current_player == @player1 ? @player2 : @player1
    end

    unless current_player.alive?
      puts @game.game_over_msg(@player1, @player2)
    end

  end

end

def game_init

  puts "\nPlayer 1, enter your name:\n"
  p1 = gets.chomp
  puts "Player 2, enter your name:\n"
  p2 = gets.chomp
  puts "\nGood luck!\n"

  new_game = Gameloop.new(p1, p2)
  new_game.init_game

end

game_init