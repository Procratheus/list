Rails.application.routes.draw do
  
  root 'welcome#index'

  namespace :api do 
    resources :users do 
      resources :lists
    end

    resources :lists, only: [] do 
      resources :items, only: [:create]
    end

    resources :items, only: [:destroy]
  end



end
