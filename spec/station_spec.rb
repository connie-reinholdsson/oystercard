require 'station'


describe Station do
  subject(:station) { described_class.new("Aldgate", 1) }
  #Means that we need to initalize with at least 1 variable

  it 'has a name' do
    expect(station.name).to eq "Aldgate"
  end
  
  it 'has a zone' do
    expect(station.zone).to eq 1
  end

end
