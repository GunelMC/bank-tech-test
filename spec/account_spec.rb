require 'account'

describe Account do
  it 'initializes a new account with balance of 0' do
    expect(subject.balance).to eq 0 # this is testing state rather than behaviour but for the sake of simplicity/test progression we are starting slow
  end
end 