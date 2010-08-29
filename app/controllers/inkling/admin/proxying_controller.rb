class Inkling::Admin::ProxyingController < Admin::Inkling::BaseController

  def new
    content_type = params[:content_type]
    # debugger
    bits = content_type.split("::")
    # path = bits.inject{|memo, bit| "#{memo}_#{bit}"}
    model_name = bits.last
    @proxy_path = "new_inkling_content_types_#{model_name}_path".downcase
    redirect_to eval(@proxy_path)
  end
end
