require 'better_nested_set'

#A folder entry is more or less a stub representing a position within a folder (polymorphing as 'content').
#It may represent another folder.

module Inkling
  class FolderEntry < ActiveRecord::Base
    include SymetrieCom::Acts::NestedSet

    acts_as_nested_set

    belongs_to :content, :polymorphic => true
    before_save :check_path

    def check_path
      path = "#{self.parent.path}" if self.parent
      path += "/#{self.content.name}"
      self.path = path
    end
  end
end
