require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::Inkling::FolderEntriesController do

  let(:root) {Inkling::FolderEntry.create()}
  let(:root2) {Inkling::FolderEntry.create()}

  it "should index all root folder_entries" do
    get :index
    root.reload
    root2.reload
    assigns['content_types'].should == Inkling::Content::Types.listed
    assigns['folder_entry'].new_record?.should == true
    assigns['root'].should_not be_nil
    response.code.should == "200"
  end

  it "should update the tree" do
    child = Inkling::FolderEntry.create()
    child.move_to_child_of root

    xhr :post, :update_tree, :new_parent => root2.id, :child => child.id, :remote=>true
    response.code.should == "200"
    child.reload
    root2.reload
    child.parent.should == root2
  end
end
