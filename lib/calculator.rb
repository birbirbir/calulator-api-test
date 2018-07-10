class Calculator
  def push(n)
    @mem ||= []
    @mem << n
  end

  def getFirstNumber
    @firstNumber = @mem[0]
  end

  def getSecondNumber
   @secondNumber = @mem[1]
  end
end