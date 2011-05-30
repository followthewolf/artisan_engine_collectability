require File.expand_path( '../../../../acceptance_helper', __FILE__ )

feature 'Add a collect to a custom collection', %q{
  In order to populate my custom collections
  As an artisan
  I want to collect an item into a custom collection.
} do
  
  background do
    # Given I have created a custom collection named 'Boss Records,'
    create_custom_collection 'Boss Records'
    
    # And I have created a collectable model named 'Bat Out of Hell'
    Record.create! :name => 'Bat Out of Hell'
    
    # And I am on the manage custom collections page,
    visit '/manage/custom_collections'
  end
  
  scenario 'I can add a collect to a custom collection' do
    # When I click the Collect link, select Bat Out of Hell, and click Collect,
    collect :record => 'Bat Out of Hell', :into => 'Boss Records'
    
    # Then I should see a notice,
    page.should have_selector '.notice', :text => "Collected successfully."
    
    # And I should see my new collect within my custom collection.
    within '.custom_collection' do
      page.should have_selector '.collect', :text => 'Bat Out of Hell'
    end
  end
end