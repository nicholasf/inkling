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
end
