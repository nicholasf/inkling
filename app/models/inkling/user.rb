require 'mob'

module Inkling
  class User < ActiveRecord::Base
    set_table_name 'inkling_users'
    devise :database_authenticatable, :confirmable, :recoverable, :rememberable, :trackable, :validatable
  end
end
