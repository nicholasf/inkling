# module Devise
#   module Controllers
#     module Helpers
#       
#       alias :old_after_sign_in_path_for :after_sign_in_path_for
#       
#       def after_sign_in_path_for(resource_or_scope)
#         scope = Devise::Mapping.find_scope!(resource_or_scope)
#         home_path = :"#{scope}_root_path"
#         unless resource_or_scope.is_a? Symbol
#           role_name = resource_or_scope.roles.first.name 
#           home_path = :"#{role_name}_root_path"
#         end
#         respond_to?(home_path, true) ? send(home_path) : root_path
#       end
#     end
#   end
# end