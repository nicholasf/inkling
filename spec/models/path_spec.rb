require File.dirname(__FILE__) + '/../spec_helper'

describe Inkling::Path do

  let(:foo) {ContentTypes::Foo.create(:name => "1")}

  it "should update the path based on its parent" do
    foo2 = ContentTypes::Foo.create(:name => "2")
    foo2.path.move_to_child_of foo.path  
    foo2.save  
    foo2.path.slug.should == "/1/2"
  end
end
