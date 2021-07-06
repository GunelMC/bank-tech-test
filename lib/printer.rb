class Printer

 def format_row(transaction)
    "#{format_time(transaction.date)} || #{format(transaction.credit)} || #{format(transaction.debit)} || #{transaction.balance}"
  end

  def format_time(date)
    date.strftime('%d/%m/%Y')
  end 

private 

def format(item)
  "#{item}" if item
end 

end