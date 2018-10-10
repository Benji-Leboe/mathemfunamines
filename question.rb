class Question

  def ask_question(player)
    (num1 = rand(10..255))
    (num2 = rand(10..255))
    @check = (num1 + num2).to_s(16)
    puts "#{player.name}: what is #{num1.to_s(16)} + #{num2.to_s(16)}?"
    @answer = gets.chomp
  end

  def check_answer?
    @answer == @check
  end

  def correct_answer(player)
    puts "You got it, #{player.name}!"
  end

  def incorrect_answer(player)
    puts "The answer was #{@check}. You might need to go back to school, #{player.name}..."
  end
end