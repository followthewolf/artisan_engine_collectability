Rails.application.routes.draw do
  namespace :manage do
    resources :custom_collections, :except => [ :new, :show ] do
      resources :collects
    end
  end
  
  get '/collections/:id' => 'custom_collections#show', :as => :custom_collection
end