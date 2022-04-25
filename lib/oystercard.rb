class Oystercard

  attr_reader :balance, :MAX_BALANCE, :card_in_use, :MIN_BALANCE

  MAX_BALANCE = 90
  MIN_BALANCE = 1 

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

    raise "Touch in failure: Minimum balance £1" if @balance < MIN_BALANCE
    @card_in_use = true

  end

  def in_journey?

    if @card_in_use == true
      true
    else
      false

    end

  end

  def touch_out

    @card_in_use = false

  end


end