class Question
  attr_reader :num1, :num2
  def initialize
    @num1 = rand(10..255)
    @num2 = rand(10..255)
  end

  def ask_question(player, num1, num2)
    "#{player.name}: what is #{num1.to_s(16).upcase} + #{num2.to_s(16).upcase}?"
  end

end