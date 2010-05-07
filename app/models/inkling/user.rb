require 'mob'

module Inkling
  class User < Mob::User
    set_table_name 'inkling_users' #most app.s have their own user table, we won't intrude
  end
end
