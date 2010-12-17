class CreatePostgresOptimizations < ActiveRecord::Migration
  include Inkling::Util::MigrationHelpers
  
  def self.up
    add_foreign_key(:roles, :user_id, :inkling_users)
    add_foreign_key(:role_memberships, :user_id, :inkling_users)
    add_foreign_key(:role_memberships, :role_id, :inkling_roles)
    add_foreign_key(:inkling_permissions, :type_id, :inkling_types)
    add_foreign_key(:inkling_permissions, :role_id, :inkling_roles)
    add_foreign_key(:inkling_logs, :user_id, :inkling_users)
    
  end

  def self.down
  end
end
