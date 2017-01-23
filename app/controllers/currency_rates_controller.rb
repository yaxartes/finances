class CurrencyRatesController < ApplicationController
  def index
    @currency_rates = CurrencyRate.where(currency_from: ['USD', 'EUR'])
  end
end
