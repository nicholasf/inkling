module Inkling
  class Role < ActiveRecord::Base    
    set_table_name 'inkling_roles'
    has_many :role_memberships
    has_many :users, :through => :role_memberships
    has_many :permissions
        
    ADMIN = "administrator"
  end
end
