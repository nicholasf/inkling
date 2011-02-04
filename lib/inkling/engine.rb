require "inkling"
require "inkling/types"
require "inkling/controllers"
require "inkling/version"
require "inkling/util/slugs"
require "inkling/routing"
require "inkling/util"
require 'cancan'
require "inkling/ability"
require "devise"
require 'devise/orm/active_record'

require "rails"

module Inkling
  TMP_DIR = "tmp/inkling/"
  THEMES_DIR = "#{TMP_DIR}themes/"
  THEME_LAYOUTS_DIR = "#{THEMES_DIR}layouts/"
  BOOTSTRAP_TASKS = []
  
  class Engine < Rails::Engine
    config.inkling = Inkling
        
    initializer "static assets" do |app|
      app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
    end
  end
  
  WELCOME_MSG = <<-MSG

Welcome!
Inkling was bootstrapped at #{Time.now}.
Start the server ('rails server') then visit http://localhost:3000/inkling/users/sign_in. 
Use the default admin account admin@localhost.com/test123.

  MSG
end
