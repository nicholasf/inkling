module Inkling
  module Content
    def self.included(base)
      Inkling::Content::Types.register(base)
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
