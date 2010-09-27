class Inkling::Permission < ActiveRecord::Base
  set_table_name 'inkling_permissions'
  
  belongs_to :role
  belongs_to :can_can_action
  belongs_to :content_type  
end