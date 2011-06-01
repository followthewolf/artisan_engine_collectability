class CustomCollectionsController < FrontController
  def show
    @custom_collection = CustomCollection.find( params[ :id ] )
    @title             = @custom_collection.name
    
    if File.exists?( "#{ Rails.root }/app/views/custom_collections/#{ @title.delete( ' ' ).underscore }.html.haml" )
      render "#{ Rails.root }/app/views/custom_collections/#{ @title.delete( ' ' ).underscore }.html.haml"
    else
      render :show
    end
  end
end