class Inkling::ProxyingController < Inkling::BaseController

  def new
    content_type = params[:content_type]
    bits = content_type.split("::")
    model_name = bits.last
    @proxy_path = "new_inkling_content_types_#{model_name}_path".downcase
    redirect_to eval(@proxy_path)
  end

  def edit
    debugger
    content_type = params[:content_type]
    bits = content_type.split("::")
    model_name = bits.last
    @proxy_path = "new_inkling_content_types_#{model_name}_path".downcase
    redirect_to eval(@proxy_path)
  end
end
