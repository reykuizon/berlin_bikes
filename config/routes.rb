Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "user_registration" }
  resources :users
  

  # NESTED RESOURCES FOR COMMENTS
  resources :products do
    resources :comments 
  end
  

  get 'static_pages/contact'

  get 'static_pages/about'

  get 'static_pages/index'

  get 'static_pages/landing_page'

  get '/products/:id', to: 'products#show'

  post '/static_pages/thank_you'

  # root 'static_pages#index'

  # root 'static_pages#landing_page'

  root 'products#index'

  # root 'orders#index'
  resources :orders, only: [:index, :show, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
