OutwardBound::Application.routes.draw do
  scope "(:locale)", locale: /en|hr/ do
    root to: "home#index"
    get "home/index"

    resources :posts
  end
end
