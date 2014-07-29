Rails.application.routes.draw do

  resources :stars

  # Made reservations a sub-resource of restaurants
  # I will only ever go to a reservation when there is a restaurant it is for
  # Allows me to access restaurant class variables from reservation views
  # This will change the routes accordingly
    resources :restaurants do
      resources :reservations
      # See http://guides.rubyonrails.org/routing.html section 2.7.2
      resources :stars, only: [:new, :create, :destroy]
    end

  devise_for :users
  resources :users
  resources :categories
  resources :stars

# adds a dashboard route
# see http://guides.rubyonrails.org/routing.html section 3.6
  get 'dashboard5', to: 'users#dashboard', as: 'dashboard'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'restaurants#index'

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
