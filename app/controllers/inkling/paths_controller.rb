class Inkling::PathsController < Inkling::BaseController
  # load_and_authorize_resource

  before_filter :get_root

  def index
    @content_types = Inkling::Content::Types.listed
    @content_types ||= []
    @path = Inkling::Path.new
  end

  def update_tree 
    new_parent_id = params[:new_parent]
    child_id = params[:child]
    new_parent = Inkling::Path.find(new_parent_id)
    child = Inkling::Path.find(child_id)
    restriction = new_parent.restricts?(child)
    if restriction[0]
      @msg = restriction[1]
    else
      child.move_to_child_of new_parent
      child.save
      @msg = "Ok."
    end
  end

  private
  def get_root
    @roots = Inkling::Path.find_all_by_parent_id(nil)
  end
end