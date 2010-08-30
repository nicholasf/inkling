module Inkling
  module Content
    module ActsAs
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def acts_as_content(friendly_name = self.class.name)

          Inkling::Content::Types.register(self)
          cattr_accessor :friendly_name
          self.friendly_name = (friendly_name or self)
          has_one :path, :as => :content, :dependent => :destroy
          after_create :create_path
          after_update :update_path
          
          send :include, InstanceMethods
        end
        
        # def content_icon
        #   self.to_s.underscore.gsub("/", "_")        
        # end
      end
    end

    module InstanceMethods
      #Creates a path to represent the ContentType instance; the path is used for routing, etc..
      def create_path
        path = Inkling::Path.new
        path.content = self
        path.save!
      end
      
      def update_path
        self.path.update_path!
        self.path.save!
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
