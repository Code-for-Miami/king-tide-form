Rails.application.routes.draw do
  root 'floods#new'

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  resources :floods, only: [:new, :create, :index] do
    collection do
      post :import
    end
  end

  # Wild Card Catch-all for High Voltage
  get "/pages/*id" => 'pages#show', as: :page, format: false

  get 'willitflood' => 'pages#show', id: 'willitflood'

end
