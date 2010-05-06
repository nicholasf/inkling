require 'better_nested_set'

module Inkling
  class Folder < ActiveRecord::Base
    include SymetrieCom::Acts::NestedSet

    set_table_name 'inkling_folders'

    acts_as_nested_set

    has_many :items, :as => :content
  end
end
