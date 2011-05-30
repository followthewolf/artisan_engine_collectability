module ArtisanEngine
  module Collectability
    module TestHelpers
      
      Factory.define :custom_collection do |cc|
        cc.name { Forgery( :name ).company_name.pluralize }
      end
      
      Factory.define :collect do |c|
        c.association :custom_collection
        
        c.after_build do |co|
          co.collectable = Record.create! :name => 'Van Halen'
        end
      end
      
      module Integration
        
        def create_custom_collection( name )
          visit '/manage/custom_collections'
          fill_in 'Name', :with => name
          click_button 'Create Custom Collection'
        end
      
        def collect( options = {} )
          collectable_class = options.keys[0]
          collectable_name  = options[ collectable_class ]
          cc_name           = options[ :into ]
          
          visit '/manage/custom_collections'
          
          within '.custom_collection', :text => cc_name do
            click_link 'Collect'
          end
          
          select collectable_name, :from => collectable_class.to_s.titleize.pluralize
          click_button 'Collect'
        end
      end
    end
  end
end