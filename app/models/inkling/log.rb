class Inkling::Log < ActiveRecord::Base
  set_table_name 'inkling_logs'
  belongs_to :inkling_user
end