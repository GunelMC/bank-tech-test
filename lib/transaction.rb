# frozen_string_literal: true

class Transaction
  attr_reader :date

  def initialize(date: Time.now)
    @date = date
  end

  def show
    format_time
  end

  private

  def format_time
    @date.strftime('%d/%m/%Y')
  end 

end
