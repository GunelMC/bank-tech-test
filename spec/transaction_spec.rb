# frozen_string_literal: true

require 'transaction'

describe Transaction do
  let(:printer_double) { double(:printer_double, format_row: nil) }
  let(:date) { Time.now.strftime('%d/%m/%Y') }
  subject(:transaction) { described_class.new(formatter: printer_double) }

  it 'is initialised with a credit of nil' do
    expect(subject.credit).to eq(nil)
  end

  it 'has the credit of 100 when passed credit of 100' do
    transaction = Transaction.new(credit: 100)
    expect(transaction.credit).to eq(100)
  end

  it 'is initialised with Time.now as the default date value' do
    allow(Time).to receive(:now).and_return(date)
    expect(subject.date).to eq(date)
  end

  describe '.show' do
    it 'calls formatter.format_row' do
      expect(printer_double).to receive(:format_row).with(transaction)
      transaction.show
    end
  end
end
