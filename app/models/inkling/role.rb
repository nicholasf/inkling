require 'mob'

module Inkling
  class Role < Mob::Role
    set_table_name 'inkling_roles'
    ADMIN = "administrator"
  end
end
