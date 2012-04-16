Bubu::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :users
  resources :users do
    member do
      get :comments
      get :favorites
    end
  end
  resources :favorites

  resources :vendors

  resources :sliders

  resources :comments

  resources :images

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
