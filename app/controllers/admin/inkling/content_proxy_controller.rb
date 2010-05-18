class Admin::Inkling::ContentProxyController < Admin::Inkling::BaseController

  def proxy
    content_type = params[:content_type]
    
    bits = content_type.split("::")
    path = bits.inject{|memo, bit| "#{memo}_#{bit}"}

    @proxy_path = "new_admin_#{path}_path(:parent_folder_id=>#{params[:parent_folder_id]})".downcase
    redirect_to eval(@proxy_path)
  end
end
