EslJobs::Application.routes.draw do
  resources :employee_search_results
  resources :job_search_results
  resources :videos

  resources :pictures

  resources :role_types

  resources :educations

  resources :reviews

  default_url_options :host => "/"
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
end
  get "advertise/index"
  get "contact/index"
  get "about/index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "job_types/index"
  get "home/index"
  get "countries/index"
  get "job_posts/index", :path => "esl-jobs"
  resources :job_posts, :path => "esl-teaching-jobs"
  resources :countries, :path => "esl-jobs"
  resources :job_types
  resources :about
  resources :contact
  resources :advertise
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'job_posts#index'
  get '/users/:id', :to => 'users#show', :as => :user
  resources :users
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
  
    # mailbox folder routes
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  # conversations
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end  
end
