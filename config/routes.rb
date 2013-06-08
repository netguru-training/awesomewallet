Awesomewallet::Application.routes.draw do
  root to: 'dashboard#index'
  resources :transactions
  match '/auth/:provider/callback', to: 'sessions#create'
  match '/logout', to: 'sessions#destroy'
end
