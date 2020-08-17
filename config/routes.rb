Rails.application.routes.draw do
  root 'top#index'
  resources :tsubuyakis do
    collection do
      post :confirm
    end
  end
end