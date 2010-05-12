
Rails.application.routes.draw do |map|

  namespace :admin do
    namespace :inkling do
      resources :folders, :controller => 'folders'
      resources :inkling_folders, :controller => 'inkling_folders' #the inkling prefix is needed for any form operation
      resources :inkling_foos, :controller => 'inkling_foos'
    end
  end

  match 'proxy_content_creation' => 'admin/inkling/content_proxy#proxy', :as => :proxy_content_creation
end