Flood::Application.routes.draw do
  devise_for :logins

  resources :accommodations do
    collection do
      get 'search'
    end
    member do
      put 'taken'
    end
  end

  root :to => "accommodations#new"

  resource :user_session do
    get :create
  end
end
