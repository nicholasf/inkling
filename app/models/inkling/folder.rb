require 'better_nested_set'

module Inkling
  class Folder < ActiveRecord::Base
    acts_as_content 'Folder'

    has_many :content_items, :through => :folder_entries

    after_create :create_tree

    def <<(content_obj)
      if content_obj == self or (content_obj.is_a? Inkling::FolderEntry and content_obj.content == self)
        raise StandardError, "A folder cannot folder itself. Please."
      end

      if content_obj.is_a? Inkling::Folder
        content_obj = content_obj.folder_entry
      end

      if content_obj.is_a? Inkling::FolderEntry
        content_obj.move_to_child_of(self.folder_entry)
      else
        raise StandardError, "Folders can only hold content."
      end
    end

    #trigger on callback on creation. Creates a folder entry (a better nested set) for folder behaviour.
    def create_tree
      folder_entry = Inkling::FolderEntry.create()
      folder_entry.content = self
      folder_entry.save!
    end

    def self.find_content()
      
    end
  end
end
