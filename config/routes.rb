class UserConstraint
  def matches?( request )
    !request.cookies['auth_token'].blank?
  end
end

Tangela::Application.routes.draw do

  match 'logout' => 'sessions#destroy', as: :logout
  match 'login' => 'sessions#new', as: :login

  resources :users
  resources :sessions, only: [ :create, :destroy, :new ]

  resources :projects do
    resources :resources
    resources :notes
  end

  root to: 'projects#index', constraints:
    UserConstraint.new

  root to: 'users#new'

end
