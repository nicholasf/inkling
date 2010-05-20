require 'better_nested_set'

#A folder entry is more or less a stub representing a position within a folder (polymorphing as 'content').
#It may represent another folder.

module Inkling
  class FolderEntry < ActiveRecord::Base
    include SymetrieCom::Acts::NestedSet

    acts_as_nested_set

    belongs_to :content, :polymorphic => true
    before_save :check_path

#    validates_presence_of :content_type
#    validates_presence_of :content_id, :message => "A folder_entry must"

    def check_path
      return if self.new_record? #ugly, but it occurs when a folder is creating its own folder_entry, so we do it, for kicks.
      return if self.content.nil?

      path = self.parent ? "#{self.parent.path}/" : "/"
      path += "#{self.content.name}"
      self.path = path
    end


  end
end
