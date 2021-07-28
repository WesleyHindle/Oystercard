class Oystercard
  attr_reader :balance, :entry_station
  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @max_balance = 90
    #@in_journey = false 
    @entry_station = entry_station
  end
  
  def top_up(amount)
    fail "Can't top up balance over 90" unless @balance + amount <= MAX_BALANCE
      @balance += amount
  end  

  def touch_in(entry_station)
    fail "Can't touch in, balance under £1" if @balance < MIN_BALANCE
    @entry_station = entry_station
    #@in_journey = true
  end

  def in_journey?  
    !!entry_station #wtf does !! do?
  end

  def touch_out
    deduct(MIN_BALANCE)
    #@in_journey = false
    @entry_station = nil
  end

  private
  def deduct(cost)
    @balance -= cost
  end  

end  