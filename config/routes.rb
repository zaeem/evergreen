Evergreen::Application.routes.draw do

  devise_for :users
devise_scope :user do
  authenticated :user do
    root :to => 'devise/sessions#new'
  end
  unauthenticated :user do
    root :to => 'devise/sessions#new'
  end
end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  authenticated :user do
    root :to => 'users#index'
  end
  root :to => "users#index"
  devise_for :users
  resources :users do
    collection do
      get :show_suppliers
      get :show_members
    end
  end
  resources :upload_csvs
  resources :csvs

  resources :apisettings do
    collection do
      get :load_list
    end
  end

end

