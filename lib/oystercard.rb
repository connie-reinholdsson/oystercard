#Card used for TFL travel
class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_CHARGE = 1

  attr_reader :balance, :in_journey, :entry_station, :journey_history

  def initialize
    @balance = 0
    @journey_history = []
  end

  def top_up(amount)
    fail "Top up unsuccessful: Balance cannot exceed £#{MAXIMUM_BALANCE}." if balance + amount > MAXIMUM_BALANCE
    self.balance += amount
  end

  def in_journey?
    entry_station # Is entry_station true, i.e. does it exist? Reason we do this, is to ensure we cannot touch_out
    #unless we've touched_in.
  end

  def touch_in(station)
    fail "Insufficient funds: Please top-up." if insufficient_funds?
    @entry_station = station
    journey_history.push({entry_station: station})
  end

  def touch_out(station)
    deduct(MINIMUM_CHARGE)
    @entry_station = nil
    journey_history[-1][:exit_station] = station
  end

  private
  attr_writer :in_journey, :balance

  def deduct(amount)
    self.balance -= amount
  end

  def insufficient_funds?
    true if balance < MINIMUM_BALANCE
  end
end
