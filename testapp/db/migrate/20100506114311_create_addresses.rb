class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.string :path
      t.references :content, :polymorphic => true
      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
