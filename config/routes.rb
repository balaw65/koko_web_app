Rails.application.routes.draw do
  get 'level1_lesson1/new'
  get 'l1l1' => 'level1_lesson1#new'
  post 'level1_lesson1/edit'

 
  get 'level1_lesson1/show'
  get 'level1_lesson1/edit'
  get 'level1_lesson1/delete'
  get 'students/new'
  get 'students/create'
  get 'students/edit'
  get 'students/destroy'
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  get 'users/new'
  get 'users/welcome'
  get 'users/index'
 
  post 'users' => 'users#create'
  get 'users' => 'users#index'

  get 'static_pages/home'
  get 'static_pages/about'
 
  get 'scheduler/show'
  get 'scheduler/new'
  get 'scheduler/timezone'
  get 'scheduler/calendar'
  get 'scheduler/day'
  post 'schedulers' => 'scheduler#timezone'
  post 'scheduler/day'

  get 'signup' => 'users#new'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
 
  resources :users
  resources :students
  resources :schedulers
  resources :sessions
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]


 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "static_pages#home"

end
