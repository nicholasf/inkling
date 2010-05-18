require File.dirname(__FILE__) + '/../../spec_helper'

describe Inkling::ProxyShowController do

  it "should proxy a show call to the appropriate controller" do
    it "should assemble a resource route and proxy onto it" do
      get '1/2/3'
      response.redirect_url.should eql "http://test.host/admin/inkling/folders/new?parent_folder_id=1"
    end
  end
end
