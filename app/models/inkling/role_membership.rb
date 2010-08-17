module Inkling
  class RoleMembership < ActiveRecord::Base
    set_table_name 'inkling_role_memberships'
    
    belongs_to :user, :class_name => "Inkling::User", :foreign_key => :user_id
    belongs_to :role, :class_name => "Inkling::Role", :foreign_key => :role_id
  end
end