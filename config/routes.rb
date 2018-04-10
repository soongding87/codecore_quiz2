Rails.application.routes.draw do
  namespace :admin do

    resources :dashboard, only: [:index]

  end
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:create, :new]

  resources :ideas, shallow: true do
    resources :reviews, only: [ :create, :destroy ]
  end

  get '/',  to: 'ideas#index', as: 'home'

end
