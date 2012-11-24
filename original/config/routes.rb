OutwardBound::Application.routes.draw do
  scope "(:locale)", locale: /en|hr/ do
    root to: "home#index"
    resources :contents
    resources :events

    controller :home do
      get "", to: :index
      get "archive"
    end
    resources :posts

    get "login", to: "sessions#new"
    post "login", to: "sessions#create"
    match "logout", to: "sessions#destroy"

    controller :about do
      get "about", to: :index
      get "about/:action"
    end
    resources :applications

    resources :courses
    resources :categories

    controller :business do
      get "business", to: :index
    end

    controller :gallery do
      get "gallery", to: :index
    end

    controller :faq do
      get "faq", to: :index
    end

    resources :tweets do
      collection { get "stream" }
    end

    controller :mails do
      post "receive_email"
    end

    match "404", :to => "errors#not_found"
    match "500", :to => "errors#internal_server_error"
  end
end
