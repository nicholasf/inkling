class Inkling::FoldersController < Inkling::BaseController

  def index
    @folders = Inkling::Folder.all
  end

end
