Rails.application.routes.draw do
  resources :chatrooms, only: [:index, :show] do
    resources :messages, only: [:create]
  end
end
