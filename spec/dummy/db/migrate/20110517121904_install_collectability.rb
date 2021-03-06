class InstallCollectability < ActiveRecord::Migration
  
  def self.up
    create_table :custom_collections do |t|
      t.string      :name,        :null => false

      t.timestamps
    end
    
    create_table :collects do |t|
      t.integer     :custom_collection_id,  :null => false
      t.references  :collectable,           :polymorphic => true
      t.integer     :position,              :null => false
      
      t.timestamps
    end
  end

  def self.down
    drop_table :custom_collections
    drop_table :collects
  end
  
end
