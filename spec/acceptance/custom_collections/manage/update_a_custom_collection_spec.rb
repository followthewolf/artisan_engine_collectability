require File.expand_path( '../../../acceptance_helper', __FILE__ )

feature 'Update a Custom Collection', %q{
  In order to manage my custom collections
  As an artisan
  I want to update a custom collection.
} do

  background do
    # Given I am on the Manage Custom Collections page,
    visit '/manage/custom_collections'
    
    # And I have created a custom collection named 'Boss Records.'
    create_custom_collection 'Boss Records'
    
    # And I have clicked the custom collection's Edit link,
    within '.custom_collection' do
      click_link 'Edit'
    end
  end
  
  scenario "I can update a custom collection with valid attributes" do
    puts custom_collection_path( CustomCollection.first )
    
    # When I fill in a new name and click Update Custom Collection,
    fill_in 'Name', :with => 'Subordinate Records'
    click_button 'Update Custom Collection'

    # Then I should see a notice,
    page.should have_selector '.notice', :text => 'Custom Collection was successfully updated.'
    
    # And I should see my new custom collection.
    page.should have_selector '.custom_collection', :text => 'Subordinate Records'
  end
  
  scenario "I can't update a custom collection with invalid attributes" do
    # When I fill in an invalid new name and click Update Custom Collection,
    fill_in 'Name', :with => ''
    click_button 'Update Custom Collection'

    # Then I should see an alert.
    page.should have_selector '.alert'
  end
end
