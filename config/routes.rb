Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :floods, only: [:new, :create, :index] do
    collection do
      post :import
    end
  end

  root 'floods#new'
  get 'willitflood' => 'public/willitflood'

end
