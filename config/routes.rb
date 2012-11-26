OutwardBound::Application.routes.draw do
  scope "(:locale)", locale: /en|hr/ do
    root to: "home#index"

    get "",        to: "home#index"
    get "courses", to: "courses#index"
    get "about",   to: "about#index"
    resources :events, path: "gallery", only: [:index, :show]
    get "contact", to: "contact#index"

    controller(:about)   { get "about/:action" }
    controller(:gallery) { get "gallery/:gallery", to: :show, as: "gallery"  }
    controller(:courses) { get "courses/:course", to: :show, as: "course" }

    resources :participants, only: [:new, :create]
  end
end
