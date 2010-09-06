class Inkling::BaseController < ApplicationController

  before_filter :authenticate_inkling_user!
  
  layout 'inkling/manage'

  # rescue_from CanCan::AccessDenied do |exception|
  #   flash[:error] = exception.message
  #   redirect_to root_url
  # end

end
