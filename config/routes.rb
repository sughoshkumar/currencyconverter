Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  if Rails.env.development?
      get '/', to: proc { [200, {}, ['']] }, constraints: { format: 'json' }
  end
  namespace :api, constraints: { format: 'json' } do

    resources :currency_converters, only: [:index, :create, :show] do
      collection do
          get :fetch_exchangerate
        end
    end
  end

end
