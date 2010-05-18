require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::Inkling::FoldersController do

  let(:folder) {Inkling::Folder.new :name => "folder1"}

  it "should create a new folder" do
    post 'create', {:inkling_folder => {"name" => "folder1"}}
    response.should be_success
    Inkling::Folder.find_by_name(folder.name).should_not be nil
  end

#  it "should update a folder" do
#    folder.save
#    put 'update', {:inkling_folder => {:id => folder.id, "name" => "folder_changed"}}
#    response.should be_success
#    Inkling::Folder.find_by_name("folder_changed").should_not be nil
#  end

#  it "should delete a folder" do
#    folder.save
#    post 'destroy', {:id => folder.id}
#    response.should be_success
#    Inkling::Folder.find_by_name("folder_changed").should be nil
#  end
end
