class CreateFoo < ActiveRecord::Migration
  def self.up
    create_table :inkling_foos do |t|
      t.string :name
      t.references :content, :polymorphic => true      
      t.timestamps
    end
  end

  def self.down
    drop_table :inkling_foos
  end
end
