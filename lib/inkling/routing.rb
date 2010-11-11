require 'ruby-debug'
module Inkling
  module Routing
    class TypeConstraint
      attr_accessor :type

      def initialize(type, prefix = nil)
        @type = type
        @prefix = prefix
      end

      def matches?(request)
        path = @prefix.nil? ? request.path : request.path.gsub(@prefix, "")
        matching_path = Inkling::Path.find_by_slug(path)

        if matching_path
          result = matching_path.content.is_a? @type.constantize
          request.params[:id] = matching_path.content.id
          result
        else
          false
        end
      end
    end
  end
end