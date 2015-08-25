Rails.application.routes.draw do
  namespace :admin do
    get "/" => "dashboard#index"
    namespace :health do
      get "/" => "dashboard#index"
      resources :categories
      resources :entries
      resources :meals
      resources :ratings
      resources :workout_categories
      resources :workouts
    end
    namespace :budget do
      get "/" => "dashboard#index"
      resources :categories
      resources :entries
      resources :events
      resources :payees
      resources :subcategories
    end
    namespace :notes do
      resources :entries, except: [:index, :show]
      resources :categories, except: [:index, :show]
    end
    namespace :blog do
      get "/" => "dashboard#index"
      resources :comments
      resources :posts
    end
    namespace :points do
      get "/" => "dashboard#index"
      resources :daily_tasks do
        member do
          put :task_update
        end
      end
      resources :goals do
        resources :options, except: [:index, :show] do
          member do
            post :quick_entry
          end
        end
        resources :activities, except: [:index, :show]
      end
      resources :activities, only: [:index, :new, :create]
    end
    namespace :dictionary do
      get "/" => "dashboard#index"
      resources :entries
      resources :languages
      resources :categories
    end
  end
  devise_for :users
  namespace :notes do
    get "/" => "dashboard#index"
    resources :entries, only: [:index, :show]
    resources :categories, only: [:index, :show]
  end
  namespace :games do
    get "/" => "dashboard#index"
    get "fallout_computer" => "fallout_computer#index"
  end
  namespace :blog do
    get "/" => "posts#index"
    resources :posts, only: [:show] do
      resources :comments, only: [:new, :create]
    end
  end
  get "/jihye" => "pages#jihye"
  root "pages#home"
end
