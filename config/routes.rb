Rails.application.routes.draw do
  devise_for :users

  resources :users do
      resources :applications
    end

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
