class Admin::Inkling::FoldersController < Admin::Inkling::BaseController

  before_filter :get_folder, :except => [:index, :new, :create]

  def index
    @root_folder_entries = Inkling::FolderEntry.find(:all, :conditions =>"content_type = 'Inkling::Folder' and parent_id is null")
#    @content_types = [""]
    @content_types = Inkling::Content::Types.listed
    @folder_entry = Inkling::FolderEntry.new
  end

  def show; end

  def new
    @folder = Inkling::Folder.new
  end

  def edit; end

  def create
    @folder = Inkling::Folder.create(params[:inkling_folder])
    render :action => :edit
  end

  def update
    @folder = Folder.update_attributes(params[:inkling_folder])
    render :action => :edit
  end

  def destroy
    @folder.delete

    params[:msg] = "Folder #{@folder.name} deleted"
    redirect_to :action => :index
  end

  private
  def get_folder
    @folder = Inkling::Folder.find(params[:id])
  end
end
