require File.expand_path( '../../../acceptance_helper', __FILE__ )

feature 'Create a Custom Collection', %q{
  In order to organize items into collections
  As an artisan
  I want to create a custom collection.
} do
  
  background do
    # Given I am on the Manage Custom Collections page,
    visit '/manage/custom_collections'
  end
  
  context "with valid attributes: " do
    background do
      # When I fill in Name with Boss Records and click Create Custom Collection,
      create_custom_collection 'Boss Records'
    end
    
    scenario 'I can create a custom collection with valid attributes' do
      # Then I should see a notice,
      page.should have_selector '.notice'
    
      # And I should see my new custom collection.
      page.should have_selector '.custom_collection', :text => 'Boss Records'
    end
  
    scenario 'I can create a custom collection with valid attributes via AJAX', :js => true do
      # Then I should see a notice,
      page.should have_selector '.notice', :text => "Custom Collection was successfully created."

      # And I should see my new custom collection.
      page.should have_selector '.custom_collection', :text => 'Boss Records'
    end
  end
  
  context "with invalid attributes: " do
    background do
      # When I fill in Name with nothing and click Create Custom Collection,
      fill_in 'Name', :with => ''
      click_button 'Create Custom Collection'
    end
    
    scenario 'I cannot create a custom collection with invalid attributes' do
      # Then I should see an alert,
      page.should have_selector '.alert'
    
      # And I should not see any custom collections.
      page.should have_no_selector '.custom_collection'
    end
  
    scenario 'I cannot create a custom collection with invalid attributes via AJAX', :js => true do
      # Then I should see an alert,
      page.should have_selector '.alert'
    
      # And I should not see any custom_collections.
      page.should have_no_selector '.custom_collection'
    end
  end
end