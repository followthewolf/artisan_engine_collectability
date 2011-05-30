class Collect < ActiveRecord::Base
  belongs_to :custom_collection
  belongs_to :collectable, :polymorphic => true
  
  validates_presence_of :custom_collection, :collectable
  
  has_listability :within => :custom_collection
end