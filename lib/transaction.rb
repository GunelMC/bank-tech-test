# frozen_string_literal: true

class Transaction
  attr_reader :date, :credit

  def initialize(date: Time.now, credit: nil, debit:nil)
    @date = date
    @credit = credit
    @debit = debit
  end

  def show
    "#{format_time} || #{format_credit} || #{format_debit} ||  "
  end

  private

  def format_time
    @date.strftime('%d/%m/%Y')
  end 

  def format_credit
    return "#{@credit}" if @credit
  end 

  def format_debit
    return "#{@debit}" if @debit
  end 

end
