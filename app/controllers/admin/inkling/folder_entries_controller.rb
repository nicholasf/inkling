class Admin::Inkling::FolderEntriesController < Admin::Inkling::BaseController

  def index
    @roots = Inkling::FolderEntry.find(:all, :conditions =>"parent_id is null")
#    puts "***#{@roots.size} ****"
#    debugger
    @content_types = Inkling::Content::Types.listed
    @folder_entry = Inkling::FolderEntry.new
  end
end
