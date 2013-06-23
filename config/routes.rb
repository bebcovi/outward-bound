OutwardBound::Application.routes.draw do
  scope "(:locale)", locale: /en|hr/ do
    root to: "home#index"

    controller :about do
      get "about", to: :index
      get "about/:action"
    end

    resources :courses
    resources :posts
    resources :albums

    controller :sessions do
      get    "login", to: :new
      post   "login", to: :create
      delete "logout", to: :destroy
    end

    controller :errors do
      get "404", to: :not_found
      get "500", to: :internal_server_error
    end
  end

  namespace :admin do
    root to: "posts#index"

    resources :posts
    resources :announcements
  end
end
