Bubu::Application.routes.draw do
  resources :images

  resources :specific_items

  resources :generic_items

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users

  resources :categories

  root :to => "generic_items#index"
  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
