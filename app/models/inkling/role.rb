require 'mob'

module Inkling
  class Role < Mob::Role    
    set_table_name 'inkling_roles'
    has_many :role_memberships
    has_many :users, :through => :role_memberships
    has_many :permissions
        
    ADMIN = "administrator"
  end
end
