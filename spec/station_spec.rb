require "/Users/Student/Projects/oystercard/lib/station.rb"

describe Station do 

  describe "#initialize" do
    let(:station){Station.new("Charring Cross", "B")}

    it "returns the zone a station is in" do 
      expect(station.zone).to eq "B"
    end

    it "returns the name of a zone" do 
      expect(station.station).to eq "Charring Cross"
    end
  end 




end