class Inkling::ProxyShowController < Inkling::BaseController

  def proxy
    folder_entry = Inkling::FolderEntry.find_by_path(params[:folder_path])
    content = folder_entry.content
    content_type = content.class

    bits = content_type.split("::")
    path = bits.inject{|memo, bit| "#{memo}_#{bit}"}

    @proxy_path = "inkling_#{path}_path".downcase
    redirect_to eval(@proxy_path)
  end
end
