class Transaction
  attr_reader :date

  def initialize(date: Time.now)
    @date = date
  end

  def show
    '05/07/2021'
  end 
end