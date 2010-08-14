require 'mob'

module Inkling
  class User < Mob::User
    set_table_name :inkling_users #most app.s have their own user table, we won't intrude
    devise :database_authenticatable, :confirmable, :recoverable, :rememberable, :trackable, :validatable
    
  end
end
