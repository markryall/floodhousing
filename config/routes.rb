Flood::Application.routes.draw do
  resources :accommodations do
    collection do
      get 'search'
    end
    member do
      get 'disable'
    end
  end

  root :to => "accommodations#new"

  resource :user_session do
    get :create
  end
end
