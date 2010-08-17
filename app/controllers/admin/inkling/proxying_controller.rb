class Admin::Inkling::ProxyingController < Admin::Inkling::BaseController

  def new
    content_type = params[:content_type]
    
    bits = content_type.split("::")
    path = bits.inject{|memo, bit| "#{memo}_#{bit}"}

    @proxy_path = "new_admin_#{path}_path".downcase
    redirect_to eval(@proxy_path)
  end
end
