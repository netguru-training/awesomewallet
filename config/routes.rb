Awesomewallet::Application.routes.draw do
	root to: 'dashboard#index'

	resources :transactions
	match "/auth/:provider/callback" => "sessions#create"
end
