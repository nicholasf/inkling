class Inkling::Admin::PermissionsController < Inkling::Admin::BaseController
  inherit_resources                                                                                     
  defaults :resource_class => Inkling::Permission, :instance_name => 'inkling_permission'
end