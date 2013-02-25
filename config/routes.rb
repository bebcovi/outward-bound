OutwardBound::Application.routes.draw do
  scope "(:locale)", locale: /en|hr/ do
    root to: "home#index"
    get "", to: "home#index"

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

    namespace :admin do
      root to: "email_forwards#index"

      resources :email_forwards do
        collection {
          put "update", to: :update_all
        }
      end
    end

    controller :errors do
      match "404", to: :not_found
      match "500", to: :internal_server_error
    end
  end
end
