module Inkling
  module Content
    module ActsAs
      def self.included(base)
         base.extend(ClassMethods)
      end

      module ClassMethods
        def acts_as_content(friendly_name)
          Inkling::Content::Types.register(self)
          has_one :folder_entry, :as => :content

          cattr_accessor :friendly_name

          self.friendly_name = (friendly_name or self)
        end
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
