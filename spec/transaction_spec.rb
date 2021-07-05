require 'transaction'

describe Transaction do
  let(:date)  { Time.new(2021, 06, 05) } 
  subject(:transaction) { described_class.new(date: date) }

  describe '.show' do
    it 'knows the time of the transaction' do
      expect(transaction.show).to eq('05/06/2021')
    end
  end
end 