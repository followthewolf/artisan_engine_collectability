require 'spec_helper'

describe ArtisanEngine::Collectability do
  it "is an Engine" do
    ArtisanEngine::Collectability::Engine.ancestors.should include Rails::Engine
  end
  
  it "accepts an array of collectable models" do
    ArtisanEngine::Collectability.collectable_models += [ :narf, :snarf ]
    
    ArtisanEngine::Collectability.collectable_models.should include :narf
    ArtisanEngine::Collectability.collectable_models.should include :snarf
  end
end

describe "ArtisanEngine::Collectability Test/Development Environment" do
  it "initializes ArtisanEngine::Collectability" do
    ArtisanEngine::Collectability.should be_a Module
  end
  
  it "compiles its stylesheets into ArtisanEngine's stylesheets/artisan_engine/collectability directory" do
    Compass.configuration.css_path.should == "#{ ArtisanEngine.root }/lib/generators/artisan_engine/templates/assets/stylesheets/artisan_engine/collectability"
  end
  
  it "does not compile stylesheets during tests" do
    Sass::Plugin.options[ :never_update ].should be_true
  end
  
  it "compiles its javascripts into ArtisanEngine's javascripts/artisan_engine/collectability directory" do
    Barista.output_root.should == Pathname.new( "#{ ArtisanEngine.root }/lib/generators/artisan_engine/templates/assets/javascripts/artisan_engine/collectability" )
  end
end