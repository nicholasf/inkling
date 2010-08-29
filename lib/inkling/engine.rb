require "inkling"
require "inkling/content"
require 'inkling/routing'
require "devise"
require 'devise/orm/active_record'
require "mob"

require "rails"
require "better_nested_set"

module Inkling
  class Engine < Rails::Engine
    config.inkling = Inkling    
    
    initializer "static assets" do |app|
      app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
    end
  end
end
