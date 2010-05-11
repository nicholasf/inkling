class Inkling::FoldersController < Inkling::BaseController

  before_filter :get_folder, :except => [:index, :new, :create]

  def index
    @folders = Inkling::Folder.find(:conditions => 'parent_id is null')
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
