OutwardBound::Application.routes.draw do
  scope "(:locale)", locale: /en|hr/ do
    root to: "home#index"

    get "", to: "home#index"
    get "faq", to: "faq#index"

    controller :about do
      get "about", to: :index
      get "about/:action"
    end

    resources :posts
    resources :galleries
  end
end
