namespace :currency_rates do
  desc "get fresh currency rates data"
  task update: :environment do
    CurrencyRatesAggregatorService.new.call
  end
end