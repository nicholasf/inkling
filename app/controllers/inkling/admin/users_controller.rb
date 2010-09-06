class Inkling::Admin::UsersController < Inkling::Admin::BaseController
  inherit_resources                                                                                     
  defaults :resource_class => Inkling::User, :instance_name => 'inkling_admin_user'

end