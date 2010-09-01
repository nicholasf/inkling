class Inkling::BaseController < ApplicationController

  before_filter :authenticate_inkling_user!
  
  layout 'inkling/manage'

end
