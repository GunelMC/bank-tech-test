require 'transaction'

describe Transaction do
  describe '#initialize' do
    let(:date)  { Time.new(2021, 06, 05) } 
    subject(:transaction) { described_class.new(date: date) }
    
    it 'is initialized with a date' do
      expect(transaction.date).to eq(date)
    end 
  end 
end 