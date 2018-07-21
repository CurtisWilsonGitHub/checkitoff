Rails.application.routes.draw do


  get 'users/show'

  devise_for :users
  get 'welcome/index'

  get 'welcome/about'

  resources :users do
    resources :items
  end

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
