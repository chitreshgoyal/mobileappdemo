Mobileapp::Application.routes.draw do

  resources :user_sessions
  resources :products
  resources :users  # give us our some normal resource routes for users
  resources :users, :as => 'accounts'  # a convenience route  
  resources :posts
  resources :roles do
    collection do
      get :set_permission
      put :update_multiple
    end
  end
  
  resources :features
  
  #mount Ckeditor::Engine => "/ckeditor"
   
  match 'login', :to => "user_sessions#new", :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout
  
  match 'signup' => 'users#new', :as => :signup
  
  match 'productlist' => 'products#index', :as=>'productpage'
  
  match 'role_user' => 'users#role_user_list'
  
  match 'update_user_role' => 'users#update_user_role', :as=> 'update_user_role'
  
  match 'set_permission' => 'roles#set_permission', :as => 'set_permission'
  
  match 'my_posts' => 'posts#index', :as => 'my_posts'
  match 'blog' => 'posts#blog'
  
  match "/:name" => "products#product_info", :as => :chitresh
 
  
  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   #root :to => 'products#index'
   root :to => 'posts#blog'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
