class CustomCollection < ActiveRecord::Base
  has_friendly_id         :name,      :use_slug  => true
  
  has_many                :collects,  :dependent => :destroy
  
  validates_presence_of   :name
end