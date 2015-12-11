Rails.application.routes.draw do

  resources :prems
  resources :prem
  get 'prem/index'

  get 'prem/create'

  get 'prem/edit'

  get 'prem/show'

  get 'prem/destroy'

  get 'prem/new' 
      
  get 'prems/index'

  get 'prems/create'

  get 'prems/edit'

  get 'prems/show'

  get 'prems/destroy'

  get 'prems/new' 
    
  get'users/index'
    
  resources :reservations

  devise_for :users, controllers: { registrations: "registrations",
                                    passwords: "passwords" }

  devise_scope :user do
    get "/login" => "devise/sessions#new"
    delete "/logout" => "devise/sessions#destroy"
  end
  
  resources :types
  resources :users
  resources :couches
  resources :questions
  resources :rating_couches
  resources :rating_users


  resources :users, except: [:edit] do
    member do
      get 'premium'
    end
  end

#    resources :reservations do
#  collection do
#        get 'index_receibed'
#  end
#end
    
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'couches#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get '/couches_self', to: 'couches#index_self'

  get '/reservations_self', to: 'reservations#index_self'
    
  get '/reservations_receibed', to: 'reservations#index_receibed'
    
    get '/reservations/index_couch/:couch_id', to: 'reservations#index_couch', as: 'couch_reservation'
    
    get '/reservations/accept/:reservation_id', to: 'reservations#accept', as: 'accept_reservation'

  get '/reservations/new/:couch_id', to: 'reservations#new', as: 'new_new_reservation'
  
  get '/rating_self', to: 'users#rating_self'

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
