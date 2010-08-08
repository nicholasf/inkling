Rails.application.routes.draw do |map|
  namespace :admin do
    namespace :inkling do
      match "/" => 'folder_entries#index'

      resources :folder_entries, :only => [:index] do
        collection do
          post :update_tree
        end
      end
      resources :folders
      resources :foos
    end
  end
end


# 
# class ContentTypeConstraint
#   attr_accessor :type
# 
#   def initialize(type)
#     @type = type.values.first
#   end
# 
#   def matches?(request)
#     path = request.path.gsub("/inkling", "")
#     entry = Inkling::FolderEntry.find_by_path(path)
# 
#     if entry
#       result = entry.content.is_a? @type
#       result
#     else
#       false
#     end
#   end
# end
# 
# Rails.application.routes.draw do |map|
#   namespace :admin do
#     namespace :inkling do
#       match "/" => 'folder_entries#index'
# 
#       resources :folder_entries, :only => [:index] do
#         collection do
#           post :update_tree
#         end
#       end
#       resources :folders
#       resources :foos
#     end
#   end
# 
#   match 'proxy_admin_create' => 'admin/inkling/proxy_admin#proxy', :as => :proxy_admin_creation
# 
#   namespace :inkling do
#     constraints ContentTypeConstraint.new(:type => Inkling::Foo) do match '/*folder_path' => "foos#show" end
# 
#     #the default 404
#     match '/*folder_path(.:format)' => "/404.html"
# 
# 
# #    resources :foos, :controller => 'foos', :only => [:show]
#    # match '/*folder_path(.:format)' => "proxy_show#proxy"
# #    match '/*folder_path' => "proxy_show#proxy" #this must be last in /inkling/* routing
#   end
# end
