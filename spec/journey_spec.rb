require 'journey'
describe Journey do
  #let(:station) { double :station, zone: 1}

  it "knows if a journey is not complete" do
    newjourney = Journey.new("Charring Cross")
    expect(newjourney.complete?).to eq(true)
  end

  it 'has a penalty fare by default' do
    newjourney = Journey.new("Charring Cross")
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end
  
  it "returns itself when exiting a journey" do
    finishstation = Journey.new("Kings Cross")
    expect(subject.finish(finishstation)).to eq(subject)
  end

  end