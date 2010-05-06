class CreateInklingUsers < ActiveRecord::Migration
  def self.up
    create_table :inkling_folders do |t|
      t.string :name, :null => false
#      t.integer :tree_id
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.timestamps
    end
  end

  def self.down
    drop_table :inkling_users
  end
end
