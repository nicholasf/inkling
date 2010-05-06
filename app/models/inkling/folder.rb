require 'better_nested_set'

module Inkling
  class Folder < ActiveRecord::Base
    include SymetrieCom::Acts::NestedSet

    set_table_name 'inkling_folders'

    has_many :folder_entries
    has_many :content_items, :through => :folder_entries
    belongs_to :content, :polymorphic => true

    after_create :create_tree

    def <<(folder_entry)
      if folder_entry.is_a? Folder
        folder_entry = folder_entry.content
      end

debugger
      
      unless folder_entry.is_a? Inkling::FolderEntry
        raise StandardError, "Folders can only hold content."
      end

      folder_entry.move_to_child_of self.content
    end

    #trigger on callback on creation. Creates a new better_nested_set.
    def create_tree
      Inkling::FolderEntry.create(:folder_id => self.id)
    end
  end
end
