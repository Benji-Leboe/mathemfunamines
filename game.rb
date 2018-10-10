class Game

  def new_turn_msg(player1, player2)

    new_turn_msg = 
      "P1: #{player1.name} vs P2: #{player2.name}
      \n--- #{player1.lives} lives vs. #{player2.lives} lives ---\n"

    "#{new_turn_msg}\n-------- NEW TURN --------\n"

  end

  def correct_answer(player)
    "\nYou got it, #{player.name}!\n"
  end

  def incorrect_answer(check, player)
    "\nThe answer was #{check}. You might need to go back to school, #{player.name}...\n"
  end

  def game_over_msg(player1, player2)
    tie = !player1.alive? && !player2.alive?

    winner = player1.alive? ? 
    "\nPlayer 1 wins with a score of #{player1.lives}/3\n" : 
    "\nPlayer 2 wins with a score of #{player2.lives}/3\n"

    result = tie ? "\nIt was a draw. You both need to study more.\n" :
    "#{winner}"

    "#{result}\n-------- GAME OVER --------\nGoodbye!"
  end

end