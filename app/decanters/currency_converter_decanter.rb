class CurrencyConverterDecanter < Decanter::Base
  input :id, :integer
  input :original_curreny, :string
  input :target_currency, :string
  input :original_amount, :float
  input :converted_amount, :float
  input :exchange_rate, :float

end
