Awesomewallet::Application.routes.draw do
	root to: 'dashboard#index'

	resources :transactions
end
