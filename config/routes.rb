Rails.application.routes.draw do
  scope :module => :manage do
    resources :custom_collections, :only => [ :create, :edit, :update, :destroy ] do
      resources :collects, :only => [ :new, :create, :destroy ]
    end
  end
  
  namespace :manage do
    resources :custom_collections, :only => [ :index ]
  end
  
  resources :custom_collections, :only => [ :show ]
end