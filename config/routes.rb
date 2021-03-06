Rails.application.routes.draw do
  resource :session, controller: 'authenticate/sessions', only: [:create, :new, :destroy]
  resources :passwords, controller: 'authenticate/passwords', only: [:new, :create]

  resource :users, controller: 'authenticate/users', only: [:new, :create] do
    resources :passwords, controller: 'authenticate/passwords', only: [:edit, :update]
  end

  #get '/sign_up', to: 'authenticate/users#new', as: 'sign_up'
  get '/sign_in', to: 'authenticate/sessions#new', as: 'sign_in'
  get '/sign_out', to: 'authenticate/sessions#destroy', as: 'sign_out'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'index#index'

  get 'our_story' => 'interface#our_story'

  get 'event' => 'interface#event'

  get 'rsvp' => 'index#index'
  post 'rsvp/respond' => 'rsvp#respond'
  get 'rsvp/respond' => 'rsvp#index'
  post 'rsvp/send_rsvp' => 'rsvp#send_rsvp'
  get 'rsvp/send_rsvp' => 'rsvp#index'

  get 'registry' => 'interface#registry'

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
