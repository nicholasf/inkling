module Inkling
  module Content
    module ActsAs
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def acts_as_content(friendly_name)
          Inkling::Content::Types.register(self)
          cattr_accessor :friendly_name

          self.friendly_name = (friendly_name or self)

          class_eval <<-EOV
            include Inkling::Content::InstanceMethods
            has_one :address, :as => :content, :dependent => :destroy
            
            after_create :create_address
            after_update :trigger_address_path_update
          EOV
        end
      end
    end

    module InstanceMethods
      #trigger on callback on creation. Creates an address to represent the ContentType instance
      #within the structure
      def create_address
        address = Inkling::Address.new
        address.content = self
        address.save!
      end
      
      def trigger_address_path_update
        address.update_path!
      end
    end

    class Types
      def self.listed
        @listed ||= [] 
      end
      
      def self.keys
        @keys ||= []
      end
      
      def self.register(type)
        if keys.include?(type.name)
          flush!
        end
        
        keys << type.name
        listed << type unless listed.index(type)
      end      
      
      def self.flush!
        @keys = []
        @listed = []
      end
    end
  end
end
