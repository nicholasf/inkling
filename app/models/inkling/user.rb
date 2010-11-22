class Inkling::User < ActiveRecord::Base
  
  set_table_name 'inkling_users' 
  has_many :role_memberships
  has_many :roles, :through => :role_memberships
  has_many :logs
  
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable    
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  def has_role?(role)
    role = role.to_s
    self.roles.find_by_name(role)
  end
end
