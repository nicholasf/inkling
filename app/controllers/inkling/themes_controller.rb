class Inkling::ThemesController < Inkling::BaseController
  inherit_resources                                                                                     
  defaults :resource_class => Inkling::Theme, :instance_name => 'inkling_theme'
end