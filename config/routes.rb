JokesOverflow::Application.routes.draw do
  root :to => "jokes#index"
  resources :jokes do
    resources :replies
  end
  resources :votes, only: [:create]
end
