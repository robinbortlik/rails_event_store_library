Rails.application.routes.draw do
  mount RailsEventStore::Browser => '/res' if Rails.env.development?
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  resources :books, only: [:index, :show] do
    member do
      put :borrow
      put :return
    end
  end

  root "books#index"
end
