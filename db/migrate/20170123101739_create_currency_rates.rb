class CreateCurrencyRates < ActiveRecord::Migration[5.0]
  def change
    create_table :currency_rates do |t|
      t.string :currency_from
      t.string :currency_to
      t.float  :rate_buy
      t.float  :rate_sell
      t.timestamps
    end

    add_index :currency_rates, :currency_from
    add_index :currency_rates, :currency_to
  end
end
