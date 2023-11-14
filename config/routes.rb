Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
	namespace :api do
		namespace :auth do
			post 'register', action: :create, controller: :registers
			post 'sign_in', action: :sign_in, controller: :logins
		end

		namespace :statuses do 
			get '/', action: :index, controller: :statuses
			post 'create', action: :create, controller: :statuses
			post ':id/likes', action: :create, controller: :status_likes
		end
	end

end
