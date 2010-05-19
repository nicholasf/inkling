class Inkling::FoosController < Inkling::BaseController

  def show
    folder_entry = Inkling::FolderEntry.find_by_path("/" + params[:folder_path])
    @foo = folder_entry.content
  end

  private
  def get_foo
  end
end
