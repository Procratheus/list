Rails.application.routes.draw do
  
  root 'welcome#index'

  namespace :api do 
    resources :users
  end

end
