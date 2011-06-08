require 'spec_helper'

# Proxy for Collectable model.
describe Record do
  let( :record ) { Record.create! :name => 'Van Halen' }
  
  context "when destroying: " do
    it "destroys all associated collects" do
      existing_collection = Factory :custom_collection
      Collect.create! :custom_collection => existing_collection, :collectable => record
      
      expect {
        record.destroy
      }.to change( Collect, :count ).by( -1 )
    end
  end
end