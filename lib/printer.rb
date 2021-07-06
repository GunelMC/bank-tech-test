class Printer

 def format_row(transaction)
    "15/03/2021 || #{format(transaction.credit)} || #{format(transaction.debit)} || #{transaction.balance}"
  end

  def format_time(date)
    date.strftime('%d/%m/%Y')
  end 

private 

def format(item)
  "#{item}" if item
end 

end