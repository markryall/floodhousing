Flood::Application.routes.draw do
  devise_for :logins

  match "l/:id/:token" => "accommodations#login"

  resource :thank_you

  resources :accommodations do
    collection do
      get :search
    end
    member do
      get :edit
      get :login
      get :contact_host
      put :list
    end
  end
  
  resources :seekers do
    collection do 
      get :interest_registered
    end
  end

  root :to => "accommodations#new"

  resource :user_session do
    get :create
  end
end
