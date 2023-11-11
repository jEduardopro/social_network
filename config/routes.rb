Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
	
	namespace :api do
		namespace :statuses do 
			post 'create', action: :create, controller: :statuses
		end
	end

end
