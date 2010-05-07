require File.dirname(__FILE__) + '/../spec_helper'

describe Inkling::Folder do

  before(:each) do
    @root = Inkling::Folder.new(:name => "root")
  end

  it "should accept nested folder entries with <<" do
    @root.save
    child = Inkling::Folder.new(:name => "child")
    child.save
    @root << child
    @root.folder_entry.children.size.should eql 1
    @root.folder_entry.children.include?(child.folder_entry).should be true
  end  
end
