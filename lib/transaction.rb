# frozen_string_literal: true

class Transaction
  attr_reader :date, :credit

  def initialize(date: Time.now, credit: nil)
    @date = date
    @credit = credit
  end

  def show
    "#{format_time} || || ||"
  end

  private

  def format_time
    @date.strftime('%d/%m/%Y')
  end 

end
