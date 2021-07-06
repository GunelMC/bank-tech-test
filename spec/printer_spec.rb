# frozen_string_literal: true

require 'printer'

describe Printer do
  let(:transaction) { double(:transaction, date: Time.new(2021, 0o3, 15), credit: 300, debit: 100, balance: 200) }

  let(:transaction1) do
    double(:transaction_1, date: Time.new(2012, 0o1, 10), credit: 1000.00, debit: nil, balance: 1000.00)
  end
  let(:transaction2) do
    double(:transaction_2, date: Time.new(2012, 0o1, 13), credit: 2000.00, debit: nil, balance: 3000)
  end
  let(:transaction3) { double(:transaction_3, date: Time.new(2012, 0o1, 14), credit: nil, debit: 500, balance: 2500) }

  describe '.format_row' do
    it 'formats the transaction row' do
      expect(subject.format_row(transaction)).to eq '15/03/2021 || 300.00 || 100.00 || 200.00'
    end

    it 'formats the transaction time' do
      expect(subject.format_time(transaction.date)).to eq '15/03/2021'
    end
  end

  describe '.format_statement' do
    it 'formats the account statement' do
      transaction_history = [transaction1, transaction2, transaction3]

      statement =
        "date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00"

      expect{ subject.format_statement(transaction_history)}.to output(/#{statement}/m).to_stdout
    end
  end
end
