Rails.application.routes.draw do
resources :sessions, only: [:new, :create, :destroy]
match '/logout', to: 'sessions#destroy', via: 'delete'

root 'sessions#new'
end
