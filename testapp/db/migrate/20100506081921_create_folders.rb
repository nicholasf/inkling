#copied from Inkling Content Framework, MIT licensed - see http://github.com/biv/inkling

class CreateFolders < ActiveRecord::Migration
  def self.up
    create_table :folders do |t|
      t.string :name, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :folders
  end
end
