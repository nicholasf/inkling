require 'better_nested_set'

module Inkling
  class Folder < ActiveRecord::Base
    include SymetrieCom::Acts::NestedSet
 
    has_many :content_items, :through => :folder_entries
    has_one :folder_entry, :as => :content

    after_create :create_tree

    def <<(content_obj)
      if content_obj == self or (content_obj.is_a? Inkling::FolderEntry and content_obj.content == self)
        raise StandardError, "A folder cannot folder itself. Please."
      end

      if content_obj.is_a? Inkling::Folder
        content_obj = content_obj.folder_entry
      end

      if content_obj.is_a? Inkling::FolderEntry
#        debugger
        content_obj.move_to_child_of(self.folder_entry)
      else
        raise StandardError, "Folders can only hold content."
      end
    end

    #trigger on callback on creation. Creates a new better_nested_set.
    def create_tree
      folder_entry = Inkling::FolderEntry.create()
      folder_entry.content = self
      folder_entry.save!
    end
  end
end
