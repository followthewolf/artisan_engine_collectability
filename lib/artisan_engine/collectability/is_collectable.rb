module ArtisanEngine
  module Collectability
    module IsCollectable
      def self.included( base )
        base.extend ClassMethods
      end
      
      module ClassMethods
        def is_collectable
          has_many :collects, :as => :collectable, :dependent => :destroy
        end
      end
    end
  end
end