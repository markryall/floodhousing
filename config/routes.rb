Floodhousing::Application.routes.draw do
  devise_for :logins

  get 'home/index'

  match "l/:id/:token" => "accommodations#confirm_my_listing"
  match "faq" => "home#faq"
  match "guidelines" => "home#guidelines"

  get 'thank_you' => 'thank_you#index'

  resources :accommodations do
    collection do
      get :search
      get :unconfirmed
      post :unconfirmed
    end
    member do
      get :edit
      get :confirm_my_listing
      get :contact_host
      put :list
    end
  end

  resources :seekers do
    collection do
      get :interest_registered
    end
  end

  root :to => "home#index"
end