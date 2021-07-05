# frozen_string_literal: true

require 'account'

describe Account do
  it 'initializes a new account with balance of 0' do
    # this is testing state rather than behaviour for simplicity
    expect(subject.balance).to eq 0
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
    
  end
end
