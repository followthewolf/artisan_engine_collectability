require 'artisan_engine/core'
require 'artisan_engine/listability'
require 'artisan_engine/collectability'

module ArtisanEngine
  module Collectability
    
    mattr_accessor :collectable_models
    def self.collectable_models
      @@collectable_models ||= []
    end
    
    # ------------------ Autoload Necessary Modules ------------------ #
    
    autoload :TestHelpers, 'artisan_engine/collectability/test_helpers' if Rails.env.test?
    
    # ------------------------- Vroom vroom! ------------------------- #
    
    class Engine < Rails::Engine
    end

  end
end