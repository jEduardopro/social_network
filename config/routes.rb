Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
	namespace :api do
		namespace :auth do
			post 'register', action: :create, controller: :registers
		end

		namespace :statuses do 
			get 'index', action: :index, controller: :statuses
			post 'create', action: :create, controller: :statuses
		end
	end

end
