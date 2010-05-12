class CreateBasicLocationTables < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string :name
    end
    add_index :countries, :name
    
    create_table :states do |t|
      t.integer :country_id
      t.string  :name
      t.string  :abbr
      t.string  :short
      t.string  :short2
    end
    add_index :states, :country_id
    add_index :states, :name
    add_index :states, :abbr
    add_index :states, :short
    add_index :states, :short2
    
    create_table :cities do |t|
      t.integer :state_id
      t.string  :name
      t.string  :city_name
    end
    add_index :cities, :name
    add_index :cities, :city_name
    add_index :cities, :state_id
  end
  
  def self.down
    drop_table :countries
    drop_table :states
    drop_table :cities
  end
  
end