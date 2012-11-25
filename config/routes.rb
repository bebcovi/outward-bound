OutwardBound::Application.routes.draw do
  scope "(:locale)", locale: /en|hr/ do
    root to: "home#index"

    get "",         to: "home#index"
    get "about",    to: "about#index"
    get "posts",    to: "posts#index"
    get "courses",  to: "courses#index"
    get "business", to: "business#index"
    get "faq",      to: "faq#index"

    controller(:about)    { get "about/:action" }
    controller(:courses)  { get "courses/:course", to: :course, as: "course" }
    controller(:business) { get "mount-everest", to: :mount_everest }

    resources :galleries
  end
end
