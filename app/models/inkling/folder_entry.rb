require 'better_nested_set'

#A folder entry is more or less a stub representing a position within a folder (polymorphing as 'content').
#It may represent another folder.

module Inkling
  class FolderEntry < ActiveRecord::Base
    include SymetrieCom::Acts::NestedSet

    acts_as_nested_set

    belongs_to :content, :polymorphic => true
#    belongs_to :folder
#    has_many :entries, :as => :content
  end
end
