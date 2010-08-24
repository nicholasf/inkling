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
            has_one :path, :as => :content, :dependent => :destroy
            
            after_create :create_path
            # after_save :trigger_path_update

            #Creates a path to represent the ContentType instance; the path is used for routing, etc..
            def create_path
              path = Inkling::Path.new
              path.content = self
              path.save!
            end
          EOV
        end
      end
    end

    module InstanceMethods

      
      def trigger_path_update
        debugger
        puts "trigger_path_update!"
        path.update_path!
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
