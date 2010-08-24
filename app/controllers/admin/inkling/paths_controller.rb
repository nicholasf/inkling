class Admin::Inkling::AddressesController < Admin::Inkling::BaseController

  before_filter :get_root

  def index
    @content_types = Inkling::Content::Types.listed
    @path = Inkling::Path.new
  end

  def update_tree
    new_parent_id = params[:new_parent]
    child_id = params[:child]
    new_parent = Inkling::FolderEntry.find(new_parent_id)
    child = Inkling::FolderEntry.find(child_id)
    child.move_to_child_of new_parent

    render :nothing => true
    return
  end

  private
  def get_root
    @roots = Inkling::Path.find_all_by_parent_id(nil)
  end
end