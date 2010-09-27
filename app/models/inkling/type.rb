class Inkling::Type < ActiveRecord::Base
  set_table_name "inkling_types"
  has_one :permission
end