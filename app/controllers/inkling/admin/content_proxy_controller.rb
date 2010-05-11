class Inkling::Admin::ContentProxyController < Inkling::Admin::BaseController

  def proxy
    content_type = params[:content_type]
    folder_id = params[:folder_id]

    bits = content_type.split("::")
    path = "new_admin_"
    bits.inject{|path, bit| path += "#{bit.downcase}_"}

    puts "*****#{path}"

    redirect_to eval(path)
  end
end
