require File.dirname(__FILE__) + '/../../spec_helper'

describe Inkling::Admin::ContentProxyController do

  it "should assemble a resource route and proxy onto it" do
    post 'proxy', {:content_type =>  "Inkling::Folder", :folder_id => 1}

    assigns[:proxy_path].should eql = "new_admin_inkling_folder(:folder_id=>1)"

    response.should be_success
  end

end
