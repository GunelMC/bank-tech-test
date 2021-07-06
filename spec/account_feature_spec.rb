# frozen_string_literal: true

require 'account'

describe 'Account Feature Test' do
  it 'prints details of transactions in reversed chronological order' do
    time_one = Time.new(2012, 0o1, 10, 12)
    time_two = Time.new(2012, 0o1, 13, 12)
    time_three = Time.new(2012, 0o1, 14, 12)

    subject = Account.new

    allow(Time).to receive(:now).and_return(time_one)
    subject.deposit(1000)

    allow(Time).to receive(:now).and_return(time_two)
    subject.deposit(2000)

    allow(Time).to receive(:now).and_return(time_three)
    subject.withdraw(500)

    statement =
"date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00"

    expect{ subject.statement }.to output(/#{statement}/m).to_stdout
  end
  
end
