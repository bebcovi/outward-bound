OutwardBound::Application.routes.draw do
  scope "(:locale)", locale: /en|hr/ do
    root to: "home#index"
    get "", to: "home#index"

    controller :about do
      get "about", to: :index
      get "about/:action"
    end

    get "contact", to: "contact#index"

    resources :courses do
      collection do
        get "apply"
        get "application"
      end
    end

    get "newsletter", to: "newsletter#index"

    resources :posts
    resources :albums
    resources :newsletter

    controller :errors do
      match "404", to: :not_found
      match "500", to: :internal_server_error
    end
  end
end
