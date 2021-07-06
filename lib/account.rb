# frozen_string_literal: true

class Account
  attr_reader :balance, :transaction_history

  def initialize(transaction_class = Transaction)
    @balance = 0
    @transaction_class = transaction_class
    @transaction_history = []
  end

  def deposit(amount)
    @balance += amount
    @transaction_history.unshift(@transaction_class.new(credit: amount, balance: @balance))
  end

  def withdraw(amount)
    raise 'Insufficient funds' if @balance < amount

    @balance -= amount
    @transaction_history.unshift(@transaction_class.new(debit: amount, balance: @balance))
  end

  def statement
    @transaction_history.map do |transaction|
      transaction.show
    end 
  end
end
