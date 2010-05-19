require File.dirname(__FILE__) + '/../spec_helper'

describe Inkling::Folder do

  let(:root) {Inkling::Folder.create :name => "root"}
  let(:child){Inkling::Folder.create :name => "child"}

  it "should accept nested folder entries with <<" do
    root << child
    root.folder_entry.children.size.should eql 1
    root.folder_entry.children.include?(child.folder_entry).should be true
  end

  it "should position inside a folder if passed a parent_folder_id" do
    child = Inkling::Folder.create(:name => "child", :parent_folder_id => root.id)
    child.folder.path.should == "/root/child"
  end
end
