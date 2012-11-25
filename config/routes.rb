OutwardBound::Application.routes.draw do
  scope "(:locale)", locale: /en|hr/ do
    root to: "home#index"

    get "",         to: "home#index"
    get "about",    to: "about#index"
    get "posts",    to: "posts#index"
    get "gallery",  to: "galleries#index", as: "galleries"
    get "courses",  to: "courses#index"
    get "business", to: "business#index"
    get "faq",      to: "faq#index"

    controller(:about)     { get "about/:action" }
    controller(:galleries) { get "gallery/:gallery", to: :show, as: "gallery"  }
    controller(:courses)   { get "courses/:course", to: :show, as: "course" }
    controller(:business)  { get "mount-everest", to: :mount_everest }
  end
end
