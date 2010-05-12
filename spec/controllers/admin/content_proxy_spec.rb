require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::Inkling::ContentProxyController do

  it "should assemble a resource route and proxy onto it" do
    post 'proxy', {:content_type =>  "Inkling::Folder", :folder_id => 1}
    response.redirect_url.should eql "http://test.host/admin/inkling/folders/new?folder_id=1"
  end

end
