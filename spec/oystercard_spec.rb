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

      expect { subject.deduct 1 }.to change { subject.balance }.by -1

    end

  end

end