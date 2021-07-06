require 'account'

describe 'Account Feature Test' do
  it 'deposit 1000, 2000 then withdraw 500' do
    time1 = Time.new(2012, 0o1, 10, 12)
    time2 = Time.new(2012, 0o1, 13, 12)
    time3 = Time.new(2012, 0o1, 14, 12)

    subject = Account.new

    allow(Time).to receive(:now).and_return(time1)
    subject.deposit(1000)

    allow(Time).to receive(:now).and_return(time2)
    subject.deposit(2000)

    allow(Time).to receive(:now).and_return(time3)
    subject.withdraw(500)

    statement =
      "date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00"

    expect(subject.statement).to eq statement
  end
end
