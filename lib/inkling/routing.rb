module Inkling
  module Routing
    class ContentTypeConstraint
      attr_accessor :type

      def initialize(type)
        @type = type.values.first
      end

      def matches?(request)
        path = request.path.gsub("/inkling", "")
        matching_path = Inkling::Path.find_by_path(path)

        if matching_path
          result = matching_path.content.is_a? @type
          request.params[:id] = matching_path.content.id
          result
        else
          false
        end
      end
    end
  end
end