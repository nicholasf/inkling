class Inkling::ProxyShowController < Inkling::BaseController

  def proxy
    folder_entry = Inkling::FolderEntry.find_by_path("/" + params[:folder_path])

    content = folder_entry.content
    content_type = content.class.name

    bits = content_type.split("::")
    path = bits.inject{|memo, bit| "#{memo}_#{bit}"}

    @proxy_path = "#{path}_path(content)".downcase
#    debugger
    puts "invoking #{@proxy_path}"
    redirect_to eval(@proxy_path)
  end
end
