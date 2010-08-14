
Rails.application.routes.draw do |map|
  # namespace :admin do
  #   namespace :inkling do
  #   end
  # end

  # match 'proxy_admin_create' => 'admin/inkling/proxy_admin#proxy', :as => :proxy_admin_creation

  namespace :inkling do
    devise_for "users", :controllers => { :sessions => "inkling/users/sessions"}, :class_name => "Inkling::User"
  end
  
  map.resources "inkling_sites"
end


class ContentTypeConstraint
  attr_accessor :type

  def initialize(type)
    @type = type.values.first
  end

  def matches?(request)
    path = request.path.gsub("/inkling", "")
    # entry = Inkling::FolderEntry.find_by_path(path)

    if entry
      result = entry.content.is_a? @type
      result
    else
      false
    end
  end
end
