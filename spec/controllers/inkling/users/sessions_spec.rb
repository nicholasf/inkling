#devise test helpers dont seem to go through controller, or something is being skipped. investigate later.

# require 'spec_helper'
# 
# describe Inkling::Users::SessionsController do
# 
#   describe "creating logs based on signing in or out" do
#     specify "that login created a login log" do
#       @admin = make_user(:administrator)
#       sign_in @admin
#       
#       Inkling::Log.all.size.should > 0
#     end
#   end
# end
