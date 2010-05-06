require File.dirname(__FILE__) + '/../spec_helper'

#a test content type for including within a folder
class Foo < ActiveRecord::Base
    include Inkling::Content
    belongs_to :content, :polymorphic => true

    self.abstract_class = true
end

describe Inkling::Folder do

  before(:each) do
    @root = Inkling::Folder.create(:name => "root")
  end

  it "should accept nested folders" do
    @root.save
    child = Inkling::Folder.create(:name => "child")
    child.move_to_child_of @root
    @root.children.size.should eql 1
    @root.children.include?(child).should be true
  end

  it "should be able to order folders and items of content" do
    child = Inkling::Folder.create(:name => "child")
    foo = Foo.new

    debugger
  end

end
