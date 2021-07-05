require 'transaction'

describe Transaction do
  let(:date)  { Time.now.strftime('%d/%m/%Y') } 
  subject(:transaction) { described_class.new(date: date) }

  describe '.show' do
    it 'knows the time of the transaction' do
      expect(transaction.show).to eq("#{date}")
    end
  end
end 