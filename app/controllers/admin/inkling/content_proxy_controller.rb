class Admin::Inkling::ContentProxyController < Admin::Inkling::BaseController

  def proxy
    content_type = params[:content_type]
    folder_id = params[:folder_id]

    bits = content_type.split("::")
    path = bits.inject{|memo, bit| "#{memo}_#{bit}"}

    @proxy_path = "new_admin_#{path}_path(:folder_entry_id=>#{params[:folder_entry_id]})".downcase
    redirect_to eval(@proxy_path)
  end
end
