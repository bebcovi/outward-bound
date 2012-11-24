OutwardBound::Application.routes.draw do
  scope "(:locale)", locale: /en|hr/ do
    root to: "home#index"

    get "", to: "home#index", as: "home_path"

    resources :posts
  end
end
