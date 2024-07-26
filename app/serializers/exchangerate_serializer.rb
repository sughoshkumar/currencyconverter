class ExchangerateSerializer
  include FastJsonapi::ObjectSerializer
  extend Lp::Serializable

  attributes :id,
             :currency,
             :rate,
             :result,
             :base_code
end