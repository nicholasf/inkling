class CreateInklingFolders < ActiveRecord::Migration
  def self.up
    create_table :inkling_folder_entries do |t|
      t.string :name, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :inkling_folder_entries
  end
end
