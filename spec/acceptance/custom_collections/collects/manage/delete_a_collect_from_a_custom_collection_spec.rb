require File.expand_path( '../../../../acceptance_helper', __FILE__ )

feature 'Delete a Collect from a Custom Collection', %q{
  In order to remove items from my custom collections
  As an artisan
  I want to delete a collect from a custom collection.
} do
  
  background do 
    # Given I have created a custom collection named 'Boss Records.'
    create_custom_collection 'Boss Records'
    
    # And I have created a collectable model
    Record.create! :name => 'Van Halen'
    
    # And I have collected my collectable into my collection,
    collect :record => 'Van Halen', :into => 'Boss Records'
    
    # And I am on the Manage Custom Collections page,
    visit '/manage/custom_collections'
    
    # And I have clicked the collect's Delete button
    within '.collect' do
      click_button 'Delete'
    end
  end
  
  scenario "I can delete a collect from a custom collection" do
    # Then I should see a notice,
    page.should have_selector '.notice'
    
    # And I should see no collects in my custom collection
    within '.custom_collection' do
      page.should have_no_selector '.collect'
    end
  end
  
  scenario "I can delete a collect from a custom collection via AJAX", :js => true do
    # When I confirm in the modal window
    accept_confirmation
    
    # Then I should see a notice
    page.should have_selector '.notice'
    
    # And I should see no collects in my custom_collection
    within '.custom_collection' do
      page.should have_no_selector '.collect'
    end
  end
end