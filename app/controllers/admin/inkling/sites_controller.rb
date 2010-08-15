class Admin::Inkling::SitesController < Admin::Inkling::BaseController
  inherit_resources                                                                                     
  defaults :resource_class => Inkling::Site, :instance_name => 'site'

end