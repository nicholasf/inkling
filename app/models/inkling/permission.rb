class Inkling::Permission < ActiveRecord::Base
  set_table_name 'inkling_permissions'
  
  belongs_to :path
  belongs_to :role
  
end