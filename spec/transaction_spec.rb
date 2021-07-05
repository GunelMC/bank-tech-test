# frozen_string_literal: true

require 'transaction'

describe Transaction do
  let(:date) { Time.now.strftime('%d/%m/%Y') }

  describe '.show' do
    it 'knows the time of the transaction' do
      expect(subject.show).to eq(date)
    end
  end
end
