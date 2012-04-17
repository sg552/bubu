Bubu::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :users
  resources :users do
    member do
      get :comments
      get :favorites
      get :edit_logo
    end
  end
  resources :favorites

  resources :vendors

  resources :sliders

  resources :comments

  resources :images do
    member do
      [:item, :user].each do |entity|
        put "update_#{entity}_image"
      end
    end
  end

  resources :specific_items

  resources :generic_items do
    collection do
      get :search
      get :search_by_categories_from_side_bar
    end
    member do
      put :award_score
    end
  end

  resources :categories

  root :to => "generic_items#index"
end
