class Inkling::CanCanAction < ActiveRecord::Base
  set_table_name "inkling_can_can_actions"
  has_one :permission
  
end