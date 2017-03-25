Rails.application.routes.draw do

  get 'recordings/new'

  get 'recordings/index'

  get 'recordings/create'

  get 'recordings/show'

  get 'recordings/edit'

  get 'recordings/destroy'

  get 'recordings/update'

  get 'videos/new'

  get 'videos/index'

  get 'videos/create'

  get 'videos/show'

  get 'videos/edit'

  get 'videos/destroy'

  get 'videos/update'

  get 'password_resets/new'

  get 'password_resets/edit'

  root 'welcome#welcome'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'welcome' => 'welcome#welcome'
  get 'about' => 'welcome#about'
  get 'signup' => 'users#new'
  get 'blog' => 'stories#index'
  get 'tag_cloud' => 'tags#show'

  post 'email_responses/bounce' => 'email_responses#bounce'
  post 'email_responses/complaint' => 'email_responses#complaint'

  get '/admin',   to: 'admin_pages#main'
  get '/admin/users',   to: 'admin_pages#admin_users'
  get '/admin/stories',   to: 'admin_pages#admin_stories'

  get 'stories/sort' => 'stories#sort'

  resources :users do
    resources :stories
    resources :comments
    resources :pictures
  end

  resources :stories do
    resources :comments
    resources :pictures
  end

  resources :comments do
    resources :comments
  end

  resources :pictures do
    resources :comments
  end
  
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :tags


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
