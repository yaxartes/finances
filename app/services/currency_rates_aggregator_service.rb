class CurrencyRatesAggregatorService
  def call
    parse_rates.each do |rate|
      CurrencyRate.create(
        currency_from: rate['fromCurrency']['name'],
        currency_to: rate['toCurrency']['name'],
        rate_buy: rate['buy'],
        rate_sell: rate['sell']
      )
    end
  end

  private

  def parse_rates
    uri = URI('https://www.tinkoff.ru/api/v1/currency_rates/')
    response = Net::HTTP.get(uri)
    JSON.parse(response)['payload']['rates'].select do |h|
      (h['category'] == 'DepositPayments') && (h['toCurrency']['name'] == 'RUB')
    end
  end
end