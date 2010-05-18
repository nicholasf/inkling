#require 'rails/generators/named_base'
#require 'rails/generators/migration'
#require 'rails/generators/active_model'
#require 'active_record'

module Inkling
  module Content
    module ActsAs
      def self.included(base)
        base.extend(ClassMethods)
#        base.extend(InstanceMethods)
      end

      module ClassMethods
        def acts_as_content(friendly_name)
          Inkling::Content::Types.register(self)
          cattr_accessor :friendly_name


          attr_accessor :parent_folder_id #smoke and mirrors

          self.friendly_name = (friendly_name or self)

          class_eval <<-EOV
            has_one :folder_entry, :as => :content
            before_save :position_in_folder
            include Inkling::Content::InstanceMethods
          EOV
        end
      end      
    end

    module InstanceMethods
      #We abstract the idea of folder entries from the content developer, so they only handle folders.
      #There is a mutator set on each content object - parent_folder_id - which can be set in the form
      #but is not saved in the database. This callback looks for it and handles the creation of a
      #folder_entry for the content obj..
      def position_in_folder
        return if parent_folder_id == nil
        return if folder_entry and folder_entry.parent.id == parent_folder_id

        #otherwise we have a parent_folder_id which does not match the folder_entry on the object
        parent_folder = Inkling::Folder.find(self.parent_folder_id)
        folder_entry = Inkling::FolderEntry.create(:parent_id => parent_folder.id)
        folder_entry.content = self
        folder_entry.save!
      end      
    end

    class Types
      cattr_accessor :listed
      @@listed = []

      def self.register(type)
        @@listed << type
      end
    end
  end
end
