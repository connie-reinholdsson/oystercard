require 'journey'

describe Journey do
subject(:journey) { described_class.new }
let (:station) { double(:station) }

  describe "#Initialize" do
    it 'initializes with an empty array' do
      expect(journey.current_journey).to be_empty
    end
  end

  describe "#start_journey" do
  it "records the entry station" do
    journey.start_journey(station)
    expect(journey.current_journey).to eq [station]
    end
  end

  describe "#end_journey" do
    it "records the exit station" do
      journey.start_journey(station)
      journey.end_journey(station)
      expect(journey.current_journey).to eq [station, station]
    end
  end

  describe '#complete?' do
    it 'checks whether the passenger has touched out on exit' do
      journey.start_journey(station)
      journey.end_journey(station)
      expect(journey.complete?).to eq true
    end
  end

  describe '#penalty_charge' do
    it 'subtracts money from the balance' do
      card = double(:card)
      expect(card).to receive(:deduct).with(described_class::PENALTY_CHARGE)
      journey.penalty_charge(card)
    end

  end
end
