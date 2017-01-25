class CurrencyRate < ApplicationRecord
  scope :period, ->(value) do
    case value
      when '6 hours'
        CurrencyRate.where(created_at: Time.now - 6.hour..Time.now)
      when 'day'
        CurrencyRate.where(created_at: Time.now - 24.hour..Time.now)
      when 'week'
        CurrencyRate.where(created_at: Time.now - 1.week..Time.now)
      else
        CurrencyRate.all
    end
  end
end
