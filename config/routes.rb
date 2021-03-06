Myapp::Application.routes.draw do
  get "home/index"
  devise_for :admins, skip: [:registrations]

  as :admin do
    get 'admins/edit' => 'devise/registrations#edit', :as => 'edit_admin_registration'    
    put 'admins' => 'devise/registrations#update', :as => 'admin_registration'            
  end


  root to: 'home#index'

  get "/admins/new_admin", to: "admins#new", as: "new_admin"
  post "/admins/create_admin", to: "admins#create", as: "create_admin"

  get "/admins/show", to: "admins#show", as: "admin_show"
  get "/admins/index", to: "admins#index", as: "admins"

  delete "/admins/:id", to: "admins#delete", as: "delete_admin"

  get "/albums/admin_index", to: "albums#admin_index", as: "albums_admin_index"
  get "/albums/admin_show/:id", to: "albums#admin_show", as: "album_admin_show"

  resources :albums, shallow: true do  
    resources :images
  end
  
  get "/jobs/index", to: "jobs#index", as: "jobs"

  resources :customers, shallow: true do 
    resources :jobs, only: [:new, :create, :edit, :update, :destroy, :show]
  end


  get "/customers/:quote_request_id/new", to: "customers#new", as: "new_customer_from_quote"
  

  get "/quote_requests/:id/change_status", to: "quote_requests#change_status", as: "change_quote_status"
  resources :quote_requests

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
