require "inkling"
require "inkling/types"
require "inkling/version"
require "inkling/routing"
require 'cancan'
require "inkling/ability"
require "devise"
require 'devise/orm/active_record'

require "rails"
require "better_nested_set"

module Inkling
  MIGRATIONS = [['create_inkling_tables.rb', 'db/migrate/create_inkling_tables.rb']]

  class Engine < Rails::Engine
    config.inkling = Inkling
        
    initializer "static assets" do |app|
      app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
    end
  end
end
