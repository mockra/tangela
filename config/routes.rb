class UserConstraint
  def matches?( request )
    !request.cookies['auth_token'].blank?
  end
end

Tangela::Application.routes.draw do

  mount Doorkeeper::Engine => '/oauth'

  namespace :api do
    namespace :v1 do
      resources :projects do
        resources :notes
        resources :resources
      end
    end
  end

  match 'logout' => 'sessions#destroy', as: :logout
  match 'login' => 'sessions#new', as: :login
  match 'login' => 'sessions#new', as: :login

  match 'resources/sort' => 'resources#sort', as: :sort_resources, via: [ :post ]
  match 'notes/sort' => 'notes#sort', as: :sort_notes, via: [ :post ]

  match 'notes/completed' => 'notes#completed', as: :completed_note, via: [ :post ]

  resources :users
  resources :sessions, only: [ :create, :destroy, :new ]

  resources :projects do
    resources :resources
    resources :notes
  end

  resources :notes
  resources :resources

  root to: 'projects#index', constraints:
    UserConstraint.new

  root to: 'users#new'

end
