require 'spec_helper'

describe Collect do
  let( :new_collect ) { Collect.new :custom_collection => stub_model( CustomCollection ),
                                    :collectable       => stub_model( Record ) }
  
  context "validations: " do
    it "is valid with valid attributes" do
      new_collect.should be_valid 
    end
    
    it "is not valid without a custom collection" do
      new_collect.custom_collection = nil
      new_collect.should_not be_valid 
    end
    
    it "is not valid without a collectable" do
      new_collect.collectable = nil
      new_collect.should_not be_valid
    end
  end
end