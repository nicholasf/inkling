require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::Inkling::FolderEntriesController do

  let(:folder) {Inkling::Folder.new :name => "folder1"}

  it "should index all root folder_entries" do
    get :index
    debugger
    response.should_be success
  end
end
