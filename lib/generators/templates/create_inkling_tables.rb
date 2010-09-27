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
    end
    
    create_table :inkling_roles do |t|
      t.string :name, :null => false
      t.timestamps
    end
    
    create_table :inkling_role_memberships do |t|
      t.integer :user_id, :null => false
      t.integer :role_id, :null => false
    end
    
    create_table :inkling_paths do |t|
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.string :slug, :null => false
      t.references :content, :polymorphic => true
      t.timestamps
    end    
    
    create_table :inkling_types do |t|
      t.string :klass_name
      t.timestamps
    end    
    
    create_table :inkling_can_can_actions do |t|
      t.string :name
      t.timestamps
    end    
    
    create_table :inkling_permissions do |t|
      t.integer :type_id
      t.integer :role_id, :null => false
      t.integer :can_can_action_id
      t.timestamps
    end    
  end

  def self.down
    drop_table :inkling_paths
    drop_table :inkling_can_can_actions
    drop_table :inkling_types    
    drop_table :inkling_permissions
    drop_table :inkling_role_memberhips    
    drop_table :inkling_roles
    drop_table :inkling_users
  end
end
