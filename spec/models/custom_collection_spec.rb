require 'spec_helper'

describe CustomCollection do
  let( :new_cc ) { CustomCollection.new :name => 'Boss Records' }
  
  context "validations: " do
    it "is valid with valid attributes" do
      new_cc.should be_valid
    end
    
    it "is not valid without a name" do
      new_cc.name = nil
      new_cc.should_not be_valid
    end
  end
  
  context "when destroying: " do
    it "destroys all associated collects" do
      existing_collection = Factory :custom_collection
      existing_collect    = Factory :collect, :custom_collection => existing_collection
      
      lambda {
        existing_collection.destroy
      }.should change( Collect, :count ).by( -1 )
    end
  end
end