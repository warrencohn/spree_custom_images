Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :api do
  	namespace :v1 do
  		resources :images
  	end
  end
end
