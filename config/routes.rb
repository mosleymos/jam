Jam::Application.routes.draw do
  
  devise_for :users
  resources :users
  resources :messages
  resources :conversations
  resources :microposts, only: [:create, :destroy]
  resources :targetships

  match 'accepter_contact', to: 'targetships#accept', via: 'get'
  match 'refuser_contact', to: 'targetships#decline', via: 'get'

  match 'home', to: 'pages_statiques#home', via: 'get'
  match 'landing', to: 'pages_statiques#landing', via: 'get'
  match 'apropos', to: 'pages_statiques#apropos', via: 'get'
  match 'mentionslegales', to: 'pages_statiques#mentionslegales', via: 'get'
  match 'contact', to: 'pages_statiques#contact', via: 'get'
  match 'blog', to: 'pages_statiques#blog', via: 'get'

  match 'detruire_compte', to: 'users#destroy', via: 'delete'
  match 'reply', to: 'conversations#reply', via: 'post'
  match 'data', to: 'users#data', via: 'get'
  match 'liste_requetes', to: 'targetships#demandes_contact', via: 'get'

  root 'pages_statiques#home'
  
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
