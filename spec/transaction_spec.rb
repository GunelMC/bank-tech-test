# frozen_string_literal: true

require 'transaction'

describe Transaction do
  let(:date) { Time.now.strftime('%d/%m/%Y') }

  it 'is initialised with a credit of nil' do
    expect(subject.credit).to eq(nil)
  end

  it 'has the credit of 100 when passed credit of 100' do
    transaction = Transaction.new(credit: 100) 
    expect(transaction.credit).to eq(100)
  end 

  describe '.show' do
    it 'shows time of the transaction' do
      expect(subject.show).to eq("#{date} ||  ||  ||  ")
    end

    it 'shows credit in its second column' do
      transaction = Transaction.new(credit: 100) 
      expect(transaction.show).to eq("#{date} || 100 ||  ||  ")
    end

    it 'shows debit in its third column' do
      transaction = Transaction.new(debit: 100) 
      expect(transaction.show).to eq("#{date} ||  || 100 ||  ")
    end

    it 'shows balance in its fourth column' do
      transaction = Transaction.new(balance: 100) 
      expect(transaction.show).to eq("#{date} ||  ||  || 100 ")
    end

  end
end
