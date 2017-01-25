require 'spec_helper'

describe CurrencyRate do
  describe 'period' do
    let!(:currency_rate_usd) { create :currency_rate, currency_from: 'USD', created_at: Time.now }
    let!(:currency_rate_eur) { create :currency_rate, currency_from: 'EUR', created_at: Time.now - 10.hour }
    let!(:currency_rate_gbp) { create :currency_rate, currency_from: 'GBP', created_at: Time.now - 2.day }

    context 'period is 6 hours' do
      it { expect(CurrencyRate.period('6 hours')).to match_array [currency_rate_usd] }
    end

    context 'period is a day' do
      it { expect(CurrencyRate.period('day')).to match_array [currency_rate_usd, currency_rate_eur] }
    end

    context 'period is a week' do
      it { expect(CurrencyRate.period('week')).to match_array [currency_rate_usd, currency_rate_eur, currency_rate_gbp] }
    end
  end
end