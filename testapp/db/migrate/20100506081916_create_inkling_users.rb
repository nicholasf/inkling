class CreateInklingUsers < ActiveRecord::Migration
  def self.up
    create_table :inkling_users do |t|
       t.string :email, :null => false
       t.integer :role_id
       t.string :display_name
       t.string :given_name
       t.string :family_name
       t.string :crypted_password
       t.string :salt, :limit => 40
       t.datetime :last_seen
       t.string :ip
       t.timestamps
    end
  end

  def self.down
    drop_table :inkling_users
  end
end
