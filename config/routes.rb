Rails.application.routes.draw do
  get 'l1_l1_questions/new'
  get 'l1_l1_questions/edit'
  get 'l1_l1_questions/show'
  post 'l1_l1_questions/edit'

  get 'l1_l2_questions/new'
  get 'l1_l2_questions/show'
  get 'l1_l2_questions/edit'
  post 'l1_l2_questions/edit'

  get 'l1_l3_questions/new'
  get 'l1_l3_questions/show'
  get 'l1_l3_questions/edit'
  get 'l1_l3_questions/create'
  post 'l1_l3_questions/edit'

  get 'l1_l4_questions/new'
  get 'l1_l4_questions/show'
  get 'l1_l4_questions/edit'
  get 'l1_l4_questions/create'

  get 'l1_l5_questions/new'
  get 'l1_l5_questions/show'
  get 'l1_l5_questions/edit'
  get 'l1_l5_questions/create'

  get 'level1_lesson1/new'
  get 'l1l1' => 'level1_lesson1#new'


  get 'l1l2' => 'l1_l2_questions#show'
  get 'l1l2review' => 'l1_l2_questions#edit'

  get 'l1l3' => 'l1_l3_questions#show'
  get 'l1l3review' => 'l1_l3_questions#edit'

  get 'l1l4' => 'l1_l4_questions#show'
 
  get 'l1l5' => 'l1_l5_questions#show'
 
  get 'level1_lesson1/show'
  get 'level1_lesson1/edit'
  get 'level1_lesson1/delete'

  get 'level1_lesson2/show'
  get 'level1_lesson2/edit'
  get 'level1_lesson2/delete'

  get 'level1_lesson3/show'
  get 'level1_lesson3/edit'
  get 'level1_lesson3/delete'


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

  resources :l1_l1_questions
  resources :l1_l2_questions
  resources :l1_l3_questions
 
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
