class Inkling::Admin::ContentProxyController < Inkling::Admin::BaseController

  def proxy
    content_type = params[:content_type]
    folder_id = params[:folder_id]

    bits = content_type.split("::")
    path = bits.inject{|memo, bit| "#{memo.downcase}_#{bit.downcase}"}

    proxy_path = "new_admin_#{path}_path(:folder_id=>#{folder_id})"
    puts proxy_path
    debugger
    redirect_to eval(path)
  end
end
