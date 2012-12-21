OutwardBound::Application.routes.draw do
  scope "(:locale)", locale: /en|hr/ do
    root to: "home#index"
    get "", to: "home#index"

    controller :about do
      get "about", to: "index"
      get "about/:action"
    end

    get "contact", to: "contact#index"

    resources :courses do
      collection {
        get "apply"
        get "application"
      }
    end

    resources :albums

    mount SendgridEmailForwarder::Engine, at: ""
  end
end
