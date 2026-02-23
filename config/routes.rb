Rails.application.routes.draw do
  root "rooms#search"

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resource :profile, only: [:show, :edit, :update]
  resource :account, only: [:show, :edit, :update]

  resources :rooms do
    collection do
      get :search
    end

    resource :favorite, only: [:create, :destroy]
  end

  resources :favorites, only: [:index]

  resources :reservations do
    post :confirm, on: :collection
  end

  resources :facilities, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :schedules
end
