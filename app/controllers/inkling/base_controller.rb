class Inkling::BaseController < ApplicationController

  before_filter :authenticate_inkling_user!
  # debugger
  layout Inkling::Theme.site.name

end
