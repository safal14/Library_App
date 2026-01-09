Rails.application.routes.draw do
get "/books", to: "books#index"
  get '/books/new', to: 'books#new', as: :new_book
  get "books/:id", to: "books#show", as: :book
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  post "/books", to:"books#create"

  get "/books/:id/edit", to: "books#edit", as: :edit_book     # Show edit form
  patch "/books/:id", to: "books#update"                       # Save changes
  delete "/books/:id", to: "books#destroy"
  get '/checkout', to: 'rentals#checkout', as: :checkout
  post '/checkout', to: 'rentals#process_checkout'
  get '/rentals/history', to: 'rentals#history', as: :rentals_history
  # Defines the root path route ("/")
  # root "posts#index"
end
