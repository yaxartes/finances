class CurrencyRatesController < ApplicationController
  def index
    @currency_rates = CurrencyRate.period(params[:period])
    [@buy = {},@sell = {}].each do |operation|
      %w(USD EUR).each do |currency|
        operation[currency]  = {}
        @currency_rates.where(currency_from: [currency]).each do |r|
          operation[currency][r.created_at] = operation == @buy ? r.rate_buy :  r.rate_sell
        end
      end
    end
  end
end
