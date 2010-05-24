require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::Inkling::FolderEntriesController do

  let(:root) {Inkling::FolderEntry.create()}
  let(:root2) {Inkling::FolderEntry.create()}

  it "should index all root folder_entries" do
    root.reload
    root2.reload
    get :index
    assigns['roots'].size.should == 2
    assigns['folder_entry'].new_record?.should == true
    response.code.should == "200"
  end

  it "should update the tree via AJAX" do
    child = Inkling::FolderEntry.create()
    child.move_to_child_of root

    post :update_tree 
  end
end
