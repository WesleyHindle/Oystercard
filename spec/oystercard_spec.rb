require "/Users/Student/Projects/oystercard/lib/oystercard.rb"

describe Oystercard do
  
  describe "#initialize" do
    it "initalizes with a balance of 0" do
      expect(subject.balance).to eql 0
    end

    it 'has an empty list of journeys by default' do 
      expect(subject.journeys).to be_empty
    end 
  end

  describe "#top_up" do
    it "tops up card with amount requested/passed in as argument" do
      expect {subject.top_up 5 }.to change {subject.balance}.by 5
    end

    it "throws an error when top up takes balance over 90" do
      subject.top_up(Oystercard::MAX_BALANCE)
      expect{subject.top_up(1)}.to raise_error("Can't top up balance over 90")
    end  
  end

 
  describe "#deduct" do  #This test is now the same as the 'expects the balance to change according to the fare when you touch out'    test
    it 'deducts value spent from the balance' do 
      subject.top_up(1) #How can I DRY this out?
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect { subject.touch_out(exit_station) }.to change {subject.balance}.by (-Oystercard::MIN_BALANCE)
    end
  end

  describe "#touch_in" do 
    let(:station){ double :station }

    it 'states whether the user has "touched in" or not.' do 
      subject.top_up(1)
      expect(subject.touch_in(station)).to be_truthy
    end  

    it 'allows the user to "touch_in" if there is at least £1 balance' do
      subject.top_up(0.5)
      expect{subject.touch_in(station)}.to raise_error("Can't touch in, balance under £1")
    end 

    it 'stores the entry station' do
      subject.top_up(2)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end
  end

  describe "#touch_out" do 
  let(:exit_station) { double :exit_station }

    it 'states whether the user has "touched out" or not.' do 
      expect(subject.touch_out(exit_station)).to be_truthy
    end 
  end 

  describe "#in_journey?" do 
    it 'states if the user is "in journey" or not. ' do  
      subject.top_up(1)
      subject.touch_in("charring cross")
      expect(subject.in_journey?).to be_truthy
    end
  end 
  
  describe "#top_up" do 
    it 'expects the balance to change according to the fare when you touch out' do 
      subject.top_up(1)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect{ subject.touch_out(exit_station) }.to change {subject.balance }.by (-Oystercard::MIN_BALANCE) #subject.touch_out calls the deduct method which affects the @balance. There is no method called .method we can use expect on.
    end 
  end
 
  let(:entry_station){ double :entry_station }
  let(:exit_station) { double :exit_station }

  it 'stores exit station' do
    subject.top_up(1)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.touch_out(exit_station)).to eq exit_station
  end

  let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

  it 'stores a journey' do
    subject.top_up(1)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.journeys).to include journey
  end

end