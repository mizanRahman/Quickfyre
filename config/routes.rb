Project::Application.routes.draw do
  
  resources :posts

  resources :subcatagories

  resources :catagories

  resources :sub_catagories

  resources :catagories

  resources :laccounts

  # match "admin/users/:id/edit" => "users#edit", :as => :admin_user_edit

  # match "admin/users/:id/post" => "users#index", :as => :admin

  # get "users/delete"


  match 'admin/' => "accounts#index", :as => :admin
  match 'accounts/:id/post' => 'accounts#post', :as => :status_post
  resources :accounts
  resource :facebook_account
  match '/callback/facebook' => "facebook_accounts#callback", :as => :facebook_callback
  resources :twitter_accounts
  resources :linkedin_accounts

  match '/callback/linkedin' => "linkedin_accounts#callback", :as => :linkedin_callback

  get "twitter_accounts/new"

  get "twitter_accounts/callback"

  match '/callback/twitter/' => "twitter_accounts#callback", :as => :twitter_callback
  resources :posts

  devise_for :users

  match 'posts/:id/publish' => 'posts#publish'
  # get "home/index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

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
   root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
