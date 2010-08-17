
module Inkling
  class User < ActiveRecord::Base
    
    set_table_name 'inkling_users' 
    has_many :role_memberships
    has_many :roles, :through => :role_memberships
    
    devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable    
    
    def has_role?(role)
      role = role.to_s
      self.roles.find_by_name(role)
    end
  end
end
