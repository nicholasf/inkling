class CreateFolderEntries < ActiveRecord::Migration
  def self.up
    create_table :folder_entries do |t|
      t.integer :folder_id
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.timestamps
    end
  end

  def self.down
    drop_table :folder_entries
  end
end
