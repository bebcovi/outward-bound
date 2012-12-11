OutwardBound::Application.routes.draw do
  scope "(:locale)", locale: /en|hr/ do
    root to: "home#index"

    get "",        to: "home#index"
    get "about",   to: "about#index"
    resources :albums, only: [:index, :show]
    get "contact", to: "contact#index"

    controller(:about)   { get "about/:action" }
    resources :courses do
      member { get "apply" }
    end

    resources :participants, only: [:new, :create]
  end
end
