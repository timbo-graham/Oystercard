require 'oystercard'

describe Oystercard do
  it 'can show a balance' do

    expect(subject.balance).to eq 0

    
    # User story 1
    # In order to use public transport
    # As a customer
    # I want money on my card

  end

  it "can top up the card balance" do
    
    # User story 2
    # In order to keep using public transport
    # As a customer
    # I want to add money to my card

    subject.top_up(10)

    expect(subject.balance).to eq 10

  end

end