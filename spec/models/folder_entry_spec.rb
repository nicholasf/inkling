require File.dirname(__FILE__) + '/../spec_helper'

describe Inkling::FolderEntry do

  before(:each) do
  end

  it "should update the path of a folder entry, if it has content" do
        
  end

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
