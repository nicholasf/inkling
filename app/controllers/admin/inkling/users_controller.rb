class Admin::Inkling::UsersController < Admin::Inkling::BaseController
  inherit_resources                                                                                     
  defaults :resource_class => Inkling::User, :instance_name => 'user'

end