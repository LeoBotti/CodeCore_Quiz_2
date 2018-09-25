Rails.application.routes.draw do
  resources :ideas do
    resources :reviews, shallow: true, only: [:create, :destroy, :edit, :update]
  end
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  get('/', to: 'ideas#index', as: :root)
end
