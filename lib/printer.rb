# frozen_string_literal: true

class Printer
  def format_row(transaction)
    "#{format_time(transaction.date)} || #{format(transaction.credit)}|| #{format(transaction.debit)}|| #{format(transaction.balance)}"
  end

  def format_time(date)
    date.strftime('%d/%m/%Y')
  end

  def format_statement(transaction_history)
    header = "date || credit || debit || balance\n"
    statementRows = transaction_history.reverse.map do |transaction|
      format_row(transaction)
    end

    header + statementRows.join("\n")
  end 

  private

  def format(item)
    sprintf('%.2f ', item) if item
  end
  
end
