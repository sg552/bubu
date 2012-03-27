Bubu::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :users

  resources :vendors

  resources :sliders

  resources :comments

  resources :images

  resources :specific_items

  resources :generic_items do
    member do
      put :award_score
    end
  end

  resources :categories

  root :to => "generic_items#index"
end
