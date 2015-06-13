Rails.application.routes.draw do
  namespace :points do
    get '/' => 'dashboard#index'
    resources :goals do
      resources :options do
        resources :activities
      end
    end
    resources :activities, only: [:new, :create]
  end
  mount Ckeditor::Engine => '/ckeditor'
  namespace :admin do
    get '/' => 'dashboard#index'
    namespace :health do
      get '/' => 'dashboard#index'
      resources :categories
      resources :entries
      resources :meals
      resources :ratings
      resources :workout_categories
      resources :workouts
    end
    namespace :budget do
      get '/' => 'dashboard#index'
      resources :categories
      resources :entries
      resources :events
      resources :payees
      resources :subcategories
    end
    namespace :notes do
      get '/' => 'dashboard#index'
      resources :entries
      resources :categories
    end
    namespace :blog do
      get '/' => 'dashboard#index'
      resources :comments
      resources :posts
    end
  end
  devise_for :users
  namespace :notes do
    resources :entries, only: [:index, :show]
    resources :categories, only: [:index, :show]
  end
  namespace :blog do
    get '/' => 'posts#index'
    resources :posts, only: [:show] do
      resources :comments, only: [:new, :create]
    end
  end
  get '/jihye' => 'pages#jihye'
  root 'pages#home'
end
