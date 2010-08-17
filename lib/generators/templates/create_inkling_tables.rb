class CreateInklingTables < ActiveRecord::Migration
  def self.up
    create_table :inkling_users do |t|
      t.database_authenticatable
      t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
      t.timestamps
      t.timestamps
      t.integer :role_id, :null => false
    end
    
    create_table :inkling_roles do |t|
      t.string :name, :null => false
      t.timestamps
    end
    
    create_table :addresses do |t|
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.string :path
      t.references :content, :polymorphic => true
      t.timestamps
    end
    
    create_table :sites do |t|
      t.string :name
      t.string :path_prefix
      t.string :description
      t.timestamps
    end
  end

  def self.down
    drop_table :sites
    drop_table :addresses
    drop_table :inkling_roles
    drop_table :inkling_users
  end
end
