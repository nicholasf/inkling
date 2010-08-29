require File.dirname(__FILE__) + '/../spec_helper'

describe Inkling::Path do

  let(:path) {Inkling::Path.create(:path => "1")}

  it "should update the path based on its parent" do
    sub_path = Inkling::Path.create(:path => "2")
    sub_path.move_to_child_of path
    sub_path.path.should == "/1/2"
  end
end
