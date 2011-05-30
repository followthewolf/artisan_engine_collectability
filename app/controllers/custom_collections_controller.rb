class CustomCollectionsController < FrontController
  def show
    @custom_collection = CustomCollection.find( params[ :id ] )
    @title             = @custom_collection.name
  end
end