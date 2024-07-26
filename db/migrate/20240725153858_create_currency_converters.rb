class CreateCurrencyConverters < ActiveRecord::Migration[7.0]
  def change
    create_table :currency_converters do |t|
      t.string :original_curreny
      t.string :target_currency
      t.float :original_amount, precision: 10, scale: 2
      t.float :converted_amount, precision: 10, scale: 2
      t.float :exchange_rate, precision: 10, scale: 2
      t.timestamps
    end
  end
end