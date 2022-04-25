require 'oystercard'

describe Oystercard do

  it 'can show a balance' do

    expect(subject.balance).to eq 0

    
    # User story 1
    # In order to use public transport
    # As a customer
    # I want money on my card

  end

  describe '#top_up' do
   
    # User story 2
    # In order to keep using public transport
    # As a customer
    # I want to add money to my card

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect { subject.top_up 1 }.to change { subject.balance }.by 1
    end

    it "raises an error when trying to top up above £90" do

      expect { subject.top_up(Oystercard::MAX_BALANCE + 1) }.to raise_error "Error: maximum balance is £#{Oystercard::MAX_BALANCE}"

    end
    
  end

  describe '#deduct' do
    
    it "deducts fare from balance when used" do
      
      subject.top_up(50)

      expect { subject.touch_out }.to change { subject.balance }.by -1

    end

  end

  it 'refuses touch in when balance below minimum' do

    subject.top_up(Oystercard::MIN_BALANCE - 1)
    expect { subject.touch_in }.to raise_error "Touch in failure: Minimum balance £#{Oystercard::MIN_BALANCE}"

  end

  describe 'journey status' do
    
    before(:each) { subject.top_up(90) }

    it "Can touch in" do
      
      expect { subject.touch_in }.to change { subject.card_in_use }.to eq true

      # expect(subject.card_in_use).to be_in_journey

    end

    it "Can touch out" do
      
      subject.touch_in
      expect { subject.touch_out }.to change { subject.card_in_use }.to eq false

    end

    it "Deducts fare on touch out" do
      
      expect { subject.touch_out }.to change { subject.balance }.by(-Oystercard::MIN_BALANCE)

    end

    it 'Can check if card is in journey' do

      subject.touch_in
      expect( subject.in_journey? ).to eq true

    end

    it 'Can check if card is NOT in journey' do
      
      expect(subject.in_journey?).to eq false

    end

  end


end