Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "main_pages#home"
    get "main_pages/home"
    get "main_pages/help"
    get "main_pages/about"
    get "main_pages/contact"
    get "/help", to: "main_pages#help"
    get "/about", to: "main_pages#about"
    get "/contact", to: "main_pages#contact"

    devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    as :user do
      get "sign_in" => "devise/sessions#new"
      post "sign_in" => "devise/sessions#create"
      delete "sign_out" => "devise/sessions#destroy"
    end

    resources :categories do
      resources :courses
    end

    resources :courses do
      resources :word_lists, except: :show
    end

    resources :tests

    resources :users, only: [] do
      resources :tests, only: [] do
        resources :user_results, only: [:create, :show]
        resources :user_results, only: [:new], :path => 'doing_test'
      end
    end

    resources :users do
      resources :user_results, only: [:index, :show]
    end

    resources :export_users, only: :index

    resources :export_tests, only: :index
  end
end
