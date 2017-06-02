Rails.application.routes.draw do
  resources :game_configs
  resources :workouts
  resources :weights
  resources :exercises
  resources :bodyparts
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root 'workouts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
