require 'printer'

describe Printer do
  let(:transaction) { double(:transaction, date: "15/03/2021", credit:300, debit: 100, balance: 200) }

  describe '.format_row' do 
    it "formats the transaction row" do
      expect(subject.format_row(transaction)).to eq "15/03/2021 || 300 || 100 || 200"
    end

    it "formats the transaction time" do
      date = Time.new(2021, 03, 15)
      expect(subject.format_time(date)).to eq "15/03/2021"
    end

  end  
end 