require File.dirname(__FILE__) + '/../spec_helper'

describe Inkling::FolderEntry do

  let(:fe) {Inkling::FolderEntry.create()}
  let(:content) {Inkling::Foo.create(:name => "foo")}

  it "should update its path (based on content obj name) before a save " do
    fe.content = content
    fe.save
    fe.path.should == "/foo"
  end

  it "should update the path of a folder entry, if it has content" do
    fe.content = content
    fe.save
    fe.path.should == "/foo"

    fe2 = Inkling::FolderEntry.create()
    fe2.move_to_child_of fe
    content2 = Inkling::Foo.create(:name => "foo2")
    fe2.content = content2
    fe2.save
    fe2.path.should == "/foo/foo2"
  end

  it "should not update the path if it does not have content" do
    fe.save
    fe.path.should == nil
  end

#  it "should update the path of a folder entry, if it has content" do
#
#  end

# putting this to one side, til I learn more about better_nested_set
# want to proceed with prototype
#
#  it "should not allow anything other than a folder to nest another entry" do
#    root = Inkling::FolderEntry.create()
#    child = Inkling::FolderEntry.create()
#
#    begin
#      child.move_to_child_of root
#      fail('Only folder entries for folders can nest content')
#    rescue StandardError => boom
#      puts "ok"
#      raise boom
#    end
#  end
end
