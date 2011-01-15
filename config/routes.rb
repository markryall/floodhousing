Flood::Application.routes.draw do
  devise_for :logins

  match "l/:id/:token" => "accommodations#login"

  resources :accommodations do
    collection do
      get 'search'
    end
    member do
      get 'edit'
      put 'taken'
      get 'login'
    end
  end

  root :to => "accommodations#new"

  resource :user_session do
    get :create
  end
end
