require 'rails/generators/active_record'

module ArtisanEngine
  module Generators
    module Collectability
      class InstallGenerator < ActiveRecord::Generators::Base

        argument    :name, :default => 'collectability'
        source_root File.expand_path( '../templates', __FILE__ )
        
        def install_core
          Rails::Generators.invoke 'artisan_engine:core:install'
          sleep 1 # to prevent duplicate timestamps.
        end
        
        def copy_initializer
          template 'initializers/collectability.rb', 
                   'config/initializers/collectability.rb'
        end
        
        def copy_installation_migration
          migration_template 'migrations/install_collectability.rb', 
                             'db/migrate/install_collectability.rb'
        end
        
      end
    end
  end
end