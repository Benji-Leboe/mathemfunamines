class Question
  attr_reader :num1, :num2
  def initialize
    @num1 = rand(10..255)
    @num2 = rand(10..255)
  end

  def ask_question(player)
    "#{player.name}: what is #{@num1.to_s(16).upcase} + #{@num2.to_s(16).upcase}?"
  end

  def check?
    (@num1 + @num2).to_s(16).upcase
  end

  def verify?(response)
    check? == response  
  end

end