Rails.application.routes.draw do

  namespace :notes do
  get 'categories/index'
  end

  namespace :notes do
  get 'categories/show'
  end

  namespace :notes do
  get 'entries/index'
  end

  namespace :notes do
  get 'entries/show'
  end

  mount Ckeditor::Engine => '/ckeditor'
  namespace :admin do
    get '/' => 'dashboard#index'
    namespace :health do
      get '/' => 'dashboard#index'
      resources :ratings
      resources :categories
      resources :entries
      resources :meals
      resources :workouts
      resources :workout_categories
    end
    namespace :notes do
      get '/' => 'dashboard#index'
      resources :entries
      resources :categories
    end
  end
  devise_for :users
  namespace :notes do
    resources :entries, only: [:index, :show]
    resources :categories, only: [:index, :show]
  end
  get '/jihye' => 'pages#jihye'
  root 'pages#home'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
