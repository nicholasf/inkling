require File.dirname(__FILE__) + '/../../spec_helper'

describe Inkling::Admin::FoldersController do

  it "should assemble a resource route and proxy onto it" do
    post 'proxy', {:content_type =>  "Inkling::Foo", :folder_id => 1}
    
    response.should be_success
  end

end
