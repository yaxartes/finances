FactoryGirl.define do
  factory :currency_rate do
    currency_from 'USD'
    currency_to 'RUB'
    sequence(:rate_buy) { |n| n }
    sequence(:rate_sell) { |n| n }
  end
end
