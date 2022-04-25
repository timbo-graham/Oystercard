class Oystercard

  attr_reader :balance, :MAX_BALANCE, :card_in_use

  MAX_BALANCE = 90

  def initialize

    @balance = 0
    @card_in_use = false

  end

  def top_up(value)

    raise "Error: maximum balance is £90" if @balance + value > MAX_BALANCE
    @balance += value

  end

  def deduct(value)

    @balance -= value

  end

  def touch_in

    @card_in_use = true

  end

  def in_journey?



  end


end