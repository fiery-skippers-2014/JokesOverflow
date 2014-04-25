JokesOverflow::Application.routes.draw do
  root :to => "jokes#index"
  resources :jokes do
    resources :replies
  end
  # resources :users, only: [:new]
  # resources :sessions, only: [:new]

  resources :votes, only: [:new, :create]

match '/votes' => 'votes#new'

end
