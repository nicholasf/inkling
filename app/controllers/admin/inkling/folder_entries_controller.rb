class Admin::Inkling::FolderEntriesController < Admin::Inkling::BaseController

  before_filter :get_root

  def index
    @content_types = Inkling::Content::Types.listed
    @folder_entry = Inkling::FolderEntry.new
  end

  private
  def get_root
    @root = Inkling::Folder.find_by_name("/").folder_entry
  end
end
