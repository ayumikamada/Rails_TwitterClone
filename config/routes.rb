Rails.application.routes.draw do
  root to: 'tsubuyakis#index'
  resources :tsubuyakis do
    collection do
      post :confirm
    end
  end
end