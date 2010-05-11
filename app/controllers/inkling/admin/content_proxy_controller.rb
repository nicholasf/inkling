class Inkling::Admin::ContentProxyController < Inkling::Admin::BaseController

  def proxy
    content_type = params[:content_type]
    folder_id = params[:folder_id]
    route_sym = "admin_#{content_type}"

    redirect_to

    foo_admin_path
  end

end
