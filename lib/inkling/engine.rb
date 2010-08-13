require "inkling"
require "inkling/content"

require "rails"
require "better_nested_set"
require "ruby-debug"


module Inkling
  class Engine < Rails::Engine
    engine_name :inkling
    
    # rake_tasks do
    #   load "tasks/inkling.rake"
    # end
  end
end
