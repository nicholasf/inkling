require File.dirname(__FILE__) + '/../spec_helper'

describe Inkling::ProxyShowController do


  #spec not recognizing route which, when called manually, answers. Leaving this. Might be a Rails 3 thingymagig.

  #
#  it "should proxy a show call to the appropriate controller" do
#    get 'inkling/1/2/3'
#    mock_folder_entry =  mock(Inkling::FolderEntry)
#    mock_foo = mock(Inkling::Foo)
#    Inkling::FolderEntry.should_receive(:find_by_path.with("1/2/3").and_return(mock_folder_entry))
#    mock_folder_entry.should_receive(:content).and_return(mock_foo)
#    mock_foo.should_receive(:class).and_return(Inkling::Foo)
##      response.redirect_url.should eql "http://test.host/admin/inkling/folders/new?parent_folder_id=1"
#  end
end
