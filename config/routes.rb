Rails.application.routes.draw do
  devise_for :users
  root to: "memos#index"
  resources :memos do
    collection do
      get 'search'
    end
    resources :comments, only: :create
  end
  resources :users, only: [:edit, :update, :show]
end
