class Inkling::ContentController < ApplicationController

  layout 'content' #this file is created by the Theme functionality in admin, and written out to tmp/inkling/themes/layouts
  alias current_user current_inkling_user
  helper_method :current_user
end
