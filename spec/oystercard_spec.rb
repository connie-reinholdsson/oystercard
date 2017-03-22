require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  #let(:entry_station) { double :entry_station }
  describe '#initialze' do
    it 'has balance of zero' do
      expect(oystercard.balance).to eq(0)
    end
    it "checks there is an instance variable journey_history" do
      expect(oystercard.journey_history).to eq []
    end
  end

  describe '#top_up' do
    it 'adds to balance' do
      expect{ oystercard.top_up 20}.to change{ oystercard.balance }.by 20
    end

    it 'raises error if limit exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      oystercard.top_up(maximum_balance)
      expect{ oystercard.top_up 1 }.to raise_error "Top up unsuccessful: Balance cannot exceed £#{maximum_balance}."
    end
  end

  describe '#not in_journey' do
    it 'initially' do
      expect(oystercard).not_to be_in_journey
    end
  end

  describe '#touch_in' do
    it "takes entry station" do
      expect(oystercard).to respond_to(:touch_in).with(1).argument
    end

    it "stores entry station" do
      oystercard.top_up(5)
      oystercard.touch_in(entry_station)
      expect(oystercard.entry_station).to eq entry_station
    end

    it "checks that station gets stored in journey history" do
      oystercard.top_up(5)
      oystercard.touch_in(entry_station)
      expect(oystercard.journey_history).to eq [{entry_station: entry_station }]
    end

    it 'changes in_journey? to true' do
      oystercard.top_up(5)
      oystercard.touch_in(entry_station)
      expect(oystercard).to be_in_journey
    end

    it "raises error if below minimum balance" do
      expect{oystercard.touch_in(entry_station)}.to raise_error "Insufficient funds: Please top-up."
    end
  end

  describe '#touch_out' do
    it 'changes in_journey? to false' do
      oystercard.top_up(5)
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      expect(oystercard).not_to be_in_journey
    end

    it "checks that station gets stored in journey history" do
      oystercard.top_up(5)
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      expect(oystercard.journey_history).to eq [{entry_station: entry_station, exit_station: exit_station}]
    end

    it "deducts fare" do
      oystercard.top_up(Oystercard::MINIMUM_BALANCE)
      oystercard.touch_in(entry_station)
      expect{oystercard.touch_out(exit_station)}.to change {oystercard.balance}.by -Oystercard::MINIMUM_CHARGE
    end
  end
end
