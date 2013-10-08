OutwardBound::Application.routes.draw do

  scope "(:locale)", locale: /en|hr/ do
    root to: "home#index"

    get "cpanel", to: redirect(subdomain: false), constraints: {subdomain: "www"}

    controller :about do
      get "about", to: :index
      get "about/:action"
    end

    resources :courses
    resources :posts
    resources :albums

    controller :errors do
      get "404", to: :not_found
      get "500", to: :internal_server_error
    end
  end

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

end
