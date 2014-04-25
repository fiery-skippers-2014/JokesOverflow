JokesOverflow::Application.routes.draw do
  resources :jokes do
    resources :replies do
      resources :comments
    end
  end
  root :to => "jokes#index"
  resources :users, only: [:new]
  resources :sessions, only: [:new]
end
