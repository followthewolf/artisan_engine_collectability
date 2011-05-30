require File.expand_path( '../../acceptance_helper', __FILE__ )

feature 'View a Custom Collection', %q{
  In order to see the items in a collection
  As a patron
  I want to view a custom collection.
} do
  
  background do
    # Given there is a custom collection,
    create_custom_collection 'Hippy Beats'
    
    # And there are three collectables,
    Record.create! :name => 'Enya'
    Record.create! :name => 'Bob Marley'
    Record.create! :name => 'Pink Floyd'
    
    # And they are part of the Hippy Beats collection,
    collect :record => 'Enya',       :into => 'Hippy Beats'
    collect :record => 'Bob Marley', :into => 'Hippy Beats'
    collect :record => 'Pink Floyd', :into => 'Hippy Beats'
    
    # And I am visiting the show custom collection page,
    visit '/custom_collections/hippy-beats'
  end
  
  scenario "I can view a custom collection and see its collected items" do
    # Then I should see the custom collection and its collected items,
    within '.custom_collection' do
      page.should have_selector '.record', :count => 3
      page.should have_content 'Enya'
      page.should have_content 'Bob Marley'
      page.should have_content 'Pink Floyd'
    end
  end
end