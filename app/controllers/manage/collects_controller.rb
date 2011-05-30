module Manage
  class CollectsController < Manage::BackController
    belongs_to :custom_collection
    
    def create
      @custom_collection = CustomCollection.find( params[ :custom_collection_id ] )
      @collectable       = find_collectable_object
    
      @custom_collection.collects.create :collectable => @collectable
      
      redirect_to manage_custom_collections_path, :notice => 'Collected successfully.'
    end
    
    destroy! do |success, failure|
      success.html { redirect_to manage_custom_collections_path, :notice => 'Removed collect successfully.' }
      success.js   { @custom_collections = CustomCollection.all }
    end
    
    private

      # Find the collectable object given to the controller.
      def find_collectable_object
        collectable_class  = params[ :collect ][ :collectable_type ].constantize
        collectable_id     = params[ :collect ][ :collectable_id ]

        collectable_class.find( collectable_id )
      end
  end
end