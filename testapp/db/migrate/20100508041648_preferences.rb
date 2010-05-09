class Preferences < ActiveRecord::Migration
  def self.up
    create_table :preferences do |t|
      t.boolean :single_site, :default => true
    end
  end

  def self.down
  end
end
