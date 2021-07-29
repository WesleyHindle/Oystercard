class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journeys
  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @max_balance = 90
    @entry_station = entry_station
    @exit_station = exit_station
    @journeys = {}
  end
  
  def top_up(amount)
    fail "Can't top up balance over 90" unless @balance + amount <= MAX_BALANCE
      @balance += amount
  end  

  def touch_in(entry_station)
    fail "Can't touch in, balance under £1" if @balance < MIN_BALANCE
    @entry_station = entry_station
  end

  def in_journey?  
    !!entry_station #wtf does !! do?
  end

  def touch_out(exit_station)
    deduct(MIN_BALANCE)
    @journeys = {entry_station: entry_station, exit_station: exit_station}
    @entry_station = nil
    @exit_station = exit_station
  end

  private

  def deduct(cost)
    @balance -= cost
  end  
end  

#station = {zone: '1', staton_name: "Charring Cross"}
