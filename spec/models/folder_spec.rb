require File.dirname(__FILE__) + '/../spec_helper'

describe Inkling::Folder do

  before(:each) do
    @root = Inkling::Folder.create(:name => "root")
  end

  it "should accept nested folders" do
    @folder.save
    child = Inkling::Folder.create(:name => "child")
    @root.children.size.should eql 1
    @root.children.include?(child).should be true
  end
end
