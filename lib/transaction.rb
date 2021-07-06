# frozen_string_literal: true

require_relative './printer'

class Transaction
  attr_reader :date, :credit

  def initialize(date: Time.now, credit: nil, debit: nil, balance: nil, formatter: Printer.new)
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance
    @formatter = formatter
  end

  def show
    @formatter.format_row(self)
  end
end
