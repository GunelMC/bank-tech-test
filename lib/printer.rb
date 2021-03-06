# frozen_string_literal: true

class Printer
  STATEMENT_HEADER = "date || credit || debit || balance\n"
  def format_row(transaction)
    "#{format_time(transaction.date)} || #{format(transaction.credit)}|| #{format(transaction.debit)}|| #{format_balance(transaction.balance)}"
  end

  def format_time(date)
    date.strftime('%d/%m/%Y')
  end

  def format_statement(transaction_history)
    statementRows = transaction_history.sort_by(&:date).reverse.map do |transaction|
      format_row(transaction)
    end

    puts STATEMENT_HEADER + statementRows.join("\n")
  end 

  private

  def format(item)
    sprintf('%.2f ', item) if item
  end

  def format_balance(item)
    sprintf('%.2f', item) if item
  end
  
end
