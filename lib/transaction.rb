# frozen_string_literal: true

class Transaction
  attr_reader :date, :credit

  def initialize(date: Time.now, credit: nil, debit:nil, balance:nil)
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance
  end

  def show
    "#{format_time} || #{format(@credit)} || #{format(@debit)} || #{@balance} "
  end

  private

  def format(item)
    "#{item}" if item
  end 

  def format_time
    @date.strftime('%d/%m/%Y')
  end 

end
