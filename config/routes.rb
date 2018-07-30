Rails.application.routes.draw do
  devise_for :users
  resources :projects
  resources :bugs do
    member do
      get :assignme
    end
    member do
      get :markup
    end
  end
  root 'projects#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
