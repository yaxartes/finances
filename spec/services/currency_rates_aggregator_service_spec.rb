require 'spec_helper'

describe CurrencyRatesAggregatorService do
  subject { CurrencyRatesAggregatorService.new }

  before do
    subject.call
  end

  context 'currency_to is RUB' do
    it { expect(CurrencyRate.where(currency_to: 'RUB')).not_to be_empty }
  end

  context 'currency_to is not RUB' do
    it { expect(CurrencyRate.where(currency_to: 'USD')).to be_empty }
  end
end