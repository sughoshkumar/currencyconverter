class CurrencyConverterSerializer
  include FastJsonapi::ObjectSerializer
  extend Lp::Serializable

  attributes :id,
             :original_curreny,
             :target_currency,
             :original_amount,
             :converted_amount,
             :exchange_rate
end