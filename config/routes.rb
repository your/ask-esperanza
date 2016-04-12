Rails.application.routes.draw do
  resources :quotes, only: [:index, :new, :create] do
    member do
      get 'quotes#vote_up',   to: 'quotes#vote_up',   as: 'vote_up'
      get 'quotes#vote_down', to: 'quotes#vote_down', as: 'vote_down'
    end
  end

  root 'quotes#index'
end
