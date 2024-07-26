module CurrencyApi
  class ExchangerateSearch
    ROOT_URL = 'https://open.er-api.com/v6/latest/'.freeze

    attr_reader :currency

    def initialize(currency:)
      @currency = currency
    end

    def search
      response = get

      raise StandardError, 'There was an issue searching. Please try again or try a different search.' unless response.success?

      wrap_response(JSON.parse(response.body))
    end

    private

    def get
      HTTParty.get(url)
    end

    def url
      [ROOT_URL, currency].join
    end

    def wrap_response(response)
      response['rates'].map.with_index do |(currency, rate), index|
        OpenStruct.new(id: index+1000, currency: currency, rate: rate, result: response['result'], base_code: response['base_code'] )
      end.compact
    end
  end
end
