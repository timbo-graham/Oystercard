class Oystercard

  attr_reader :balance
  attr_reader :MAX_BALANCE

  MAX_BALANCE = 90

  def initialize

    @balance = 0

  end

  def top_up(value)

    raise "Error: maximum balance is £90" if @balance + value > MAX_BALANCE
    @balance += value

  end

  def deduct(value)

    @balance -= value

  end


end