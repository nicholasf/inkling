class Admin::Inkling::FolderEntriesController < Admin::Inkling::BaseController

  def index
    @root_folder_entries = Inkling::FolderEntry.find(:all, :conditions =>"content_type = 'Inkling::Folder' and parent_id is null")
    @content_types = Inkling::Content::Types.listed
    @folder_entry = Inkling::FolderEntry.new
  end

end
