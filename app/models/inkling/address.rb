require 'better_nested_set'

module Inkling
  class Address < ActiveRecord::Base
    # include SymetrieCom::Acts::NestedSet
    acts_as_nested_set
    
    belongs_to :site
    belongs_to :content, :polymorphic => true
  end
end
