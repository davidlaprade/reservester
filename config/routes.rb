Rails.application.routes.draw do

  # Made reservations a sub-resource of restaurants
  # Allows me to access restaurant id from params
    resources :restaurants do
      resources :reservations
      # See http://guides.rubyonrails.org/routing.html section 2.7.2
      # adds two new post methods for favoriting and unfavoriting within restaurant route
      resources :stars do
         member do
           post 'favorite'
           post 'unfavorite'
         end
      end
    end

  devise_for :users
  resources :users
  resources :categories


# adds custom routes
# see http://guides.rubyonrails.org/routing.html section 3.6
# the as: option generates the rails helper path
  get 'dashboard5', to: 'users#dashboard', as: 'dashboard'
  get 'my-favorites', to: 'users#my_favorites', as: 'my_favorites'


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
