module Manage
  class CustomCollectionsController < Manage::BackController
    respond_to :html, :js
    
    create! do |success, failure|
      failure.html { redirect_to manage_custom_collections_path, :alert => 'Custom Collection could not be saved.' }
      
      success.js   { @custom_collections = CustomCollection.all }
      failure.js do 
        @custom_collections = CustomCollection.all
        flash.now[ :alert ] = 'Custom Collection could not be created.'
        render :create
      end
    end
    
    destroy! do |success, failure|
      success.js { @custom_collections = CustomCollection.all; render :create }
    end
  end
end