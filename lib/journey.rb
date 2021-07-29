class Journey
    PENALTY_FARE = 6
    def initialize(entry_station = nil)
      @entry_station = entry_station
      @other_station = nil
    end
  def complete?
# statement that say entry station(true) adn exit station(false) are completed?
    if @entry_station != nil && @other_station == nil
      true
    else
      false
    end
  end
  def fare
    #if the journey is complete charege me the right fare, otherwise charge me the penalty PENALTY_FARE
    if complete? == true
    
       fare = 1
    else 
        PENALTY_FARE
    end
  end
  def finish (endstation = nil)
    # collect the end station and return self
    @other_station = endstation
    p self
    return self
  end
end