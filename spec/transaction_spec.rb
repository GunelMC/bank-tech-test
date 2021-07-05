# frozen_string_literal: true

require 'transaction'

describe Transaction do
  let(:date) { Time.now.strftime('%d/%m/%Y') }

  it 'is initialised with a credit of nil' do
    expect(subject.credit).to eq(nil)
  end

  describe '.show' do
    it 'knows the time of the transaction' do
      expect(subject.show).to eq(date)
    end
  end
end
