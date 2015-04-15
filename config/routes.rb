Rails.application.routes.draw do
  get 'reviews/new'

  get 'reviews/create'

  devise_for :users

  get 'home' => 'static_pages#home'

  get 'help' => 'static_pages#help'

  get 'about' => 'static_pages#about'

  root 'static_pages#home'

  resources :users, only: [:index, :show] do
    resources :requests, except: [:edit, :update]
    resources :favorites, only: [:index]
  end

  get '/users/:id/:show_type' => 'relationships#index'

  resources :relationships, only: [:create, :destroy]

  resources :likes, only: [:create, :destroy]

  resources :categories

  resources :books do
    resources :reviews
  end

  resources :read_statuses

  get 'history' => 'read_statuses#index'

  resources :favorites, only: [:create, :destroy]

  namespace :admin do
    root 'static_pages#home'
    resources :users, only: :destroy
    resources :requests, only: [:index, :show, :update]
  end

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
