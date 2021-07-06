# frozen_string_literal: true

require 'account'

describe Account do
  let(:transaction_double) { double(:transaction_double, show: nil) }
  let(:transaction_class_double) { double(:transaction_class_double, new: transaction_double ) }

  subject { Account.new(transaction_class_double) }
  
  it 'initializes a new account with balance of 0' do
    # this is testing state rather than behaviour for simplicity
    expect(subject.balance).to eq 0
  end

  it 'initializes a new account with an empty transaction history' do
    # this is testing state rather than behaviour for simplicity
    expect(subject.transaction_history).to eq []
  end

  # second user story
  describe '.deposit' do
    it 'increments the account balance by the amount passed' do
      expect { subject.deposit(100) }.to change { subject.balance }.by(100)
    end

    it 'depositting 100 then 400 changes the balance by 500' do
      subject.deposit(100)
      subject.deposit(400)
      expect(subject.balance).to eq(500)
    end

    it 'calls for a new transaction with the credit amount and resulting balance' do
      expect(transaction_class_double).to receive(:new).with(credit:100, balance: 100)
      subject.deposit(100)
    end
  end

  # third user story
  describe '.withdraw' do
    before(:each) do
      subject.deposit(1000)
    end

    it 'decrements the account balance by the amount passed' do
      expect { subject.withdraw(100) }.to change { subject.balance }.by(-100)
    end

    it 'withdrawing 100 then 200 results in a balance of 700' do
      subject.withdraw(100)
      subject.withdraw(200)
      expect(subject.balance).to eq(700)
    end

    it 'throws an error when there is an insufficient balance' do
      expect { subject.withdraw(2000) }.to raise_error('Insufficient funds')
    end

    it 'calls for a new transaction with the debit amount and resulting balance' do
      expect(transaction_class_double).to receive(:new).with(debit:100, balance: 900)
      subject.withdraw(100)
    end
  end

  describe '.statement' do
    it "calls transaction.show method" do
      subject.deposit(100)
      expect(transaction_double).to receive(:show).exactly(1).time
      subject.statement
    end 

  end

end
