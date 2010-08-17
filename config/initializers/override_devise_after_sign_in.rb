module Devise
  module Controllers
    module Helpers
      
      alias :old_after_sign_in_path_for :after_sign_in_path_for
      
      def after_sign_in_path_for(resource_or_scope)
        scope = Devise::Mapping.find_scope!(resource_or_scope)
        debugger
        home_path = :"#{scope}_root_path"
        respond_to?(home_path, true) ? send(home_path) : root_path
      end
    end
  end
end