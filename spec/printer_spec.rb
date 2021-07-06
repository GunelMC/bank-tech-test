require 'printer'

describe Printer do
  let(:transaction) { double(:transaction, date: "15/03/2021", credit:300, debit: 100, balance: 200) }

  describe '.format_row' do 
    it "formats the transaction row" do
      expect(subject.format_row(transaction)).to eq "15/03/2021 || 300 || 100 || 200"
    end
  end  
end 