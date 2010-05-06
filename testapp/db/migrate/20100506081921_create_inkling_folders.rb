class CreateInklingFolders < ActiveRecord::Migration
  def self.up
    create_table :inkling_folders do |t|
      t.string :name, :null => false
      t.references :content, :polymorphic => true      
      t.timestamps
    end
  end

  def self.down
    drop_table :inkling_folder_entries
  end
end
