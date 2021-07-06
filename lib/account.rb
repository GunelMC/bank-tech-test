# frozen_string_literal: true

require_relative './printer'
require_relative './transaction'

class Account
  attr_reader :balance, :transaction_history

  def initialize(transaction_class = Transaction, formatter = Printer.new)
    @balance = 0
    @transaction_class = transaction_class
    @transaction_history = []
    @formatter = formatter
  end

  def deposit(amount)
    @balance += amount
    add_deposit_transaction(credit:amount, balance: @balance)
    print_deposit_message(amount, @balance)
  end

  def withdraw(amount)
    raise 'Insufficient funds' if @balance < amount

    @balance -= amount
    add_withdraw_transaction(debit: amount, balance: @balance)
    print_withdraw_message(amount, @balance)
  end

  def statement
    @formatter.format_statement(@transaction_history)
  end

  private

  def add_deposit_transaction(credit: nil, balance: nil) 
    @transaction_history.unshift(@transaction_class.new(credit: credit, balance: balance))
  end

  def add_withdraw_transaction(debit: nil, balance: nil) 
    @transaction_history.unshift(@transaction_class.new(debit: debit, balance: balance))
  end 

  def print_deposit_message(amount, balance)
    "#{amount} is deposited. Current balance: #{@balance}"
  end
  
  def print_withdraw_message(amount, balance)
  "#{amount} is withdrawn. Current balance: #{@balance}"
  end
end
