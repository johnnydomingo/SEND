Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  get 'messages/create'
  get 'chat_rooms/index'
  get 'chat_rooms/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :chat_rooms, only: [:index, :show] do
    resources :messages, only: [:create]
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  devise_scope :user do
    root to: "devise/sessions#new"
  end
end
