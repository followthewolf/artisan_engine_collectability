require File.expand_path( '../../../acceptance_helper', __FILE__ )

feature 'Delete a Custom Collection', %q{
  In order to manage my custom collections
  As an artisan
  I want to delete a custom collection.
} do

  background do
    # Given I am on the Manage Custom Collections page,
    visit '/manage/custom_collections'
    
    # And I have created a custom collection named 'Boss Records'
    create_custom_collection 'Boss Records'
    
    # And I have clicked the custom collection's Delete button,
    within '.custom_collection', :text => 'Boss Records' do
      click_button 'Delete'
    end
  end
  
  scenario 'I can delete a custom collection' do
    # Then I should see a notice,
    page.should have_selector '.notice'
    
    # And I should see no custom collections.
    page.should have_no_selector '.custom_collection'
  end
  
  scenario 'I can delete a custom collection via AJAX', :js => true do
    # When I confirm in the modal window,
    accept_confirmation
    
    # Then I should see a notice,
    sleep 0.5 and page.should have_selector '.notice', :text => "Custom Collection was successfully destroyed."
    
    # And I should see no custom collections.
    page.should have_no_selector '.custom_collection'
  end
end