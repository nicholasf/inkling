require File.dirname(__FILE__) + '/../spec_helper'

describe Inkling::Foo do

  let(:root) {Inkling::Folder.create :name => "root"}

  it "should use a before_save callback, :position_in_folder, to create a folder_entry under parent_folder_id" do
    foo = Inkling::Foo.create(:parent_folder_id => root.id, :name => "foo")
    foo.reload
    foo.folder_entry.parent.should eql root.folder_entry
  end
end
