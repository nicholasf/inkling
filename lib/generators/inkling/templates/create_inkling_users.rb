class CreateInklingUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
       t.column :email, :string, :null => false
       t.column :role_id, :int
       t.column :display_name, :string
       t.column :given_name, :string
       t.column :family_name, :string
       t.column :crypted_password, :string
       t.column :salt, :string, :limit => 40
       t.column :created_at, :datetime, :default => Time.now
       t.column :last_seen, :datetime
       t.column :ip, :string
    end
  end

  def self.down
    drop_table :users
  end
end
