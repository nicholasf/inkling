require 'mob'

module Inkling
  class User < Mob::User
    #set_table_name :inkling_users #most app.s have their own user table, we won't intrude
    #see http://inkling.lighthouseapp.com/projects/52914-inkling/tickets/10-set_table_name-seems-to-be-broken-in-ar-for-rails-3-rc-1#ticket-10-2
  end
end
