require File.expand_path( '../../../../acceptance_helper', __FILE__ )

feature 'Sort Collects', %q{
  In order to manage the order of items in my custom collections
  As an artisan
  I want to sort my collects.
} do
  
  scenario "I can sort my collects" do
    # This is a cheater spec because I don't know how to make Selenium drag/drop
    # properly. 
    
    # It just tests that Collect is properly integrated with Listability
    # and assumes that the JS parameters are being sent properly.
    
    # If something goes wrong, check to make sure that sortable.serialize is
    # sending properly formatted parameters to the controller.
    
    # Given I have a custom collection and three collectables,
    @custom_collection = CustomCollection.create! :name => 'Boss Records'
    @record1           = Record.create! :name => 'Van Halen'
    @record2           = Record.create! :name => 'David Bowie'
    @record3           = Record.create! :name => 'The Beatles'
    
    # When I sort my collectables,
    @collect1 = Collect.create! :custom_collection => @custom_collection, :collectable => @record1
    @collect2 = Collect.create! :custom_collection => @custom_collection, :collectable => @record2
    @collect3 = Collect.create! :custom_collection => @custom_collection, :collectable => @record3
    
    page.driver.post '/sort/collects', :collect => [ "#{ @collect3.id }",
                                                     "#{ @collect2.id }", 
                                                     "#{ @collect1.id }" ]
    
    # And I visit the custom collections page,
    visit '/manage/custom_collections'
    
    # Then my collectables should be in their sorted order.
    all( '.collect' )[0].text.should =~ /The Beatles/
    all( '.collect' )[1].text.should =~ /David Bowie/
    all( '.collect' )[2].text.should =~ /Van Halen/
  end
end