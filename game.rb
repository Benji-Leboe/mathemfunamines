class Game
  def new_turn_msg(player1, player2)
    new_turn_msg = "P1: #{player1.name} vs P2: #{player2.name}
                    \n--- #{player1.lives} lives vs. #{player2.lives} lives ---\n"
    puts "#{new_turn_msg}\n----- NEW TURN -----\n"
  end

  def game_over_msg(player1, player2)
    winner = player1 > 0 ? 
    "Player 1 wins with a score of #{player1.lives}/3\n" : 
    "Player 2 wins with a score of #{player2.lives}/3\n"

    puts "#{winner}\n----- GAME OVER -----\nGoodbye!"
  end

end