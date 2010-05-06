require 'better_nested_set'

module Inkling
  class Folder < ActiveRecord::Base
    include SymetrieCom::Acts::NestedSet

    set_table_name 'inkling_folders'

    has_many :folder_entries
    has_many :content_items, :through => :folder_entries
    belongs_to :content, :polymorphic => true
  end
end
