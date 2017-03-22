
class Journey

  PENALTY_CHARGE = 6

  attr_reader :current_journey

  def initialize
    @current_journey = []
  end

  def start_journey(card, entry_station)
    penalty_charge(card)
    current_journey.push(entry_station)
  end

  def end_journey(exit_station)
    current_journey.push(exit_station)
  end

  def complete?
    current_journey.count == 2
  end

  def penalty_charge(card)
    card.deduct(PENALTY_CHARGE) if card.in_journey?
  end

end
