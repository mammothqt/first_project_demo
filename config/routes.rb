Rails.application.routes.draw do
  scope '(:locale)', locale: /en|vi/ do
    root 'main_pages#home'
    get 'main_pages/home'
    get 'main_pages/help'
    get 'main_pages/about'
    get 'main_pages/contact'
    get '/help', to: 'main_pages#help'
    get '/about', to: 'main_pages#about'
    get '/contact', to: 'main_pages#contact'

    devise_for :users, controllers: { confirmations: 'confirmations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    as :user do
      get 'sign_in' => 'devise/sessions#new'
      post 'sign_in' => 'devise/sessions#create'
      delete 'sign_out' => 'devise/sessions#destroy'
    end

    resources :categories, except: :show do
      resources :courses
    end

    resources :courses do
      resources :word_lists, except: :show
    end

    resources :tests do
      resources :user_results, only: :create
      resources :user_results, only: :new, path: 'doing_test'
    end

    resources :users do
      resources :user_results, only: [:index, :show]
    end

    resources :exports, only: :index
  end
end
