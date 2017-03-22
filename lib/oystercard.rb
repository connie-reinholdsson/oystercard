require_relative 'station'
require_relative 'journey'

#Card used for TFL travel
class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_CHARGE = 1

  attr_reader :balance, :in_journey, :entry_station, :journey

  def initialize
    @balance = 0
    @journey_history = []
  end

  def top_up(amount)
    fail "Top up unsuccessful: Balance cannot exceed £#{MAXIMUM_BALANCE}." if balance + amount > MAXIMUM_BALANCE
    self.balance += amount
  end

  def in_journey?
    !!entry_station # Is entry_station true, i.e. does it exist? Reason we do this, is to ensure we cannot touch_out
    #unless we've touched_in.
  end

  def touch_in(station)
    fail "Insufficient funds: Please top-up." if insufficient_funds?
    # self.balance -= PENALTY_CHARGE if in_journey?
    @entry_station = station
    @journey = Journey.new
    journey.start_journey(station)
  end

  def touch_out(station)
    deduct(MINIMUM_CHARGE)
    @entry_station = nil
    journey.end_journey(station)
  end

  def deduct(amount)
    self.balance -= amount
  end

  private
  attr_writer :in_journey, :balance


  def insufficient_funds?
    true if balance < MINIMUM_BALANCE
  end
end
