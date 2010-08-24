require "inkling"
require "inkling/content"
require 'inkling/routing'
require "devise"
require 'devise/orm/active_record'
require "mob"

require "rails"
require "better_nested_set"
require "ruby-debug"


module Inkling
  class Engine < Rails::Engine
    config.inkling = Inkling    
  end
end
