module Api
  class CurrencyConvertersController < ApiController

    def index
        render json: serializable_collection(CurrencyConverter.all, 'CurrencyConverter')
    end

    def create
      @currency_converter = CurrencyConverter.create!(currency_converter_params)
      render json: serializable(@currency_converter), status: :ok
    end

    def show
      @currency_converter = CurrencyConverter.find_by(id: params[:id])
      render json: serializable(@currency_converter)
    end

    def fetch_exchangerate
        exchangerates = exchangerate_search.search
        render json: ExchangerateSerializer.new(exchangerates).serializable_hash.to_json
    end

    private

    def exchangerate_search
      CurrencyApi::ExchangerateSearch.new(currency: params[:currency])
    end

    def currency_converter_params
      @currency_converter_params ||= CurrencyConverterDecanter.decant(params.require(:data))
    end

  end
end
