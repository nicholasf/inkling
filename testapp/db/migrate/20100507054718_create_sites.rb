class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.string :name
      t.string :path_prefix
      t.string :description
      t.timestamps
    end
  end

  def self.down
    drop_table :sites
  end
end
