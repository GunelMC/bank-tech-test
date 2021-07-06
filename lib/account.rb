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
    @transaction_history.unshift(@transaction_class.new(credit: amount, balance: @balance))
    "#{amount} is deposited. Current balance: #{@balance}"
  end

  def withdraw(amount)
    raise 'Insufficient funds' if @balance < amount

    @balance -= amount
    @transaction_history.unshift(@transaction_class.new(debit: amount, balance: @balance))
    "#{amount} is withdrawn. Current balance: #{@balance}"
  end

  def statement
    @formatter.format_statement(@transaction_history)
  end
end
